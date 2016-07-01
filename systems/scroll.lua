local system = {}

system.name = "scroll"
system.importance = 2
system.dx = 0
system.dy = -50
system.x = 0
system.y = -300
system.update = function(dt)
	system.x = system.x + dt * system.dx
	
	system.y = system.y + dt * system.dy
	

	for k,v in pairs(system.targets) do
		

	

		v.position.x = v.position.x + dt * system.dx * v.no_scroll.multiplier
		
		
		v.position.y = v.position.y + dt * system.dy * v.no_scroll.multiplier
		

	end
	

end

system.requirements = {no_scroll=true,position=true}

return system