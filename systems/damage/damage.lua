local system = {}

system.name = "damage"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		
		print("HOI")
		
	end
end

system.requirements = {damaged=true,health=true,unshielded=true}

return system