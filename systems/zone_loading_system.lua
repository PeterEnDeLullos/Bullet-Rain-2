local system = {}

system.name = "zone_loading"
system.x = 0
system.y = 0
system.zone = 1
system.scroll = 0
system.update = function(dt)
		if not game.systems.scroll then
			return
		end
		
for k,v in pairs(system.targets) do
	
	-- Loading
	if v.zone_id == system.zone then
		
		if v.zone.zone_condition[1]==MOVEMENT then
			local dx, dy = system.x - game.systems.scroll.x, system.y - game.systems.scroll.y
			if v.zone.zone_condition[2] < math.sqrt(dx*dx + dy * dy) then
				
				system.scroll = math.sqrt(game.systems.scroll.x* game.systems.scroll.x, game.systems.scroll.y * game.systems.scroll.y)
				system.x, system.y = game.systems.scroll.x, game.systems.scroll.y
				-- TODO: actually load system
				for l, w in pairs(v.zone.entities) do
					local ent = w[1](unpack(w))
					ent.remove_zone = v.zone_id
					if ent.position then
						ent.position.x = ent.position.x + system.x
						
						ent.position.y = ent.position.y + system.y
						
					end
					core.entity.add(ent)

	
				end
				core.component.remove(v, "unloaded")
				system.zone = system.zone  + 1
			end
		end
		-- Try loading an asset preventively
	end

end
end
system.requirements = {zone = true, unloaded = true}

return system