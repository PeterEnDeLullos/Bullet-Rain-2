local system = {}

system.name = "a_from_w"

system.update = function(dt)
	for k,v in pairs(system.targets) do
		local dx = 0
		local dy = 0
		if not v.mass.counts_as_infinite  then
			for l,w in pairs(system.targets) do

				if w ~= v then
					local xd = v.position.x - w.position.x
					local yd = v.position.y - w.position.y

					local hyp = math.sqrt(xd*xd+yd*yd)
					if hyp ~= 0 then
						local gmmr = global.g * w.mass.mass / hyp*hyp
						dx = dx - xd/hyp * gmmr
						dy = dy - yd/hyp * gmmr
					end
				end
			end
		end
		v.acceleration.x = dx
		v.acceleration.y = dy
	end
end

system.requirements = {position=true,acceleration=true, mass=true}

return system