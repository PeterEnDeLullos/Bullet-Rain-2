local system = {}

system.name = "damage"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		v.previously_damaged[1] =v.previously_damaged[1] -dt
		if v.previously_damaged[1]  < 0 then
			
			core.component.remove(v,"previously_damaged")
		end
	end
end


system.requirements = {previously_damaged=true}

return system