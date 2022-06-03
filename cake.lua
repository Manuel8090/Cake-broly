if game.PlaceId == 536102540 or 3565304751 then
    local tp = coroutine.create(function()
        while wait() do
            local Rootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
            Rootpart.CFrame = CFrame.new(game.Workspace.Live.terrellmoney13.HumanoidRootPart.Position)
        end
    end)
    coroutine.resume(tp)
    
    local tp1 = coroutine.create(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Manuel8090/auto-tp/main/auto%20tp", true))()
    end)
    coroutine.resume(tp1)   
elseif game.PlaceId == 2050207304 then
        local Broly = "Broly BR"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Manuel8090/host-for-tp-cframe/main/ddaddy%20bread", true))()
end
