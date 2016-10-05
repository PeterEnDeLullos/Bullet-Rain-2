local id = 0
return function(_, sub,max,per)
 	local entity = {}
 	id =  id + 1
 	entity.name="shield".. id

	if not(sub) then
		error "shieldgens must have a subsystem"
	end
	entity.subcomponent={x=0,y=0,id=sub.id}
	entity.no_scroll = {multiplier = 1}
	
 	--add_simple_image_component(entity,img,0,0)
 	--entity.render_still_image.importance = 7
 	entity.shield_gen = {max=max,per=per}

	return entity

end