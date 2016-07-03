local system = {}

system.name = "straight_line_bullet_bahavior"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		print(v)
		v.position.x = v.position.x + v.straight_line_bullet_behavior[1] * dt * math.sin(v.rotation[1])
		v.position.y = v.position.y + v.straight_line_bullet_behavior[1] * dt * -math.cos(v.rotation[1])
	end
end

system.requirements = {straight_line_bullet_behavior=true,position=true,rotation=true}

return system