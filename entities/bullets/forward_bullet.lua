require 'components.bulletbehavior.straight_line'
require 'entities.empty_bullet'

require 'components.simple_image'
local id = 0
print("LOAD MEH")
return function(_, x,y,rotation,side)
 	local entity = game.entity_definitions.empty_bullet(nil, x,y,rotation,side)
 	
 	entity.name="forward_".. entity.name
	if side == "enemy" then
		game.component_definitions.bulletbehavior.straight_line(entity,120)
	else
		game.component_definitions.bulletbehavior.straight_line(entity,900)
	end
	return entity
end
