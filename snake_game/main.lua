local GameState = require("gamestate")
local gameState = GameState:new()

function love.update(dt)
    gameState:update(dt)
end

function love.draw()
    gameState:draw()
end

function love.keypressed(key)
    if gameState.current == "menu" and key == "return" then
        gameState:switch("playing")

    elseif gameState.current == "playing" then
        local game = gameState.states.playing

        if game:isGameOver() then
            -- Switch to menu AND reset the game for next time
            gameState.states.playing:reset()
            gameState:switch("menu")

        else
            if key == "up" then game:changeDirection(0, -1)
            elseif key == "down" then game:changeDirection(0, 1)
            elseif key == "left" then game:changeDirection(-1, 0)
            elseif key == "right" then game:changeDirection(1, 0) end
        end
    end
end

