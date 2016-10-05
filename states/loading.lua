local loading = {}
loading.loaded = 1
-- Loading screen phases, split up loading code among these phases
loading.loaded_paths = {}
local function my_require (str)
    loading.loaded_paths[str] = str
    return require (str)
end


local function load_component_definition(url)
    local a = game.component_definitions
    local b = game.component_definitions
    local last_word = ""
    local first = true
    print("HERE")
    for word in string.gmatch(url, '([^.]+)') do
        print(">"..word)
        if not first then
            b = a
            last_word = word
            if not a[word] then
                a[word] = {}
            end
            a = a[word]
        end
        first=false
    end
    b[last_word] =  my_require (url)
end
local function load_entity_definition(url)
    local a = game.entity_definitions
    local b = game.entity_definitions
    local last_word = ""
    local first = true
    print("HERE")
    for word in string.gmatch(url, '([^.]+)') do
        print(">"..word)
        if not first then
            b = a
            last_word = word
            if not a[word] then
                a[word] = {}
            end
            a = a[word]
        end
        first=false
    end
    b[last_word] =  my_require (url)
end
local function recursiveEnumerate(folder, fileTree, file_loader)
    local lfs = love.filesystem
    local filesTable = lfs.getDirectoryItems(folder)
    for i,v in ipairs(filesTable) do
        local file = folder.."/"..v
        if lfs.isFile(file) then
            fileTree = fileTree.."\n"..string.gsub(string.gsub(file,"/","."),".lua","")
            file_loader(string.gsub(string.gsub(file,"/","."),".lua",""))
        elseif lfs.isDirectory(file) then
            fileTree = recursiveEnumerate(file, fileTree, file_loader)
        end
    end
    return fileTree
end


loading.phases = {
    core.reset_game,
    function()

        
        
        
         for k,v in pairs (loading.loaded_paths) do
            package.loaded[v] = nil
            
         end

     collectgarbage("collect")

        loading.loaded_paths = {}
        core.system.add( my_require 'systems.collision.hypercollision',  {"update"})
        core.system.add( my_require 'systems.basic_movement.rotate', {"update"})
        core.system.add( my_require 'systems.basic_movement.move_there_and_back', {"update"})
        core.system.add( my_require 'systems.basic_movement.move_bezier', {"update"})
        core.system.add( my_require 'systems.basic_movement.reverse_bezier', {"update"})
        core.system.add( my_require 'systems.basic_movement.delete_on_bezier_end', {"update"})
                core.system.add( my_require 'systems.delayed_add_component', {"update"})

                core.system.add( my_require 'systems.spawn_queued_enemies', {"update"})
        core.system.add( my_require 'systems.map_loading.sti_loading', {"draw"})

        -- add my_required systems
        core.system.add( my_require 'systems.basicphysics.velocity_from_acceleration', {"update"})
        core.system.add( my_require 'systems.basicphysics.position_from_velocity',  {"update"})
        core.system.add( my_require 'systems.basicphysics.acceleration_from_mass',  {"update"})
        core.system.add( my_require 'systems.basicphysics.subcomponent',  {"update"})
        core.system.add( my_require 'systems.basicphysics.draw_from_mass_and_position',  {"draw"})
        core.system.add( my_require 'systems.player_input.basic_move', {"update"})
        core.system.add( my_require 'systems.draw_functions.draw_square',  {"draw"})
        core.system.add( my_require 'systems.draw_functions.draw_animated_image',  {"draw","update"})

        core.system.add( my_require 'systems.draw_functions.draw_polygon',  {"draw"})
        core.system.add( my_require 'systems.guns.forward',  {"update"})
        core.system.add( my_require 'systems.guns.split_forward',  {"update"})
        core.system.add( my_require 'systems.guns.forward_beam',  {"update"})

        core.system.add( my_require 'systems.guns.pulsar',  {"update"})

        core.system.add( my_require 'systems.destroy_after_timeout',  {"update"})
        core.system.add( my_require 'systems.destroy_outside_screen',  {"update"})

        core.system.add( my_require 'systems.light_system'(),  {"update","draw"})
        core.system.add( my_require 'systems.scroll',  {"update"})
                core.system.add( my_require 'systems.subcomponent_registry',{"update"})

        core.system.add( my_require 'systems.zone_loading_system',  {"update"})
        core.system.add( my_require 'systems.zone_unloading_system',  {"update"})
        core.system.add( my_require 'systems.image_loader',  {"update"})
        core.system.add( my_require 'systems.damage.damage',  {"update"})
        core.system.add( my_require 'systems.damage.on_death',  {"update"})
        core.system.add( my_require 'systems.draw_lives',  {"draw_ui"})
        core.system.add( my_require 'systems.damage.player_damage',  {"update"})
        core.system.add( my_require 'systems.damage.dummy',  {"update"})
        core.system.add( my_require 'systems.explosions.boem_on_death',  {"update"})
        
        core.system.add( my_require 'systems.draw_direction_debug',  {"draw"})
        core.system.add( my_require 'systems.aim_class',  {"update"})
        core.system.add( my_require 'systems.ship_components.shield', {"update"})
        core.system.add( my_require 'systems.ship_components.shieldgen', {"update"})
        core.system.add( my_require 'systems.bullet_movement.straight_line_bullet_bahavior', {"update"})
        next_id = function ()
    local id = 0
    return function()
        id = id+1
        return id
    end
end
next_id = next_id()
        game.resources = {}
        -- require component types
    end, 
    function()
        -- require entity types
        print(load_entity_definition)
        print(recursiveEnumerate("entities","entities", load_entity_definition))
        print(recursiveEnumerate("components","components", load_component_definition))

        
        print(">.>")

        local entity = core.entity.add(game.entity_definitions.player(700,300))
        
        my_require ('levels.level1')()
        
        local a = game.entity_definitions.ship_components.shieldgen(_,entity,3,10)


        core.entity.add(a)
        

        local aaaa= core.entity.add({sti_map={file="assets/collision/test.lua"}})

        core.entity.add(game.entity_definitions.guns.forward_beam(nil, -10,0,nil,0,0.4,game.entities[1],"player","left"))
        core.entity.add(game.entity_definitions.guns.forward_beam(nil, 10,0,nil,0,0.4,game.entities[1],"player","right"))
        core.entity.add(game.entity_definitions.guns.split_forward_gun(nil, 0,0,nil,0,10,game.entities[1],"player","center"))

end,
    function()
        if game.system_categories.load then
        for k,v in core.system.orderedPairs(game.system_categories.load) do
            --v.load(dt)
        end
    end

    end
}

function loading:enter(from)
    print("STARTING LOADING")
    loading.loaded=1
end
-- Leave loading screen
function loading:leave(from)

       for k,v in pairs(game.systems) do
        print("Running system "..v.name)
    end
    print("FINISHED LOADING")
end
function loading:update()
    if self.loaded <= #self.phases then
        self.phases[self.loaded]()
        self.loaded = self.loaded + 1
--        love.timer.sleep(0.01)

    else
        GS:pop()
    end

end
-- Draw loading screen
function loading:draw()
    
end
function loading:keypressed(key)

end
return loading


