-- Def: agent: Entity with agency (doh), so an agent is an object that has the capability to decide on behavior, using some decision method (one of which is player input)


local id = 0
return function(x,y)
 	local player = {}
 	id =  id + 1
 	player.name="agent".. id
	player.position = {x=x,y=y}
	player.speed = {speed=140}
	player.basic_move = true

	player.no_scroll = {multiplier = 1}
	player.rotation = {0}
	player.remain_within_camera = {xpad = 50, ypad = 50}
	player.velocity = {x=0,y=0}
	game.component_definitions.animation_component(player,{"/assets/ships/player ships/small.png"},{{frames = 1,dt = 0.1}},-32,-32)
	player.render.importance=5

  	player.col_polygon = {{0,-32},{-12,0},{-8,16},{-16,24},{-8,32},{8,32},{16,24},{8,16},{12,0}, offX=0,offY=0}


  	player.collision = {moves=true, type="player"}
  	player.unshielded = {1}
  	player.lives = {4,4}

	return player
end