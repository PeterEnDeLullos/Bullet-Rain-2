local system = {}

system.name = "p_from_v"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		print(v.name)
		v.position.x = v.position.x + v.velocity.x * dt
		v.position.y = v.position.y + v.velocity.y * dt
	end
end

system.requirements = {velocity=true,position=true}

return system