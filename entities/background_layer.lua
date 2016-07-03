require 'components.simple_image'
local id = 0
function get_background_layer(_, x,y,img,mult,lay,sub)
 	local entity = {}
 	id =  id + 1
 	entity.name="bg_layer".. id

	entity.position = {x=x,y=y}
	if(sub) then
		entity.subcomponent={x=0,y=0,id=sub.id}
	end
	
	entity.no_scroll = {multiplier = mult}
	
 	add_simple_image_component(entity,img,0,0)
 	entity.render_still_image.importance = lay
	entity.render_still_image.zoom = 2

 	
	return entity

end