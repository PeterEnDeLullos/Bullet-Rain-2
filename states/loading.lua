local loading = {}
loading.loaded = 1
-- Loading screen phases, split up loading code among these phases
loading.phases = {
    core.reset_game,
    function()
        

        -- add required systems
        core.system.add( require 'systems.basicphysics.velocity_from_acceleration', {"update"})
        core.system.add( require 'systems.basicphysics.position_from_velocity',  {"update"})
        core.system.add( require 'systems.basicphysics.acceleration_from_mass',  {"update"})
        core.system.add( require 'systems.basicphysics.draw_from_mass_and_position',  {"draw"})
        core.system.add( require 'systems.player_input.basic_move', {"update"})
        core.system.add( require 'systems.draw_functions.draw_square',  {"draw"})
        core.system.add( require 'systems.light_system'(),  {"update","draw"})
        core.system.add( require 'systems.scroll',  {"update"})
        core.system.add( require 'systems.image_loader',  {"load"})

        --core.system.add( require 'systems.entity_remain_within_camera',  {"update"})
        core.system.add( require 'systems.draw_direction_debug',  {"draw"})
        core.system.add( require 'systems.aim_class',  {"update"})

        -- require component types
    end, 
    function()
        require 'components.simple_image'
        -- require entity types
        require 'entities.agent'
        require 'entities.planet'
        require 'entities.player'
        require 'entities.aim_enemy'

        entity = core.entity.add(get_new_player(300,5300))


        entity = core.entity.add(get_new_aim_enemy(300,5300))
        -- add entities
        entity = core.entity.add(get_new_planet(300,5300,10))
        entity.color={red=255,green=255,blue=255}
        entity.velocity.y = 45
        --entity.mass.counts_as_infinite=true
        entity = core.entity.add(get_new_planet(200,5300,10))
        entity.velocity.y = 55
        core.gamera = require 'lib.gamera'
        print(#game.entities)
        game.cam = core.gamera.new(-5,0,1205,10000)
        game.cam:setPosition(1,5000)
        entity = core.entity.add(get_new_planet(600,5300,20))
        entity.velocity.y = -50     

end,
    function()
        for k,v in core.system.orderedPairs(game.system_categories.load) do
            v.load(dt)
        end

    end
}

function loading:enter(from)
    print("STARTING LOADING")
end
-- Leave loading screen
function loading:leave(from)

       for k,v in pairs(game.systems) do
        print("Running system "..v.name)
    end
    print("FINISHED LOADING")
    to_load = false
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


