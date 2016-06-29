local id = 0
function get_new_aim_enemy(x,y,w)
 	local entity = {}
 	id =  id + 1
 	entity.name="aim_enemy".. id

	entity.position = {x=x,y=y}
	entity.velocity = {x=0,y=0}
	entity.direction = 0
	entity.aims_for_entity = {entity = 1}
	entity.color = {red=0,green=255,blue=0}
	
	return entity

end