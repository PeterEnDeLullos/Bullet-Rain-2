game = {}
GS = require "lib.hump.gamestate"
global = {}
global.g = 2
require 'core.main'
core.states = require 'states.main'

models = {}
require"lib.Tserial"




function love.load()
love.graphics.setDefaultFilter("nearest", "nearest", 1)

    GS.registerEvents()

    
    GS.switch(core.states.menu)
end

-- This one will only be used for debugging purposes, love.keyDown is used in most other cases
function love.keypressed(key)
    core.gamepad = nil
    if GS.current() ~= core.states.menu  and key == CONTROLS.PAUSE then
    	if  GS.current() ~= core.states.pause then
        	GS.push(core.states.pause)
        else
        	GS.pop()
        end

    end
    if key == "o" then
                for k,v in pairs(game.entities) do
            v.systems = nil
        end
        local t =Tserial.pack(game.entities)
        print(t)

        core.reset_game()

        -- add required systems
        core.system.add( require 'systems.velocity_from_acceleration', "update")
        core.system.add( require 'systems.position_from_velocity', "update")
        core.system.add( require 'systems.acceleration_from_mass', "update")
        core.system.add( require 'systems.draw_from_mass_and_position', "draw")
        core.system.add( require 'systems.player_input.basic_move', "update")
        core.system.add( require 'systems.draw_functions.draw_square', "draw")
        core.system.add( require 'systems.light_system'(), "both")

        -- require entity types
        require 'entities.agent'
        require 'entities.planet'
        collectgarbage("collect")
        -- add entities
        local u = Tserial.unpack(t)
        print(u)
        for k,v in pairs(u) do
            core.entity.add(v)
        end

    end
  

end

function love.threaderror(t, e)
    return error(e)
end