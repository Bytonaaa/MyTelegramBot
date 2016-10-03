local creater = { }
local keyboard_contr = require "keyboard.keyboard_controller"
local persons = require "Player.starter_pack"
local states = require "Player.players_state"
local psevdo_creater = { ["/exit"] = true }

  creater["/exit"] = function(user)
    user:set_state(states.MENU)
  end
  
  creater["/start"] = function(user)
    local s = "Введите строку в формате '/{тип класса} {имя персонажа}', чтобы создать нового персонажа. \n Доступные классы:"
    for key, val in pairs(persons.CLASSES) do
      s = s.."\n "..val.command_name.. " = ".. val.full_name
    end
    user:send_message(s, keyboard_contr.get_keyboard_by_table(psevdo_creater))
  end
  
  
  for key, val in pairs(persons.CLASSES) do
    creater[val.command_name] = function(user, msg)
      user:send_message("Поздравляем, ты создал персонажа "..msg[1].." класса "..val.full_name..".")
      user:create_new_person(msg[1], val.id)
    end
  end
  
return creater