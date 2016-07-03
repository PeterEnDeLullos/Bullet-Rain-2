local id = 0
function get_gunblade_blade(_, x,y,rot,rate,sub, side)
 	local entity = {}
 	id =  id + 1
 	entity.name="gunblade_blade".. id

	entity.position = {x=x,y=y}
	if(sub) then
		entity.subcomponent={x=x,y=y,id=sub.id}
	end
	
	entity.no_scroll = {multiplier = 1}
	
 	add_simple_image_component(entity,"/assets/ships/enemy ships/gunblade/gunblade blade.png",-8,-64)
 	entity.render.importance = 6.9
 	entity.rotation = {rot}
 	entity.col_polygon = {{-8,-18},{-8,-40},{8,-40}, {8,-18}, offX=0,offY=0}
 	entity.fire_forward = {x=6,y=-44,rate=rate*4,side=side,fire_name="gunblade_blade"}
 	

 	entity.collision={moves=true,type=side}
 	entity.simple_rotation={-1}
	entity.health={6,to_sub=1, to_self=0}
	entity.explode_on_death={5,offX=0,offY=-32}
 	entity.unshielded={1}
 	if not sub then
 		entity.aims_for_entity = {entity=1}
 	end
	return entity

end