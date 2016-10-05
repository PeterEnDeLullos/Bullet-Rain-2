local id = 0
return function(_, x,y,rotation,side)
 	local entity = {}
 	id =  id + 1
 	entity.name="simple_bullet".. id
	entity.position = {x=x,y=y,new=true}
	entity.no_scroll = {multiplier = 1}
	entity.rotation = {rotation}
 	entity.col_polygon = {{-4,0},{0,8},{4,0},{0,-8}, offX=0,offY=0}
 	entity.collision={type=side.."_bullet"}
 	entity.destroy_outside_screen = {1}
	return entity

end
