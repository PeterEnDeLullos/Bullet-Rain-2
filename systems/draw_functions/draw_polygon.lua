local test_system = {}
test_system.name = "draw_squre"
test_system.draw = function()
	for k,v in pairs(test_system.targets) do
			love.graphics.setColor( 128,128,128,255)

		if not v.col_polygon.is_point then
			local line = {}
			for _,w in ipairs(v.col_polygon) do
				line[#line+1] = w[1]+v.position.x+v.col_polygon.offX
				line[#line+1] = w[2]+v.position.y+v.col_polygon.offY
			end
			line[#line+1] = v.col_polygon[1][1]+v.position.x+v.col_polygon.offX
			line[#line+1] = v.col_polygon[1][2]+v.position.y+v.col_polygon.offY
			print( unpack(line))
			print(game.systems.scroll.y)
			love.graphics.line(unpack(line))
		
			
		end


	end
	local items, len = game.systems.hypercollision.world:queryRect(-1000000, 500000, 640000, 480000)

	for i=1, len do
  		local x,y,w,h = world:getRect(items[i])
  		love.graphics.rectangle('line', x,y,w,h)
	end
end
test_system.requirements = {position=true,col_polygon=true}

return test_system
