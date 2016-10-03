local city = { }
local keyboard_contr = require "keyboard.keyboard_controller"

  city["/move_next"] = function (user)
    --user:move_next_tile(tiles_contr.get_next_tile())
    user:send_message("Ты пошел дальше")
  end
  
  city["/tractir"] = function(user)
    --user:send_message
    user:send_message("Ты в трактире")
  end

  city["/start"] = function(user)
    local s = "Добро пожаловать в наш городок. Вы можете зайти в трактир или пойти дальше"
    user:send_message(s, keyboard_contr.get_keyboard_by_table(city))
  end
  
  
return city