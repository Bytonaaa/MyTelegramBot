local table_funcs = { }

function table_funcs.concat_table(tablein, tablefrom)
  local res_table = { }
  for key, val in pairs(tablefrom) do
    res_table[key] = val
  end
  
  for key, val in pairs(tablein) do
    res_table[key] = val
  end
  return res_table
end

function table_funcs.fadd_to_table(tablein, tablemain)
  return function(added_table)
    table.insert(tablein, table_funcs.concat_table(added_table, tablemain))
  end
  
end

return table_funcs