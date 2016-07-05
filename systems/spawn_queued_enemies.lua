local system = {}

system.name = "spawn_queue"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if v.spawn_queue.at > #v.spawn_queue then
			core.entity.remove(v)
		else
			
			v.spawn_queue.t  = v.spawn_queue.t - dt
			if v.spawn_queue.t <= 0 then
				v.spawn_queue.t = v.spawn_queue.wait
				local actual = {}
				actual[1] = _G[v.spawn_queue[v.spawn_queue.at][1]]
				if v.spawn_queue.is_absolute then
				actual[2] = v.spawn_queue.x
				actual[3] = v.spawn_queue.y
				else
				actual[2] = v.spawn_queue.x+game.systems.scroll.x
				actual[3] = v.spawn_queue.y+game.systems.scroll.y
			end
				for l,w in ipairs(v.spawn_queue[v.spawn_queue.at]) do
					if l ~= 1 then
						actual[l+2] = w
					end
				end
				core.entity.spawn(actual)
				v.spawn_queue.at=v.spawn_queue.at+1
			end
		end
		
	end
end
system.register = function(entity)

end
system.requirements = {spawn_queue=true}

return system

