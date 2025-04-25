local data_util = require("__bzgas__.data-util");
require("factsheet")

-- Added by Brevven for bzgas
-- local gd = "__gas-boiler__"
local gd = "__bzgas__/gas-boiler"



gf_boiler_entity = util.table.deepcopy(data.raw.boiler.boiler)
gf_boiler_entity.name = "gas-boiler"
gf_boiler_entity.icon = gd.."/graphics/icons/gas-boiler.png"
gf_boiler_entity.icon_size = 32
gf_boiler_entity.minable.result = "gas-boiler"
gf_boiler_entity.fast_replaceable_group = "boiler"
gf_boiler_entity.energy_source = {
	type = "fluid",
  emissions_per_minute = { pollution = 30 },
	fluid_box = {
    volume = 100,
		pipe_covers = pipecoverspictures(),
		pipe_picture = {
			north = {
        filename = gd.."/graphics/entity/"
          .."hr-assembling-machine-1-pipe-N.png",
        priority = "extra-high",
        width = 71,
        height = 38,
        shift = util.by_pixel(2.25, 13.5),
        scale = 0.5
			},
			east = {
					filename = gd.."/graphics/entity/"
						.."hr-assembling-machine-1-pipe-E.png",
					priority = "extra-high",
					width = 42,
					height = 76,
					shift = util.by_pixel(-24.5, 1),
					scale = 0.5
			},
			south = {
					filename = gd.."/graphics/entity/"
						.."hr-assembling-machine-1-pipe-S.png",
					priority = "extra-high",
					width = 88,
					height = 61,
					shift = util.by_pixel(0, -31.25),
					scale = 0.5
			},
			west = {
					filename = gd.."/graphics/entity/"
						.."hr-assembling-machine-1-pipe-W.png",
					priority = "extra-high",
					width = 39,
					height = 73,
					shift = util.by_pixel(25.75, 1.25),
					scale = 0.5
			}
		},
		pipe_connections = {
			{flow_direction = "input", direction = defines.direction.west, position = {0, 0.788}}, --{0, 1.5}
		},
    production_type = "input",
		secondary_draw_orders = {
			south = 32,
			north = -1,
			east = -1,
			west = -1,
		}
	},
	burns_fluid = true,
	scale_fluid_usage = true,
	smoke = {{
			name = "smoke",
			north_position = util.by_pixel(-38, -47.5),
			south_position = util.by_pixel(38.5, -32),
			east_position = util.by_pixel(20, -70),
			west_position = util.by_pixel(-19, -8.5),
			frequency = 15,
			starting_vertical_speed = 0.3,
			starting_frame_deviation = 0
	}},
	light_flicker = {
		color = colors.gas_fire_glow,
		minimum_light_size = 0.1,
		light_intensity_to_size_coefficient = 1
	}
}
gf_boiler_entity.fire_flicker_enabled = false
gf_boiler_entity.fire_glow_flicker_enabled = false
gf_boiler_entity.fire = {}
gf_boiler_entity.fire_glow = {
  north={
    filename = 	gd.."/graphics/entity/hr-gas-boiler-N-light.png",
    apply_runtime_tint = true,
    tint={r=1,g=0.6,b=0.6,a=0.4},
    blend_mode = "additive-soft",
  },
  south = {
    filename = 	gd.."/graphics/entity/hr-gas-boiler-S-light.png",
    apply_runtime_tint = true,
    tint={r=1,g=0.6,b=0.6,a=0.4},
    blend_mode = "additive-soft",
  },
  east = {
    filename = 	gd.."/graphics/entity/hr-gas-boiler-E-light.png",
    apply_runtime_tint = true,
    tint={r=1,g=0.6,b=0.6,a=0.4},
    blend_mode = "additive-soft",
  },
  west = {
    filename = 	gd.."/graphics/entity/hr-gas-boiler-W-light.png",
    apply_runtime_tint = true,
    tint={r=1,g=0.6,b=0.6,a=0.4},
    blend_mode = "additive-soft",
  },
}

gf_boiler_item = util.table.deepcopy(data.raw.item.boiler)
gf_boiler_item.name = "gas-boiler"
gf_boiler_item.icon_size = 32
gf_boiler_item.icon = gd.."/graphics/icons/gas-boiler.png"
gf_boiler_item.order = "b[steam-power]-b[gas-boiler]"
gf_boiler_item.place_result = "gas-boiler"

gf_boiler_recipe = {
	type = "recipe",
	name = "gas-boiler",
	enabled = false,
	ingredients = {
		data_util.item("boiler",1),
		data_util.item("pump",1),
    },
	results = {data_util.item("gas-boiler",1)}
}

data:extend({
	gf_boiler_item,
	gf_boiler_recipe,
	gf_boiler_entity
})
add_recipe_to_tech(
	"fluid-handling",
	"gas-boiler"
)
