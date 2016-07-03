local id = 0
function get_new_shield(_, sub, side,value)
 	local entity = {}
 	id =  id + 1
 	entity.name="shield".. id

	entity.position = {x=0,y=0}
	if not(sub) then
		error "shields must have a subsystem"
	end
	entity.subcomponent={x=0,y=0,id=sub.id}
	entity.no_scroll = {multiplier = 1}
	
 	--add_simple_image_component(entity,img,0,0)
 	--entity.render_still_image.importance = 7
 	entity.rotation = {0}
 	entity.simple_rotation={-1}

 	entity.shield = {value}

	return entity

end