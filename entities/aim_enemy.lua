require 'components.simple_image'
local id = 0
function get_aim_enemy(_, x,y,w)
 	local entity = {}
 	id =  id + 1
 	entity.name="aim_enemy".. id

	entity.position = {x=x,y=y}
	entity.velocity = {x=0,y=0}
	entity.direction = 0
	entity.aims_for_entity = {entity = 1}
	entity.color = {red=0,green=255,blue=0}
 	add_simple_image_component(entity,"assets/BulletRain/Panda.png",32,32)
	return entity

end