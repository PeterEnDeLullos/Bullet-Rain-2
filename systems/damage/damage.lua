local system = {}

system.name = "damage"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
	if v.health.to_self then
		v.health[1] = v.health[1] - v.damaged.amount*v.health.to_self
	else
		v.health[1] = v.health[1] - v.damaged.amount
	end
	if v.health.to_sub and v.subcomponent then
		core.component.add(game.entities[v.subcomponent.id],"damaged",v.damaged)
		game.entities[v.subcomponent.id].damaged.amount = game.entities[v.subcomponent.id].damaged.amount *v.health.to_sub
	end
	print(v.health[1])
	core.component.remove(v,"damaged")
	core.component.add(v,"prev_dmg",{2})
		if v.health[1]  < 0 then
			core.entity.remove(v)
		end
	end
end
system.register = function(v)

end

system.requirements = {damaged=true,health=true,unshielded=true}

return system