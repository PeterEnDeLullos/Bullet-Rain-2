-- The basic idea is: first use an efficient way to do collisions (bump.lua). If that shows collisions, check naively (polygon intersection)
local function point_in_polygon(polygon, point, position, position2)
  local odd = false
  local prev = #polygon

  local y = point[2]+position2[2]-position[2]
  local x = point[1]+position2[1]-position[1]
  for k,v in ipairs(polygon) do
  	w = polygon[prev]
  	if (v[2] < y and w[2] >= y) or (w[2] < y and v[2] >= y) then
  		if v[1] + (y - v[2])/ (w[2]-w[1])*(v[2]-v[1]) < x then
  			odd = not odd

  		end
  	end
  	prev = k
  end
  return odd

end

local function get_xywh_by_polygon(polygon)
	local minx,miny,maxx,maxy = polygon[1][1],polygon[1][2],polygon[1][1],polygon[1][2]
	for k,v in ipairs(polygon) do
		minx = math.min(minx,v[1])
		maxx = math.max(maxx,v[1])
		miny = math.min(miny,v[2])
		maxy = math.max(maxx,v[2])
	end
	return minx,miny,maxx-minx, maxy - miny
end
local function polygon_in_polygon(polygon, polygon2,position,position2)
	local hit = false
	for k,v in ipairs( polygon2) do

		if point_in_polygon(polygon, v,position,position2) then
			hit = true
			break
		end
	end
	if hit then
		return true
	end
	return point_in_polygon(polygon2,polygon[1],position2,position)
end

local system = {}
local bump = require 'lib.bump.bump'
system.name = "hypercollision"
system.world = bump.newWorld()

system.update = function(dt)

for k,v in pairs(system.targets) do
	local x,y,_, _ = system.world:getRect(v)

	x = x - v.col_polygon.offX
	y = y - v.col_polygon.offY
		if v.col_polygon.updated then
			local x,y,w,h = get_xywh_by_polygon(v.col_polygon)
			v.col_polygon.offX = v.position.x
			v.col_polygon.offY = v.position.y
			x = x + v.position.x
			y = y + v.position.y	
			world:update(v, x,y,w,h)


		end
		if v.collision.moves then
			v.position.x, v.position.y, cols, len = system.world:move(v, v.position.x, v.position.y)
			v.position.x, v.position.y = v.position.x, v.position.y 
			for _, col in pairs(cols) do
				-- TODO: fancy check
				print("COL")
				local hit = false
				col = col.other
				if v.col_polygon.is_point then
					if not col.col_polygon.is_point then -- other is a polygon, I'm a poing
						hit = point_in_polygon(col.col_polygon, {0,0}, col.position, v.position)

					else
						hit = false -- points never hit eachother
					end
				elseif col.col_polygon.is_point then -- Other is a point, I'm a polygon
					hit = point_in_polygon(v.col_polygon, {0,0}, v.position, col.position)
				else -- polygon hits polygon

					hit = polygon_in_polygon(v.col_polygon, col.col_polygon, {v.position.x, v.position.y}, {col.position.x,col.position.y})
				end
			end
		else
			-- Bullets
			system.world:update(v, v.position.x-x, v.position.y - y)

		end
		

	end
end

system.register = function (entity) 
	local w,h,x,y = 0,0,entity.position.x,entity.position.y
	if entity.is_point then
		w = 4
		h = 4
		entity.col_polygon.offX = 2
		entity.col_polygon.offY = 2
		x = x - w/2
		y = y - h/2
	else
		x,y,w,h = get_xywh_by_polygon(entity.col_polygon)
		entity.col_polygon.offX = x
		entity.col_polygon.offY = y

	end
		print( x + entity.position.x )
	system.world:add(entity, x + entity.position.x ,y + entity.position.y,w,h)
end
system.unregister = function (entity)
	system.world:remove(entity)
end
system.requirements = {position=true, col_polygon = true, collision=true}

return system