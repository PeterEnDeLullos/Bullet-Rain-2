require 'entities.bullets.beam'
require 'entities.guns.forward_beam'
local system = {}

system.name = "gun_forward_beam"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		
		if  not v.subcomponent or (game.entities[v.subcomponent.id] and game.entities[v.subcomponent.id].fire and game.entities[v.subcomponent.id].fire[v.fire_beam.fire_name]) then
			
			if v.fire_beam.to_fire then
				v.fire_beam.to_fire = v.fire_beam.to_fire - dt
				if v.fire_beam.to_fire < 0 then
					 v.fire_beam.to_fire =1/v.fire_beam.rate
					 print("HOI")
					 local tt = core.rotate_point(v.rotation[1], {v.fire_beam.x,v.fire_beam.y})
					 local b = game.entity_definitions.bullets.beam(nil,v.position.x+tt[1], v.position.y+tt[2],v.rotation[1],v.fire_beam.side,v,v.fire_beam.t)
					 core.entity.add(b)
		
					end
			else
				v.fire_beam.to_fire = 1/v.fire_beam.rate

			end
		else
			if v.fire_beam.to_fire then
				v.fire_beam.to_fire = math.max(v.fire_beam.to_fire - dt,0)
			else
				v.fire_beam.to_fire = 1/v.fire_beam.rate
			end

		end
	end
end

system.requirements = {fire_beam=true,position=true,rotation=true}

return system