return function(entity,urls,animations, offX, offY)
	entity.images = urls
	entity.images_unloaded = {1}

	entity.animations = animations
	entity.animations.start = 1
	entity.render = {ID = 1, offX = offX, offY =  offY}

end