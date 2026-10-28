-- Ported from the TF2 mod "Pack Ouest Etat" (Panneau_Gare.con)

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
    name = _("Panneau de gare"),
    description = _("Panneaux de gare Ouest-État (double support, fin de quai, RB), placés le long de la voie."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_panneau.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_panneau_preview.tga",
  },
  menuCategory = {
    categories = {
      { category = "rail_assets", filterCategories = { "sign" }, order = 4405 },
    },
  },
  params = {
    { key = "panneau", name = _("Type"), uiType = "ComboBox", values = { _("Aucun"), _("Panneau double support"), _("Panneau fin de quai"), _("Panneau gare RB"), _("Panneau blanc FR/BRE"), _("Panneau SNCF 2011 bleu"), _("Panneau SNCF blanc FR/BRE"), _("Panneau SNCF bleu FR") }, defaultIndex = 1 },
    { key = "positiony_gare", name = _("Côté"), uiType = "Button", values = { _("Gauche"), _("Droite") }, defaultIndex = 1 },
    { key = "offsetz", name = _("Hauteur"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsety", name = _("Distance à la voie"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsetx", name = _("Espacement"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
  },
  updateScript = {
    fileName = "panneau_gare.script@updateFn",
    params = {},
  },
}
end
