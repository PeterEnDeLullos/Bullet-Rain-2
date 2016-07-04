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
				print("remove damage")
				core.component.remove(main,"damaged")
			end
			if 0>=v.shield[1] then
				print("Removing")
				core.entity.remove(v)
			end
			if main.damaged then
				print("damaged")
				main.damaged.amount = final
			end
		end
		
	end
end
system.register = function(v) 
	print("REG SHIELD")
	local main = game.entities[v.subcomponent.id]
	if main.shielded then
		print(main.shielded[1])
	end
	if not main.shielded then
		if main.unshielded then
			print("remove unshielded")
			core.component.remove(main, "unshielded")
		end
		print(v.name)
		core.component.add(main,"shielded",{1,v.shield[1]})
	else
		print(main.shielded[1])
		error (v.name)
		main.shielded[1] = main.shielded[1] + 1
		main.shielded[2] = main.shielded[2]+v.shield[1]
	end
end
system.unregister = function (v)
	local main = game.entities[v.subcomponent.id]
	if main.shielded then
		print("MAIN")
		main.shielded[1] = main.shielded[1] -1
		print(main.shielded[1])
		if main.shielded[1] <= 0 then
			core.component.remove(main,"shielded")
			core.component.add(main,"unshielded",{})
			print("Unshielded")
		end
	else
		print("no shield?")
	end
end
system.requirements = {shield=true,subcomponent=true}

return system