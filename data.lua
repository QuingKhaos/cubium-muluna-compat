local khaoslib_recipe = require("__khaoslib__.recipe")
local khaoslib_technology = require("__khaoslib__.technology")

khaoslib_recipe:load {
  type = "recipe",
  name = "muluna-tree-growth-greenhouse-cubium",
  category = "muluna-greenhouse",
  subgroup = "muluna-forestry",
  icons = {
    {icon = "__muluna-graphics__/graphics/icons/molecule-carbon-dioxide.png", icon_size = 64, scale = 0.3, shift = {-5, -5}, draw_background = true},
    {icon = "__base__/graphics/icons/tree-01.png", icon_size = 64, scale = 0.35, shift = {-5, 5}, draw_background = true},
    {icon = "__cubium__/graphics/icons/fluid/liquid-hope.png", icon_size = 64, scale = 0.3, shift = {5, -5}, draw_background = true},
  },
  enabled = false,
  allow_productivity = true,
  maximum_productivity = 3,
  allow_quality = false,
  auto_recycle = false,
  hide_from_signal_gui = false,
  energy_required = 300,
  ingredients = {
    {type = "item", name = "tree-seed", amount = 10},
    {type = "fluid", name = "carbon-dioxide", amount = 20000, fluidbox_index = 1, ignored_by_productivity = 20000},
    {type = "fluid", name = "water", amount = 500, fluidbox_index = 2},
    {type = "item", name = "energized-microcube", amount = 1},
    {type = "fluid", name = "liquid-hope", amount = 500, fluidbox_index = 3},
  },
  results = {
    {type = "item", name = "muluna-sapling", amount = 20},
    {type = "fluid", name = "oxygen", amount = 20000, fluidbox_index = 1, ignored_by_productivity = 20000},
    {type = "fluid", name = "emotional-tar", amount = 500, fluidbox_index = 2, ignored_by_productivity = 500},
    {type = "item", name = "dormant-microcube", amount = 1, percent_spoiled = 0, ignored_by_productivity = 9999, show_details_in_recipe_tooltip = false},
  },
  result_is_always_fresh = true,
} :commit()

khaoslib_recipe:load {
  type = "recipe",
  name = "muluna-tree-growth-greenhouse-water-saving-cubium",
  category = "muluna-greenhouse",
  subgroup = "muluna-forestry",
  icons = {
    {icon = "__base__/graphics/icons/fluid/water.png", icon_size = 64, scale = 0.3, shift = {-5, -5}, draw_background = true},
    {icon = "__base__/graphics/icons/tree-01.png", icon_size = 64, scale = 0.35, shift = {-5, 5}, draw_background = true},
    {icon = "__cubium__/graphics/icons/fluid/liquid-hope.png", icon_size = 64, scale = 0.3, shift = {5, -5}, draw_background = true},
  },
  enabled = false,
  allow_productivity = true,
  maximum_productivity = 3,
  allow_quality = false,
  auto_recycle = false,
  hide_from_signal_gui = false,
  energy_required = 600,
  ingredients = {
    {type = "item", name = "tree-seed", amount = 10},
    {type = "fluid", name = "carbon-dioxide", amount = 20000, fluidbox_index = 1, ignored_by_productivity = 20000},
    {type = "fluid", name = "water", amount = 250, fluidbox_index = 2},
    {type = "item", name = "energized-microcube", amount = 1},
    {type = "fluid", name = "liquid-hope", amount = 1000, fluidbox_index = 3},
  },
  results = {
    {type = "item", name = "muluna-sapling", amount = 20},
    {type = "fluid", name = "oxygen", amount = 20000, fluidbox_index = 1, ignored_by_productivity = 20000},
    {type = "fluid", name = "emotional-tar", amount = 1000, fluidbox_index = 2, ignored_by_productivity = 1000},
    {type = "item", name = "dormant-microcube", amount = 1, percent_spoiled = 0, ignored_by_productivity = 9999, show_details_in_recipe_tooltip = false},
  },
  result_is_always_fresh = true,
} :commit()

khaoslib_technology:load {
  type = "technology",
  name = "muluna-greenhouses-cubium",
  localised_name = {"recipe-name.muluna-tree-growth-greenhouse-cubium"},
  icons = {
    {icon = "__muluna-graphics__/graphics/greenhouse/sprites/greenhouse-icon-big.png", icon_size = 640},
    {icon = "__cubium__/graphics/icons/fluid/liquid-hope.png", icon_size = 64, scale = 0.75, shift = {45, 45}},
  },
  prerequisites = {
    "muluna-greenhouses",
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack",
    "interstellar-science-pack",
    "cube-mastery-3",
  },
  effects = {
    {type = "unlock-recipe", recipe = "carbon-dioxide"},
    {type = "unlock-recipe", recipe = "muluna-tree-growth-greenhouse-cubium"},
    {type = "unlock-recipe", recipe = "muluna-tree-growth-greenhouse-water-saving-cubium"},
  },
  unit = {
    time = 60,
    count = 5000,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1},
      {"interstellar-science-pack", 1},
    },
  },
} :commit()
