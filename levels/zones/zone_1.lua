require 'entities.aim_enemy'
local entities = {}
entities[1] = {get_aim_enemy, -20, 270}
entities[2] = {get_aim_enemy, 200, 100}
print(get_aim_enemy)
return {entities = entities, zone_condition = {MOVEMENT, 0}, unloaded = true}