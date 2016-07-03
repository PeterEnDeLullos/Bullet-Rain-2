require 'components.bulletbehavior.straight_line'
require 'entities.empty_bullet'

require 'components.simple_image'
local id = 0
print("LOAD MEH")
function get_forward_bullet(_, x,y,rotation,side)
 	local entity = get_empty_bullet(nil, x,y,rotation,side)
 	
 	entity.name="forward_".. entity.name
	
	add_straight_line_component(entity,50)
	return entity
end
print(get_empty_bullet)