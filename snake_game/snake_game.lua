local SnakeGame = {}
SnakeGame.__index = SnakeGame

local Vector2 = require("vector2")
local Events = require("events")
local HighScore = require("highscore")

function SnakeGame:new()
    local game = {
        snake = { Vector2:new(10, 10) },
        direction = Vector2:new(1, 0),
        food = Vector2:new(15, 15),
        score = 0,
        highScore = HighScore:load(),
        gameOver = false,
        gameOverReason = "",
        gridSize = 20,
        moveTimer = 0,
        moveInterval = 0.2
    }
    return setmetatable(game, SnakeGame)
end

function SnakeGame:changeDirection(dx, dy)
    self.direction = Vector2:new(dx, dy)
end

function SnakeGame:update(dt)
    if self.gameOver then return end

    self.moveTimer = self.moveTimer + dt
    if self.moveTimer >= self.moveInterval then
        self.moveTimer = 0

        -- Move the snake
        local head = self.snake[1]
        local newHead = head + self.direction

        -- Check self collision
        for _, segment in ipairs(self.snake) do
            if newHead == segment then
                self.gameOver = true
                self.gameOverReason = "You ate yourself '__'"
                if self.score > self.highScore then
                    HighScore:save(self.score)
                    self.highScore = self.score
                end                
                return
            end
        end

        -- Check wall collision
        if newHead.x < 0 or newHead.y < 0 or newHead.x >= 40 or newHead.y >= 30 then
            self.gameOver = true
            self.gameOverReason = "You hit the wall '( "
            if self.score > self.highScore then
                HighScore:save(self.score)
                self.highScore = self.score
            end            
            return
        end

        table.insert(self.snake, 1, newHead)

        -- Eat food
        if newHead == self.food then
            self.score = self.score + 1
            Events:emit("food_eaten", {score = self.score})
            self.food = Vector2:new(math.random(0, 29), math.random(0, 19))
        else
            table.remove(self.snake)
        end
    end
end

function SnakeGame:draw()
    -- Draw border
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", 0, 0, self.gridSize * 40, self.gridSize * 30)

    love.graphics.setColor(0, 1, 0)
    for _, segment in ipairs(self.snake) do
        love.graphics.rectangle("fill", segment.x * self.gridSize, segment.y * self.gridSize, self.gridSize, self.gridSize)
    end

    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.food.x * self.gridSize, self.food.y * self.gridSize, self.gridSize, self.gridSize)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: " .. self.score, 10, 10)
    if self.gameOver then
        love.graphics.print("Game Over! " .. self.gameOverReason, 200, 230)
        love.graphics.print("High Score: " .. self.highScore, 10, 30)
        love.graphics.print("Press Enter to play again", 200, 250)
    end
end

return SnakeGame
