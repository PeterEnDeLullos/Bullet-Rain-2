
local id = 0
print("LOAD MEH")
return function(_, x,y,rotation,side)
 	local entity = game.entity_definitions.empty_bullet(nil, x,y,rotation,side)
 	entity.col_polygon = {{-8,0},{0,16},{8,0},{0,-16}, offX=0,offY=0}

 	entity.name="pulsar-bullet_".. entity.name
	
	game.component_definitions.bulletbehavior.straight_line(entity,120)
	return entity
end
