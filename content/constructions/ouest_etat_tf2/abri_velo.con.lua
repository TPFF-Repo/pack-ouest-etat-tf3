-- Ported from the TF2 mod "Pack Ouest Etat" (Abri_velo.con)

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
    name = _("Abri vélo"),
    description = _("Abri vélo Ouest-État, deux variantes (Baule-Escoublac)."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_abri_velo.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_abri_velo_preview.tga",
  },
  menuCategory = {
    categories = {
      { category = "rail_assets", filterCategories = { "building" }, order = 4408 },
    },
  },
  params = {
    { key = "type_abri", name = _("Type"), uiType = "ComboBox", values = { _("Baule-Escoublac"), _("Baule-Escoublac 2"), _("Abri vélo 1"), _("Abri vélo trottoir"), _("Auvent abri vélo") }, defaultIndex = 1 },
    { key = "positiony_abri", name = _("Côté"), uiType = "Button", values = { _("Gauche"), _("Droite") }, defaultIndex = 1 },
    { key = "offsetz", name = _("Hauteur"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsety", name = _("Distance à la voie"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsetx", name = _("Espacement"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "zRotate", name = _("Rotation Z"), uiType = "Slider", values = degrees(DEGREES), defaultIndex = math.floor(#DEGREES / 2) + 1 },
  },
  updateScript = {
    fileName = "abri_velo.script@updateFn",
    params = {},
  },
}
end
