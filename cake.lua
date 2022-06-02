Move1 = "Meteor Crash"
Move2 = "Wolf Fang Fist"
Move3 = "TS Molotov"
Move4 = "Anger Rush"
Move5 = "Deadly Dance"
Move6 = "Strong Kick"
Move7 = "Sweep Kick"

Settings = {
    Earth = false, -- determines if you go to earth to queue or queue world
    AntiLeach = false, -- rejoins you if somebody is in your broly
    AutoPunch = false, -- auto punches broly if you run out of ki
    DoubleFreeze = false, -- freezes your double exp, you can transform if this is on
    TeamDamage = false, -- you can kill other auto broliers if they grab broly
    CarryMode = false, -- makes you non invis, and you are only on the first pad
    BrolyCamera = false, -- Makes your camera track broly, kinda buggy
    LateTransform = false, -- for androids, transforms when ki is at 70%
    Promotepls = true, -- just promotes my discord
    forms = true, -- turn this on for forms, turn off for androids
    RejoinTime = 140, -- rejoins in broly if this time is exceeded
    GrabChecker = 80, -- time it takes for broly to be last form, rejoins you if hes not by then
    FirstForm = 80, -- the time it takes for brolies Super Saiyan form, this helps a little bit if you are grabbed
    AnimateFreeze = true, -- Breaks your animator but youre still allowed to attack
    invis = false, -- Determines whether your invisible or not, a good alternitive to carry mode so you dont get queued with a lot of people
    waittime = .8, -- the time it waits after it loads
    
        OutputChange = false, -- changes output when low ki
        Amount = 100 -- the amount will be left doesnt go lower than 5, in intervals of 5 aswell 100, 95, 90, 85, ect...
}

repeat
    wait()
until game:IsLoaded()
repeat
    wait()
until game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
game.Players.LocalPlayer.Character:WaitForChild("PowerOutput")
wait(Settings.waittime)

-- [[ Variables ]]

local Rootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
local Client = game.Players.LocalPlayer
local Ids = {
    536102540, -- Earth
    3565304751, -- Que
    2050207304 -- Broly
}

if game.PlaceId == Ids[1] then
    game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
end

local Credits =
    coroutine.create(
    function()
        if Settings.Promotepls == true then
            while wait(8) do
                local A_1 = "ddy bread"
                local A_2 = "All"
                local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                Event:FireServer(A_1, A_2)
            end
        end
    end
)

coroutine.resume(Credits)

--[[ Death Checker ]]
local DeathChecker =
    coroutine.create(
    function()
        game:GetService("RunService").RenderStepped:Connect(
            function()
                if game:GetService("Workspace").Live[Client.name].Humanoid.Health < .1 or game:GetService("Workspace").Live.juan100m1.Humanoid.Health < .1 then
                    game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                end
            end
        )
    end
)
coroutine.resume(DeathChecker)

--[[ Variables ]]
Character = Client.Character or Client.CharacterAdded:Wait()
Workspace = game:GetService("Workspace")

--[[ Earth Sequence ]]
--[[Queue Sequence]]

coroutine.resume(coroutine.create(function()
        for i, v in pairs(game.Workspace:GetDescendants()) do
            while wait() do
                v.CanCollide = false
            end
        end
    end
    )
)
if game.PlaceId == Ids[2] then
        while wait() do
        wait()
        game:GetService("Workspace").Live[Client.name].PowerOutput:Destroy()
        wait(.1)
        local Rootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
        while wait() do
                Rootpart.CFrame =
                CFrame.new(game.Workspace.Live.juan100m1.HumanoidRootPart.Position
            ) * CFrame.new(0, -1 , -2)
        end
        wait(30)
        game:GetService("TeleportService"):Teleport(Ids[1], LocalPlayer)
        end
    end

if game.PlaceId == Ids[1] then
    game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
end

