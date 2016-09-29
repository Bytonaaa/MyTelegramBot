local user_manager = { }
local user = { }
user.__index = user
local bot
  
  --Send Text message to user
  function user:send_message(message)
    bot.sendMessage(self.id, message)
  end
  
  --Get a State of user
  function user:get_state()
    return self.state
  end
  
  
  --Set a State to user
  function user:set_state(new_state)
    self.state = new_state
  end

  
  --Block user
  function user:block_user()
    
  end
  
  
  --Delete user from online
  function user:delete_user()
    bot.sendMessage(self.id, "U have been with bot like "..self.online_time)
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
  --All states of users
  user_manager.STATES = {
    ENABLE = 0,
    DISABLE = 1
  }
  
  
  --Set a bot to manager
  function user_manager.set_bot(new_bot)
    bot = new_bot
  end

  
  --User constructor
  function user_manager:new(new_user)
    self.name = new_user.username or new_user.first_name
    self.id = new_user.id
    self.state = user_manager.STATES.ENABLE
    self.online_time = 0
    setmetatable(self, user)
    return self
  end
  
  

return user_manager