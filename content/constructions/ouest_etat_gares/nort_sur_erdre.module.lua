function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare de Nort-sur-Erdre"),
    description = _("Bâtiment de gare de Nort-sur-Erdre de style Ouest-État."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_nort_sur_erdre.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_nort_sur_erdre_preview.tga",
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
    tag = "ouest_etat_nort_sur_erdre",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/nort_sur_erdre/nort_sur_erdre.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/nort_sur_erdre/nort_sur_erdre.mdl",
      extend = { 15.07, -15.07, 0.49, -25.83 },
            laneLists = {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 0, -25.8, 0.05, }, { 0, 5.8, 0.8, }, 1.5, },
              { { 0, -20, 0.85, }, { 0, 5.8, 0.8, }, 1.5, },
              { { 0, -20, 0.85, }, { 0, 6.45, 0, }, 1.5, },
              { { 0, -13.55, 0.85, }, { 0, 6.45, 0, }, 1.5, },
              { { 0, -13.55, 0.85, }, { 0, 14, 0, }, 1.5, },
              { { 0, 0.45, 0.85, }, { 0, 14, 0, }, 1.5, },
          },
        },
    },
  },
}
end