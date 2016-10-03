local city_creater
local types = require "tiles.tile_types"
local keyboard_contr = require "keyboard.keyboard_controller"
local states = require "Player.players_state"

city_creater = function (data)
  if data.type ~= types.CITY then
    return { }
  end
  local controller = { }
  controller["/start"] = function (user)
    user:send_message("Добро пожаловать в город ".. data.name..".", keyboard_contr.get_keyboard_by_table(controller))
  end
  
  controller["/move_next"] = function (user)
    user:send_message("Ты пошел дальше")
  end
  
  controller["/tractir"] = function(user)
    user:send_message("Ты в трактире")
  end
  
  controller["/exit"] = function(user)
    user:set_state(states.MENU)
  end
  return controller
end

return city_creater