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

local MODELS = {
  "pack_ouest_etat::/assets/ecran/ecran_depart_3t.mdl",
  "pack_ouest_etat::/assets/ecran/ecran_depart_liste.mdl",
}

local updateFn = function(captureParams, params)
  local model = MODELS[params.affichage]

  local offsetX = OFFSETS[params.offsetx] / 100
  local offsetY = OFFSETS[params.offsety] / 100
  local offsetZ = OFFSETS[params.offsetz] / 100

  local shift = 5
  if params.positiony_gare == 1 then shift = -5 end
  -- le modele est deja a ~2 m au-dessus de son origine (ecran suspendu)
  local height = 0

  local models = {}
  if model ~= nil then
    models[1] = {
      id = model,
      transf = mat4.rotZYXTransl(vec3.new(0, 0, 0), vec3.new(offsetX, shift + offsetY, height + offsetZ)),
    }
  end

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
        models = models,
      },
    },
  }
end

function data()
return { updateFn = updateFn }
end
