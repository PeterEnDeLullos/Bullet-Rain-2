
local id = 0
function get_pulsar_gun(_, x,y,img,rot,rate,sub, side, name)
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
 	entity.rotation = {0}
 	--entity.col_polygon = {{0,-20},{-10,10},{10,10}, offX=0,offY=0}
 	
 	entity.collision={type=side.."_enemy"}
 	
 	entity.fire_pulsar = {x=0,y=-28,rate=rate,side=side,fire_name=name}


 		entity.aims_for_entity = {entity=1}
 	
	return entity

end