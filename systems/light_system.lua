
require "lib.light.livsh"
return function()
local light = {}

light.name= "light"
light.importance = 2

light.objects = {}

function light.register(entity)
	if not light.world then
		light.world = love.light.newWorld()
		light.world:setAmbientColor(15, 15, 31)
	end
	 if entity.light.type =="source" then
	 	light.objects[entity.id] = light.world:newLight(0, 0, entity.light_source.red, entity.light_source.green, entity.light_source.blue, entity.light_source.range)
	 	return
	 end
	 if not entity.light.type then
	 	error("Didn't specify light type for entity " .. entity.name)
	 end
	 error("Using invalid light type ".. entity.light.type .. " for entity ".. entity.name)

end
function light.unregister(entity)
	light.objects[entity.id]:clear()
end
function light.update(dt)
		for k,v in pairs(light.objects) do
			if v == nil then
				error("V == nil")
			end
			if game.entities[k] == nil then
					error("K"..k..tostring(light).." == nil")
			end
			v:setPosition(game.entities[k].position.x-game.systems.scroll.x,game.entities[k].position.y-game.systems.scroll.y)
		end
		if light.world then
	    	light.world:update()	
	    end
end
function light.draw()
	love.graphics.push()
    if game.systems.scroll then
            love.graphics.translate(game.systems.scroll.x, game.systems.scroll.y)
        end
   	if light.world then
	    light.world:drawShadow()
        light.world:drawShine()
    end
    love.graphics.pop()


    
end


light.requirements = {light=true,position=true}

return light
end