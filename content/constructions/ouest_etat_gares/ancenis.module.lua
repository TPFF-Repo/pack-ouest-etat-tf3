function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare d’Ancenis"),
    description = _("Bâtiment de gare d’Ancenis de style Ouest-État."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_ancenis.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_ancenis_preview.tga",
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
    tag = "ouest_etat_ancenis",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/ancenis/ancenis.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/ancenis/ancenis.mdl",
      extend = { 21.2, -21.2, 0.375, -25.81 },
      laneLists = {
        {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 3.6, -25.85, 0.05, }, { 0, 5.75, 0.8, }, 1.5, },
              { { 3.6, -20.1, 0.85, }, { 0, 5.75, 0.8, }, 1.5, },
              { { 3.6, -20.1, 0.85, }, { 0, 20.1, 0, }, 1.5, },
              { { 3.6, 0, 0.85, }, { 0, 20.1, 0, }, 1.5, },
              { { -5.4, -25.85, 0.05, }, { -0.1, 5.75, 0.8, }, 1.5, },
              { { -5.5, -20.1, 0.85, }, { -0.1, 5.75, 0.8, }, 1.5, },
              { { -5.5, -20.1, 0.85, }, { -2.3, 7.4, 0, }, 1.5, },
              { { -7.8, -12.7, 0.85, }, { -2.3, 7.4, 0, }, 1.5, },
              { { -7.75, -12.7, 0.85, }, { -11.85, 0, 0, }, 1.5, },
              { { -19.6, -12.7, 0.85, }, { -11.85, 0, 0, }, 1.5, },
              { { -19.6, -12.65, 0.85, }, { 0, 12.65, 0, }, 1.5, },
              { { -19.6, 0, 0.85, }, { 0, 12.65, 0, }, 1.5, },
              { { 11.25, -25.85, 0.05, }, { -0.05, 5.75, 0.8, }, 1.5, },
              { { 11.2, -20.1, 0.85, }, { -0.05, 5.75, 0.8, }, 1.5, },
              { { 11.2, -20.1, 0.85, }, { 2.45, 7.55, 0, }, 1.5, },
              { { 13.65, -12.55, 0.85, }, { 2.45, 7.55, 0, }, 1.5, },
              { { 13.65, -12.55, 0.85, }, { 5.9, 0, 0, }, 1.5, },
              { { 19.55, -12.55, 0.85, }, { 5.9, 0, 0, }, 1.5, },
              { { 19.55, -12.55, 0.85, }, { 0, 12.55, 0, }, 1.5, },
              { { 19.55, 0, 0.85, }, { 0, 12.55, 0, }, 1.5, },
          },
        },
      },
    },
  },
}
end