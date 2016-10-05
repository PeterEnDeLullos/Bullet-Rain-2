
local id = 0
return function(_, x,y, side,rev)
 	local entity = {}
 	id =  id + 1
 	entity.name="gunblade".. id

	entity.position = {x=x,y=y}
 	entity.rotation = {0}
	entity.no_scroll = {multiplier = 1}

 	game.component_definitions.simple_image(entity,"/assets/ships/enemy ships/gunblade/gunblade body.png",-64,-64)
 	entity.render.importance = 7
 	entity.col_polygon = {{-16,0},{0,16},{16,0},{0,-16}, offX=0,offY=0}
 	entity.collision={moves=true, type=side}
 	if rev then
 		game.component_definitions.enemy_movement.there_and_back(entity,{{x=-1,y=0,speed=50,time=10,now=0},{x=0,y=1,speed=50,time=2.5,now=0}})
 	else
 		game.component_definitions.enemy_movement.there_and_back(entity,{{x=1,y=0,speed=50,time=10,now=0},{x=0,y=1,speed=50,time=2.5,now=0}})
 	end
 	local blades = {}
 	blades[1] = {game.entity_definitions.enemies.gunblade_blade, 0,0,0, 0.7,entity, side}
 	blades[2] = {game.entity_definitions.enemies.gunblade_blade, 0,0,0.5*math.pi,0.7,entity, side}
 	blades[3] = {game.entity_definitions.enemies.gunblade_blade, 0,0,math.pi,0.7,entity, side}
 	blades[4] = {game.entity_definitions.enemies.gunblade_blade, 0,0,1.5*math.pi,0.7,entity, side}
 	entity.fire={gunblade_blade=true}
 	entity.health={10}
 	entity.explode_on_death={9}
 	entity.unshielded={1}
	return entity, blades

end