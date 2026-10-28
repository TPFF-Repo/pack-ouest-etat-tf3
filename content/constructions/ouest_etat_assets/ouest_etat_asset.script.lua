-- Pack Ouest Etat - asset script
-- Places a single model as a decorative asset.

function data()
return {
  updateFn = function(captureParams, params)
    return {
      cost = 0,
      bulldozeCost = 0,
      maintenanceCost = 0,
      subconstructions = {
        {
          tag = 1,
          models = {
            { id = captureParams.modelId, transf = { 1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1, }, },
          },
        },
      },
    }
  end,
}
end
