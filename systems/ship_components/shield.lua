-- This is a surface shield. Permits taking small amounts of damage
local system = {}

system.name = "shield"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
	local main = game.entities[v.subcomponent.id]

		if main.damaged then
			local final = main.damaged.amount-v.shield[1]
			v.shield[1] = v.shield[1] - main.damaged.amount
			print("Shield at "..v.shield[1])
			if v.shield[1] <= 0 then
				core.component.remove(main,"damaged")
			end
			if 0>=v.shield[1] then
				core.entity.remove(v)
			end
			if main.damaged then
				main.damaged.amount = final
			end
		end
		
	end
end
system.register = function(v) 
	local main = game.entities[v.subcomponent.id]
	if not main.shielded then
		if main.unshielded then

			core.component.remove(main, "unshielded")
		end
		core.component.add(main,"shielded",{1,v.shield[1]})
	else
		main.shielded[1] = main.shielded[1] + 1
		main.shielded[2] = main.shielded[2]+v.shield[1]
	end
end
system.unregister = function (v)
	local main = game.entities[v.subcomponent.id]
	if main.shielded then
		main.shielded[1] = main.shielded[1] -1
		if main.shielded[1] <= 0 then
			core.component.remove(main,"shielded")
			core.component.add(main,"unshielded",{})
		end
	end
end
system.requirements = {shield=true,subcomponent=true}

return system