---@class Player
player = player or {}

---Returns the player's current health.
---@return number
function player.get_health()
    return native.player.get_health()
end

---Sets the player's health.
---@param health number
function player.set_health(health)
    native.player.set_health(health)
end

---Returns the player's current velocity.
---@return vec3
function player.get_velocity()
    return native.player.get_velocity()
end

---Sets the player's velocity.
---@param velocity vec3
function player.set_velocity(velocity)
    native.player.set_velocity(velocity)
end

---Gives items to the player.
---@param item_id number
---@param amount number
---@return boolean success Returns true if all items were added.
function player.give_item(item_id, amount)
    return native.player.give_item(item_id, amount)
end
