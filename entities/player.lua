-- Def: agent: Entity with agency (doh), so an agent is an object that has the capability to decide on behavior, using some decision method (one of which is player input)

local id = 0
function get_new_player(x,y)
 	local player = {}
 	id =  id + 1
 	player.name="agent".. id
	player.position = {x=x,y=y}
	player.speed = {speed=100}
	player.basic_move = true
	player.square = {width=10, height=10}
	player.light = {type="source"}
	player.no_scroll = {multiplier = 1}
	player.remain_within_camera = {xpad = 50, ypad = 50}
	player.light_source = {red=255, green=127,  blue=63, range=500, glowStrength=0.3}
	add_simple_image_component(player,"/assets_old/entity/ships/ship_003_idle.png",-21,-16)
  	player.col_polygon = {{0,-20},{10,30},{-10,30}, offX=0,offY=0}
  	player.collision = {moves=true, type="player"}
	return player
end