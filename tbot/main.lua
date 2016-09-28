--[[

]]

local bot, extension = require("tbot.lua-bot-api").configure("279009282:AAEVJVs-4Px8AGLqD_3yI6Od_Va0MLma7Ng")
local user_manager = require("tbot.Player.Player")
user_manager.set_bot(bot)
local players_online = require("tbot.Player.playersonline")

-- override onMessageReceive function so it does what we want
extension.onTextReceive = function (msg)
	print("New Message by " .. msg.from.first_name)

	if (msg.text == "/start") then
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
	end
end

-- override onPhotoReceive as well
extension.onPhotoReceive = function (msg)
	print("Photo received!")
	bot.sendMessage(msg.chat.id, "Nice photo! It dimensions are " .. msg.photo[1].width .. "x" .. msg.photo[1].height)
end

-- This runs the internal update and callback handler
-- you can even override run()
extension.run(100,5)
