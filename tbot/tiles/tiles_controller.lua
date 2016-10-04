local tiles_contr = { }
local get_tile_by_data = require "tiles.get_tile_by_data"
local tile_types = require "tiles.tile_types"

  function tiles_contr.get_start_tile(user)
    local data = {["type"] = tile_types.CITY, 
      name = "My village", 
      bar = { ["type"] = tile_types.BAR,
        name = "Drinked RUSSIAN MAN"
      }
    }
    return get_tile_by_data(data)
  end

  function tiles_contr.get_next_tile(user)
    
  end

return tiles_contr