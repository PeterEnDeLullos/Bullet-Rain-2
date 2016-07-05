
local id = 0
function get_spawn_queue(_,queue,is_absolute, dt)
 	local entity = {}
 	id =  id + 1
 	entity.name="queue".. id
 	entity.spawn_queue=queue
 	entity.spawn_queue.is_absolute=is_absolute
 	entity.spawn_queue.at = 1
 	entity.spawn_queue.dt = dt
	entity.no_scroll = {multiplier = 1}
	
	return entity

end