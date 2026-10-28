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

local MODELS = {
  "pack_ouest_etat::/assets/panneau_indicateur/panneau_indicateur_dir_both.mdl",
  "pack_ouest_etat::/assets/panneau_indicateur/panneau_indicateur_dir_left.mdl",
  "pack_ouest_etat::/assets/panneau_indicateur/panneau_indicateur_dir_right.mdl",
  "pack_ouest_etat::/assets/panneau_indicateur/panneau_indicateur_sortie_left.mdl",
  "pack_ouest_etat::/assets/panneau_indicateur/panneau_indicateur_sortie_right.mdl",
  "pack_ouest_etat::/assets/panneau_indicateur/panneau_indicateur_train.mdl",
  "pack_ouest_etat::/assets/panneau_indicateur/panneau_indicateur_sortie_simple.mdl",
  "pack_ouest_etat::/assets/panneau_avertissement/panneau_aver_traverse.mdl",
  "pack_ouest_etat::/assets/panneau_avertissement/panneau_interdit_yellow.mdl",
  "pack_ouest_etat::/shared/poteau_sncf_new/poteau_sncf_new.mdl",
}

local updateFn = function(captureParams, params)
  local offsetX = OFFSETS[params.offsetx] / 100
  local offsetY = OFFSETS[params.offsety] / 100
  local offsetZ = OFFSETS[params.offsetz] / 100
  local rotation = DEGREES[params.zRotate]

  local shift = 5
  if params.positiony_gare == 1 then shift = -5 end
  local height = 1

  local transf = mat4.rotZYXTransl(
    vec3.new(math.rad(rotation), 0, 0),
    vec3.new(offsetX, shift + offsetY, height + offsetZ))

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
          { id = MODELS[params.panneau], transf = transf },
        },
      },
    },
  }
end

function data()
return { updateFn = updateFn }
end
