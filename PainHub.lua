local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Destroy old GUI if re-executed
if CoreGui:FindFirstChild("PainHub") then
    CoreGui.PainHub:Destroy()
end

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PainHub"
screenGui.Parent = CoreGui
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 250)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0,12)
local stroke = Instance.new("UIStroke", mainFrame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255,0,0)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0,0,0,0)
title.Text = "PainHub - Key System"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.Parent = mainFrame

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.Position = UDim2.new(0,0,0,40)
subtitle.Text = "Thanks for using PainHub"
subtitle.TextColor3 = Color3.fromRGB(180,180,180)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 20
subtitle.Parent = mainFrame

-- TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 300, 0, 40)
textBox.Position = UDim2.new(0.5, -150, 0, 90)
textBox.Text = ""
textBox.PlaceholderText = "Enter Key 🗝"
textBox.TextColor3 = Color3.new(0,0,0)
textBox.BackgroundColor3 = Color3.fromRGB(240,240,240)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 20
textBox.Parent = mainFrame

local tbCorner = Instance.new("UICorner", textBox)
tbCorner.CornerRadius = UDim.new(0,8)
local tbStroke = Instance.new("UIStroke", textBox)
tbStroke.Color = Color3.fromRGB(255,0,0)
tbStroke.Thickness = 1.5

-- Check Key Button
local checkButton = Instance.new("TextButton")
checkButton.Size = UDim2.new(0, 120, 0, 40)
checkButton.Position = UDim2.new(0, 20, 0, 150)
checkButton.Text = "Check Key"
checkButton.TextColor3 = Color3.new(1,1,1)
checkButton.BackgroundColor3 = Color3.fromRGB(40,40,60)
checkButton.Font = Enum.Font.Gotham
checkButton.TextSize = 20
checkButton.Parent = mainFrame

local cCorner = Instance.new("UICorner", checkButton)
cCorner.CornerRadius = UDim.new(0,8)
local cStroke = Instance.new("UIStroke", checkButton)
cStroke.Color = Color3.fromRGB(255,0,0)
cStroke.Thickness = 1.5

-- Get Key Button
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 120, 0, 40)
getKeyButton.Position = UDim2.new(1, -140, 0, 150)
getKeyButton.Text = "Get Key"
getKeyButton.TextColor3 = Color3.new(1,1,1)
getKeyButton.BackgroundColor3 = Color3.fromRGB(40,40,60)
getKeyButton.Font = Enum.Font.Gotham
getKeyButton.TextSize = 20
getKeyButton.Parent = mainFrame

local gCorner = Instance.new("UICorner", getKeyButton)
gCorner.CornerRadius = UDim.new(0,8)
local gStroke = Instance.new("UIStroke", getKeyButton)
gStroke.Color = Color3.fromRGB(255,0,0)
gStroke.Thickness = 1.5

-- Fade out function
local function fadeOutAndDestroy()
    local tween = TweenService:Create(mainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
    tween:Play()
    for _, child in ipairs(mainFrame:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
            TweenService:Create(child, TweenInfo.new(0.7), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
        elseif child:IsA("UIStroke") then
            TweenService:Create(child, TweenInfo.new(0.7), {Transparency = 1}):Play()
        end
    end
    tween.Completed:Wait()
    screenGui:Destroy()
end

-- Functionality
checkButton.MouseButton1Click:Connect(function()
    if textBox.Text == "DANGER-KEY-2025!!" then
        textBox.Text = "Key Verified!!✅"
        task.delay(1, function()
            fadeOutAndDestroy()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/dharsa1n/Scripts/refs/heads/main/INK%20GAME"))()
        end)
    else
        textBox.Text = "Get Key"
    end
end)

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://link-hub.net/1374420/VPUDpCodaLP7")
    textBox.Text = "Link copied "
end)
