# Snake Game Using Lua.

## Overview
A classic Snake game implemented in Lua 5.4 using the LOVE2D framework. The game uses modern Lua design patterns including a Game State Manager, Entity Component System, Input Handling, and Vector2 math utilities. It also supports high score saving and loading.

## Features
- Smooth and responsive controls  
- Multiple game states: Menu, Playing, Game Over  
- High score management  
- Organized modular code for easy understanding and extension

## Installation & Setup
1. Install [LOVE2D](https://love2d.org/) (version 11.3 or later recommended).  
2. Clone this repository:  
   ```bash
   git clone https://github.com/HalaKhalifa/AI-and-Games.git
   cd AI-and-Games/snake_game
   ```  
3. Run the game:  
   ```bash
   love .
   ```

## Controls
- Arrow keys or WASD: Move the snake  
- Enter/Return: Start or restart the game  

## Project Structure
```
snake_game/
├── main.lua            # Entry point
├── gamestate.lua       # Game State Manager
├── entity.lua          # Entity Component System
├── vector2.lua         # Vector2 math utility
├── highscore.lua       # High score save/load system
├── input.lua           # Input handling
├── events.lua          # Event system
├── states/
│   ├── menu_state.lua
│   └── playing_state.lua
└── snake_game.lua      # Core game logic
```

##  Citation:
For setting up LOVE2D and Lua environment:

- [LOVE2D](https://love2d.org/) official website
- Lua 5.4 documentation: https://www.lua.org/manual/5.4/