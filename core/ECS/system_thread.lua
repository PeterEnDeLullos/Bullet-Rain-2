local channel = love.thread.getChannel( "1" )
local game = channel:demand()
game.entities[4].position.x=1000000000
while(true) do

end