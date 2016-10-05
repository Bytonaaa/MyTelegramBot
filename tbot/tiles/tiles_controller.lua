local tiles_contr = { }
local get_tile_by_data = require "tiles.get_tile_by_data"
local tile_types = require "tiles.tile_types"
local city_gen = require "tiles.city_dictionary"
local bar_gen = require "tiles.bar_dictionary"

local function rand(my_table)
  return my_table[math.random(#my_table)]
end

  function tiles_contr.get_start_tile(user)
    local data = city_gen[1]
    data.bar = rand(bar_gen)
    return get_tile_by_data(data)
  end

  function tiles_contr.get_next_tile(user)
    local data = rand(city_gen)
    data.bar = rand(bar_gen)
    return get_tile_by_data(data)
  end

return tiles_contr