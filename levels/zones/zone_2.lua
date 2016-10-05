require 'entities.aim_enemy'
require 'entities.empty_line'
require 'entities.enemies.gunblade'
require 'entities.enemies.pulsar'
return  function() 

local entities = {}

entities[1] = {game.entity_definitions.enemies.gunblade, 300, 100, "enemy"}
entities[2] = {game.entity_definitions.enemies.gunblade, 1000, 100, "enemy",1}
entities[3] = {game.entity_definitions.enemies.pulsar, 700, 300, "enemy"}


return {entities = entities, zone_condition = {MOVEMENT, 1400}, unloaded = true}
end