local system = {}

system.name = "basic_move"

system.update = function(dt)
	for k,v in pairs(system.targets) do
		
		local dx = 0
		local dy = 0
		if love.keyboard.isDown( "w") then
			dy = -1
		end
		if love.keyboard.isDown( "a") then
			dx = -1
		end
		if love.keyboard.isDown( "s") then
			dy = 1
		end
		if love.keyboard.isDown( "d") then
			dx = 1
		end
		if love.keyboard.isDown("space") then
			if not v.fire then
				core.component.add(v,"fire",{left=true,right=true})
			end
		else
			if v.fire then
				core.component.remove(v,"fire")
			end
		end

		hyp = math.sqrt(dx*dx+dy*dy)

		if hyp > 0 then
			dx = dx / hyp
			dy = dy / hyp
		end
		v.velocity.x =  dx*v.speed.speed
		v.velocity.y =  dy*v.speed.speed
	end
end

system.requirements = {position=true,basic_move=true,speed=true}

return system