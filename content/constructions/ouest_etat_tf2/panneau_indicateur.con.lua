-- Porté depuis le mod TF2 « Pack Ouest Etat » (Panneau_indicateur.con)

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
  categories = { "sign" },
  availability = { yearFrom = 1850, yearTo = 0 },
  description = {
    name = _("Panneau indicateur"),
    description = _("Panneaux directionnels et de sortie Ouest-État, panneau accès aux trains, panneaux divers et poteau SNCF. Accroche à la voie par défaut, MAJ pour placer librement."),
    icon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_panneau.tga",
    previewIcon = "pack_ouest_etat::/constructions/ouest_etat_icons/ouest_etat_panneau_preview.tga",
  },
  menuCategory = {
    categories = {
      { category = "rail_assets", filterCategories = { "sign" }, order = 4410 },
    },
  },
  params = {
    {
      key = "panneau",
      name = _("Type"),
      uiType = "ComboBox",
      values = {
        _("Direction gauche/droite"),
        _("Direction gauche"),
        _("Direction droite"),
        _("Sortie gauche"),
        _("Sortie droite"),
        _("Accès aux trains"),
        _("Sortie simple"),
        _("Avertissement traversée"),
        _("Interdiction jaune"),
        _("Poteau SNCF"),
      },
      defaultIndex = 1,
    },
    { key = "positiony_gare", name = _("Côté"), uiType = "Button", values = { _("Gauche"), _("Droite") }, defaultIndex = 1 },
    { key = "offsetz", name = _("Hauteur"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsety", name = _("Distance à la voie"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "offsetx", name = _("Espacement"), uiType = "Slider", values = cm(OFFSETS), defaultIndex = math.floor(#OFFSETS / 2) + 1 },
    { key = "zRotate", name = _("Rotation Z"), uiType = "Slider", values = degrees(DEGREES), defaultIndex = math.floor(#DEGREES / 2) + 1 },
  },
  updateScript = {
    fileName = "panneau_indicateur.script@updateFn",
    params = {},
  },
}
end
