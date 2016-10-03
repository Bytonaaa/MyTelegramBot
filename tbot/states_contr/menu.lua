local menu = { }
local keyboard_contr = require "keyboard.keyboard_controller"
local states = require "Player.players_state"

  menu["/create_person"] = function (user)
    --user:move_next_tile(tiles_contr.get_next_tile())
    user:set_state(states.CREATE_NEW_PERSON)
  end
  
  menu["/load_person"] = function(user)
    --user:send_message
    user:set_state(states.CHOOSE_PERSON)
  end

  menu["/start"] = function(user)
    local s = "RPG life."
    user:send_message(s, keyboard_contr.get_keyboard_by_table(menu))
  end
  
  
return menu