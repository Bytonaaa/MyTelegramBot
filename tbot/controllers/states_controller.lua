local controller = { }
local bot 

controller["/start"] = function(user)
  user:send_message("Hello, my name is"..bot.first_name)
end

controller["/ping"] = function(user)
  user:send_message(user.id.."@"..user.name.."@pong")
end

controller["/help"] = function(user)
  user:send_message("i am bot, i am helping")
end

controller["/unknown_command"] = function(user)
  user:send_message("you have send me unknown command")
end

function controller.set_bot(new_bot)
  bot = new_bot
end

return controller