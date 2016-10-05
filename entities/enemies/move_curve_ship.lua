

local id = 0
return function(_, x,y, side,curve)
 	local entity = {}
 	id =  id + 1
 	entity.name="curve_ship".. id

	entity.position = {x=x,y=y}
 	entity.rotation = {math.pi}
	entity.no_scroll = {multiplier = 1}

	entity.curved_move={speed=0.1,trace=curve}
	entity.delete_bezier_when_finished = {1}
 	entity.col_polygon = {{-10,-10},{10,-10},{30,30},{-10,10}, offX=0,offY=0}
 	entity.collision={moves=true, type="enemy"}
 	 	entity.fire_forward = {x=0,y=-28,rate=1,side=side,fire_name="pulsar_gun"}

 	entity.health={1}
 	entity.unshielded={1}
 	entity.fire={pulsar_gun=true}
	return entity

end