-- Ported from the TF2 mod "Pack Ouest Etat" (poteau_modulable.con)
-- The TF2 parameters "horloges" and "ecran_infogare" are not ported yet: the clock
-- and screen models are not imported in the TF3 pack. Only the post and the track sign remain.

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
local OFFSETS_Z = intRange(-200, 200, 5)

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
    name = _("Poteau modulable"),
    description = _("Poteau SNCF placé le long de la voie, avec panneau de voie optionnel."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_panneau.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_panneau_preview.tga",
  },
  menuCategory = {
    categories = {
      { category = "rail_assets", filterCategories = { "sign" }, order = 4404 },
    },
  },
  params = {
    { key = "panneau_voie", name = _("Panneau de voie"), uiType = "ComboBox", values = { _("Non"), _("Simple"), _("Double") }, defaultIndex = 1 },
    { key = "positiony_gare", name = _("Côté"), uiType = "Button", values = { _("Gauche"), _("Droite") }, defaultIndex = 1 },
    { key = "offsetz", name = _("Hauteur"), uiType = "Slider", values = cm(OFFSETS_Z), defaultIndex = math.floor(#OFFSETS_Z / 2) + 1 },
    { key = "offsety", name = _("Distance à la voie"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsetx", name = _("Espacement"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
  },
  updateScript = {
    fileName = "poteau_modulable.script@updateFn",
    params = {},
  },
}
end
