local system = {}

system.name = "player_damage"
system.importance = 2
system.update = function(dt)

	for k,v in pairs(system.targets) do

		v.damaged.timer = v.damaged.timer - dt

		if v.damaged.timer <= 0 then
			print("STOP")
			core.component.remove(v,"damaged")		
		end

	end
end
system.register = function(dt)
		print("damaged9")
		dt.damaged.timer = 1

		dt.lives[1] = dt.lives[1] - 1
		if dt.lives[1] == 0 then
			    GS.push(core.states.death)

		end
end
system.requirements = {damaged=true,lives=true,unshielded=true}

return system