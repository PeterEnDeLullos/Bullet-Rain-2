local test_system = {}
test_system.name = "explode_on_death"
function test_system.update(tt)
	end
function test_system.unregister(entity)
	
	if entity.health[1] <= 0 or ( entity.subcomponent and game.entities[entity.subcomponent.id].health[1] <= 0 ) then
		if entity.explode_on_death.offX then
			if entity.rotation then
				local a = core.rotate_point(entity.rotation[1],{entity.explode_on_death.offX, entity.explode_on_death.offY})
				core.entity.add(get_new_explosion(entity.position.x+a[1],entity.position.y+a[2],entity.explode_on_death[1]))
			else
				core.entity.add(get_new_explosion(entity.position.x+entity.explode_on_death.offX,entity.position.y+entity.explode_on_death.offY,entity.explode_on_death[1]))
			end
		else
			core.entity.add(get_new_explosion(entity.position.x,entity.position.y,entity.explode_on_death[1]))
		end
	end
end
test_system.requirements = {explode_on_death=true, health=true}

return test_system


