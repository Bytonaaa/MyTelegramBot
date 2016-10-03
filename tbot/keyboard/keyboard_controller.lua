local keyboard_controller = { }
local keyboards = { }
local bot 

  function keyboard_controller.get_reply_keyboard(id_keyboard) 
    return keyboards[id_keyboard]()
  end

  function keyboard_controller.get_keyboard_by_table(my_t)
    local buttons_table = { }
    local line = { }
    local count = 0
    for key, val in pairs(my_t) do
      if count >= 3 then
        table.insert(buttons_table, line)
        line = { }
        count = 0
      end
      if key ~= "/start" then
        count = count + 1
        table.insert(line, key)
      end
    end
    table.insert(buttons_table, line)
    return bot.generateReplyKeyboardMarkup(buttons_table, true)
  end
  
  function keyboard_controller.set_bot(new_bot)
    bot = new_bot
  end
  
  
  function keyboards.default()
    local buttons_table = { }
    local line = { }
    table.insert(line, "/help")
    table.insert(line, "/unresolved_issue")
    table.insert(buttons_table, line)
    return bot.generateReplyKeyboardMarkup(buttons_table, true)
  end
  
  function keyboards.thinked()
    local buttons_table = { }
    local line = { }
    table.insert(line, "/solved")
    table.insert(line, "/not_solved")
    table.insert(buttons_table, line)
    return bot.generateReplyKeyboardMarkup(buttons_table, true)
  end
  
  
return keyboard_controller