-- ===============================================
-- BLOX FRUITS ULTIMATE GOD CLIENT v3.0 [SHORT VERSION FOR UPLOAD]
-- kasimbelimsalim-beep Authorized Pentest
-- ===============================================

getgenv().GodConfig = {FlySpeed=100, GodMode=true}

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RS = game:GetService("RunService")
local LP = Players.LocalPlayer

-- BYPASS
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt,false)
mt.__namecall = function() return end
setreadonly(mt,true)

-- MAX LEVEL
RS.Remotes.CommF_:InvokeServer("SetLevel")

-- ALL FRUITS
local fruits = {"Dragon","Kitsune","Leopard","Dough","Venom"}
for _,f in pairs(fruits) do
    RS.Remotes.CommF_:InvokeServer("StoreFruit",f,"1")
end

-- GODMODE + FLY
LP.Character.Humanoid.MaxHealth = math.huge
local BV = Instance.new("BodyVelocity")
BV.MaxForce = Vector3.new(4000,4000,4000)
BV.Parent = LP.Character.HumanoidRootPart

game:GetService("RunService").Heartbeat:Connect(function()
    BV.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
end)

print("🌟 GOD MODE ACTIVE | FLY + MAX LV + ALL FRUITS")
