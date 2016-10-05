require 'entities.aim_enemy'
return  function() 

local entities = {}
entities[1] = {game.entity_definitions.aim_enemy, 100, 100}
entities[2] = {game.entity_definitions.aim_enemy, 200, 100}
return {entities = entities, zone_condition = {CLEARED, 300}, unloaded = true}
end