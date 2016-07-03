local id = 0
function get_empty_bullet(_, x,y,rotation,side)
 	local entity = {}
 	id =  id + 1
 	entity.name="simple_bullet".. id
	entity.position = {x=x,y=y,new=true}
	entity.no_scroll = {multiplier = 1}
	entity.rotation = {rotation}
 	entity.col_polygon = {{-2,0},{0,4},{2,0},{0,-4}, offX=0,offY=0}
 	entity.collision={type=side.."_bullet"}
	return entity

end
