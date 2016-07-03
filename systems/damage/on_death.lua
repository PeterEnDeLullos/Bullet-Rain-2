local system = {}

system.name = "subcomponent_ondeath"
system.importance = 2
system.update = function(dt)
	
end
system.unregister = function(ent)
 	for k,v in pairs (ent.on_death) do
 		if v[1] == "remove_component" then
 			print("REM"..game.entities[ent.subcomponent.id].name..v[2])
 			core.component.remove(game.entities[ent.subcomponent.id],v[2])
 		end
 		if v[1] == "add_component" then
			core.component.add(game.entities[ent.subcomponent.id],v[2], v[3])
 		end
 	end
end

system.requirements = {on_death=true,subcomponent = true}

return system