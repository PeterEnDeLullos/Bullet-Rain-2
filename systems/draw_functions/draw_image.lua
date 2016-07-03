local test_system = {}
test_system.name = "draw_image"
local function importance_func(x1, x2)
	if not x1 or not x1.render_still_image.importance then
		return false
	elseif not x2 or not x2.render_still_image.importance then
		return x1.render_still_image.importance >= 0
	end
	return x1.render_still_image.importance > x2.render_still_image.importance
end
test_system.draw = function()
    table.sort( test_system.targets, importance_func )

	for k,v in pairs(test_system.targets) do
		love.graphics.push()
		if v.render_still_image.zoom then
			love.graphics.scale(v.render_still_image.zoom)
		end
		love.graphics.scale(2)
		if v.rotation then
		love.graphics.draw(game.resources[v.images[v.render_still_image.ID]][1],v.position.x,v.position.y, v.rotation[1],1,1,-v.render_still_image.offX, -v.render_still_image.offY)			
	else
		love.graphics.draw(game.resources[v.images[v.render_still_image.ID]][1],v.position.x+v.render_still_image.offX,v.position.y+  v.render_still_image.offY)
	end
	love.graphics.pop()
	end
end
test_system.requirements = {position=true,images=true,images_loaded=true,render_still_image=true}

return test_system
