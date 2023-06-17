local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Plr = Players.LocalPlayer
local FlyEnabled = false

local function Fly()
    local character = Plr.Character or Plr.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.PlatformStand = true
    humanoid.Sit = true
    humanoid.JumpPower = 0

    local flyVector = Vector3.new(0, 0, 0)
    local speed = 50

    local function updateFlyVector()
        local forward = (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0)
        local right = (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0)

        flyVector = Vector3.new(right, forward, 0).unit * speed
    end

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            FlyEnabled = not FlyEnabled
            humanoid.PlatformStand = FlyEnabled
            updateFlyVector()
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.A or
            input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.D then
            updateFlyVector()
        end
    end)

    game:GetService("RunService").Heartbeat:Connect(function()
        if FlyEnabled then
            character.HumanoidRootPart.Velocity = flyVector
        end
    end)
end

Fly()
