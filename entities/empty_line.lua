require 'components.simple_image'
local id = 0
function get_empty_line(_, x,y,dx,dy)
 	local entity = {}
 	id =  id + 1
 	entity.name="simple_line".. id

	entity.position = {x=x+dx/2,y=y+dy/2}

	entity.color = {red=0,green=255,blue=0}
	entity.no_scroll = {multiplier = 1}
	entity.rotation={0}
 	add_simple_image_component(entity,"/assets_old/animation/explosion_small_001.png",0,0)
	entity.col_polygon = {{-dx/2,dy/2},{dx/2,dy/2}, offX=0,offY=0}
 	entity.collision={type="enemy_beam"}
	return entity

end