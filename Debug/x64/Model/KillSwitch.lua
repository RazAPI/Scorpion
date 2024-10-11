function KillSwitchActivated()
local GKD = Instance.new("ScreenGui")
    local ForceUpdatingBanner = Instance.new("Frame")
    local TextNotif = Instance.new("TextLabel")
    local CopyWebsiteURL = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")

    -- Properties:

    GKD.Name = "GKD"
    GKD.Parent = game.CoreGui.RobloxGui.Modules.Shell.Components.Overscan
    GKD.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ForceUpdatingBanner.Name = "ForceUpdatingBanner"
    ForceUpdatingBanner.Parent = GKD
    ForceUpdatingBanner.BackgroundColor3 = Color3.fromRGB(90, 79, 207)
    ForceUpdatingBanner.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ForceUpdatingBanner.BorderSizePixel = 0
    ForceUpdatingBanner.Position = UDim2.new(0, 0, 0, -60)
    ForceUpdatingBanner.Size = UDim2.new(1, 0, 1, 60)
    ForceUpdatingBanner.Visible = true
    ForceUpdatingBanner.ZIndex = 100

    TextNotif.Name = "TextNotif"
    TextNotif.Parent = ForceUpdatingBanner
    TextNotif.AnchorPoint = Vector2.new(0.5, 0.5)
    TextNotif.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextNotif.BackgroundTransparency = 1.000
    TextNotif.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextNotif.BorderSizePixel = 0
    TextNotif.Position = UDim2.new(0.5, 0, 0.5, 0)
    TextNotif.Size = UDim2.new(0, 400, 0, 200)
    TextNotif.ZIndex = 101
    TextNotif.Font = Enum.Font.Gotham
    TextNotif.Text = "We're sorry for the inconvenience, but Scorpion has been kill-switched for maintenance, In the meantime, you can join our discord to find more information. \n\n - The Scorpion Team\n" 

    TextNotif.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextNotif.TextScaled = true
    TextNotif.TextSize = 15.000
    TextNotif.TextWrapped = true

    CopyWebsiteURL.Name = "CopyWebsiteURL"
    CopyWebsiteURL.Parent = ForceUpdatingBanner
    CopyWebsiteURL.Active = false
    CopyWebsiteURL.AnchorPoint = Vector2.new(0.5, 1)
    CopyWebsiteURL.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CopyWebsiteURL.BorderSizePixel = 0
    CopyWebsiteURL.Position = UDim2.new(0.5, 0, 0.5, 150)
    CopyWebsiteURL.Size = UDim2.new(0, 342, 0, 40)
    CopyWebsiteURL.ZIndex = 101
    CopyWebsiteURL.Font = Enum.Font.GothamBold
    CopyWebsiteURL.Text = "Copy Discord Link"
    CopyWebsiteURL.TextColor3 = Color3.fromRGB(90, 79, 207)
    CopyWebsiteURL.TextSize = 16.000

    CopyWebsiteURL.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/ppkGE773")
        CopyWebsiteURL.Text = "Successfully copied link to clipboard."
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
