local system = {}

system.name = "zone_unloading"
system.x = 0
system.y = 0

system.update = function(dt)
	
for k,v in pairs(system.targets) do
	if game.systems.zone_loading.zone - 1 > v.remove_zone then
		if v.images then
			for k,v in pairs(v.images) do
				game.resources[v][2] = game.resources[v][2] -1

				if game.resources[v][2] == 0 then
					print("Removing resource ".. v)
					
					game.resources[v] = nil
				end
			end
		end
		core.entity.remove(v)

		break
	end
end
end
system.requirements = {remove_zone = true}

return system