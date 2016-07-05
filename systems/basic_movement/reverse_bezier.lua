
local system = {}

system.name = "reverse_bezier"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		 core.component.remove(v,"curved_move_finished")
	end
end
system.register = function(entity)
	print("HALLO")

	local line = {}
	for k,v in pairs( entity.curved_move_finished.trace) do
		line[k] = v
	end

	for k,v in pairs(line) do
		entity.curved_move_finished.trace[#entity.curved_move_finished.trace-k+1] = v
	end
	entity.curved_move_finished.t = 0

end
system.unregister = function(entity)
			 core.component.add(entity,"curved_move", entity.curved_move_finished)
end
system.requirements = {curved_move_finished=true,reverse_bezier_when_finished=true}

return system


