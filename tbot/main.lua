--[[

]]

local bot, extension = require("lua-bot-api").configure("279009282:AAEVJVs-4Px8AGLqD_3yI6Od_Va0MLma7Ng")
local user_manager = require("Player.Player")
user_manager.set_bot(bot)
local players_online = require("Player.playersonline")
local update_func, add_to_update_func = require("updater.updater")
local command_controller = require("controllers.states_controller")
command_controller.set_bot(bot)

-- override onMessageReceive function so it does what we want
extension.onTextReceive = function (msg)
  local pl = players_online.get_player(msg.from.id)
  
  if command_controller[msg.text] then
    command_controller[msg.text](pl)
  else
    command_controller["/unknown_command"](pl)
  end
end

extension.onUpdateReceive = function(update_m)

  local pl = players_online.get_player(update_m.message.from.id)
  if not pl then
    pl = user_manager:new(update_m.message.from)
    players_online.add_player(pl)
  end
  pl:reset_online_time()
end

-- override onPhotoReceive as well
extension.onPhotoReceive = function (msg)
	print("Photo received!")
	bot.sendMessage(msg.chat.id, "Nice photo! It dimensions are " .. msg.photo[1].width .. "x" .. msg.photo[1].height)
end


extension.run(update_func)
