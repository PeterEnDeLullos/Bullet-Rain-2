local system = {}

system.name = "delayed_add_component"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		v.delayed_add_component.t = v.delayed_add_component.t - dt
		if v.delayed_add_component.t  <= 0 then
			core.component.add(v,v.delayed_add_component.component,v.delayed_add_component.contents)
			core.component.remove(v,"delayed_add_component")
		end
	end
end

system.requirements = {delayed_add_component=true}

return system