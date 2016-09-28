local user_manager = { }
local user = { }
user.__index = user
local bot


  user_manager.STATES = {
    ENABLE
  }
  
  function user:send_message(message)
    bot.sendMessage(self.id, self.name.."@"..message)
  end
  
  function user:get_state()
    
  end
  
  function user:set_state(new_state)
    
  end

  function user:block_user()
    
  end
  
  function user:delete_user()
  
  end
  
  
  function user_manager.set_bot(new_bot)
    bot = new_bot
  end

  function user_manager:new(new_user)
    self.name = new_user.username or new_user.first_name
    self.id = new_user.id
    setmetatable(self, user)
    return self
  end
  
  

return user_manager