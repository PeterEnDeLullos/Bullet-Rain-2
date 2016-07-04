-- Def: agent: Entity with agency (doh), so an agent is an object that has the capability to decide on behavior, using some decision method (one of which is player input)
MOVEMENT = 0
CLEARED = 1

local id = 0

function get_new_zone(file)
 	local zone = {}
 	id =  id + 1

 	zone.name="zone".. id
 	zone.zone_id = id
	zone.zone = require (file)()
	zone.unloaded = {true}
	 
	return zone
end