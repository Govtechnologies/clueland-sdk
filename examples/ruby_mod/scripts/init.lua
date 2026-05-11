-- Ruby Mod Initialization
engine.log("Ruby Mod Initializing...")

-- Register the block (this would be handled by the engine's data-driven loader, 
-- but we can also do it via script for dynamic behavior)
engine.register_block({
    name = "ruby_mod:ruby_block",
    opaque = true,
    textures = { all = "ruby_mod:ruby_block" }
})

events.on("on_block_break", function(x, y, z, block_name)
    if block_name == "ruby_mod:ruby_ore" then
        engine.log("A rare ruby was discovered at " .. x .. ", " .. y .. ", " .. z)
        -- In a real mod, we might drop an item here
    end
end)
