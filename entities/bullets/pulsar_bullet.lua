require 'components.bulletbehavior.straight_line'
require 'entities.empty_bullet'

require 'components.simple_image'
local id = 0
print("LOAD MEH")
function get_pulsar_bullet(_, x,y,rotation,side)
 	local entity = get_empty_bullet(nil, x,y,rotation,side)
 	entity.col_polygon = {{-8,0},{0,16},{8,0},{0,-16}, offX=0,offY=0}

 	entity.name="pulsar-bullet_".. entity.name
	
	add_straight_line_component(entity,120)
	return entity
end
