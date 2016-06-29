local system = {}
system.name = "image_loader"
system.resources = {}
system.load = function(dt)
	local nothing = true
	for k,v in pairs(system.targets) do
		if nothing then
			break
		end
		for kk,vv in pairs(v.images_needed) do
			if not system.resources[vv]  then
				system.resources[vv] = love.graphics.newImage( vv )
				break
			end
		end
	end
	love.graphics.setColor( 255,255,255,255)
end
system.requirements = {images_needed=true}
return system