local system = {}

system.name = "destroy_outside_screen"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if v.position.x-game.systems.scroll.x< 0 or v.position.x- game.systems.scroll.x >1366 or v.position.y- game.systems.scroll.y <0 or  v.position.y- game.systems.scroll.y >800 then
			core.entity.remove(v)
			
		end
	end
end
system.register = function(v)

end

system.requirements = {position=true,destroy_outside_screen=true}

return system