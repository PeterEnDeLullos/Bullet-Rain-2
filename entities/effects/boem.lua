-- Def: agent: Entity with agency (doh), so an agent is an object that has the capability to decide on behavior, using some decision method (one of which is player input)
require 'components.animation_component'
local id = 0
function get_new_explosion(x,y,id)
 	local player = {}
 	id =  id + 1
 	player.name="boem".. id
	player.position = {x=x,y=y}

	player.no_scroll = {multiplier = 1}
	player.rotation = {0}
	player.remain_within_camera = {xpad = 50, ypad = 50}
	player.light_source = {red=255, green=0,  blue=0, range=1000, glowStrength=0.3}
	add_simple_animation_component(player,{"/assets_old/animation/explosion_small_001.png"},{{frames = 8,dt = 0.05}},-21,-16)
	player.despawn = {0.4}
	player.render.importance=5


	return player
end