local shop_creater
local types = require "tiles.tile_types"
local keyboard_contr = require "keyboard.keyboard_controller"

shop_creater = function (loader, data)
  
  if data.type ~= types.SHOP then
    return nil
  end
  
  local controller = { }
  controller["/start"] = function (user)
    user:send_message("Добро пожаловать в магазин ".. data.name..".", keyboard_contr.get_keyboard_by_table(controller))
  end
  
  controller["/buy"] = function (user)
    user:send_message("Ты купил новую броню.")
  end
  
  if data.prev ~= nil then
    controller["/return"] = function(user)
      user:set_back_tile_controller()
    end
  end
  return controller
end

return shop_creater