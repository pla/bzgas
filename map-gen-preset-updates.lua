if data.raw["map-gen-presets"] and data.raw["map-gen-presets"].default then
  for name, preset in pairs(data.raw["map-gen-presets"].default) do 
    if type(preset) == "table" and 
      preset.basic_settings and 
      preset.basic_settings.autoplace_controls and 
      preset.basic_settings.autoplace_controls["iron-ore"] then
        preset.basic_settings.autoplace_controls["gas"] = preset.basic_settings.autoplace_controls["iron-ore"]
    end
  end
end

for _, resource in pairs({ "gas" }) do
  data.raw.planet.nauvis.map_gen_settings.autoplace_controls[resource] = {}
  data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings[resource] = {}
end
