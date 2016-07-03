local system = {}

system.name = "destroy_after_timeout"
system.importance = 2
system.update = function(dt)
	for k,v in pairs(system.targets) do
		v.despawn[1] = v.despawn[1] - dt
		if v.despawn[1] < 0 then
			core.entity.remove(v)
		end
	end
end
system.register = function(v)

end

system.requirements = {despawn=true}

return system