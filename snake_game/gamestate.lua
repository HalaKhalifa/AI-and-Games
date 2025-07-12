local GameState = {}
GameState.__index = GameState

function GameState:new()
    local state = {
        current = "menu",
        states = {
            -- 3rd requirement: 'Use proper module structure' 
            menu = require("states.menu_state"),
            playing = require("states.game_state")
        }
    }
    return setmetatable(state, GameState)
end

-- 1st requirement: 'Switch between menu and playing states'
function GameState:switch(newState)
    if self.states[newState] then
        self.current = newState
    end
end

-- 2nd requirement: 'Each state has update() and draw() methods'
-- assumes both menu_state and game_state implement update() and draw(): 
function GameState:update(dt)
    self.states[self.current]:update(dt)
end

function GameState:draw()
    self.states[self.current]:draw()
end

return GameState
