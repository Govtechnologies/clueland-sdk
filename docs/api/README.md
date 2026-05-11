# Clueland API Reference

This document outlines the global APIs available to Lua mods.

## Global Objects

### `engine`
The core engine interface.
- `engine.register_block(properties: table)`: Registers a new block type.
- `engine.log(message: string)`: Prints a message to the debug console.
- `engine.get_time(): number`: Returns the total engine run time in seconds.

### `world`
Access to voxel data and terrain.
- `world.set_block(x, y, z, name)`: Change a block at world coordinates.
- `world.get_block(x, y, z): string`: Query a block type at world coordinates.
- `world.is_air(x, y, z): boolean`: Quick check if a position is empty.

### `player`
Interaction with the local player.
- `player.get_position(): Vec3`: Current player position.
- `player.get_health(): number`: Current player health (0-20).
- `player.set_health(val)`: Set player health.
- `player.send_message(text)`: Display a message in the player's HUD.

### `events`
Event subscription system.
- `events.on(event_name: string, callback: function)`: Subscribe to an event.
  - `on_player_join`: Fired when player enters the world.
  - `on_block_break`: Fired when a block is destroyed.
  - `on_block_place`: Fired when a block is placed.

## Data Types

### `Vec3`
A table with `x`, `y`, and `z` numeric fields.
