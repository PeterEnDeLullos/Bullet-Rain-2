require 'components.bulletbehavior.straight_line'
require 'entities.empty_line'

require 'components.simple_image'
local id = 0
print("LOAD MEH")
return function (_, x,y,rotation,side, sub,t)
	local dx, dy = 1000*math.sin(rotation),-1000*math.cos(rotation)

 	local entity = {}

 	print(rotation)
 	id =  id + 1
 	entity.name="forward_beam".. id



	entity.color = {red=0,green=255,blue=0}
	entity.no_scroll = {multiplier = 1}
	entity.rotation={rotation}
	entity.col_polygon = {{0,0},{dx,dy}, offX=0,offY=0}
 	entity.collision={type=side.."_beam"}

	entity.position = {x=x,y=y}
	if(sub) then
		print(sub)
		entity.subcomponent={x=0,y=0,id=sub.id}
	end
	entity.despawn={t}
	
	entity.no_scroll = {multiplier = 1}
	
 	--add_simple_image_component(entity,img,0,0)
 	--entity.render_still_image.importance = 7
 	if not sub then
 		entity.aims_for_entity = {entity=1}
 	end
	return entity
end
