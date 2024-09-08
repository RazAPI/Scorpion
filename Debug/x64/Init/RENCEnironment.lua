getgenv().getplayers = function()
    local players = {}
    for _, x in pairs(game:GetService("Players"):GetPlayers()) do
        players[x.Name] = x
    end
    players["LocalPlayer"] = game:GetService("Players").LocalPlayer
    return players
end
getgenv().getplayer = function(plr)
    if type(plr) ~= "string" then
        return error("Invalid Type, must be a string.")
    end
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Name == plr or v.DisplayName == plr then
            return v
        end
    end
end
getgenv().customprint = function(text, properties, imageId)
    print(text)
    task.wait(.025)
    local msg = game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView").ClientLog[tostring(#game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientLog:GetChildren())-1].msg
    for i, x in pairs(properties) do
        msg[i] = x
    end
    if imageId then
        msg.Parent.image.Image = imageId
    end
end
getgenv().getdevice = function()
	local inputsrv = game:GetService("UserInputService")
	if inputsrv:GetPlatform() == Enum.Platform.Windows then
		return 'Windows'
	elseif inputsrv:GetPlatform() == Enum.Platform.OSX then
		return 'macOS'
	elseif inputsrv:GetPlatform() == Enum.Platform.IOS then
		return 'iOS'
	elseif inputsrv:GetPlatform() == Enum.Platform.UWP then
		return 'Windows (Microsoft Store)'
	elseif inputsrv:GetPlatform() == Enum.Platform.Android then
		return 'Android'
	else
		return 'Unknown'
	end
end
getgenv().getfps = function(suffix)
    local rawfps = game:GetService("Stats").Workspace.Heartbeat:GetValue()
    local fpsnum = tonumber(rawfps)
    local fps = tostring(math.round(fpsnum))
    return not suffix and fps or fps.." fps"
end
getgenv().getping = function(suffix)
    local rawping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local pingstr = rawping:sub(1,#rawping-7)
    local pingnum = tonumber(pingstr)
    local ping = tostring(math.round(pingnum))
    return not suffix and ping or ping.." ms"
end
getgenv().playanimation = function(animationId, player)
    local plr = player or getplayer()
    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://" .. tostring(animationId)
        humanoid:LoadAnimation(animation):Play()
    end
end
getgenv().runanimation = function(animationId, player)
    local plr = player or getplayer()
    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://" .. tostring(animationId)
        humanoid:LoadAnimation(animation):Play()
    end
end
getgenv().getlocalplayer = function()
    return getplayer()
end
getgenv().getaffiliateid = function()
    return "none"
end
getgenv().join = function(placeID, jobID)
    game:GetService("TeleportService"):TeleportToPlaceInstance(placeID, jobID, getplayer())
end
getgenv().firetouchtransmitter = firetouchinterest
getgenv().getplatform = function()
	local inputsrv = game:GetService("UserInputService")
	if inputsrv:GetPlatform() == Enum.Platform.Windows then
		return 'Windows'
	elseif inputsrv:GetPlatform() == Enum.Platform.OSX then
		return 'macOS'
	elseif inputsrv:GetPlatform() == Enum.Platform.IOS then
		return 'iOS'
	elseif inputsrv:GetPlatform() == Enum.Platform.UWP then
		return 'Windows (Microsoft Store)'
	elseif inputsrv:GetPlatform() == Enum.Platform.Android then
		return 'Android'
	else
		return 'Unknown'
	end
end
getgenv().getos = function()
	local inputsrv = game:GetService("UserInputService")
	if inputsrv:GetPlatform() == Enum.Platform.Windows then
		return 'Windows'
	elseif inputsrv:GetPlatform() == Enum.Platform.OSX then
		return 'macOS'
	elseif inputsrv:GetPlatform() == Enum.Platform.IOS then
		return 'iOS'
	elseif inputsrv:GetPlatform() == Enum.Platform.UWP then
		return 'Windows (Microsoft Store)'
	elseif inputsrv:GetPlatform() == Enum.Platform.Android then
		return 'Android'
	else
		return 'Unknown'
	end
end
