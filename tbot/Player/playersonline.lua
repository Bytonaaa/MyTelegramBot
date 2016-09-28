local players_manager = { }
local players = { }

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

return players_manager