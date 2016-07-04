local system = {}

system.name = "basic_move_there_and_back"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		for _,w in pairs(v.there_and_back) do
				v.position.x = v.position.x + w.x*w.speed*dt
				v.position.y = v.position.y + w.y*w.speed*dt
				w.now = w.now + dt
				if w.now > w.time then
					w.now = 0
					w.x = -w.x
					w.y = -w.y
				end
		end
		
	end
end

system.requirements = {there_and_back=true,position=true}

return system

