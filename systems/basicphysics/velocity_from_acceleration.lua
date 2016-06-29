local system = {}

system.name = "v_from_a"

system.update = function(dt)
	for k,v in pairs(system.targets) do
		v.velocity.x = v.velocity.x + v.acceleration.x * dt
		v.velocity.y = v.velocity.y + v.acceleration.y * dt
	end
end

system.requirements = {velocity=true,acceleration=true}

return system