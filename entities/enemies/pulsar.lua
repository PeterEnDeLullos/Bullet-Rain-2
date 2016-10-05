

local id = 0
return function(_, x,y, side, bezier)
 	local entity = {}
 	id =  id + 1
 	entity.name="pulsar".. id

	entity.position = {x=x,y=y}
 	entity.rotation = {math.pi}
	entity.no_scroll = {multiplier = 1}
	if bezier then
	entity.curved_move={speed=0.1,trace= bezier}
	entity.delete_bezier_when_finished = {1}
end
 	local blades = {}
 	blades[1] = {game.entity_definitions.enemies.pulsar_left, entity, side}
 	blades[2] = {game.entity_definitions.enemies.pulsar_right, entity, side}
 	blades[3] = {game.entity_definitions.guns.pulsar_gun, 0,0,nil,0,1/2,entity, side,"pulsar_gun"}

 	entity.health={1}
 	entity.unshielded={1}
 	entity.fire={pulsar_gun=true}
	return entity, blades

end