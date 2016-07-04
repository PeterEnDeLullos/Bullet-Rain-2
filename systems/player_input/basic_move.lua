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
				core.component.add(v,"fire",{left=true,right=true,center=true})
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
		local player = game.entities[1]
		if love.keyboard.isDown("1") then
		  	  	player.col_polygon = {{0,-32},{-12,0},{-8,16},{-16,24},{-8,32},{8,32},{16,24},{8,16},{12,0}, offX=0,offY=0,updated=true}
  	  	end
  	  	if love.keyboard.isDown("2") then
		player.col_polygon = {{0,-32},{-8,-12},{0,-4},{8,-12}, offX=0,offY=0,updated=true}
		end
  		if love.keyboard.isDown("3") then 
  			player.col_polygon = {{0,-32},{-12,0},{-32,-8},{-32,8},{-8,16},{-16,24},{-8,32},{8,32},{16,24},{8,16},{32,8},{32,-8},{12,0}, offX=0,offY=0,updated=true}
  		end


	end
end

system.requirements = {position=true,basic_move=true,speed=true}

return system