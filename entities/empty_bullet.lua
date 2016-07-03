local id = 0
function get_empty_bullet(_, x,y,rotation,side)
 	local entity = {}
 	id =  id + 1
 	entity.name="simple_bullet".. id
	entity.position = {x=x,y=y}
	entity.no_scroll = {multiplier = 1}
	entity.rotation = {rotation}
 	entity.col_polygon = {{-10,0},{0,10},{10,0},{0,-10}, offX=0,offY=0}
 	entity.collision={type=side.."_bullet"}
	return entity

end
print(get_empty_bullet)