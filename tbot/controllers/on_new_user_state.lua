local states = require "Player.players_state"
local states_modules = { }
states_modules[states.MENU]= require "states_contr.menu"
states_modules[states.CREATE_NEW_PERSON] = require "states_contr.create_new_person"
states_modules[states.CHOOSE_PERSON] = require "states_contr.load_person"
states_modules[states.PLAYING] = require "states_contr.playing"

local function set_new_state(user, state)
  user.state_contr = states_modules[state]
  user.state = state
  states_modules[state]["/start"](user)
end

return set_new_state