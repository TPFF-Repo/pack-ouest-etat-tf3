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
local SIZES = { "s", "m" }
local LOGOS = { "nouille", "casquette", "carmillon" }

local updateFn = function(captureParams, params)
  local size = SIZES[params.size_abri]
  local logo = LOGOS[params.logo_abri]
  local bench = "nb"
  if params.banc_abri == 2 then bench = "b" end

  local offsetX = OFFSETS[params.offsetx] / 100
  local offsetY = OFFSETS[params.offsety] / 100
  local offsetZ = OFFSETS[params.offsetz] / 100
  local rotation = DEGREES[params.zRotate]

  local shift = 5
  if params.positiony_abri == 1 then shift = -5 end
  local height = 1

  local transf = mat4.rotZYXTransl(
    vec3.new(math.rad(rotation), 0, 0),
    vec3.new(offsetX, shift + offsetY, height + offsetZ))

  local model = string.format("pack_ouest_etat::/assets/abri_quai/abri_gen_%s_%s_%s.mdl", bench, size, logo)

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
          { id = model, transf = transf },
        },
      },
    },
  }
end

function data()
return { updateFn = updateFn }
end
