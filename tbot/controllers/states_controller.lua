local controller = { }
local bot 
local keyboards = require"keyboard.keyboard_controller"

controller["/start"] = function(user)
  user:send_message("Привет, меня зовут "..bot.first_name, keyboards.get_reply_keyboard("default"))
end

controller["/ping"] = function(user)
  user:send_message(user.id.."@"..user.name.."@pong")
end

controller["/help"] = function(user)
  user:send_message([[Я бот, который поможет тебе в решении проблемы. Если у тебя есть не решенная проблема, то отправь мне "/unresolved_issue".
    Если ты решил задачу, тогда напиши мне "/solved". Иначе, продолжай нажимать "/not_solved", пока мои методы тебе не помогут.]])
end

local random_gj = { }
table.insert(random_gj, "Я никогда в тебе не сомневался!")
table.insert(random_gj, "АААААААААААААА, Я ТАК СЧАСТЛИВ")
table.insert(random_gj, "Ты просто гений, что додумался до такого")
controller["/solved"] = function(user)
  user:send_message(random_gj[math.random(#random_gj)], keyboards.get_reply_keyboard("default"))
end

local random_think = { }
table.insert(random_think, "А что если посмотреть с другой стороны?")
table.insert(random_think, "Возможно, ты прав.")
table.insert(random_think, "Это действительно сложно. Даже не знаю чем подсказать.")
table.insert(random_think, "Может быть погуглить задачу частями?")
controller["/not_solved"] = function(user)
  user:send_message(random_think[math.random(#random_think)])
end

controller["/unknown_command"] = function(user)
  user:send_message("you have send me unknown command")
end

controller["/unresolved_issue"] = function(user)
  user:send_message(random_think[math.random(#random_think)], keyboards.get_reply_keyboard("thinked"))
end

function controller.set_bot(new_bot)
  bot = new_bot
  keyboards.set_bot(new_bot)
end

return controller