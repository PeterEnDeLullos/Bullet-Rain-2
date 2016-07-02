require 'components.simple_image'
local id = 0
print("LOAD MEH")
function get_empty_bullet(_, x,y,w)
 	local entity = {}
 	id =  id + 1
 	entity.name="simple_bullet".. id
	entity.color = {red=0,green=255,blue=0}
	print("POITN")
	entity.position = {x=x,y=y}
	entity.direction = 0
	entity.aims_for_entity = {entity = 1}
	entity.color = {red=0,green=255,blue=0}
	entity.no_scroll = {multiplier = 1}
	entity.rotation = {3}
 	add_simple_image_component(entity,"/assets_old/animation/explosion_small_001.png",0,0)
 	entity.col_polygon = {{-4,0},{0,4},{4,0},{0,-4}, offX=0,offY=0}
 	entity.collision={}
	return entity

end
print(get_empty_bullet)