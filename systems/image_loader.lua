local system = {}
system.name = "image_loader"
system.update = function(dt)
	local nothing = false
	for k,v in pairs(system.targets) do
		if nothing then
			break
		end
		vv = v.images[v.images_unloaded[1]]
		if vv then
			if not game.resources[vv]  then
				game.resources[vv] = {love.graphics.newImage( "assets/Dropbox/bulletrain"..vv ), 1}
				nothing = true	

				v.images_unloaded[1] = { v.images_unloaded[1]  + 1 }
				break
			else
				game.resources[vv][2] = game.resources[vv][2] + 1
				v.images_unloaded[1] =  { v.images_unloaded[1]  + 1 }
				break
			end
		else
			core.component.remove(v,"images_unloaded")
			core.component.add(v,"images_loaded",{true})
		end

	end
end
system.requirements = {images=true, images_unloaded = true}
return system