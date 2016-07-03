local system = {}

system.name = "straight_line_bullet_bahavior"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if v.position.rotation_old ~= v.rotation[1] then
		v.position.dx = math.sin(v.rotation[1])
		v.position.dy = -math.cos(v.rotation[1])
		v.position.rotation_old = v.rotation[1]
		
		end
		v.position.x = v.position.x + v.straight_line_bullet_behavior[1] * dt * v.position.dx
		v.position.y = v.position.y + v.straight_line_bullet_behavior[1] * dt * v.position.dy
	end
end

system.requirements = {straight_line_bullet_behavior=true,position=true,rotation=true}

return system