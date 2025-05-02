-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
local util = require("data-util");

util.k2matter({
  k2matter = {
    material = { type = "fluid", name = "gas", amount = 100 },
    matter_count = 5,
    energy_required = 1,
    need_stabilizer = false,
    unlocked_by = "gas-matter-processing",
  },
  k2baseicon = "oil",
  icon = { icon = "__bzgas__/graphics/icons/gas.png", icon_size = 128, scale = 0.7}
})

end
