require 'entities.background_layer'
require 'entities.guns.forward_gun'

core.entity.add(get_new_zone("levels.zones.zone_1"))
core.entity.add(get_new_zone("levels.zones.zone_2"))
core.entity.add(get_new_zone("levels.zones.zone_3"))
core.entity.add(get_new_zone("levels.zones.zone_4"))

core.entity.add(get_background_layer(nil, -500,-1000,"/assets/background/layer1.png",0.49/2,-4))
core.entity.add(get_background_layer(nil, -500,-1000,"/assets/background/layer23.png",0.3/2,-5))

core.entity.add(get_forward_gun(nil, 100,100,nil,1,1,nil,"enemy"))