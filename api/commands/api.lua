---@class Commands
commands = commands or {}

---Executes a console command.
---@param command_string string
---@return boolean success
function commands.execute(command_string)
    return native.commands.execute(command_string)
end

---Places a block at the specified position.
---@param x number
---@param y number
---@param z number
---@param block_id number
function commands.place_block(x, y, z, block_id)
    native.commands.place_block(x, y, z, block_id)
end

---Spawns an entity.
---@param name string
---@param pos vec3
function commands.spawn_entity(name, pos)
    native.commands.spawn_entity(name, pos)
end

---Registers a new console command.
---@param name string
---@param handler fun(args: string[])
function commands.register(name, handler)
    native.commands.register(name, handler)
end
