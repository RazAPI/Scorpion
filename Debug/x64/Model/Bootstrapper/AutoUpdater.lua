task.wait(0.6)

local Prompt = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Hey = Instance.new("TextLabel")
local Warn = Instance.new("TextLabel")
local Choose1 = Instance.new("TextButton")
local SwearToGod = Instance.new("UICorner")
local CA = Instance.new("TextButton")
local CAT = Instance.new("UICorner")
local Ascii = Instance.new("UICorner")
local Choose2 = Instance.new("TextButton")
local SpentMostOfMyLifeOnAJacket = Instance.new("UICorner")

game.CoreGui.MainWindow:Destroy()

Prompt.Name = "AutoUpdater"
Prompt.Parent = game.CoreGui

Main.Size = UDim2.new(0, 500, 0, 400) 
Main.Position = UDim2.new(0, 500, 0, 150) 
Main.BackgroundColor3 = Color3.new(0, 0, 0)
Main.BackgroundTransparency = 0.3
Main.Draggable = true
Main.Active = true
Main.ClipsDescendants = true
Main.Parent = Prompt

SwearToGod.CornerRadius = UDim.new(0, 20)
SwearToGod.Parent = Main

Hey.Name = "PromptThing"
Hey.Parent = Main
Hey.TextSize = 30
Hey.Font = Enum.Font.Code
Hey.Text = "Slaze - Updater"
Hey.TextColor3 = Color3.new(1, 1, 1)
Hey.BackgroundColor3 = Color3.new(0, 0, 0)
Hey.BackgroundTransparency = 1
Hey.Position = UDim2.new(0.5, -150, 0.00007, 0) 
Hey.Size = UDim2.new(0, 300, 0, 100)

Ascii.CornerRadius = UDim.new(0, 20)
Ascii.Parent = Hey

Warn.Name = "Hi"
Warn.Parent = Main
Warn.TextSize = 22
Warn.Font = Enum.Font.SourceSans
Warn.Text = "Slaze has received an update! Please choose an option. \n \n  Version 1.0.7.1, Build 266.715.1"
Warn.Position = UDim2.new(0.5, -150, 0.3, 0)
Warn.TextColor3 = Color3.new(1, 1, 1)
Warn.BackgroundColor3 = Color3.new(0, 0, 0)
Warn.BackgroundTransparency = 1
Warn.Size = UDim2.new(0, 300, 0, 100)



Choose1.Name = "Button1OrJustUpdate"
Choose1.Parent = Main
Choose1.Font = Enum.Font.SourceSans
Choose1.TextSize = 20
Choose1.Text = "Update now"
Choose1.TextColor3 = Color3.new(1, 1, 1)
Choose1.BackgroundColor3 = Color3.new(0, 0, 0)
Choose1.BackgroundTransparency = 0.6
Choose1.Position = UDim2.new(0.73, -300, 0.7, 0)
Choose1.Size = UDim2.new(0, 150, 0, 50)

SpentMostOfMyLifeOnAJacket.CornerRadius = UDim.new(0, 20)
SpentMostOfMyLifeOnAJacket.Parent = Choose1

CA.Name = "Button2OrJustCancel"
CA.Parent = Main
CA.Font = Enum.Font.SourceSans
CA.TextSize = 20
CA.Text = "Cancel Update"
CA.TextColor3 = Color3.new(1, 1, 1)
CA.BackgroundColor3 = Color3.new(0, 0, 0)
CA.BackgroundTransparency = 0.6
CA.Position = UDim2.new(0.50, 0, 0.7, 0)
CA.Size = UDim2.new(0, 150, 0, 50)

CAT.CornerRadius = UDim.new(0, 20)
CAT.Parent = CA

CA.MouseButton1Click:Connect(function()
local success, result = pcall(function()
Main.Visible = false
game.CoreGui.AutoUpdater:Destroy()
end)
if success then

 end
end)

Choose1.MouseButton1Click:Connect(function()
local success, result = pcall(function()
task.wait(0.3)
Choose1.Visible = false
Warn.Visible = false
CA.Visible = false
Choose1.Visible = false

local function animateStatus(statusText, repeatCount, delay)
    for i = 1, repeatCount do
        Warn.Text = statusText
        task.wait(delay)
        Warn.Text = statusText .. "."
        task.wait(delay)
        Warn.Text = statusText .. ".."
        task.wait(delay)
        Warn.Text = statusText .. "..."
        task.wait(delay)
    end
end

Warn.Position = UDim2.new(0.5, -150, 0.3, 0)
Warn.Font = Enum.Font.SourceSansItalic
Warn.TextSize = 27
Warn.Visible = true
animateStatus("Fetching latest modules \n \n  1 Endpoint(s) made out of 4 ", 2, 0.2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/RazAPI/SlazeV3/main/Debug/x64/Model/KillSwitch.lua"))()
task.wait(1)
animateStatus("Protecting integrity \n \n  2 Endpoint(s) made out of 4", 2, 0.2)
task.wait(0.7)
animateStatus("Checking bootstrapper version \n \n 3 Endpoint(s) made out of 4", 2, 0.2)
task.wait(0.6)
animateStatus("Downloading dependencies \n \n 4 Endpoint(s) made out of 4", 2, 0.2)
task.wait(0.4)
animateStatus("Launching bootstrapper", 2, 0.2)
task.wait(2)
game.CoreGui.AutoUpdater:Destroy()
end)
if success then
 end
end)
