require 'components.simple_image'
local id = 0
function get_empty_line(_, x,y,dx,dy,rotation,type)
 	local entity = {}
 	id =  id + 1
 	entity.name="simple_line".. id

	entity.position = {x=x+dx/2,y=y+dy/2}

	entity.color = {red=0,green=255,blue=0}
	entity.no_scroll = {multiplier = 1}
	entity.rotation={rotation}
	entity.col_polygon = {{-dx/2,dy/2},{dx/2,dy/2}, offX=0,offY=0}
 	entity.collision={type=type}
	return entity

end