
local system = {}

system.name = "move_bezier"
system.importance = 2
system.curves = {}
system.update = function(dt)
	for k,v in pairs(system.targets) do
		system.curves[v.id].t = system.curves[v.id].t + dt*v.curved_move.speed
		if system.curves[v.id].t  > 1 then
			
			core.component.add(v,"curved_move_finished",v.curved_move)
			core.component.remove(v,"curved_move")
		else
		local dx, dy= system.curves[v.id].c:evaluate(system.curves[v.id].t)
		
		v.position.x =  v.position.x-system.curves[v.id].bx + dx
		v.position.y = v.position.y-system.curves[v.id].by + dy
		system.curves[v.id].bx =dx
		system.curves[v.id].by =dy
		end	
	end
end
system.register = function(entity)
	system.curves[entity.id] = {}
	local line = {}
	for k,v in pairs( entity.curved_move.trace) do
		line[#line+1] = v[1]
		line[#line+1] = v[2]
	end

	 system.curves[entity.id].c = love.math.newBezierCurve( line)
	 local x,y = system.curves[entity.id].c:evaluate(0)
	system.curves[entity.id].bx = x
	system.curves[entity.id].by = y
	system.curves[entity.id].t = 0
end
system.unregister = function(entity)
		system.curves[entity.id] = nil 
					print("FINISHED")

end

system.requirements = {curved_move=true,position=true}

return system


