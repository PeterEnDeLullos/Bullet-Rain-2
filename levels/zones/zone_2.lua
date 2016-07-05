require 'entities.aim_enemy'
require 'entities.empty_line'
require 'entities.enemies.gunblade'
require 'entities.enemies.pulsar'
return  function() 

local entities = {}
--entities[1] = {get_aim_enemy, -20, 270}
--entities[2] = {get_aim_enemy, 200, 100}
entities[1] = {get_gunblade, 300, 100, "enemy"}
entities[2] = {get_gunblade, 1000, 100, "enemy",1}
entities[3] = {get_pulsar, 700, 300, "enemy"}

--entities[4] = {get_empty_line, 100, 300,400,0}

return {entities = entities, zone_condition = {MOVEMENT, 1400}, unloaded = true}
end