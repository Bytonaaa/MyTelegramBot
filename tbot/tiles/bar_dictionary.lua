local bar = { }
local table_funcs = require "tiles.table_funcs"
local types = require "tiles.tile_types"

soc_table = { ["type"] = types.BAR }

added_func = table_funcs.fadd_to_table(bar, soc_table)

added_func({ name = "пьяный ДЖО", discription = "Малец, тебе тут никто не рад." })
added_func({ name = "розовый единорог", discription = "Здесь обитают самые милые существа." })

return bar