--[[ Broly Sequence ]]
if game.PlaceId == Ids[3] then
    if Settings.AntiLeach == true then
        if #game.Players:GetChildren() > 1 then
            game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
        elseif Settings.AntiLeach == false then
            print("AntiLeach is false")
        end
    end

    if Settings.forms == true then
        wait(.2)
        Client.Backpack.ServerTraits.Input:FireServer({"x"}, CFrame.new())
        wait(3.6)
        Client.Backpack.ServerTraits.Transform:FireServer("h")
        wait(1)
        Client.Backpack.ServerTraits.Input:FireServer({"xoff"}, CFrame.new())
    end

    local track =
        coroutine.create(
        function()
            Target = "broly br"
            for i, w in pairs(game.Workspace.Live:GetChildren()) do
                if string.match(string.lower(w.Name), string.lower(Target)) then
                    _G.Track = true
                    while _G.Track and game:GetService("RunService").Heartbeat:wait() do
                        w:WaitForChild("HumanoidRootPart")
                        for i, v in pairs(game.Workspace:GetChildren()) do
                            if v:FindFirstChild("Ki") and v:FindFirstChild("Mesh") then
                                v.CFrame = w.HumanoidRootPart.CFrame
                            end
                        end
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v:FindFirstChild("Ki") and v:FindFirstChild("Mesh") then
                                v.CFrame = w.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            end
        end
    )

    coroutine.resume(track)

    local CameraFollow =
        coroutine.create(
        function()
            if Settings.BrolyCamera == true then
                game:GetService("RunService").Stepped:Connect(
                    function()
                        game.Workspace.CurrentCamera.CFrame =
                            CFrame.new(
                            Client.Character.HumanoidRootPart.Position,
                            game:GetService("Workspace").Live["Broly BR"].HumanoidRootPart.Position
                        ) * CFrame.new(0, 2, 20)
                    end
                )
                if Settings.BrolyCamera == false then
                    print("Broly Camera is false")
                end
            end
        end
    )
    coroutine.resume(CameraFollow)

    local GoGod =
        coroutine.create(
        function()
            local God = true
            while God == true do
                wait()
                if
                    game.Workspace.Live[Client.Name].Humanoid.Health <= Client.Character.Humanoid.MaxHealth * .2 and
                        game.Workspace.Live[Client.Name].Ki.Value <= Workspace.Live[Client.Name].Ki.MaxValue * .2
                 then
                    Client.Backpack.ServerTraits.Transform:FireServer("g")
                    wait()
                    Client.Backpack.ServerTraits.Transform:FireServer("h")
                    wait()
                    Client.Backpack.ServerTraits.Transform:FireServer("g")
                end
            end
        end
    )

    coroutine.resume(GoGod)

    local brolyhealthDisplay =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:connect(
                function()
                    game:GetService("Players")[Client.name].PlayerGui.HUD.Bottom.SP.Visible = true
                    Client.PlayerGui.HUD.Bottom.SP.Text = "Cake Broly | Level : " .. Client.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text .. " | Time : " .. math.floor(Workspace.DistributedGameTime) .. " / " .. Settings.RejoinTime .. " | Broly Health : " .. math.floor(Workspace.Live["Broly BR"].Humanoid.Health)
		    Client.PlayerGui.HUD.Bottom.SP.BackgroundColor3 = Color3.new(0, 0, 0)
                end
            )
        end
    )
    coroutine.resume(brolyhealthDisplay)

    local frameLoop = -- [[ always make a variable so you can insert it in the resume() --]]
        coroutine.create(
        function()
            -- Always wrap a function so the wrap has something to run
            game:GetService("RunService").RenderStepped:connect(
                function()
                    Rootpart.CFrame =
                    CFrame.new(game.Workspace.Live.juan100m1.HumanoidRootPart.Position
                    ) * CFrame.new(0, 0 , 0)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    game:GetService("Workspace").Camera.FieldOfView = 120
                end
            )
        end
    )
    coroutine.resume(frameLoop)

    local AutoHit =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    if Settings.AutoPunch == true and game.Workspace.Live[Client.name].Ki.Value < 36 then
                        Client.Backpack.ServerTraits.Input:FireServer({"m2"}, CFrame.new())
                    end
                end
            )
        end
    )
    local LateTransform =
        coroutine.create(
        function()
            if Settings.LateTransform == true then
                repeat
                    wait()
                until Workspace.Live[Client.name].Ki.Value <= Workspace.Live[Client.name].Ki.MaxValue * .7
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
                wait(.2)
                Client.Backpack.ServerTraits.Transform:FireServer("h")
            elseif LateTrasform == false then
                Client.Backpack.ServerTraits.Transform:FireServer("h")
            end
        end
    )

    coroutine.resume(LateTransform)

    if Settings.AutoPunch == false then
        print("AutoPunch is false")
    end

    if Settings.DoubleFreeze == true then
        game:GetService("Workspace").Live[Client.name]:FindFirstChild("True"):Destroy()
    elseif Settings.DoubleFreeze == false then
        print("DoubleFreeze is false")
    end
    if Settings.TeamDamage == true then
        game:GetService("Workspace").Live[Client.name]:FindFirstChild("team damage"):Destroy()
    elseif Settings.TeamDamage == false then
        print("TeamDamage is false")
    end

    coroutine.resume(AutoHit)
    local RejoinTime =
        coroutine.create(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    if game:GetService("Workspace").DistributedGameTime >= Settings.RejoinTime then
                        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                    end
                end
            )
        end
    )
    coroutine.resume(RejoinTime)

    local runService = game:GetService("RunService")
    local debuffs = {
        "Look",
        "xx",
        "Action",
        "SuperAction",
        "Attacking",
        "Using",
        "heavy",
        "hyper",
        "Hyper",
        "Tele",
        "tele",
        "Slow",
        "Killed",
        "KiBlasted",
        "MoveStart",
        "Hyper",
        "Dodging",
        "KiBlasting",
        "BStun",
        "creator",
        "KnockBacked",
        "NotHardBack"
    }

    local function onCharacterAdded(character)
        if (not character) then
            return
        end

        character.ChildAdded:Connect(
            function(child)
                runService.RenderStepped:Wait()
                if (table.find(debuffs, child.Name)) then
                    child:Destroy()
                end
            end
        )
    end

    onCharacterAdded(Client.Character)
    Client.CharacterAdded:Connect(onCharacterAdded)

    if (Client.Character) then
        for i, v in next, Client.Character:GetChildren() do
            if (table.find(debuffs, v.Name)) then
                runService.RenderStepped:Wait()
                v:Destroy()
            end
        end
    end
    local ExplosiveWaveEZ =
        coroutine.create(
        function()
            game:GetService("RunService").Stepped:Connect(
                function()
                    local Detection = {"ExplosiveWave"}

                    for i, v in pairs(game.Workspace:GetChildren()) do
                        if table.find(Detection, v.Name) then
                            wait()
                            Client.Character:FindFirstChild("Humanoid"):EquipTool(Client.Backpack["Flash Strike"])
                            Client.Character["Flash Strike"]:Activate()
                            Client.Character["Flash Strike"]:Deactivate()
                            wait(.2)
                            if Client.Character["Flash Strike"] then
                                Client.Character["Flash Strike"].Parent = Client.Backpack
                            end
                        end
                    end
                end
            )
        end
    )

    coroutine.resume(ExplosiveWaveEZ)

    if Settings.AnimateFreeze == true then
        game.Players.LocalPlayer.Character.Humanoid.Animator.Parent = game.Workspace.Live["Broly BR"].Humanoid
        wait(.2)
        game.Workspace.Live["Broly BR"].Humanoid.Animator:Destroy()
        wait(.1)
        game.Workspace.Live["Broly BR"].Humanoid.Animator:Destroy()
    elseif Settings.AnimateFreeze == false then
        print("Animation is Running")
    end

