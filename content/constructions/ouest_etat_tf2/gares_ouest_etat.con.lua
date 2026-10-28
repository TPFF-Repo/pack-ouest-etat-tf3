-- Ported from the TF2 mod "Pack Ouest Etat" (Gares_Bretagne / Gares_Normandie / Gares_PDLL)
-- Only the stations whose models are imported in the TF3 pack are listed here (Ancenis).
-- Add the other names to the list below (see the script) once their .mdl files are imported.

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

local function degrees(a)
  local r = {}
  for i = 1, #a do r[i] = a[i] .. " deg" end
  return r
end

local OFFSETS = intRange(-500, 500, 5)
local DEGREES = intRange(-180, 180, 1)

function data()
return {
  type = "ASSET_TRACK",
  buildMode = "MULTI",
  skipCollision = true,
  autoRemovable = false,
  snapping = { rail = true, road = false, water = false },
  categories = { "building" },
  availability = { yearFrom = 1935, yearTo = 0 },
  description = {
    name = _("Gare Ouest-État"),
    description = _("Bâtiment de gare Ouest-État indépendant, placé le long de la voie avec réglages de position, socle et rotation (comportement Transport Fever 2)."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_gare.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_gare_preview.tga",
  },
  menuCategory = {
    categories = {
      { category = "rail_assets", filterCategories = { "building" }, order = 4401 },
    },
  },
  params = {
    { key = "positiony_gare", name = _("Côté"), uiType = "Button", values = { _("Gauche"), _("Droite") }, defaultIndex = 1 },
    { key = "variant_gares", name = _("Variante"), uiType = "ComboBox", values = { _("Ancenis"), _("Ancenis (signalétique)"), _("Briouze"), _("Cholet"), _("Cholet (affichage)"), _("Guingamp (avec marquise)"), _("Guingamp (avec marquise, affichage)"), _("Guingamp (sans marquise)"), _("Guingamp (sans marquise, affichage)"), _("Lamballe"), _("Montauban"), _("Montauban (affichage, plaque)"), _("Montauban (affichage, relief)"), _("Nort-sur-Erdre"), _("Nort-sur-Erdre (affichage)"), _("Plouaret-Trégor"), _("Pontchâteau"), _("Pontchâteau (affichage)"), _("Rosporden"), _("Rosporden (affichage)"), _("Yffiniac"), _("Yffiniac (affichage)") }, defaultIndex = 1 },
    { key = "socle", name = _("Socle"), uiType = "Button", values = { _("Oui"), _("Non") }, defaultIndex = 1 },
    { key = "offsetz", name = _("Décalage Z"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsety", name = _("Décalage Y"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsetx", name = _("Décalage X"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "zRotate", name = _("Rotation Z"), uiType = "Slider", values = degrees(DEGREES), defaultIndex = math.floor(#DEGREES / 2) + 1 },
  },
  updateScript = {
    fileName = "gares_ouest_etat.script@updateFn",
    params = {},
  },
}
end
