require 'entities.enemies.spawn_queue'
require 'entities.enemies.move_curve_ship'
return function()
local entities = {}

local line = {}
	for i = 1,20 do
		line[#line+1] = {"enemies.move_curve_ship","enemy", {{0,0},{900,0},{900,800}}}
	end
	entities[1] = {game.entity_definitions.enemies.spawn_queue, -100, 100,line,true,1}
	

	line = {}
	for i = 1,20 do
		line[#line+1] = {"enemies.move_curve_ship","enemy", {{0,0},{-900,0},{-900,800}}}
	end
	entities[2] = {game.entity_definitions.enemies.spawn_queue, 1466, 100,line,true,1}
	


		line = {}
	for i = 1,20 do
		line[#line+1] = {"enemies.move_curve_ship","enemy", {{0,0},{-900,0},{-900,-800}}}
	end
	entities[3] = {game.entity_definitions.enemies.spawn_queue, 1466, 700,line,true,1}
	

	line = {}
	for i = 1,20 do
		line[#line+1] = {"enemies.move_curve_ship","enemy", {{0,0},{900,0},{900,-800}}}
	end
	entities[4] = {game.entity_definitions.enemies.spawn_queue, -100, 700,line,true,1}
	entities[5] = {game.entity_definitions.enemies.gunblade, 1000, 100, "enemy",1}

	return {entities = entities, zone_condition = {MOVEMENT, 0}, unloaded = true}
end
