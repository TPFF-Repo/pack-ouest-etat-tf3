-- Ecran de quai Ouest-Etat : pose libre le long de la voie (asset)
local function intRange(start, stop, step)
  local a = {}
  local i = start
  while i <= stop do
    a[#a + 1] = i
    i = i + step
  end
  return a
end

local function cm(a)
  local r = {}
  for i = 1, #a do r[i] = a[i] .. " cm" end
  return r
end

local OFFSETS = intRange(-500, 500, 5)

function data()
return {
  type = "ASSET_TRACK",
  buildMode = "MULTI",
  skipCollision = true,
  autoRemovable = false,
  snapping = { rail = true, road = false, water = false },
  categories = { "sign" },
  availability = { yearFrom = 1850, yearTo = 0 },
  description = {
    name = _("Écran de quai"),
    description = _("Écran de départ Ouest-État, posé le long de la voie."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_ecran.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_ecran_preview.tga",
  },
  menuCategory = {
    categories = {
      { category = "rail_assets", filterCategories = { "sign" }, order = 4406 },
    },
  },
  params = {
    { key = "affichage", name = _("Affichage"), uiType = "ComboBox", values = { _("3 trains"), _("Liste des départs") }, defaultIndex = 1 },
    { key = "positiony_gare", name = _("Côté"), uiType = "Button", values = { _("Gauche"), _("Droite") }, defaultIndex = 1 },
    { key = "offsetz", name = _("Hauteur"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsety", name = _("Distance à la voie"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsetx", name = _("Espacement"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
  },
  updateScript = {
    fileName = "ecran_quai.script@updateFn",
    params = {},
  },
}
end