-- [[ Output Change ]]

    coroutine.resume(
        coroutine.create(
            function()
                while Settings.OutputChange == true do
		     if Client.Character.LowerTorso:FindFirstChild('Ui3') and Client.PlayerGui.HUD.Bottom.SideMenu.Output.Perc.Text ~= "100%" then
                     print("increasing")
                     Client.Backpack.ServerTraits.Input:FireServer({"increase"}, true)
                  end
                  wait(.2)
                  if Client.Character.Ki.Value <= Client.Character.Ki.MaxValue * .09 then
                       if Client.PlayerGui.HUD.Bottom.SideMenu.Output.Perc.Text ~= Settings.Amount .. "%" then
                            Client.Backpack.ServerTraits.Input:FireServer({"decrease"}, true)
                            print("Decreasing")
                         end
                  end
             end
end))
    
    coroutine.resume(coroutine.create(function()
        for i, v in pairs(game.Workspace:GetDescendants()) do
            while wait() do
                v.CanCollide = false
            end
        end
    end
    )
)

    while true do
        for i, v in pairs(Client.Backpack:GetChildren()) do
            if
                v.Name == Move1 or v.Name == Move2 or v.Name == Move3 or v.Name == Move4 or v.Name == Move5 or
                    v.Name == Move6 or
                    v.Name == Move7 or
                    v.Name == Move8 or
                    v.Name == Move9 or
                    v.Name == Move0
             then
                v.Parent = Client.Character
                v:Activate()
                v:Deactivate()
                wait(.2)
                v.Parent = Client.Backpack
                Client.Backpack.ServerTraits.EatSenzu:FireServer(
                    "snake sucks dick nigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger niggernigger nigger nigger"
                )
                if game.Workspace.Live["Broly BR"].Humanoid.Health < .1 then
                    if Settings.Earth == true then
                        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                    elseif Settings.Earth == false then
                        game:GetService("TeleportService"):Teleport(Ids[2], LocalPlayer)
                    end
                end
            end
        end
    end
end
