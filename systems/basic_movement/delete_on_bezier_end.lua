
local system = {}

system.name = "delete_bezier_finished"
system.importance = 2
system.update = function(dt)
	
end
system.register = function(entity)
	core.entity.remove(entity)

end
system.unregister = function(entity)
			 
end
system.requirements = {curved_move_finished=true,delete_bezier_when_finished=true}

return system


