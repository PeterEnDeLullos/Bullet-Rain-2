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
	
end
system.unregister = function(v)
	for k,vv in pairs (system.components[v.subcomponent.id]) do

		if vv.id == v.id then
			system.components[v.subcomponent.id][k] = nil
			
		end
	end
	 if  system.components[v.subcomponent.id] == {} then
	 	system.components[v.subcomponent.id] = nil
	 end
end


system.requirements = {subcomponent=true}

return system