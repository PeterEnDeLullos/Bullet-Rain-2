local system = {}

system.name = "subcomponent_reg"
system.importance = 2
system.components = {}
system.update=function(dt)
end
system.register = function(v)
	
		
		if  not system.components[v.subcomponent.id] then
			system.components[v.subcomponent.id]  = {}
		end
		system.components[v.subcomponent.id] [#system.components[v.subcomponent.id] +1]=v
		print("REG")
	
end

system.requirements = {subcomponent=true}

return system