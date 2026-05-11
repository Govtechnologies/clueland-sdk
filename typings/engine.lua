---@meta

---@class vec3
---@field x number
---@field y number
---@field z number
---@operator add(vec3): vec3
---@operator sub(vec3): vec3
---@operator mul(number): vec3

---@class BlockHandle
---@field id number
---@field stateId number

---@class HitResult
---@field hit boolean
---@field pos vec3
---@field normal vec3
---@field hit_pos vec3
---@field distance number

---@class BlockDefinition
---@field id string The unique name of the block (e.g. "my_mod:ruby_ore")
---@field opaque? boolean Defaults to true.
---@field hardness? number Defaults to 1.0.
---@field tinted? boolean Defaults to false.
---@field texture? string Shortcut to set all faces to one texture.
---@field textures? table<string, string> Map of face names to texture names.
---@field on_tick? fun(x: number, y: number, z: number)
---@field on_use? fun(x: number, y: number, z: number): boolean
---@field on_random_tick? fun(x: number, y: number, z: number)

---@class Engine
local engine = {}

---Logs a message to the engine console.
---@param message string
function engine.print(message) end

---Plays a sound group at a position.
---@param group string
---@param pos vec3
---@param volume number
function engine.play_sound(group, pos, volume) end

---Spawns a particle effect at a position.
---@param type string
---@param pos vec3
function engine.spawn_particle(type, pos) end

---Schedules a callback to be run after a delay.
---@param delay_seconds number
---@param callback function
function engine.schedule(delay_seconds, callback) end

---Returns the display name of a block by its numeric ID.
---@param id number
---@return string
function engine.get_block_name(id) end

---Returns the numeric ID of a block by its name.
---@param name string
---@return number
function engine.get_block_id(name) end

---Registers a new block type.
---@param definition BlockDefinition
function engine.register_block(definition) end

---@class World
local world = {}

---Returns the block at the specified position.
---@param x number
---@param y number
---@param z number
---@return BlockHandle
function world.get_block(x, y, z) end

---Returns the player's current position.
---@return vec3
function world.get_player_pos() end

---Performs a raycast in the world.
---@param origin vec3
---@param direction vec3
---@param distance number
---@return HitResult
function world.raycast(origin, direction, distance) end

---Schedules a block tick update.
---@param x number
---@param y number
---@param z number
---@param delay_ticks number
function world.schedule_tick(x, y, z, delay_ticks) end

---Returns the current world time in ticks.
---@return number
function world.get_time() end

---@class Commands
local commands = {}

---Executes a console command.
---@param command_string string
---@return boolean success
function commands.execute(command_string) end

---Places a block at the specified position.
---@param x number
---@param y number
---@param z number
---@param block_id number
function commands.place_block(x, y, z, block_id) end

---Spawns an entity.
---@param name string
---@param pos vec3
function commands.spawn_entity(name, pos) end

---Registers a new console command.
---@param name string
---@param handler fun(args: string[])
function commands.register(name, handler) end

---@class Events
local events = {}

---Subscribes to an engine event.
---@param event_name "tick" | "block_break" | "block_place"
---@param callback function
function events.on(event_name, callback) end

---@class Player
local player = {}

---Returns the player's current health.
---@return number
function player.get_health() end

---Sets the player's health.
---@param health number
function player.set_health(health) end

---Returns the player's current velocity.
---@return vec3
function player.get_velocity() end

---Sets the player's velocity.
---@param velocity vec3
function player.set_velocity(velocity) end

---Gives items to the player.
---@param item_id number
---@param amount number
---@return boolean success Returns true if all items were added.
function player.give_item(item_id, amount) end

---@class UI
local ui = {}

---Pushes a new screen onto the UI stack.
---@param name string
function ui.push_screen(name) end

---Pops the top screen from the UI stack.
function ui.pop_screen() end

---Returns whether any menu screen is currently open.
---@return boolean
function ui.is_menu_open() end

---Registers a callback for a UI event (e.g. button click).
---@param event_name string
---@param handler function
function ui.on_callback(event_name, handler) end

-- Global Instances
---@type Engine
engine = {}
---@type World
world = {}
---@type Commands
commands = {}
---@type Events
events = {}
---@type Player
player = {}
---@type UI
ui = {}
