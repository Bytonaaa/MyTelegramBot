local user_manager = { }
local user = { }
user.__index = user
local bot
local tiles_contr = require "tiles.tiles_controller"
local champ_factory = require "Player.starter_pack"
local set_states_contr = require "controllers.on_new_user_state"
local states = require "Player.players_state"

  local function load_person(us, person)
    us.player_information = person
    us:set_tile_controller(tiles_contr.get_start_tile(us))
  end

  --Send Text message to user
  function user:send_message(message, keyboard_markup, reply_to_msg_id, disable_web_prew, disable_notification)
    bot.sendMessage(self.id, message, "", disable_web_prew, disable_notification, reply_to_msg_id, keyboard_markup)
  end
  
  --Get a State of user
  function user:get_state()
    return self.state
  end
  
  
  
  --Set a State to user
  function user:set_state(new_state)
    set_states_contr(self, new_state)
  end

  
 
  --Block user
  function user:block_user()
    
  end
  
  
  
  --Delete user from online
  function user:delete_user()
  end
  
  
  
  --Get a time which user have been in online
  function user:get_online_time()
    return self.online_time
  end
  
  --Reset user online time
  function user:reset_online_time()
    self.online_time = 0
  end
  
  --Add time to user
  function user:add_online_time(dt)
    self.online_time = self.online_time + dt
  end
  
  --Move user_player to next tile
  function user:move_next_tile()
    self:set_tile_controller(tiles_contr.get_next_tile(self))
  end
  
  function user:set_tile_controller(controller)
    self.player_information.tile_contr = { controller }
    self.player_information.tile_contr[1]["/start"](self)
  end
  
  function user:set_next_tile_controller(controller)
    table.insert(self.player_information.tile_contr, controller)
    self.player_information.tile_contr[#self.player_information.tile_contr]["/start"](self)
  end
  
  function user:set_back_tile_controller()
    table.remove(self.player_information.tile_contr)
    self.player_information.tile_contr[#self.player_information.tile_contr]["/start"](self)
  end
  
  --Tile controller trying to recive msg
  function user:try_tile_controller_work(msg, arg)
    if self.player_information and #self.player_information.tile_contr > 0 and 
    self.player_information.tile_contr[#self.player_information.tile_contr][msg] then
      self.player_information.tile_contr[#self.player_information.tile_contr][msg](self, arg)
      return true
    end
    return false
  end
  
  function user:try_state_controller_work(msg, arg)
    if self.state_contr and self.state_contr[msg] then
      self.state_contr[msg](self, arg)
      return true
    end
    return false
  end
  
  --Create new person 
  function user:create_new_person(new_name, type_class)
    local tabl = champ_factory[type_class].characteristics()
    tabl["name"] = new_name
    if not self.champs then
      self.champs = { }
    end
    table.insert(self.champs, tabl)
  end
  
 
  --Choose person to play
  function user:choose_person(id)
    load_person(self, self.champs[id])
  end
  
  
  
  function user:delete_person(id)
    table.remove(self.champs, id)
  end
  
  --Load state for person

  
 --All states of users
  
  
  
  --Set a bot to manager
  function user_manager.set_bot(new_bot)
    bot = new_bot
  end

  
  
  --User constructor
  function user_manager:new(new_user)
    self.name = new_user.username or new_user.first_name
    self.id = new_user.id
    self.online_time = 0
    self.champs = { }
    --self.player_information = { tile_contr = tiles_contr.get_start_tile(self) }
    setmetatable(self, user)
    self:set_state(states.MENU)
    --self.player_information.tile_contr["/start"](self)
    return self
  end

  
return user_manager