local latestVersion = "4.5"
local tweenService = game:GetService("TweenService")

if (localVersion == "4.4") then
    -- Credits to 1 F0, even though I was never intended/supposedly allowed to use this.
    -- Locally just adding a new one now.
    local GetWindowDescendants = Instance.new("ScreenGui")
    local BannerFrame = Instance.new("Frame")
    local NotificationDisplayed = Instance.new("TextLabel")
    local CopyDiscordURL = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")


    GetWindowDescendants.Name = "DummyBootScreen"
    GetWindowDescendants.Parent = game.CoreGui.RobloxGui.Modules.Shell.Components.Overscan
    GetWindowDescendants.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    BannerFrame.Name = "LocalBanner"
    BannerFrame.Parent = GetWindowDescendants
    BannerFrame.BackgroundColor3 = Color3.fromRGB(90, 79, 207)
    BannerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    BannerFrame.BorderSizePixel = 0
    BannerFrame.Position = UDim2.new(0, 0, 0, -60)
    BannerFrame.Size = UDim2.new(1, 0, 1, 60)
    BannerFrame.Visible = true
    BannerFrame.ZIndex = 100

    NotificationDisplayed.Name = "Notification"
    NotificationDisplayed.Parent = BannerFrame
    NotificationDisplayed.AnchorPoint = Vector2.new(0.5, 0.5)
    NotificationDisplayed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotificationDisplayed.BackgroundTransparency = 1.000
    NotificationDisplayed.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotificationDisplayed.BorderSizePixel = 0
    NotificationDisplayed.Position = UDim2.new(0.5, 0, 0.5, 0)
    NotificationDisplayed.Size = UDim2.new(0, 400, 0, 200)
    NotificationDisplayed.ZIndex = 101
    NotificationDisplayed.Font = Enum.Font.Gotham
    NotificationDisplayed.Text = "Hi, This version of Scorpion is outdated, and we recommend you switch to the newest version.\n\n - Newest Version: " 
        .. latestVersion 
        .. "\n - Current Version: " 
        .. localVersion 
        .. "\n\n - RazAPI\n"

    TextNotif.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextNotif.TextScaled = true
    TextNotif.TextSize = 17.000
    TextNotif.TextWrapped = true

    CopyDiscordURL.Name = "CopyDiscordLink"
    CopyDiscordURL.Parent = BannerFrame
    CopyDiscordURL.Active = false
    CopyDiscordURL.AnchorPoint = Vector2.new(0.5, 1)
    CopyDiscordURL.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CopyDiscordURL.BorderSizePixel = 0
    CopyDiscordURL.Position = UDim2.new(0.5, 0, 0.5, 150)
    CopyDiscordURL.Size = UDim2.new(0, 342, 0, 40)
    CopyDiscordURL.ZIndex = 101
    CopyDiscordURL.Font = Enum.Font.GothamBold
    CopyDiscordURL.Text = "Copy Discord Link"
    CopyDiscordURL.TextColor3 = Color3.fromRGB(90, 79, 207)
    CopyDiscordURL.TextSize = 16.000

    CopyDiscordURL.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/ppkGE773")
        CopyDiscordURL.Text = "Successfully copied link to clipboard."
    end)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = CopyDiscordURL
end


