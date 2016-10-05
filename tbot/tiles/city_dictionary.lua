local city = { }
local table_funcs = require "tiles.table_funcs"
local types = require "tiles.tile_types"

soc_table = { ["type"] = types.CITY }

added_func = table_funcs.fadd_to_table(city, soc_table)

added_func({ name = "Чистилище", discription = "Добро пожаловать в твой первый город, новый герой." })
added_func({ name = "Город грехов", discription = "Помолись, прежде чем уходить." })

return city