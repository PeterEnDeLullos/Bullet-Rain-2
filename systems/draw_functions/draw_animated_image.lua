local anim8 = require 'lib.anim8.anim8'
local test_system = {}
test_system.name = "draw_animation"
test_system.animations = {}
test_system.currents = {}
local aa = 0
local function importance_funcy(x1, x2)
	
	return x1.render.importance < x2.render.importance
end
test_system.draw = function()
	
	local l_targets = {}

	for k,v in pairs(test_system.targets) do
		l_targets[#l_targets+1] = v
	end
	table.sort(l_targets, importance_funcy)
	for k,v in ipairs(l_targets) do
		love.graphics.push()
		if v.shielded and v.lives then
			love.graphics.push()
			love.graphics.setColor(0,0,255,255)
			if love.timer.getFPS() > 0 then
			aa=aa + 1/love.timer.getFPS()
			end
			local a,b,c,d = core.rotate_point(aa,{-40,0}), core.rotate_point(aa,{0,40}),core.rotate_point(aa,{40,0}), core.rotate_point(aa,{0,-40})

			love.graphics.line(a[1]+v.position.x,a[2]+v.position.y,b[1]+v.position.x,b[2]+v.position.y,c[1]+v.position.x,c[2]+v.position.y,d[1]+v.position.x,d[2]+v.position.y,a[1]+v.position.x,a[2]+v.position.y)
			love.graphics.pop()
		end

		if v.render.zoom then
			love.graphics.scale(v.render.zoom)
		end


		if v.damaged and v.damaged.timer and v.damaged.timer*5%2<1 then
			
					love.graphics.setColor(255,255,255,128)
					

		else

					love.graphics.setColor(255,255,255,255)

		end
		if v.animations then
		if test_system.currents[v.id] ~= v.render.ID then
			test_system.currents[v.id] = v.render.ID

			local iw =  game.resources[v.images[v.render.ID]][1]:getWidth()
			local ih = game.resources[v.images[v.render.ID]][1]:getHeight()
			local fw = iw/v.animations[v.render.ID].frames
			test_system.animations[v.id] = anim8.newAnimation(anim8.newGrid(fw,ih,iw,ih)('1-'..v.animations[v.render.ID].frames,1), v.animations[v.render.ID].dt)
		end
		if v.rotation then
			test_system.animations[v.id]:draw(game.resources[v.images[v.render.ID]][1],v.position.x,v.position.y, v.rotation[1],1,1,-v.render.offX, -v.render.offY)			
	else
		test_system.animations[v.id]:draw(game.resources[v.images[v.render.ID]][1],v.position.x+v.render.offX,v.position.y+  v.render.offY)
	end
	else 
		-- render image
		if v.rotation then
			love.graphics.draw(game.resources[v.images[v.render.ID]][1],v.position.x,v.position.y, v.rotation[1],1,1,-v.render.offX, -v.render.offY)			
		else
			love.graphics.draw(game.resources[v.images[v.render.ID]][1],v.position.x+v.render.offX,v.position.y+  v.render.offY)
		end

	end
		love.graphics.setColor(255,255,255,255)
		love.graphics.pop()

	end
end
test_system.update = function(dt)

		for k,v in pairs(test_system.targets) do
			if v.animations then
			if test_system.animations[v.id] then
				test_system.animations[v.id]:update(dt)
			end
			end
		end
end
test_system.unregister = function (entity)
	
	test_system.animations[entity.id] = nil
	test_system.currents[entity.id] = nil

end
test_system.register = function(entity)
	if not entity.render.importance then
		entity.render.importance = 0
	end
end
test_system.requirements = {position=true,images=true,images_loaded=true, render=true}

return test_system
