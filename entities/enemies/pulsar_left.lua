
local id = 0
function get_pulsar_left(_,sub,side)
 	local entity = {}
 	id =  id + 1
 	entity.name="pulsar_left".. id

	entity.position = {x=2,y=2}
	if(sub) then
		entity.subcomponent={x=0,y=0,id=sub.id}
	end
	
	entity.no_scroll = {multiplier = 1}
	
 	add_simple_image_component(entity,"/assets/ships/enemy ships/pulsar/pulsar_left.png",-34,-44)
 	entity.render.importance = 6.9
 	entity.rotation = {0}
 	entity.col_polygon = {{-7,-34},{-5,-14},{-5,36},{-14,23},{-23,5},{-23,-7},{-13,-27}, offX=-23,offY=-24}
 	

 	entity.collision={moves=true,type=side}
 	
	entity.health={6,to_sub=0, to_self=1}
	entity.explode_on_death={5,offX=0,offY=-32}
 	entity.unshielded={1}
 	 		entity.aims_for_entity = {entity=1}

 	entity.pulsar_side = {1}
entity.on_death = {{"remove_component","no_scroll"},{"add_component","acceleration",{400}},{"add_component","velocity",{x=0,y=0}},{"add_component","despawn",{5}},{"remove_component","fire"}}
 	if not sub then
 		entity.aims_for_entity = {entity=1}
 	end
	return entity

end