local id = 0
return function(x,y,w)
 	local entity = {}
 	id =  id + 1
 	entity.name="planet".. id

	entity.position = {x=x,y=y}
	entity.velocity = {x=0,y=0}
	entity.acceleration = {x=0,y=0}
	entity.mass = {mass = w, counts_as_infinite=false}
	entity.color = {red=0,green=255,blue=0}
	
	return entity

end