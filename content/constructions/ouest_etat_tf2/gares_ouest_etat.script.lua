local mat4 = require "::/scripts/mat4.tl"
local vec3 = require "::/scripts/vec3.tl"

local function intRange(start, stop, step)
  local a = {}
  local i = start
  while i <= stop do
    a[#a + 1] = i
    i = i + step
  end
  return a
end

local OFFSETS = intRange(-500, 500, 5)
local DEGREES = intRange(-180, 180, 1)

-- Variant table: { model with base, model without base ("_ss") }
-- Add the other stations here once their models are imported, for example:
--   { "briouze", "briouze_ss" },
--   { "cholet", "cholet_ss" },
--   { "guingamp", "guingamp_ss" },
-- { dossier, modèle avec socle, modèle sans socle }
local VARIANTS = {
  { "ancenis", "ancenis", "ancenis_ss" },
  { "ancenis", "ancenis_aff", "ancenis_aff_ss" },
  { "briouze", "briouze", "briouze_ss" },
  { "cholet", "cholet", "cholet_ss" },
  { "cholet", "cholet_aff", "cholet_aff_ss" },
  { "guingamp_am", "guingamp_am", "guingamp_am_ss" },
  { "guingamp_am", "guingamp_am_aff", "guingamp_am_aff_ss" },
  { "guingamp_sm", "guingamp_sm", "guingamp_sm_ss" },
  { "guingamp_sm", "guingamp_sm_aff", "guingamp_sm_aff_ss" },
  { "lamballe_sm", "lamballe_sm", "lamballe_sm_ss" },
  { "montauban", "montauban", "montauban_ss" },
  { "montauban2", "montauban2", "montauban2_ss" },
  { "montauban3", "montauban3", "montauban3_ss" },
  { "nort_sur_erdre", "nort_sur_erdre", "nort_sur_erdre_ss" },
  { "nort_sur_erdre", "nort_sur_erdre_aff", "nort_sur_erdre_aff_ss" },
  { "plouaret_tregor_am", "plouaret_tregor_am", "plouaret_tregor_am_ss" },
  { "pontchateau", "pontchateau", "pontchateau_ss" },
  { "pontchateau", "pontchateau_aff", "pontchateau_aff_ss" },
  { "rosporden", "rosporden", "rosporden_ss" },
  { "rosporden", "rosporden_aff", "rosporden_aff_ss" },
  { "yffiniac", "yffiniac", "yffiniac_ss" },
  { "yffiniac", "yffiniac_aff", "yffiniac_aff_ss" },
}

local updateFn = function(captureParams, params)
  local variant = VARIANTS[params.variant_gares]
  local folder = variant[1]
  local name = variant[2]
  if params.socle == 2 then name = variant[3] end

  local offsetX = OFFSETS[params.offsetx] / 100
  local offsetY = OFFSETS[params.offsety] / 100
  local offsetZ = OFFSETS[params.offsetz] / 100
  local rotation = DEGREES[params.zRotate]

  local shift = 5
  if params.positiony_gare == 1 then shift = -5 end
  local height = 1

  local model = "pack_ouest_etat::/assets/gares/" .. folder .. "/" .. name .. ".mdl"

  return {
    cost = 0,
    bulldozeCost = 0,
    maintenanceCost = 0,
    -- Accroche à la voie
    snapPoint = {
      transf = { 1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1 },
      transportModes = { "TRAIN", "ELECTRIC_TRAIN" },
      snapToBaseEdgeTypes = { "TRACK" },
      allowSnapToBaseEdgeEnds = true,
      alignWithCoast = false,
      placeAtTerrainHeight = false,
      forceSnapToWaterSurfaceHeight = false,
      snapHeightOffsetAboveWater = 0,
      onlySnapToWaterSurfaceHeightWhenInWater = false,
      allowSnapToMesh = false,
    },
    subconstructions = {
      {
        tag = 1,
        groundFaces = {
          {
            face = {
              { -0.01, -0.01, 0.0, 1.0 },
              { 0.01, -0.01, 0.0, 1.0 },
              { 0.01, 0.01, 0.0, 1.0 },
              { -0.01, 0.01, 0.0, 1.0 },
            },
            modes = {
              { type = "FILL", key = "::/terrain/materials/asphalt_01/asphalt_01.gtex" },
            },
          },
        },
        models = {
          {
            id = model,
            transf = mat4.rotZYXTransl(
              vec3.new(math.rad(rotation), 0, 0),
              vec3.new(offsetX, shift + offsetY, height + offsetZ)),
          },
        },
      },
    },
  }
end

function data()
return { updateFn = updateFn }
end
