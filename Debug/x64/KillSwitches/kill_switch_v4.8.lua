function KillSwitchActivated()
local latestVersion = "4.803"
local outdatedVersion = "4.802"
local localVersion = "4.803"

if localVersion == outdatedVersion then
    local ModuleSource = Instance.new("ScreenGui")
    local Ringabitofutilitiestoya = Instance.new("Frame")
    local TakeItInside = Instance.new("TextLabel")
    local BuyMeANecklace = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")

    -- Properties:

    ModuleSource.Name = "New_ScreenGui_Implant"
    ModuleSource.Parent = game.CoreGui.RobloxGui.Modules.Shell.Components.Overscan
    ModuleSource.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Ringabitofutilitiestoya.Name = "ForceUpdatingBanner"
    Ringabitofutilitiestoya.Parent = ModuleSource
    Ringabitofutilitiestoya.BackgroundColor3 = Color3.fromRGB(90, 79, 207)
    Ringabitofutilitiestoya.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Ringabitofutilitiestoya.BorderSizePixel = 0
    Ringabitofutilitiestoya.Position = UDim2.new(0, 0, 0, -60)
    Ringabitofutilitiestoya.Size = UDim2.new(1, 0, 1, 60)
    Ringabitofutilitiestoya.Visible = true
    Ringabitofutilitiestoya.ZIndex = 100

    TakeItInside.Name = "Notification"
    TakeItInside.Parent = Ringabitofutilitiestoya
    TakeItInside.AnchorPoint = Vector2.new(0.5, 0.5)
    TakeItInside.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TakeItInside.BackgroundTransparency = 1.000
    TakeItInside.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TakeItInside.BorderSizePixel = 0
    TakeItInside.Position = UDim2.new(0.5, 0, 0.5, 0)
    TakeItInside.Size = UDim2.new(0, 400, 0, 200)
    TakeItInside.ZIndex = 101
    TakeItInside.Font = Enum.Font.Gotham
    TakeItInside.Text = "We're sorry for the inconvience, but this version of Scorpion has been killswitched, due to being outdated.\n\n Need more information? Join our Discord Server down below! \n\n - Best Regards,\nRazAPI" 

    TakeItInside.TextColor3 = Color3.fromRGB(255, 255, 255)
    TakeItInside.TextScaled = true
    TakeItInside.TextSize = 15.000
    TakeItInside.TextWrapped = true

    BuyMeANecklace.Name = "CopyDiscordURL"
    BuyMeANecklace.Parent = Ringabitofutilitiestoya
    BuyMeANecklace.Active = false
    BuyMeANecklace.AnchorPoint = Vector2.new(0.5, 1)
    BuyMeANecklace.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BuyMeANecklace.BorderSizePixel = 0
    BuyMeANecklace.Position = UDim2.new(0.5, 0, 0.5, 150)
    BuyMeANecklace.Size = UDim2.new(0, 342, 0, 40)
    BuyMeANecklace.ZIndex = 101
    BuyMeANecklace.Font = Enum.Font.GothamBold
    BuyMeANecklace.Text = "Copy Discord Link"
    BuyMeANecklace.TextColor3 = Color3.fromRGB(90, 79, 207)
    BuyMeANecklace.TextSize = 16.000

    BuyMeANecklace.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/68ANVyvz")
        BuyMeANecklace.Text = "Successfully copied link to clipboard."
    end)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = CopyWebsiteURL
    BlurEffect:Destroy()
    ImageLabel:Destroy()
    fr:Destroy()
    ScreenGui:Destroy()

  KillSwitchDisabled = false
    task.wait(2)
    MainScorpion:Destroy()
end
function KillSwitchDisabled()
  KillSwitchActivated = false
end
KillSwitchDisabled()
end
