local playing = { }
local keyboard_contr = require "keyboard.keyboard_controller"
local states = require "Player.players_state"
  
  playing["/status"] = function(user)
    user:send_message("Player: ".. user.player_information.name)
  end

  playing["/start"] = function(user)
    local s = "Введите '/status' чтобы узнать информацию о персонаже"
    user:send_message(s)
  end
  
  
return playing