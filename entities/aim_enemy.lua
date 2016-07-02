require 'components.simple_image'
local id = 0
function get_aim_enemy(_, x,y,w)
 	local entity = {}
 	id =  id + 1
 	entity.name="aim_enemy".. id

	entity.position = {x=x,y=y}
	entity.direction = 0
	entity.aims_for_entity = {entity = 1}
	entity.color = {red=0,green=255,blue=0}
 	add_simple_image_component(entity,"/assets_old/animation/explosion_small_001.png",0,0)
 	entity.rotation = {90}
 	entity.col_polygon = {{-10,-10},{10,-10},{30,30},{-10,10}, offX=0,offY=0}
 	entity.collision={moves=true}
	return entity

end