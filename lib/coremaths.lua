core.rotate_point = function(angle,p)
	
   local s = math.sin(angle)
   local c = math.cos(angle)

  
  
  -- rotate point
  local xnew = p[1] * c - p[2] * s
  local ynew = p[1] * s + p[2] * c

  -- translate point back:
  return {xnew, ynew}
  
end
