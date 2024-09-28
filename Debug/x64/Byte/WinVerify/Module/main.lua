local Players = game:GetService("Players")
local whitelist = {"dontterminal", "SkibidiWielder", "heartlesking", "Therealbacongg", "SusssyAmogusThing"}
local blacklist = {"1", "0"}

local function isWhitelisted(username)
    for _, name in pairs(whitelist) do
        if name == username then
            return true
        end
    end
    return false
end

local function isBlacklisted(username)
    for _, name in pairs(blacklist) do
        if name == username then
            return true
        end
    end
    return false
end

local player = Players.LocalPlayer
local username = player.Name

if isBlacklisted(username) then
    player:Kick("You've been blacklisted from Scorpion: Contact razzoni for more information.")
elseif not isWhitelisted(username) then
    player:Kick("User isn't whitelisted, or has been blacklisted. Please apply for the beta applications.\nContact razzoni for more information.")
end

