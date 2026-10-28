function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare de Rosporden (affichage)"),
    description = _("Bâtiment de gare de Rosporden de style Ouest-État."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_rosporden_aff.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_rosporden_aff_preview.tga",
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
    tag = "ouest_etat_rosporden_aff",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/rosporden/rosporden_aff.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/rosporden/rosporden_aff.mdl",
      extend = { 27.13, -27.13, 0.34, -25.83 },
            laneLists = {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 5.05, -25.8, 0.05, }, { 0, 5.8, 0.8, }, 1.5, },
              { { 5.05, -20, 0.85, }, { 0, 5.8, 0.8, }, 1.5, },
              { { 5.05, -20, 0.85, }, { 0, 20, 0, }, 1.5, },
              { { 5.05, 0, 0.85, }, { 0, 20, 0, }, 1.5, },
              { { -5.5, -25.8, 0.05, }, { 0, 5.8, 0.8, }, 1.5, },
              { { -5.5, -20, 0.85, }, { 0, 5.8, 0.8, }, 1.5, },
              { { -5.5, -20, 0.85, }, { -2.25, 9.25, 0, }, 1.5, },
              { { -7.75, -10.75, 0.85, }, { -2.25, 9.25, 0, }, 1.5, },
              { { -7.75, -10.75, 0.85, }, { -17.8, 0, 0, }, 1.5, },
              { { -25.55, -10.75, 0.85, }, { -17.8, 0, 0, }, 1.5, },
              { { -25.55, -10.75, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { -25.55, 0, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { 11.2, -25.8, 0.05, }, { 0, 5.8, 0.8, }, 1.5, },
              { { 11.2, -20, 0.85, }, { 0, 5.8, 0.8, }, 1.5, },
              { { 11.2, -20, 0.85, }, { 2.45, 9.25, 0, }, 1.5, },
              { { 13.65, -10.75, 0.85, }, { 2.45, 9.25, 0, }, 1.5, },
              { { 13.65, -10.75, 0.85, }, { 11.25, 0, 0, }, 1.5, },
              { { 24.9, -10.75, 0.85, }, { 11.25, 0, 0, }, 1.5, },
              { { 24.9, -10.75, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { 24.9, 0, 0.85, }, { 0, 10.75, 0, }, 1.5, },
          },
        },
    },
  },
}
end