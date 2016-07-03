local id = 0
function get_pulsar_right(_,sub, side)
 	local entity = {}
 	id =  id + 1
 	entity.name="pulsar_right".. id

	entity.position = {x=16,y=0}
	if(sub) then
		entity.subcomponent={x=-2,y=-2,id=sub.id}
	end
	
	entity.no_scroll = {multiplier = 1}
	
 	add_simple_image_component(entity,"/assets/ships/enemy ships/pulsar/pulsar_right.png",-34,-44)
 	entity.render.importance = 6.9
 	entity.rotation = {0}
 	entity.col_polygon = { {4,-14},{6,-34},{12,-27},{18,-6},{18,0},{13,10},{4,24}, offX=23,offY=24}
 	

 	entity.collision={moves=true,type=side}
	entity.health={6,to_sub=0, to_self=1}
	entity.explode_on_death={5,offX=0,offY=-16}
 	entity.unshielded={1}
 	 		entity.aims_for_entity = {entity=1}

 	entity.on_death = {{"remove_component","no_scroll"},{"add_component","acceleration",{400}},{"add_component","velocity",{x=0,y=0}},{"add_component","despawn",{5}},{"remove_component","fire"}}

 	entity.pulsar_side = {2}
 	if not sub then
 		entity.aims_for_entity = {entity=1}
 	end
	return entity

end