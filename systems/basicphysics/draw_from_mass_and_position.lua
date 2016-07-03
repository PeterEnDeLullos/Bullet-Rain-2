local system = {}

system.name = "draw_from_mass_and_position"

system.draw = function()
	love.graphics.push()
	for k,v in pairs(system.targets) do
		love.graphics.setColor( v.color.red,v.color.green,v.color.blue )
		love.graphics.circle("fill",v.position.x,v.position.y,3*math.sqrt(v.mass.mass))
		love.graphics.setColor( 255,255,255,255)
	end
	love.graphics.pop()
end

system.requirements = {mass=true,position=true, color=true}

return system