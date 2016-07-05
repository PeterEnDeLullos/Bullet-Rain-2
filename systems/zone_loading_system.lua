local system = {}

system.name = "zone_loading"
system.x = 0
system.y = 0
system.zone = 1
system.scroll = 0
system.entities = -1
system.update = function(dt)
		if not game.systems.scroll then
			return
		end
		
for k,v in pairs(system.targets) do
	-- Loading
	if v.zone_id == system.zone then
		
		local cond = false
		if v.zone.zone_condition[1]==MOVEMENT  then
			local dx, dy = system.x - game.systems.scroll.x, system.y - game.systems.scroll.y
			if v.zone.zone_condition[2] < math.sqrt(dx*dx + dy * dy) then
				cond = true
			end
		end
		if  v.zone.zone_condition[1] == CLEARED  and system.entities == 0 then
			cond = true
		end
		if cond then
				system.entities=0
				system.scroll = math.sqrt(game.systems.scroll.x* game.systems.scroll.x, game.systems.scroll.y * game.systems.scroll.y)
				system.x, system.y = game.systems.scroll.x, game.systems.scroll.y
				-- TODO: actually load system
				for l, w in pairs(v.zone.entities) do
					system.entities = system.entities + core.entity.spawn(w, v.zone_id)
	
				end
				core.component.remove(v, "unloaded")
				system.zone = system.zone  + 1
			end
		end
		-- Try loading an asset preventively
	end

end
system.requirements = {zone = true, unloaded = true}

return system