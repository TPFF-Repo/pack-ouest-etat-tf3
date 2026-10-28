function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare de Guingamp (sans marquise, affichage)"),
    description = _("Bâtiment de gare de cholet de style Ouest-État."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_guingamp_sm_aff.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_guingamp_sm_aff_preview.tga",
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
    tag = "ouest_etat_guingamp_sm_aff",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/guingamp_sm/guingamp_sm_aff.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/guingamp_sm/guingamp_sm_aff.mdl",
      extend = { 31.7, -31.7, 0, -18.85 },
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
              { { -7.75, -10.75, 0.85, }, { -22.3, 0, 0, }, 1.5, },
              { { -30.05, -10.75, 0.85, }, { -22.3, 0, 0, }, 1.5, },
              { { -30.05, -10.75, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { -30.05, 0, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { 5.5, -19.2, 0.05, }, { 0, 3.95, 0.8, }, 1.5, },
              { { 5.5, -15.25, 0.85, }, { 0, 3.95, 0.8, }, 1.5, },
              { { 5.5, -15.25, 0.85, }, { 2.25, 4.5, 0, }, 1.5, },
              { { 7.75, -10.75, 0.85, }, { 2.25, 4.5, 0, }, 1.5, },
              { { 7.75, -10.75, 0.85, }, { 22.3, 0, 0, }, 1.5, },
              { { 30.05, -10.75, 0.85, }, { 22.3, 0, 0, }, 1.5, },
              { { 30.05, -10.75, 0.85, }, { 0, 10.75, 0, }, 1.5, },
              { { 30.05, 0, 0.85, }, { 0, 10.75, 0, }, 1.5, },
          },
        },
    },
  },
}
end