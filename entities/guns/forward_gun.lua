
local id = 0
return function(_, x,y,img,rot,rate,sub, side, name)
	if not name then
		name="gun"
	end
 	local entity = {}
 	id =  id + 1
 	entity.name="forward_gun".. id

	entity.position = {x=x,y=y}
	if(sub) then
		entity.subcomponent={x=x,y=y,id=sub.id}
	end
	
	entity.no_scroll = {multiplier = 1}
	
 	--add_simple_image_component(entity,img,0,0)
 	--entity.render_still_image.importance = 7
 	entity.rotation = {rot}
 	entity.fire_forward = {x=0,y=-28,rate=rate,side=side,fire_name=name}
 	entity.collision={type=side.."_gun"}
 	if not sub then
 		entity.aims_for_entity = {entity=1}
 	end
	return entity

end