function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare d'Yffiniac"),
    description = _("Bâtiment de gare d'Yffiniac de style Ouest-État."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_yffiniac.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_yffiniac_preview.tga",
  },
  buildMode = "SINGLE",
  autoRemovable = false,
  type = "rail_building_size3",
  metadata = {
    era = 0,
    level = 1,
    span = { 1, 2 },
    catchmentPassenger = { radius = 160 },
    moreCapacity = { passenger = 0 },
    price = 250000,
    maintenanceCost = 25000,
    comfortFactor = 0.05,
    tag = "ouest_etat_yffiniac",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/yffiniac/yffiniac.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/yffiniac/yffiniac.mdl",
      extend = { 11.66, -13.34, 0.01, -17.88 },
            laneLists = {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 2.5, -17.7, 0.05, }, { 0, 1.6, 0.8, }, 1.5, },
              { { 2.5, -16.1, 0.85, }, { 0, 1.6, 0.8, }, 1.5, },
              { { 2.5, -16.1, 0.85, }, { 0, 16.1, 0, }, 1.5, },
              { { 2.5, 0, 0.85, }, { 0, 16.1, 0, }, 1.5, },
              { { -1, -17.7, 0.05, }, { 0, 1.6, 0.8, }, 1.5, },
              { { -1, -16.1, 0.85, }, { 0, 1.6, 0.8, }, 1.5, },
              { { -1, -16.1, 0.85, }, { 0, 2.95, 0, }, 1.5, },
              { { -1, -13.15, 0.85, }, { 0, 2.95, 0, }, 1.5, },
              { { -1, -13.15, 0.85, }, { -10.85, 0, 0, }, 1.5, },
              { { -11.85, -13.15, 0.85, }, { -10.85, 0, 0, }, 1.5, },
              { { -11.85, -13.15, 0.85, }, { 0, 13.15, 0, }, 1.5, },
              { { -11.85, 0, 0.85, }, { 0, 13.15, 0, }, 1.5, },
          },
        },
    },
  },
}
end