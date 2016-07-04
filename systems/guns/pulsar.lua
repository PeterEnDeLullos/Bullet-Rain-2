require 'entities.bullets.pulsar_bullet'
local system = {}

system.name = "gun_pulsar"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if  not v.subcomponent or (game.entities[v.subcomponent.id] and game.entities[v.subcomponent.id].fire and game.entities[v.subcomponent.id].fire[v.fire_pulsar.fire_name]) then
			
			if v.fire_pulsar.to_fire then
				v.fire_pulsar.to_fire = v.fire_pulsar.to_fire - dt
				if v.fire_pulsar.to_fire < 0 then
					 v.fire_pulsar.to_fire =1/v.fire_pulsar.rate
					 local tt = core.rotate_point(v.rotation[1], {v.fire_pulsar.x,v.fire_pulsar.y})
					 core.entity.add(get_pulsar_bullet(nil,v.position.x+tt[1], v.position.y+tt[2],v.rotation[1],v.fire_pulsar.side))

					end
			else
				v.fire_pulsar.to_fire = 1/v.fire_pulsar.rate

			end
		else
			if v.fire_pulsar.to_fire then
				v.fire_pulsar.to_fire = math.max(v.fire_pulsar.to_fire - dt,0)
			else
				v.fire_pulsar.to_fire = 1/v.fire_pulsar.rate
			end
		end
	end
end

system.requirements = {fire_pulsar=true,position=true,rotation=true}

return system