--[[

]]

local bot, extension = require("lua-bot-api").configure("248276882:AAGok6vhHx2qscgbP9iHbxRoa4ugp93WvAA")

-- override onMessageReceive function so it does what we want
extension.onTextReceive = function (msg)

	--[[if (msg.text == "/start") then
		bot.sendMessage(msg.from.id, "Hello there 👋\nMy name is " .. bot.first_name)
    my_user = user_manager:new(msg.from)
    players_online.add_player(my_user)
	elseif (msg.text == "ping") then
    local pl = players_online.get_player(msg.from.id)
    if not pl then
      pl = user_manager:new(msg.from)
      players_online.add_player(pl)
    end
    pl:send_message("pong!")
	else
		bot.sendMessage(msg.chat.id, "I am just an example, running on the Lua Telegram Framework written with ❤️ by @cosmonawt")
	end]]
  if not bot.sendGame(msg.chat.id, "Diyu") then
    print("ERROR")
  end
end

extension.onCallbackQueryReceive = function (CallbackQuery)
  bot.answerCallbackQuery(CallbackQuery.id, "SCARIEST GAME EVER", true, "http://olde-shipmates.com/diyu/v0.16.09.25_html5_en/index.html" )
end

extension.run(100,5)
