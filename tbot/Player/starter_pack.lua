local starter_pack = { }
  starter_pack.CLASSES = {
    MAGE = {id = 0, command_name = "/mage", full_name = "mage" },
    WARRIOR = {id = 1, command_name = "/war", full_name = "warrior" }
  }
  
  
  
  starter_pack[starter_pack.CLASSES.MAGE.id] = { }
  starter_pack[starter_pack.CLASSES.MAGE.id].characteristics = function() return {
    class_type = starter_pack.CLASSES.MAGE.full_name,
    level = 0,
    hp = 70,
    energy = 100,
    mana = 150
  } end
  
  starter_pack[starter_pack.CLASSES.WARRIOR.id] = { }
  starter_pack[starter_pack.CLASSES.WARRIOR.id].characteristics = function() return {
    class_type = starter_pack.CLASSES.WARRIOR.full_name,
    level = 0,
    hp = 150,
    energy = 150,
    mana = 50
  } end



return starter_pack