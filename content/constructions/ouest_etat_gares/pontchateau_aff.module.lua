function data()
return {
  availability = { yearFrom = 1850, yearTo = 0 },
  menuCategory = {
    categories = {
      { category = "modules_building", filterCategories = { "passenger" }, order = 600 },
    },
  },
  description = {
    name = _("Bâtiment de gare de Pontchâteau (affichage)"),
    description = _("Bâtiment de gare de Pontchâteau de style Ouest-État."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_pontchateau_aff.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_pontchateau_aff_preview.tga",
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
    tag = "ouest_etat_pontchateau_aff",
  },
  getModelsScript = {
    fileName = "ouest_etat_gare.script@gare.getModelsFn",
    params = { model = "pack_ouest_etat::/assets/gares/pontchateau/pontchateau_aff.mdl" },
  },
  updateScript = {
    fileName = "ouest_etat_gare.script@gare.updateFn",
    params = {
      model = "pack_ouest_etat::/assets/gares/pontchateau/pontchateau_aff.mdl",
      extend = { 21.2, -15.55, 0.28, -16.22 },
            laneLists = {
          linkable = true,
          speedLimit = 20,
          transportModes = { "PERSON", },
          nodes = {
              { { 6.2, -15.95, 0.05, }, { 0, 2.8, 0.8, }, 1.5, },
              { { 6.2, -13.15, 0.85, }, { 0, 2.8, 0.8, }, 1.5, },
              { { 6.2, -13.15, 0.85, }, { 0, 13.15, 0, }, 1.5, },
              { { 6.2, 0, 0.85, }, { 0, 13.15, 0, }, 1.5, },
          },
        },
    },
  },
}
end