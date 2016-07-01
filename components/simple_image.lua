function add_simple_image_component(entity,url,offX,offY)
	entity.images = {url}
	entity.images_unloaded = {1}
	entity.render_still_image = {ID = 1, offX = offX, offY =  offY}

end