local minfps = 1000
local ctx = GS.new()
function ctx:enter(dt)
    GS.push(core.states.loading)
    love.mouse.setGrabbed(true)
end

function get_nil()
    return "nil" 

end
function ctx:update(dt)
    for k,v in core.system.orderedPairs(game.system_categories.update) do
        v.update(dt)

    end

end
function ctx:draw()

    love.graphics.push()
    if game.systems.scroll then
            love.graphics.translate(-game.systems.scroll.x, -game.systems.scroll.y)
        end
    
 
      for k,v in core.system.orderedPairs(game.system_categories.draw) do
        v.draw()
    end
    love.graphics.pop()
  for k,v in core.system.orderedPairs(game.system_categories.draw_ui) do
        v.draw_ui()
    end
    local fps = love.timer.getFPS( )
    if fps == 0 then
        fps = 1000
    end
    minfps = math.min(minfps, fps)
    love.graphics.print("Current FPS: "..tostring(fps).. "MIN".. minfps, 10, 10)
    if hitt then
        love.graphics.print(hitt,20,20)
    end

end

function ctx:leave()
    love.mouse.setGrabbed(false)
    print('leaving')
end
return ctx
