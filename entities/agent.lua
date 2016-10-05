-- Def: agent: Entity with agency (doh), so an agent is an object that has the capability to decide on behavior, using some decision method (one of which is player input)

local id = 0
return function(x,y)
 	local agent = {}
 	id =  id + 1
 	agent.name="agent".. id
	agent.position = {x=x,y=y}
	agent.speed = {speed=100}
	agent.basic_move = true
	agent.mass = {mass=1000}
	agent.acceleration = {x=0,y=0}
	agent.square = {width=10, height=10}
	agent.light = {type="source"}
	
	agent.light_source = {red=255, green=127,  blue=63, range=500,glowStrength=0.3}
	game.component_definitions.simple_image(agent,"assets/demon_statue.png",100,100)
	
	return agent
end