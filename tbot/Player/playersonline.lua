local players_manager = { }
local players = { }
local event_broadcast_table = { }
local MAX_SECONDS_ONLINE = 180

  local function delete_player (user)
    if user:get_online_time() < MAX_SECONDS_ONLINE then 
      return false
    else
      user:send_message("Good bye")
      user:delete_user()
      return true
    end
  end
  function players_manager.get_player (id)
    return players[id]
  end
    
  function players_manager.add_player (user)
    if not players[user.id] then
      players[user.id] = user
      return true
    else
      return false
    end
  end
  
  function players_manager.update_players(dt)
    for key, val in pairs(players) do
      if not delete_player(val) then
        for key_f, val_f in pairs(event_broadcast_table) do
          val_f(val, dt)
        end
      else 
        players[key] = nil
      end
    end
  end
  
  function players_manager.add_event(id, func)
    if event_broadcast_table[id] then
      error("Id have already placed")
    end
    event_broadcast_table[id] = func
    return function() event_broadcast_table[id] = nil end
  end


  players_manager.add_event("add_timing", function(user, dt) 
      user:add_online_time(dt)
    end)
  
return players_manager