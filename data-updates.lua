local khaoslib_recipe = require("__khaoslib__.recipe")
local khaoslib_technology = require("__khaoslib__.technology")

local packs = {
  {name = "interstellar", copy_tech = "muluna-telescope"},
}

for _, pack in pairs(packs) do
  if khaoslib_recipe.exists(pack.name .. "-science-pack") and khaoslib_technology.exists(pack.copy_tech) and khaoslib_technology.exists(pack.name .. "-science-pack") then
    khaoslib_recipe:load(pack.name .. "-science-pack")
      :copy(pack.name .. "-science-pack-cubic")
      :unset("icons")
      :unset("icon")
      :unset("icon_size")
      :set {
        subgroup = mods["cubium-science-pack-reorder"] and (mods["science-tab"] and "cubic-science-pack" or "cubic-science") or "cubic",
        icons = {
          {icon = "__cubium__/graphics/icons/matter-cube.png", scale = 0.9},
          {icon = data.raw["tool"][pack.name .. "-science-pack"].icon, scale = 0.6},
        },
        localised_name = {"item-name." .. pack.name .. "-science-pack"},
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        result_is_always_fresh = true,
        order = mods["cubium-science-pack-reorder"] and data.raw["tool"][pack.name .. "-science-pack"].order or "ab",
      }
      :add_ingredient {type = "item", name = "energized-microcube", amount = 1}
      :add_ingredient {type = "fluid", name = "dream-concentrate", amount = 200, fluidbox_index = 1}
      :replace_result(function(result)
          return result.name == pack.name .. "-science-pack"
        end, function(result)
          result.amount = result.amount * 3
          return result
        end)
      :add_result {type = "item", name = "dormant-microcube", amount = 1, percent_spoiled = 0, ignored_by_productivity = 9999, show_details_in_recipe_tooltip = false}
      :commit()

    khaoslib_technology:load(pack.copy_tech)
      :copy(pack.name .. "-science-pack-cubic")
      :unset("icons")
      :unset("icon")
      :unset("icon_size")
      :set {icons = {
        {icon = "__cubium__/graphics/technology/ultradense-technology.png", icon_size = 256},
        {icon = data.raw["technology"][pack.name .. "-science-pack"].icon, icon_size = data.raw["technology"][pack.name .. "-science-pack"].icon_size, scale = 0.4, shift = {1, -10}},
      }}
      :unset("localised_name")
      :unset("localised_description")
      :clear_prerequisites()
      :add_prerequisite("cube-mastery-4")
      :add_prerequisite(pack.name .. "-science-pack")
      :set {unit = {time = 15, count = 1}}
      :add_science_pack {pack.name .. "-science-pack", 1}
      :clear_effects()
      :add_unlock_recipe(pack.name .. "-science-pack-cubic")
      :commit()
  end
end
