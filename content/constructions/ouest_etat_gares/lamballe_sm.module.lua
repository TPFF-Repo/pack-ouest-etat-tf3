function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare de Lamballe"),
    description = _("Bâtiment de gare de cholet de style Ouest-État."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_lamballe_sm.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_lamballe_sm_preview.tga",
  },
  buildMode = "SINGLE",
  autoRemovable = false,
  type = "rail_building_size3",
  metadata = {
    era = 0,
    level = 1,
    span = { 1, 3 },
    catchmentPassenger = { radius = 160 },
    moreCapacity = { passenger = 0 },
    price = 250000,
    maintenanceCost = 25000,
    comfortFactor = 0.05,
    tag = "ouest_etat_lamballe_sm",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/lamballe_sm/lamballe_sm.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/lamballe_sm/lamballe_sm.mdl",
      extend = { 23.7, -29.9, 0, -18.85 },
      laneLists = {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 0, -19.2, 0.05, }, { 0, 3.95, 0.8, }, 1.5, },
              { { 0, -15.25, 0.85, }, { 0, 3.95, 0.8, }, 1.5, },
              { { 0, -15.25, 0.85, }, { -1.45, 15.25, 0, }, 1.5, },
              { { -1.45, 0, 0.85, }, { -1.45, 15.25, 0, }, 1.5, },
              { { -5.5, -19.2, 0.05, }, { 0, 3.95, 0.8, }, 1.5, },
              { { -5.5, -15.25, 0.85, }, { 0, 3.95, 0.8, }, 1.5, },
              { { -5.5, -15.25, 0.85, }, { -2.25, 4.5, 0, }, 1.5, },
              { { -7.75, -10.75, 0.85, }, { -2.25, 4.5, 0, }, 1.5, },
              { { -7.75, -10.75, 0.85, }, { -20.9, 0, 0, }, 1.5, },
              { { -28.65, -10.75, 0.85, }, { -20.9, 0, 0, }, 1.5, },
              { { -28.65, -10.75, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { -28.65, 0, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { 5.5, -19.2, 0.05, }, { 0, 3.95, 0.8, }, 1.5, },
              { { 5.5, -15.25, 0.85, }, { 0, 3.95, 0.8, }, 1.5, },
              { { 5.5, -15.25, 0.85, }, { 2.25, 4.5, 0, }, 1.5, },
              { { 7.75, -10.75, 0.85, }, { 2.25, 4.5, 0, }, 1.5, },
              { { 7.75, -10.75, 0.85, }, { 14.25, 0, 0, }, 1.5, },
              { { 22, -10.75, 0.85, }, { 14.25, 0, 0, }, 1.5, },
              { { 22, -10.75, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { 22, 0, 0.85, }, { 0, 10.75, 0, }, 1.5, },
          },
        },
    },
  },
}
end