local id = 0
function get_shield(_, sub, side)
 	local entity = {}
 	id =  id + 1
 	entity.name="shield".. id

	entity.position = {x=0,0}
	if not(sub) then
		error "shields must have a subsystem"
	end
	entity.subcomponent={x=0,y=0,id=sub.id}
	entity.no_scroll = {multiplier = 1}
	
 	--add_simple_image_component(entity,img,0,0)
 	--entity.render_still_image.importance = 7
 	entity.rotation = {rot}
 	entity.simple_rotation={-1}

 	entity.col_polygon = {{0,-40},{40,0},{0,40},{-40,0, offX=20,offY=0}
 	entity.shield = {1}
 	entity.collision={type=side.."_shieldgen"}

	return entity

end