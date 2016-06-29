local system = {}

system.name = "entity_remain_within_camera"
system.importance = 2
system.dx = 0
system.dy = -50
system.x = 600
system.y = 5000
system.update = function(dt)
	system.x = system.x + dt * system.dx
	system.y = system.y + dt * system.dy
	for k,v in pairs(system.targets) do

		local x,y,w,h = game.cam:getVisible()

		xx = (v.remain_within_camera.xpad or 0) + x
		yy = (v.remain_within_camera.ypad or 0) + y
		x2 = (-v.remain_within_camera.xpad or 0) + x
		y2 = (-v.remain_within_camera.ypad or 0) + y
		v.position.x = math.max(math.min(x2+w,v.position.x), xx)
		v.position.y = math.max(math.min(y2+1.5*h,v.position.y), yy+0.5*h)

		
	end
end

system.requirements = {remain_within_camera=true,position=true}

return system