function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare de Cholet"),
    description = _("Bâtiment de gare de cholet de style Ouest-État."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_cholet.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_cholet_preview.tga",
  },
  buildMode = "SINGLE",
  autoRemovable = false,
  type = "rail_building_size3",
  metadata = {
    era = 0,
    level = 1,
    span = { 1, 4 },
    catchmentPassenger = { radius = 160 },
    moreCapacity = { passenger = 0 },
    price = 250000,
    maintenanceCost = 25000,
    comfortFactor = 0.05,
    tag = "ouest_etat_cholet",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/cholet/cholet.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/cholet/cholet.mdl",
      extend = { 38.77, -38.77, 0.1, -38.84 },
      laneLists = {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 0, -38.85, 0.05, }, { 0, 11.45, 0.8, }, 1.5, },
              { { 0, -27.4, 0.85, }, { 0, 11.45, 0.8, }, 1.5, },
              { { 0, -27.4, 0.85, }, { 0, 27.4, 0, }, 1.5, },
              { { 0, 0, 0.85, }, { 0, 27.4, 0, }, 1.5, },
              { { -5.4, -38.85, 0.05, }, { -0.1, 11.45, 0.8, }, 1.5, },
              { { -5.5, -27.4, 0.85, }, { -0.1, 11.45, 0.8, }, 1.5, },
              { { -5.5, -27.4, 0.85, }, { -2.3, 10.9, 0, }, 1.5, },
              { { -7.8, -16.5, 0.85, }, { -2.3, 10.9, 0, }, 1.5, },
              { { -7.85, -16.5, 0.85, }, { -25.65, 3.8, 0, }, 1.5, },
              { { -33.5, -12.7, 0.85, }, { -25.65, 3.8, 0, }, 1.5, },
              { { -33.5, -12.65, 0.85, }, { 0, 12.65, 0, }, 1.5, },
              { { -33.5, 0, 0.85, }, { 0, 12.65, 0, }, 1.5, },
              { { 5.4, -38.85, 0.05, }, { 0.1, 11.45, 0.8, }, 1.5, },
              { { 5.5, -27.4, 0.85, }, { 0.1, 11.45, 0.8, }, 1.5, },
              { { 5.5, -27.4, 0.85, }, { 2.3, 10.9, 0, }, 1.5, },
              { { 7.8, -16.5, 0.85, }, { 2.3, 10.9, 0, }, 1.5, },
              { { 7.85, -16.5, 0.85, }, { 25.65, 3.8, 0, }, 1.5, },
              { { 33.5, -12.7, 0.85, }, { 25.65, 3.8, 0, }, 1.5, },
              { { 33.5, -12.65, 0.85, }, { 0, 12.65, 0, }, 1.5, },
              { { 33.5, 0, 0.85, }, { 0, 12.65, 0, }, 1.5, },
          },
        },
    },
  },
}
end