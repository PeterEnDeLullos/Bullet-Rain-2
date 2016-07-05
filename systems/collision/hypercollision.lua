-- The basic idea is: first use an efficient way to do collisions (bump.lua). If that shows collisions, check naively (polygon intersection)
local function get_cross(a,b)
	return "cross"
end
local ln = 0
local factions = {"player","enemy"}
local col_mode_types = {"","_beam","_bullet"}
local col_table = {}
for k,v in pairs(factions) do
	for k2,v2 in pairs(factions) do
		for k3,v3 in pairs(col_mode_types) do
			for k4,v4 in pairs(col_mode_types) do
				if v ~= v2 and (v3 == "" or v4 == "" ) then
					if not col_table[v2..v4..v..v3] then
					col_table[v..v3..v2..v4] = {v..v3,v2..v4}
				end
				end
			end
		end
	end
end

for k,v in pairs(col_table) do
	print(k,v[1],v[2])
end
local function handle_hit(a, b)
	if a.collision.type == "player" then
		if b.collision.type == "beam" then
			if not a.damaged then
				core.component.add(a,"damaged",{type="beam",amount = 1})
			end
		end
		if b.collision.type == "enemy_bullet" then
			core.entity.remove(b)
			if not a.damaged then
				core.component.add(a,"damaged",{type="bullet",amount = 1})
			end
		end
		if b.collision.type == "enemy" then
			
			if not a.damaged then
				core.component.add(a,"damaged",{type="enemy",amount = 1})
			end
		end
	end
	if a.collision.type == "enemy" then
		if b.collision.type == "player_beam" then
			if not a.damaged then
				core.component.add(a,"damaged",{type="beam",amount = 1})
			end
		end
		if b.collision.type == "player_bullet" then
			core.entity.remove(b)
			if not a.damaged then
				core.component.add(a,"damaged",{type="bullet",amount = 1})
			end
		end

	end
end
local function check_useful(a,b)
		if a.collision.type == "player" then
		if b.collision.type == "enemy_beam" then
			return true
		end
		if b.collision.type == "enemy_bullet" then
						return true

		end
		if b.collision.type == "enemy" then
						return true

		end
	end
	if a.collision.type == "enemy" then
		if b.collision.type == "player_beam" then
						return true

		end
		if b.collision.type == "player_bullet" then
						return true

		end

	end
	return false
end
local function point_in_polygon(polygon, point, position, position2)
  local odd = false
  local prev = #polygon

  local y = point[2]+position2[2]-position[2]
  local x = point[1]+position2[1]-position[1]
  for k,v in ipairs(polygon) do
  	w = polygon[prev]
  	if (v[2] < y and w[2] >= y) or (w[2] < y and v[2] >= y) then
  		if (v[1] + (y - v[2]) / (w[2]-v[2])*(w[1]-v[1]) < x) then
  			odd = not odd

  		end
  	end
  	prev = k
  end
  return odd

end


local function get_xywh_by_polygon(polygon, rotation)
	if not rotation then
		rotation = 90
	end
	polygon.rot = {}
	polygon.rotation = rotation
	for k,v in ipairs(polygon) do
		polygon.rot[k] = core.rotate_point(rotation,v)
	end
	local minx,miny,maxx,maxy = polygon.rot[1][1],polygon.rot[1][2],polygon.rot[1][1],polygon.rot[1][2]
	for k,v in ipairs(polygon.rot) do
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
		if point_in_polygon(polygon,v,position, position2) then
			hit = true
			break
		end
		if line_in_polygon(polygon, old, v,position,position2) then
			hit = true
			break
		end
		old = v
	end
		if point_in_polygon(polygon2,polygon[1],position2, position) then
			hit = true
		end
		
	
	return hit

end

local system = {}
local bump = require 'lib.bump.bump'
system.name = "hypercollision"
system.world = bump.newWorld(32)
system.categories={}
system.polygons = {}

for k,v in pairs(col_table) do
	system.categories[v[1]] = {}
	system.categories[v[2]] = {}

end
system.update = function(dt)

		for k,v in pairs(system.targets) do



			local x,y,w,h = 0,0,0,0
			if v.rotation then
				x,y,w,h = get_xywh_by_polygon(v.col_polygon, v.rotation[1]) -- also refreshes rotated polygon
				v.col_polygon.rotation = v.rotation[1]
			else
				x,y,w,h = get_xywh_by_polygon(v.col_polygon, 0)
			end
			
		end
	


				-- TODO: fancy check

			for _,all in pairs(col_table) do
				for _,v in pairs(system.categories[all[1]]) do
					for _,col in pairs(system.categories[all[2]]) do
						
						
				local hit = false
				if v.col_polygon.is_point then
					if not col.col_polygon.is_point then -- other is a polygon, I'm a poing
						hit = point_in_polygon(col.col_polygon.rot, {0,0}, {col.position.x,col.position.y}, {v.position.x, v.position.y})
					else
						hit = false -- points never hit eachother
					end
				elseif col.col_polygon.is_point then -- Other is a point, I'm a polygon
					hit = point_in_polygon(v.col_polygon.rot, {0,0},  {v.position.x, v.position.y}, {col.position.x,col.position.y})
				else -- polygon hits polygon

					hit = polygon_in_polygon(v.col_polygon.rot, col.col_polygon.rot, {v.position.x, v.position.y}, {col.position.x,col.position.y})
				end
				if hit then

					ln = ln  + 1
					handle_hit(v,col)
					handle_hit(col,v)
				end
			end
			
		end

		

	end
end

system.register = function (entity) 

	system.categories[entity.collision.type][entity.id] = entity
	system.polygons[entity.id] = {}

end
system.unregister = function (entity)
	system.categories[entity.collision.type][entity.id] = nil
	system.polygons[entity.id] = nil

end
system.requirements = {position=true, col_polygon = true, collision=true}

return system