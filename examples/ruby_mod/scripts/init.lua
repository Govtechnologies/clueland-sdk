-- Ruby Mod Initialization
engine.log("Ruby Mod Initializing...")

-- Register the block (this would be handled by the engine's data-driven loader, 
-- but we can also do it via script for dynamic behavior)
engine.register_block({
    name = "ruby_mod:ruby_block",
    opaque = true,
    textures = { all = "ruby_mod:ruby_block" }
})

events.on("block_break", function(data)
    local block_name = engine.get_block_name(data.block_id)
    if block_name == "ruby_mod:ruby_ore" then
        engine.log("A rare ruby was discovered at " .. data.x .. ", " .. data.y .. ", " .. data.z)
        -- In a real mod, we might drop an item here
    end
end)

