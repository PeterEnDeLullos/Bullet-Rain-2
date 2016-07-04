local system = {}

system.name = "zone_unloading"
system.x = 0
system.y = 0

system.update = function(dt)
	
for k,v in pairs(system.targets) do
	if game.systems.zone_loading.zone - 2 > v.remove_zone then
		if v.images then
			for k,vv in pairs(v.images) do
				game.resources[vv][2] = game.resources[vv][2] -1
				
				if game.resources[vv][2] == 0 then
					print("Removing resource ".. vv)
					
					game.resources[vv] = nil
				end
			end
		end
		core.entity.remove(v)

	end
end
end
system.unregister = function(entity)
	if game.systems.zone_loading then
		game.systems.zone_loading.entities =game.systems.zone_loading.entities  -1
	end
end
system.requirements = {remove_zone = true}

return system