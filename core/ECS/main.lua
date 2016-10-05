require 'core.ECS.system'
require 'core.ECS.entity'
require 'core.ECS.component'

function core.reset_game()
	if game then
		-- cleanup
		if game.systems then
        for k,v in pairs( game.systems ) do
            core.system.remove(v)
        end
        for k,v in pairs(game.entities) do
            core.entity.remove(v)
        end
    end
        game.entities={}
        game.systems={}
		print("RESETTING")
	end
	models = {}
	models.entity_types = {}
	models.component_types = {}
	models.system_types = {}

	game = {}
	game.entities= {}
	game.entity_definitions={}
	game.component_definitions={}

	game.systems = {}
	game.system_categories = {}
	game.thread_count = 0
	print("RESET")
end