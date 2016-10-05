
local id = 0
return function(_,x,y,queue,is_absolute, dt)
 	local entity = {}
 	id =  id + 1
 	entity.name="queue".. id
 	print("HOI")
 	entity.spawn_queue=queue
 	entity.spawn_queue.is_absolute=is_absolute
 	entity.spawn_queue.at = 1
 	entity.spawn_queue.t = dt
 	entity.spawn_queue.wait = dt

 	entity.spawn_queue.x = x
 	entity.spawn_queue.y = y

	return entity

end