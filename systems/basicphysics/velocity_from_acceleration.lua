local system = {}

system.name = "v_from_a"

system.update = function(dt)
	for k,v in pairs(system.targets) do
		v.velocity.x = v.velocity.x + v.acceleration[1] * dt *math.sin(v.rotation[1])
		
		v.velocity.y = v.velocity.y + v.acceleration[1] * dt*-math.cos(v.rotation[1])
	end
end

system.requirements = {velocity=true,acceleration=true}

return system