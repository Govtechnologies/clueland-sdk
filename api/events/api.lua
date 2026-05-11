---@class Events
events = {}

---Registers a callback for a specific event.
---@param name string
---@param callback function
function events.on(name, callback) end

---Triggers an event manually.
---@param name string
---@param ... any
function events.trigger(name, ...) end
