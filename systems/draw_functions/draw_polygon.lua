local test_system = {}
test_system.name = "draw_squre"
test_system.importance = -2

test_system.draw = function()
	for k,v in pairs(test_system.targets) do
			love.graphics.setColor( 128,128,128,255)

		if not v.col_polygon.is_point then
			local line = {}
			for _,w in ipairs(v.col_polygon.rot) do
				line[#line+1] = w[1]+v.position.x
				line[#line+1] = w[2]+v.position.y
			end
			if #line ~= 4 then
				line[#line+1] = v.col_polygon.rot[1][1]+v.position.x
				line[#line+1] = v.col_polygon.rot[1][2]+v.position.y
			end

			love.graphics.line(unpack(line))
			--local x,y,w,h = game.systems.hypercollision.world:getRect(v)
  			--love.graphics.rectangle('line', x,y,w,h)	

			end

			love.graphics.circle("fill",v.position.x-1, v.position.y-1,2)

	end


end
test_system.requirements = {position=true,col_polygon=true}

return test_system
