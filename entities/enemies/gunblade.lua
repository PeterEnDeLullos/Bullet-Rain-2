require 'components.simple_image'
require 'entities.enemies.gunblade_blade'
local id = 0
function get_gunblade(_, x,y, side)
 	local entity = {}
 	id =  id + 1
 	entity.name="gunblade".. id

	entity.position = {x=x,y=y}
 	entity.rotation = {0}
 	--add_simple_image_component(entity,"/assets/ships/enemy ships/gunblade/gunblade body.png",-64,-64)
 	--entity.render.importance = 7
 	entity.col_polygon = {{-16,0},{0,16},{16,0},{0,-16}, offX=0,offY=0}
 	entity.collision={moves=true, type=side}
 	blades = {}
 	blades[1] = {get_gunblade_blade, 0,0,0, 1,entity, side}
 	blades[2] = {get_gunblade_blade, 0,0,0.5*math.pi,1,entity, side}
 	blades[3] = {get_gunblade_blade, 0,0,math.pi,1,entity, side}
 	blades[4] = {get_gunblade_blade, 0,0,1.5*math.pi,1,entity, side}
	return entity, blades

end