local controllers_tile_by_data = { }
local tile_types = require "tiles.tile_types"
controllers_tile_by_data[tile_types.CITY] = require "tiles.city_creater"

local function get_tile_by_data(data)
  if controllers_tile_by_data[data.type] then
    return controllers_tile_by_data[data.type](data)
  end
end

return get_tile_by_data