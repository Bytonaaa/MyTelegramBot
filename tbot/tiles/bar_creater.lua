local bar_creater
local types = require "tiles.tile_types"
local keyboard_contr = require "keyboard.keyboard_controller"

bar_creater = function (loader, data)
  
  if data.type ~= types.BAR then
    return { }
  end
  
  local controller = { }
  controller["/start"] = function (user)
    user:send_message("Добро пожаловать в таверну ".. data.name..".", keyboard_contr.get_keyboard_by_table(controller))
  end
  
  controller["/relax"] = function (user)
    user:send_message("Ты отдохнул и востановил силы.")
  end
  
  if data.prev ~= nil then
    controller["/return"] = function(user)
      user:set_back_tile_controller()
    end
  end
  return controller
end

return bar_creater