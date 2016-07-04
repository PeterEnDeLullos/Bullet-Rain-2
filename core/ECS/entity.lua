core.entity = {}
next_id = function ()
	local id = 0
	return function()
		id = id+1
		return id
	end
end
next_id = next_id()
function core.entity.add(entity)
	entity.id = next_id()
	entity.systems = {}

	for k,v in pairs(entity) do
		if k ~= "id"  and k ~= "systems" then
			core.component.add_existing(entity,k)
		end	
	end
	local  b = { __mode = "v" }
	setmetatable(entity.systems, b) 
	game.entities[entity.id] = entity
	return entity
end
function core.entity.remove(entity)
	if game.systems.subcomponent_reg and game.systems.subcomponent_reg.components[entity.id] ~= nil then
		print("RM")
		for k,v in pairs(game.systems.subcomponent_reg.components[entity.id] ) do
			core.entity.remove(v)
		end
	end
	game.entities[entity.id] = nil
	for k,v in pairs(entity.systems) do
		v.targets[entity.id] = nil
		if v.unregister then
			v.unregister(entity)
		end
	end
end
