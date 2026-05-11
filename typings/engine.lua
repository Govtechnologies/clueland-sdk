---@meta

---@class Vec3
---@field x number
---@field y number
---@field z number

---@class Player
---@field name string
local Player = {}

---Returns the player's current health.
---@return number
function Player:get_health() end

---Sets the player's health.
---@param health number
function Player:set_health(health) end

---Returns the player's position.
---@return Vec3
function Player:get_position() end

---@class Engine
local Engine = {}

---Registers a new block type in the engine.
---@param properties table The block properties (name, model, textures, etc.)
function Engine.register_block(properties) end

---Logs a message to the engine console.
---@param message string
function Engine.log(message) end

---@class World
local World = {}

---Sets a block at the specified position.
---@param x number
---@param y number
---@param z number
---@param block_name string
function World.set_block(x, y, z, block_name) end

---Returns the name of the block at the specified position.
---@param x number
---@param y number
---@param z number
---@return string
function World.get_block(x, y, z) end

---@class Events
local Events = {}

---Subscribes to an engine event.
---@param event_name "on_block_break" | "on_block_place" | "on_player_join"
---@param callback function
function Events.on(event_name, callback) end

-- Global instances available in the modding environment
---@type Player
player = {}
---@type Engine
engine = {}
---@type World
world = {}
---@type Events
events = {}
