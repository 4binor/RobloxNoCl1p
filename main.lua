local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local Fly = Instance.new("TextButton") -- Добавленная кнопка "Fly"
local Plr = Players.LocalPlayer
local Clipon = false
local FlyEnabled = false -- Флаг для отслеживания состояния "Fly"

Noclip.Name = "Noclip"
Noclip.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0, 0, 0)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(1, 0.843137, 0)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "Noclip"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(1, 0.843137, 0)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left

Credit.Name = "Credit"
Credit.Parent = BG
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.195238099, 0, 0.866141737, 0)
Credit.Size = UDim2.new(0, 128, 0, 17)
Credit.Font = Enum.Font.SourceSans
Credit.FontSize = Enum.FontSize.Size18
Credit.Text = "Created by KingLuna\nVersion 1.0.0" -- Обновленный текст Credit
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextSize = 16
Credit.TextStrokeColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Credit.TextStrokeTransparency = 0
Credit.TextWrapped = true

-- Конфигурация кнопки "Fly"
Fly.Name = "Fly"
Fly.Parent = BG
Fly.BackgroundColor3 = Color3.new(1, 0.843137, 0)
Fly.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Fly.BorderSizePixel = 2
Fly.Position = UDim2.new(0.152380958, 0, 0.604480922, 0)
Fly.Size = UDim2.new(0, 146, 0, 36)
Fly.Font = Enum.Font.Highway
Fly.FontSize = Enum.FontSize.Size28
Fly.Text = "Fly"
Fly.TextColor3 = Color3.new(1, 1, 1)
Fly.TextSize = 25
Fly.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Fly.TextStrokeTransparency = 0

Toggle.MouseButton1Click:Connect(function()
    if Status.Text == "off" then
        Clipon = true
        Status.Text = "on"
        Status.TextColor3 = Color3.new(0, 185, 0)
        Stepped = game:GetService("RunService").Stepped:Connect(function()
            if not Clipon == false then
                for a, b in pairs(Workspace:GetChildren()) do
                    if b.Name == Plr.Name then
                        for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
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

-- Функция для включения/выключения "Fly"
local function ToggleFly()
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
end

Fly.MouseButton1Click:Connect(ToggleFly)
