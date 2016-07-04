require 'entities.bullets.forward_bullet'
local system = {}

system.name = "gun_split_forward"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if  not v.subcomponent or (game.entities[v.subcomponent.id] and game.entities[v.subcomponent.id].fire and game.entities[v.subcomponent.id].fire[v.fire_split_forward.fire_name]) then
			
			if v.fire_split_forward.to_fire then
				v.fire_split_forward.to_fire = v.fire_split_forward.to_fire - dt
				if v.fire_split_forward.to_fire < 0 then
					 v.fire_split_forward.to_fire =1/v.fire_split_forward.rate
					 local tt = core.rotate_point(v.rotation[1], {v.fire_split_forward.x,v.fire_split_forward.y})
					 local b = get_forward_bullet(nil,v.position.x+tt[1], v.position.y+tt[2],v.rotation[1]-0.2,v.fire_split_forward.side)
 					 core.entity.add(b)
 					 b = get_forward_bullet(nil,v.position.x+tt[1], v.position.y+tt[2],v.rotation[1]+0.2,v.fire_split_forward.side)

					 core.entity.add(b)
		
					end
			else
				v.fire_split_forward.to_fire = 1/v.fire_split_forward.rate

			end
		else
			if v.fire_split_forward.to_fire then
				v.fire_split_forward.to_fire = math.max(v.fire_split_forward.to_fire - dt,0)
			else
				v.fire_split_forward.to_fire = 1/v.fire_split_forward.rate
			end

		end
	end
end

system.requirements = {fire_split_forward=true,position=true,rotation=true}

return system