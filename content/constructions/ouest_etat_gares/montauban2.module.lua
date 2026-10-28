function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare de Montauban (affichage, plaque)"),
    description = _("Bâtiment de gare de Montauban de style Ouest-État, avec panneau d'affichage et socle."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_montauban2.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_montauban2_preview.tga",
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
    tag = "ouest_etat_montauban2",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/montauban2/montauban2.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/montauban2/montauban2.mdl",
      extend = { 8, -8.1, 0, -14.13 },
      laneLists = {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 0, -14.25, 0.05, }, { 0, 3.8, 0.8, }, 1.5, },
              { { 0, -10.45, 0.85, }, { 0, 3.8, 0.8, }, 1.5, },
              { { 0, -10.45, 0.85, }, { 0, 10.45, 0, }, 1.5, },
              { { 0, 0, 0.85, }, { 0, 10.45, 0, }, 1.5, },
          },
        },
    },
  },
}
end