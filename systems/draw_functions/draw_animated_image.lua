local anim8 = require 'lib.anim8.anim8'
local test_system = {}
test_system.name = "draw_animation"
test_system.animations = {}
test_system.currents = {}
local function importance_func(x1, x2)
	if not x1.render_animation.importance then
		return false
	elseif not x2.render_animation.importance then
		return x1.render_animation.importance >= 0
	end
	return x1.render_animation.importance > x2.render_animation.importance
end
test_system.draw = function()
table.sort( test_system.targets, importance_func )
	for k,v in pairs(test_system.targets) do
		if test_system.currents[v.id] ~= v.render_animation.ID then
			test_system.currents[v.id] = v.render_animation.ID
			print(v.render_animation.ID)
			print(v.animations[v.render_animation.ID])
			local iw =  game.resources[v.images[v.render_animation.ID]][1]:getWidth()
			print(iw)
			local ih = game.resources[v.images[v.render_animation.ID]][1]:getHeight()
			local fw = iw/v.animations[v.render_animation.ID].frames
			
			test_system.animations[v.id] = anim8.newAnimation(anim8.newGrid(fw,ih,iw,ih)('1-'..v.animations[v.render_animation.ID].frames,1), v.animations[v.render_animation.ID].dt)
		end
		if v.rotation then
			test_system.animations[v.id]:draw(game.resources[v.images[v.render_animation.ID]][1],v.position.x,v.position.y, v.rotation[1],1,1,-v.render_animation.offX, -v.render_animation.offY)			
	else
		test_system.animations[v.id]:draw(game.resources[v.images[v.render_animation.ID]][1],v.position.x+v.render_animation.offX,v.position.y+  v.render_animation.offY)
	end
	end
end
test_system.update = function(dt)
		for k,v in pairs(test_system.targets) do
			if test_system.animations[v.id] then
				test_system.animations[v.id]:update(dt)
			end
end
end
test_system.unregister = function (entity)
	test_system.animations[entity.id] = nil
	test_system.currents[entity.id] = nil
end
test_system.requirements = {position=true,images=true,images_loaded=true, animations=true, render_animation=true}

return test_system
