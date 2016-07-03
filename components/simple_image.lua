function add_simple_image_component(entity,url,offX,offY)
	entity.images = {url}
	entity.images_unloaded = {1}
	entity.render = {ID = 1, offX = offX, offY =  offY}

end