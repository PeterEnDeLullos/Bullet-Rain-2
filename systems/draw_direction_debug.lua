local system = {}

system.name = "draw_from_direction_debug"

system.draw = function()
	for k,v in pairs(system.targets) do
		love.graphics.setColor( v.color.red,v.color.green,v.color.blue )
		love.graphics.line(v.position.x,v.position.y,v.position.x+10*math.sin(v.direction),v.position.y+10*math.cos(v.direction))
		love.graphics.setColor( 255,255,255,255)
	end
	love.graphics.setColor( 255,255,255,255)
end

system.requirements = {direction=true,position=true}

return system