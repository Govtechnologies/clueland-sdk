---@class Events
events = events or {}

---Subscribes to an engine event.
---@param event_name "tick" | "block_break" | "block_place"
---@param callback function
function events.on(event_name, callback)
    native.events.on(event_name, callback)
end
