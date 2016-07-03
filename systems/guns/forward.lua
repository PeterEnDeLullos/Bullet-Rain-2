require 'entities.bullets.forward_bullet'
local system = {}

system.name = "gun_forward"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		if true or not v.subcomponent then
			
			if v.fire_forward.to_fire then
				v.fire_forward.to_fire = v.fire_forward.to_fire - dt
				if v.fire_forward.to_fire < 0 then
					 v.fire_forward.to_fire =1/v.fire_forward.rate
					 local tt = core.rotate_point(v.rotation[1], {v.fire_forward.x,v.fire_forward.y})
					 core.entity.add(get_forward_bullet(nil,v.position.x+tt[1], v.position.y+tt[2],v.rotation[1],v.fire_forward.side))

					end
			else
				v.fire_forward.to_fire = 1/v.fire_forward.rate

			end
		end
	end
end

system.requirements = {fire_forward=true,position=true,rotation=true}

return system