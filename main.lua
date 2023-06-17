local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local Noclip = Instance.new("ScreenGui")
Noclip.Name = "Noclip"
Noclip.Parent = CoreGui

local BG = Instance.new("Frame")
BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0, 0, 0)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.5, -140, 0.8, -115)
BG.Size = UDim2.new(0, 280, 0, 230)
BG.Active = true
BG.Draggable = true

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(1, 0.843137, 0)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 280, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "Noclip"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

local Toggle = Instance.new("TextButton")
Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(1, 0.843137, 0)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.109565221, 0)
Toggle.Size = UDim2.new(0, 120, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0

local StatusPF = Instance.new("TextLabel")
StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.255072743, 0)
StatusPF.Size = UDim2.new(0, 80, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.550000012, 0, 0.255072743, 0)
Status.Size = UDim2.new(0, 60, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left

local Credit = Instance.new("TextLabel")
Credit.Name = "Credit"
Credit.Parent = BG
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.114285723, 0, 0.860240936, 0)
Credit.Size = UDim2.new(0, 200, 0, 17)
Credit.Font = Enum.Font.SourceSans
Credit.FontSize = Enum.FontSize.Size18
Credit.Text = "Created by KingLuna\nVersion 1.0.0"
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextSize = 16
Credit.TextStrokeColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Credit.TextStrokeTransparency = 0
Credit.TextWrapped = true

local Fly = Instance.new("TextButton")
Fly.Name = "Fly"
Fly.Parent = BG
Fly.BackgroundColor3 = Color3.new(1, 0.843137, 0)
Fly.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Fly.BorderSizePixel = 2
Fly.Position = UDim2.new(0.152380958, 0, 0.273912132, 0)
Fly.Size = UDim2.new(0, 120, 0, 36)
Fly.Font = Enum.Font.Highway
Fly.FontSize = Enum.FontSize.Size28
Fly.Text = "Fly"
Fly.TextColor3 = Color3.new(1, 1, 1)
Fly.TextSize = 25
Fly.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Fly.TextStrokeTransparency = 0

local Plr = Players.LocalPlayer
local Clipon = false
local FlyEnabled = false

Toggle.MouseButton1Click:Connect(function()
    if Status.Text == "off" then
        Clipon = true
        Status.Text = "on"
        Status.TextColor3 = Color3.new(0, 185, 0)
        local Stepped = game:GetService("RunService").Stepped:Connect(function()
            if Clipon then
                for _, character in ipairs(Plr.Character:GetDescendants()) do
                    if character:IsA("BasePart") then
                        character.CanCollide = false
                    end
                end
            else
                Stepped:Disconnect()
            end
        end)
    elseif Status.Text == "on" then
        Clipon = false
        Status.Text = "off"
        Status.TextColor3 = Color3.new(170, 0, 0)
    end
end)

Fly.MouseButton1Click:Connect(function()
    FlyEnabled = not FlyEnabled
    if FlyEnabled then
        Plr.CharacterAdded:Connect(function(character)
            character:WaitForChild("Humanoid").Died:Connect(function()
                FlyEnabled = false
            end)
        end)
        local humanoid = Plr.Character:WaitForChild("Humanoid")
        humanoid.PlatformStand = true
        humanoid.Sit = true
        humanoid.JumpPower = 0
        local mouse = Plr:GetMouse()
        mouse.KeyDown:Connect(function(key)
            if key == "q" then
                FlyEnabled = false
            end
        end)
        local flyVector = Vector3.new(0, 1, 0)
        local flying = true
        game:GetService("RunService").Stepped:Connect(function()
            if FlyEnabled and flying and Plr.Character then
                Plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                Plr.Character.HumanoidRootPart.Velocity = flyVector * 50
            end
        end)
    end
end)
