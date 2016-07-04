local system = {}

system.name = "subcomponent"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if not  game.entities[v.subcomponent.id] then
			core.component.remove(v,"subcomponent")
		else
			local x = v.subcomponent.x
			local y = v.subcomponent.y
			v.position.x = game.entities[v.subcomponent.id].position.x + x
			v.position.y = game.entities[v.subcomponent.id].position.y + y
		end
	end
end

system.requirements = {subcomponent=true,position=true}

return system