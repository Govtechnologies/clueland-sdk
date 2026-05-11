---@class UI
ui = ui or {}

---Pushes a new screen onto the UI stack.
---@param name string
function ui.push_screen(name)
    native.ui.push_screen(name)
end

---Pops the top screen from the UI stack.
function ui.pop_screen()
    native.ui.pop_screen()
end

---Returns whether any menu screen is currently open.
---@return boolean
function ui.is_menu_open()
    return native.ui.is_menu_open()
end

---Registers a callback for a UI event (e.g. button click).
---@param event_name string
---@param handler function
function ui.on_callback(event_name, handler)
    native.ui.on_callback(event_name, handler)
end
