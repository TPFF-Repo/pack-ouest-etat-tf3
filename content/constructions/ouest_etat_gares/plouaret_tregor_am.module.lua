function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare de Plouaret-Trégor (avec marquise)"),
    description = _("Bâtiment de gare de Plouaret-Trégor de style Ouest-État, avec marquise."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_plouaret_tregor_am.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_plouaret_tregor_am_preview.tga",
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
    tag = "ouest_etat_plouaret_tregor_am",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/plouaret_tregor_am/plouaret_tregor_am.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/plouaret_tregor_am/plouaret_tregor_am.mdl",
      extend = { 19, -15, 0, -20.2 },
            laneLists = {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 17, -20.3, 0.05, }, { 0, 3.2, 0.8, }, 1.5, },
              { { 17, -17.1, 0.85, }, { 0, 3.2, 0.8, }, 1.5, },
              { { 17, -17.1, 0.85, }, { 0, 17.1, 0, }, 1.5, },
              { { 17, 0, 0.85, }, { 0, 17.1, 0, }, 1.5, },
          },
        },
    },
  },
}
end