return function ()
	require 'entities.background_layer'

	core.entity.add(game.entity_definitions.zone("levels.zones.zone_1"))
	core.entity.add(game.entity_definitions.zone("levels.zones.zone_2"))
	core.entity.add(game.entity_definitions.zone("levels.zones.zone_3"))
	core.entity.add(game.entity_definitions.zone("levels.zones.zone_4"))

	core.entity.add(game.entity_definitions.background_layer(nil, -500,-1000,"/assets/background/layer1.png",0.49/2,-4))
	core.entity.add(game.entity_definitions.background_layer(nil, -500,-1000,"/assets/background/layer23.png",0.3/2,-5))



end