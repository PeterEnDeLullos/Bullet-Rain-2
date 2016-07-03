require 'components.simple_image'
require 'entities.enemies.gunblade_blade'
local id = 0
function get_gunblade(_, x,y, side)
 	local entity = {}
 	id =  id + 1
 	entity.name="gunblade".. id

	entity.position = {x=x,y=y}
 	entity.rotation = {0}
	entity.no_scroll = {multiplier = 1}

 	add_simple_image_component(entity,"/assets/ships/enemy ships/gunblade/gunblade body.png",-64,-64)
 	entity.render.importance = 7
 	entity.col_polygon = {{-16,0},{0,16},{16,0},{0,-16}, offX=0,offY=0}
 	entity.collision={moves=true, type=side}
 	blades = {}
 	blades[1] = {get_gunblade_blade, 0,0,0, 0.7,entity, side}
 	blades[2] = {get_gunblade_blade, 0,0,0.5*math.pi,0.7,entity, side}
 	blades[3] = {get_gunblade_blade, 0,0,math.pi,0.7,entity, side}
 	blades[4] = {get_gunblade_blade, 0,0,1.5*math.pi,0.7,entity, side}
 	entity.fire={gunblade_blade=true}
 	entity.health={10}
 	entity.explode_on_death={9}
 	entity.unshielded={1}
	return entity, blades

end