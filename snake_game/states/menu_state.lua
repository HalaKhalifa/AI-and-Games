local MenuState = {}

function MenuState:update(dt)

end

function MenuState:draw()
    love.graphics.print("Press Enter to Start", 200, 200)
end

return MenuState
