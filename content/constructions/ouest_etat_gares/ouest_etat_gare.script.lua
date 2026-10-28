-- Pack Ouest Etat - gare module script
-- Adds the station building model to the modular station building slot and
-- registers the pedestrian lanes that are defined in the module params.
--
-- Contract copied from the vanilla station modules
-- (stations/rail/modular_station/modules.script.lua -> updateFnBuilding and
--  stations/rail/trainstationutil.lua -> MakeMainBuildingModule):
--   * the model is rotated -90 degrees around Z and shifted by 7.5 m on X
--     relative to the slot, exactly like the vanilla main building modules
--   * models go through addModel(name, transf, tag, result.cargoStation.models)
--   * lanes are appended to result.cargoStation.laneLists
--   * result.subconstructions does not exist yet at module time
--
-- The lanes are appended from the terminateConstructionHook, i.e. after the
-- vanilla station has rebuilt its subconstructions and after the legacy lane
-- import. Appending last avoids shifting the lane list indices that the
-- station terminals of the platform modules refer to.
--
-- The lane node tangents are precomputed in the .module.lua params (tangent
-- length = edge length) because the tangents stored in the imported .mdl
-- metadata are not usable directly.

local transf = require "::/scripts/mat4.tl"
local vec3 = require "::/scripts/vec3.tl"
local modulesutil = require "::/scripts/construction/modulesutil.lua"

local function modelList(captureParams)
  return {
    { id = captureParams.model, transf = transf.identity() },
  }
end

local getModelsFn = function(captureParams)
  local modelTransf = transf.rotZTransl(math.rad(-90), vec3.new(7.5, 0, 0))
  return {
    { id = captureParams.model, transf = modelTransf },
  }
end

local updateFn = function(captureParams, result, transform, tag, slotId, addModel, constrParams)
  local station = result.cargoStation
  local list = modelList(captureParams)
  local baseTransf = transform or transf.identity()

  -- Same placement as the vanilla main building modules.
  local modelTransf = transf.rotZTransl(math.rad(-90), vec3.new(7.5, 0, 0))
  local assetTransf = transf.mul(baseTransf, modelTransf)

  for i = 1, #list do
    -- addModel() already applies the slot transform internally, so pass the
    -- relative model transform here (exactly like MakeMainBuildingModule line 389:
    -- addModelFn(config.main, modelTransf)).
    if station and station.models then
      addModel(list[i].id, modelTransf, tag, station.models)
    elseif addModel then
      addModel(list[i].id, modelTransf, tag)
    end
  end

  -- Level the terrain under the footprint (optional, so it never blocks the build).
  local ext = captureParams.extend
  if ext and station and station.terrainAlignmentLists then
    local face = {
      { ext[1], ext[4], 0.0, 1.0 },
      { ext[1], ext[3], 0.0, 1.0 },
      { ext[2], ext[3], 0.0, 1.0 },
      { ext[2], ext[4], 0.0, 1.0 },
    }
    modulesutil.TransformFaces(assetTransf, face)
    station.terrainAlignmentLists[#station.terrainAlignmentLists + 1] = {
      type = "EQUAL",
      faces = { face },
      optional = true,
    }
  end

  local laneLists = captureParams.laneLists
  if laneLists and station and station.laneLists then
    local prevHook = result.terminateConstructionHook

    result.terminateConstructionHook = function()
      if prevHook then
        prevHook()
      end

      for i = 1, #laneLists do
        local src = laneLists[i]
        station.laneLists[#station.laneLists + 1] = {
          transf = assetTransf,
          transportModes = src.transportModes,
          speedLimit = src.speedLimit,
          nodes = src.nodes,
          linkable = src.linkable,
          forwardOnly = src.forwardOnly,
          needsReservation = src.needsReservation,
        }
      end
    end
  end

  return result
end

function data()
return {
  gare = {
    updateFn = updateFn,
    getModelsFn = getModelsFn,
  },
}
end
