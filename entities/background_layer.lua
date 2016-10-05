local id = 0
return function(_, x,y,img,mult,lay,sub)
 	local entity = {}
 	id =  id + 1
 	entity.name="bg_layer".. id

	entity.position = {x=x,y=y}
	if(sub) then
		entity.subcomponent={x=0,y=0,id=sub.id}
	end
	
	entity.no_scroll = {multiplier = mult}
	
 	game.component_definitions.simple_image(entity,img,0,0)
 	entity.render.importance = lay
	entity.render.zoom = 2
	entity.render.wrappingMode = "mirroredrepeat"

 	
	return entity

end