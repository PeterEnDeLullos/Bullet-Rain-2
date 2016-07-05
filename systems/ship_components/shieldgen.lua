-- This is a surface shield. Permits taking small amounts of damage
local system = {}
require 'entities.ship_components.shield'

system.name = "shield_gen"
system.importance = 2
system.update = function(dt)
	for k,entity in pairs(system.targets) do
		entity.shield_gen.dt = entity.shield_gen.dt - dt
		if entity.shield_gen.dt <= 0  then
			entity.shield_gen.dt = entity.shield_gen.per
			if entity.shield_gen.shield and game.entities[entity.shield_gen.shield] and game.entities[entity.shield_gen.shield].shield then
				

					print(game.entities[entity.shield_gen.shield].shield[1])
					game.entities[entity.shield_gen.shield].shield[1] = math.min(game.entities[entity.shield_gen.shield].shield[1] + 1, entity.shield_gen.max)
				
			else
				local a = get_new_shield(_,game.entities[entity.subcomponent.id],"player",1)
        		core.entity.add(a)
        		entity.shield_gen.shield = a.id
			end
		end
	end
end
system.register = function(entity)
	entity.shield_gen.dt = entity.shield_gen.per
end
system.requirements = {shield_gen=true,subcomponent=true}

return system