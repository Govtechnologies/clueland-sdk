-- Basic Mod Template Initialization
engine.log("Basic Mod Template Loaded!")

events.on("on_player_join", function()
    engine.log("Welcome to the world!")
end)

events.on("on_block_break", function(x, y, z, block_name)
    engine.log("Player broke " .. block_name .. " at " .. x .. ", " .. y .. ", " .. z)
end)



