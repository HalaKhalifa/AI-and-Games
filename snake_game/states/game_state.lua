local SnakeGame = require("snake_game")
local GameState = {}
local game

function GameState:update(dt)
    game:update(dt)
end

function GameState:draw()
    game:draw()
end

function GameState:changeDirection(dx, dy)
    game:changeDirection(dx, dy)
end

function GameState:load()
    game = SnakeGame:new()
end

function GameState:isGameOver()
    return game.gameOver
end

function GameState:reset()
    game = SnakeGame:new()
end

GameState:load()
return GameState
