---@class Engine
engine = engine or {}

---Logs a message to the engine console.
---@param message string
function engine.print(message)
    native.engine.print(message)
end

---Alias for engine.print
engine.log = engine.print

---Plays a sound group at a position.
---@param group string
---@param pos vec3
---@param volume number
function engine.play_sound(group, pos, volume)
    native.engine.play_sound(group, pos, volume)
end

---Spawns a particle effect at a position.
---@param type string
---@param pos vec3
function engine.spawn_particle(type, pos)
    native.engine.spawn_particle(type, pos)
end

---Schedules a callback to be run after a delay.
---@param delay_seconds number
---@param callback function
function engine.schedule(delay_seconds, callback)
    native.engine.schedule(delay_seconds, callback)
end

---Returns the display name of a block by its numeric ID.
---@param id number
---@return string
function engine.get_block_name(id)
    return native.engine.get_block_name(id)
end

---Returns the numeric ID of a block by its name.
---@param name string
---@return number
function engine.get_block_id(name)
    return native.engine.get_block_id(name)
end

---Registers a new block type.
---@param definition BlockDefinition
function engine.register_block(definition)
    native.engine.register_block(definition)
end

---Returns the engine version.
---@return string
function engine.get_version()
    return native.engine.version
end
