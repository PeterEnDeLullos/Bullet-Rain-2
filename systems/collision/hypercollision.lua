-- The basic idea is: first use an efficient way to do collisions (bump.lua). If that shows collisions, check naively (polygon intersection)
local function get_cross(a,b)
	return "cross"
end
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
		maxy = math.max(maxy,v[2])
	end
	return minx,miny,maxx-minx, maxy - miny
end
function segmentIntersects(x1, y1, x2, y2, x3, y3, x4, y4)
   d = (y4-y3)*(x2-x1)-(x4-x3)*(y2-y1)
   Ua_n = ((x4-x3)*(y1-y3)-(y4-y3)*(x1-x3))
   Ub_n = ((x2-x1)*(y1-y3)-(y2-y1)*(x1-x3))
   if d == 0 then
       --if Ua_n == 0 and Ua_n == Ub_n then
       --    return true
       --end
       return false
   end
   Ua = Ua_n / d
   Ub = Ub_n / d
   if Ua >= 0 and Ua <= 1 and Ub >= 0 and Ub <= 1 then
       return true
   end
   return false
end
local function line_in_polygon(polygon, start, finish, position, position2)
	local old = polygon[#polygon]
	for k,v in ipairs( polygon) do
		if segmentIntersects(v[1]+position[1],v[2]+position[2],old[1]+position[1],old[2]+position[2],start[1]+position2[1],start[2]+position2[2],finish[1]+position2[1],finish[2]+position2[2]) then
			return true
		end
	end
	return false
end
local function polygon_in_polygon(polygon, polygon2,position,position2)
	local hit = false
	local old = polygon2[#polygon2]
	for k,v in ipairs( polygon2) do

		if line_in_polygon(polygon, old, v,position,position2) then
			hit = true
			break
		end
		old = v
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
	local x,y= v.col_polygon.x, v.col_polygon.y
	
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
			v.position.x, v.position.y, cols, len = system.world:move(v, v.position.x + v.col_polygon.offX, v.position.y + v.col_polygon.offY,get_cross)
			v.position.x, v.position.y = v.position.x - v.col_polygon.offX, v.position.y - v.col_polygon.offY
			for _, col in pairs(cols) do
				-- TODO: fancy check
				local hit = false
				col = col.other
				if v.col_polygon.is_point then
					if not col.col_polygon.is_point then -- other is a polygon, I'm a poing
						hit = point_in_polygon(col.col_polygon, {0,0}, {col.position.x,col.position.y}, {v.position.x, v.position.y})
						print("HERE")
					else
						hit = false -- points never hit eachother
					end
				elseif col.col_polygon.is_point then -- Other is a point, I'm a polygon
					hit = point_in_polygon(v.col_polygon, {0,0},  {v.position.x, v.position.y}, {col.position.x,col.position.y})
				else -- polygon hits polygon

					hit = polygon_in_polygon(v.col_polygon, col.col_polygon, {v.position.x, v.position.y}, {col.position.x,col.position.y})
				end
				if hit then
					print("HIT".. col.name)
				end
			end
		else
			-- Bullets
			system.world:update(v, v.position.x + v.col_polygon.offX, v.position.y + v.col_polygon.offY)

		end
		

	end
end

system.register = function (entity) 
	local w,h,x,y = 0,0,entity.position.x,entity.position.y
	if entity.col_polygon.is_point then
		w = 10
		h = 10
		entity.col_polygon.offX = 5
		entity.col_polygon.offY = 5
		entity.col_polygon.x = x-5
		entity.col_polygon.y = y-5
		x = x - w/2
		print("fiets")
		y = y - h/2
	else
		x,y,w,h = get_xywh_by_polygon(entity.col_polygon)
		entity.col_polygon.offX = x
		entity.col_polygon.offY = y
		entity.col_polygon.x = entity.position.x
		entity.col_polygon.y = entity.position.y
		print("HOI")
	end
	w = math.max(w,1)
	h = math.max(h,1)
	system.world:add(entity, entity.position.x , entity.position.y,w,h)
end
system.unregister = function (entity)
	system.world:remove(entity)
end
system.requirements = {position=true, col_polygon = true, collision=true}

return system