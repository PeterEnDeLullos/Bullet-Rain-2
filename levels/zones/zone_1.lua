require 'entities.enemies.spawn_queue'
require 'entities.enemies.move_curve_ship'
return function()
local entities = {}
print("HOI")

local line = {}
	for i = 1,20 do
		line[#line+1] = {"get_move_curve_ship","enemy", {{0,0},{900,0},{900,800}}}
	end
	entities[1] = {get_spawn_queue, -100, 100,line,true,1}
	

	line = {}
	for i = 1,20 do
		line[#line+1] = {"get_move_curve_ship","enemy", {{0,0},{-900,0},{-900,800}}}
	end
	entities[2] = {get_spawn_queue, 1466, 100,line,true,1}
	


		line = {}
	for i = 1,20 do
		line[#line+1] = {"get_move_curve_ship","enemy", {{0,0},{-900,0},{-900,-800}}}
	end
	entities[3] = {get_spawn_queue, 1466, 700,line,true,1}
	

	line = {}
	for i = 1,20 do
		line[#line+1] = {"get_move_curve_ship","enemy", {{0,0},{900,0},{900,-800}}}
	end
	entities[4] = {get_spawn_queue, -100, 700,line,true,1}
	return {entities = entities, zone_condition = {MOVEMENT, 0}, unloaded = true}
end
