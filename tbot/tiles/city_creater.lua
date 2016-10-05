local city_creater
local types = require "tiles.tile_types"
local keyboard_contr = require "keyboard.keyboard_controller"
local states = require "Player.players_state"

city_creater = function (loader, data)
  
  if data.type ~= types.CITY then
    return nil
  end
  
  local controller = { }
  controller["/start"] = function (user)
    user:send_message("Добро пожаловать в город ".. data.name..".\n" .. data.discription,
      keyboard_contr.get_keyboard_by_table(controller))
  end
  
  controller["/move_next"] = function (user)
    user:move_next_tile()
  end
  
  if data.bar ~= nil then
    data.bar.prev = true
    local contr_bar = loader(data.bar)
    controller["/move_bar"] = function(user)
      user:set_next_tile_controller(contr_bar)
    end
  end
  
  controller["/exit"] = function(user)
    user:set_state(states.MENU)
  end
  return controller
end

return city_creater