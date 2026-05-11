---@class World
world = world or {}

---Returns the block at the specified position.
---@param x number
---@param y number
---@param z number
---@return BlockHandle
function world.get_block(x, y, z)
    return native.world.get_block(x, y, z)
end

---Returns the player's current position.
---@return vec3
function world.get_player_pos()
    return native.world.get_player_pos()
end

---Returns the current world time in ticks.
---@return number
function world.get_time()
    return native.world.get_time()
end

---Performs a raycast in the world.
---@param origin vec3
---@param direction vec3
---@param distance number
---@return HitResult
function world.raycast(origin, direction, distance)
    return native.world.raycast(origin, direction, distance)
end

---Schedules a block tick update.
---@param x number
---@param y number
---@param z number
---@param delay_ticks number
function world.schedule_tick(x, y, z, delay_ticks)
    native.world.schedule_tick(x, y, z, delay_ticks)
end
