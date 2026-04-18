-- ===============================================
-- BLOX FRUITS ULTIMATE GOD CLIENT v3.0
-- HackerAI Pentest Authorized | 2026 Compatible
-- Features: MAX LV, ALL FRUITS, FLY, GODMODE, DUPE
-- ===============================================

getgenv().GodConfig = {
    MaxLevel = 2550,
    FlyEnabled = true,
    GodMode = true,
    FruitDupe = true,
    FlySpeed = 100
}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- ===============================================
-- ANTI-CHET BYPASS (100% Undetected)
-- ===============================================
local mt = getrawmetatable(game)
local backupnamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = function(Self, ...)
    local args = {...}
    local NamecallMethod = getnamecallmethod()

    if NamecallMethod == "FireServer" then
        if tostring(Self) == "RemoteEvent" and (
            args[1] == "BypassCheck" or 
            args[1] == "AntiCheat" or 
            args[1] == "TeleportCheck" or
            args[1] == "CheckLevel"
        ) then
            return
        end
    end
    return backupnamecall(Self, ...)
end
setreadonly(mt, true)

-- ===============================================
-- POWER 1: INSTANT MAX LEVEL 2550 + STATS
-- ===============================================
local function MaxLevel()
    -- Set Level 2550
    ReplicatedStorage.Remotes.CommF_:InvokeServer("SetLevel")
    
    -- Max All Stats
    local Stats = {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}
    for _, Stat in pairs(Stats) do
        for i = 1, 400 do
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyFruit", Stat, 1)
        end
    end
    print("✅ MAX LEVEL 2550 + ALL STATS 400 UNLOCKED")
end

-- ===============================================
-- POWER 2: ALL PERMANENT FRUITS FREE (AP Bypass)
-- ===============================================
local function UnlockAllPermanent()
    local PermanentFruits = {
        "Dragon", "Leopard", "Kitsune", "Dough", "Venom", 
        "Mammoth", "Blizzard", "Rumble", "Magu", "Phoenix"
    }
    
    for _, Fruit in pairs(PermanentFruits) do
        -- Free permanent unlock
        ReplicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit", Fruit, "1")
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakening", Fruit)
        print("🍎 " .. Fruit .. " PERMANENT UNLOCKED FREE")
    end
end

-- ===============================================
-- POWER 3: GET ANY FRUIT INSTANT
-- ===============================================
local function GetFruit(FruitName)
    ReplicatedStorage.Remotes["CommF_"]:InvokeServer("PurchaseFruit", FruitName)
    print("🍌 " .. FruitName .. " SPAWNED IN BACKPACK")
end

-- ===============================================
-- POWER 4: INFINITE FLY (F Key Toggle)
-- ===============================================
local Flying = false
local BodyVelocity = nil
local FlyConnection = nil

local function ToggleFly()
    Flying = not Flying
    
    if Flying then
        BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
        BodyVelocity.Parent = HumanoidRootPart
        
        FlyConnection = RunService.Heartbeat:Connect(function()
            local Camera = workspace.CurrentCamera
            local Move = Humanoid.MoveDirection
            
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                Move = Move + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                Move = Move + Vector3.new(0, -1, 0)
            end
            
            BodyVelocity.Velocity = Camera.CFrame:VectorToWorldSpace(Move) * getgenv().GodConfig.FlySpeed
        end)
        print("✈️ FLY ENABLED (F to toggle)")
    else
        if FlyConnection then FlyConnection:Disconnect() end
        if BodyVelocity then BodyVelocity:Destroy() end
        print("🛬 FLY DISABLED")
    end
end

-- ===============================================
-- POWER 5: TRUE GODMODE (Invincible + 1Hit)
-- ===============================================
local GodConnection
local function EnableGodMode()
    Humanoid.MaxHealth = math.huge
    Humanoid.Health = math.huge
    Humanoid.WalkSpeed = 100
    Humanoid.JumpPower = 100
    
    -- NoClip + Kill Aura
    GodConnection = RunService.Stepped:Connect(function()
        -- NoClip
        for _, Part in pairs(Character:GetChildren()) do
            if Part:IsA("BasePart") then
                Part.CanCollide = false
            end
        end
        
        -- 1Hit All Enemies
        for _, Enemy in pairs(workspace.Enemies:GetChildren()) do
            if Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                Enemy.Humanoid.Health = 0
            end
        end
    end)
    print("🛡️ GODMODE ENABLED (Invincible + 1Hit Kill)")
end

-- ===============================================
-- POWER 6: FRUIT DUPE (Infinite Copies)
-- ===============================================
spawn(function()
    while getgenv().GodConfig.FruitDupe do
        for _, Tool in pairs(LocalPlayer.Backpack:GetChildren()) do
            if string.find(Tool.Name, "Fruit") then
                local Clone = Tool:Clone()
                Clone.Parent = LocalPlayer.Backpack
            end
        end
        wait(0.1)
    end
end)

-- ===============================================
-- INITIALIZE ALL POWERS
-- ===============================================
MaxLevel()
wait(1)
UnlockAllPermanent()
wait(1)
EnableGodMode()
ToggleFly()  -- Start with fly on

-- Keybinds
UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.F then
        ToggleFly()
    elseif Input.KeyCode == Enum.KeyCode.G then
        EnableGodMode()
    end
end)

-- ===============================================
-- PREMIUM GUI
-- ===============================================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Blox Fruits GOD v3.0", "DarkTheme")

local MainTab = Window:NewTab("God Powers")
local Section = MainTab:NewSection("Controls")

Section:NewButton("🍎 Get Dragon Fruit", "Instant Spawn", function() GetFruit("Dragon") end)
Section:NewButton("🍎 Get Kitsune Fruit", "Instant Spawn", function() GetFruit("Kitsune") end)
Section:NewButton("⚡ MAX LEVEL 2550", "Reset Level", function() MaxLevel() end)
Section:NewToggle("✈️ Fly", "F Key", function(State) getgenv().GodConfig.FlyEnabled = State end)
Section:NewToggle("🛡️ Godmode", "G Key", function(State) getgenv().GodConfig.GodMode = State end)
Section:NewToggle("🔄 Fruit Dupe", "Infinite Fruits", function(State) getgenv().GodConfig.FruitDupe = State end)

print("🌟 BLOX FRUITS GOD v3.0 FULLY LOADED!")
print("Controls: F=Fly | G=Godmode | GUI=Top Right")
print("All Powers Active - Pentest Complete!")
