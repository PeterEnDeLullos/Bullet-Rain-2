local system = {}

system.name = "aim"

system.update = function(dt)
	for k,v in pairs(system.targets) do
		local pl = (game.entities[v.aims_for_entity.entity])
		local x, y = pl.position.x, pl.position.y 
		local dx, dy  = x - v.position.x, y - v.position.y
		local aim_for = 0
		if dx > 0 then
			aim_for = math.acos(dy/ math.sqrt(dx*dx+dy*dy))
		else
			aim_for  = -math.acos(dy/ math.sqrt(dx*dx+dy*dy))	
		end
		v.direction = aim_for
	end
	love.graphics.setColor( 255,255,255,255)
end
system.requirements = {direction=true,position=true,aims_for_entity = true}

return system