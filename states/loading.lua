local loading = {}
loading.loaded = 1
-- Loading screen phases, split up loading code among these phases
loading.phases = {
    core.reset_game,
    function()
        

        -- add required systems
        core.system.add( require 'systems.velocity_from_acceleration', {"update"})
        core.system.add( require 'systems.position_from_velocity',  {"update"})
        core.system.add( require 'systems.acceleration_from_mass',  {"update"})
        core.system.add( require 'systems.draw_from_mass_and_position',  {"draw"})
        core.system.add( require 'systems.player_input.basic_move', {"update"})
        core.system.add( require 'systems.draw_functions.draw_square',  {"draw"})
        core.system.add( require 'systems.light_system'(),  {"update","draw"})
        -- require component types
    end, 
    function()
        require 'components.simple_image'
        -- require entity types
        require 'entities.agent'
        require 'entities.planet'
        require 'entities.player'

        -- add entities
        entity = core.entity.add(get_new_planet(300,300,10))
        entity.color={red=255,green=255,blue=255}
        entity.velocity.y = 45
        --entity.mass.counts_as_infinite=true
        entity = core.entity.add(get_new_planet(200,300,10))
        entity.velocity.y = 55

        entity = core.entity.add(get_new_planet(600,300,20))
        entity.velocity.y = -50     
        entity = core.entity.add(get_new_player(300,300,10))

end,
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


