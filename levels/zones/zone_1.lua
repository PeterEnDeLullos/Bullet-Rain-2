require 'entities.aim_enemy'
require 'entities.bullets.forward_bullet'
require 'entities.empty_line'

local entities = {}
--entities[1] = {get_aim_enemy, -20, 270}
--entities[2] = {get_aim_enemy, 200, 100}
entities[1] = {get_forward_bullet, 300, 300,(90/180)*math.pi,"enemy"}
--entities[1].add={{"subcomponent",{x=40,y=40,id=1}}}


--entities[4] = {get_empty_line, 100, 300,400,0}

return {entities = entities, zone_condition = {MOVEMENT, 0}, unloaded = true}