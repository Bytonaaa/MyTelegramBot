local loader = { }
local keyboard_contr = require "keyboard.keyboard_controller"
local persons = require "Player.starter_pack"
local states = require "Player.players_state"
local psevdo_loader = { ["/exit"] = true }

  loader["/exit"] = function(user)
    user:set_state(states.MENU)
  end
  
  loader["/start"] = function(user)
    local s = "Чтобы загрузить персонажа, введите строку вида '/go {id}'.\n Чтобы удалить персонажа введите, строку вида '/delete {id}'."
    if #user.champs == 0 then
      s = s.."\nВ данный момент у вас ни одного персонажа."
    end
    for key, val in ipairs(user.champs) do
      s = s.."\n id: "..key.. " name: ".. val.name
    end
    user:send_message(s, keyboard_contr.get_keyboard_by_table(psevdo_loader))
  end
  
  loader["/go"] = function(user, msg)
    user:send_message("Вы выбрали игрока ".. msg[1].. ". Поздравляю!")
    user:choose_person(tonumber(msg[1]))
  end
  
  loader["/delete"] = function(user, msg)
    user:delete_person(msg[1])
    local s = ""
    for key, val in ipairs(user.champs) do
      s = s.."\nid: "..key.. " name: ".. val.name
    end
    if s == "" then
      s = "В данный момент у вас ни одного персонажа."
    end
    user:send_message(s)
  end
  
  for key, val in pairs(persons.CLASSES) do
    loader[val.command_name] = function(user, msg)
      user:send_message("Поздравляем, ты создал персонажа "..msg[1].." класса "..val.full_name..".") 
    end
  end
  
return loader