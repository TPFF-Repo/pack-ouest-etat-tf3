-- Ported from the TF2 mod "Pack Ouest Etat" (Abri_quai_generique.con)
-- Note: the separate bench props of the TF2 version are not present in the TF3 pack;
-- the "bench" parameter selects the shelter model that already includes the bench
-- (abri_gen_b_*) instead of abri_gen_nb_*.

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
  availability = { yearFrom = 1850, yearTo = 0 },
  description = {
    name = _("Abri de quai générique"),
    description = _("Abri de quai générique Ouest-État (deux tailles, trois logos SNCF, avec ou sans banc)."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_abri_quai.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_abri_quai_preview.tga",
  },
  menuCategory = {
    categories = {
      { category = "rail_assets", filterCategories = { "building" }, order = 4407 },
    },
  },
  params = {
    { key = "size_abri", name = _("Taille"), uiType = "Button", values = { _("S"), _("M") }, defaultIndex = 1 },
    { key = "logo_abri", name = _("Logo SNCF"), uiType = "Button", values = { _("Nouille"), _("Casquette"), _("Carmillon") }, defaultIndex = 1 },
    { key = "banc_abri", name = _("Avec banc"), uiType = "Button", values = { _("Non"), _("Oui") }, defaultIndex = 1 },
    { key = "positiony_abri", name = _("Côté"), uiType = "Button", values = { _("Gauche"), _("Droite") }, defaultIndex = 1 },
    { key = "offsetz", name = _("Hauteur"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsety", name = _("Distance à la voie"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsetx", name = _("Espacement"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "zRotate", name = _("Rotation Z"), uiType = "Slider", values = degrees(DEGREES), defaultIndex = math.floor(#DEGREES / 2) + 1 },
  },
  updateScript = {
    fileName = "abri_quai_generique.script@updateFn",
    params = {},
  },
}
end
