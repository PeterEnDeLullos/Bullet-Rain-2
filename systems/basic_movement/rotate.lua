local system = {}

system.name = "basic_rotate"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		
		v.rotation[1] = v.rotation[1] + v.simple_rotation[1]*dt
		
	end
end

system.requirements = {rotation=true,simple_rotation=true}

return system