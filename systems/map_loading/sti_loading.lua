local sti = require 'lib.sti'
local system = {}
system.name = "sti_loader"
system.lists = {}
system.tile_textures = {}
system.sti_maps = {}
system.draw = function(dt)
	for k,v in  pairs(system.targets) do
		system.sti_maps[v.id]:draw()
	end
end
system.register = function (entity) 
	system.lists[entity.id] = {}
	system.sti_maps[entity.id] = sti.new(entity.sti_map.file)

	local map = system.sti_maps[entity.id]
    local collidable_tiles = {}
    for k,v in pairs(map.layers) do
    	print(k,v)
    end
    local layer = map.layers["Tilelaag 1"]
    for k,v in pairs(map.tilesets) do
    	print(k,v)
    end
	for k,v in pairs(map.tilesets[1])do

		print(k,v)
	end

    for y = 1, map.height do
    	for x = 1, map.width do

        if layer.data[y][x] then
    		local quad = layer.data[y][x].quad:getViewport( )
    		local image = map.tilesets[layer.data[y][x].tileset].image
          
        end
      end
    end




end

system.unregister = function (entity) 
	for k,v in pairs(system.lists[entity.id]) do
		core.entity.remove(v)
	end
	system.lists[entity.id] = nil
	system.sti_maps[entity.id] = nil
end

system.requirements = {sti_map=true}
return system