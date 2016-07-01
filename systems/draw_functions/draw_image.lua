local test_system = {}
test_system.name = "draw_image"
test_system.draw = function()
	for k,v in pairs(test_system.targets) do

		love.graphics.draw(game.resources[v.images[v.render_still_image.ID]][1],v.position.x-v.render_still_image.offY,v.position.y- v.render_still_image.offY)
	end
end
test_system.requirements = {position=true,images=true,images_loaded=true,render_still_image=true}

return test_system
