local test_system = {}
test_system.name = "draw_squre"
test_system.draw_ui = function()
	for k,v in pairs(test_system.targets) do
		love.graphics.print(game.entities[1].lives[1].."/"..game.entities[1].lives[2],600,10)
	end
end
test_system.requirements = {lives=true,}

return test_system
