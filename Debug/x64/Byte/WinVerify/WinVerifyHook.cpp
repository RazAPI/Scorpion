local blacklisted = {
    "0x00000000",
    "0x00000001",
    "0x00000002",
    "0x00000003",
    "0x00000004",
    "0x00000005",
    "0x00000006",
    "0x00000007",
    "0x00000008",
    "0x00000009",
    "0x000000010"
}

local scr = 0x1 or "1"
local scr_module = 0x479f0000 or "479f0000"
local scr_identity = 0x0 or "0"
local scr_connection = 0x72 or "72"
local scr_signin = 0x0 or "0"
local scr_static = 0x0 or "0"
local scr_login = 0x0 or "0"



local LockHandle = {
    ["0x00000000"] = true,
    ["0x00000001"] = true,
    ["0x00000002"] = true,
    ["0x00000003"] = true,
    ["0x00000004"] = true,
    ["0x00000005"] = true,
    ["0x00000006"] = true,
    ["0x00000007"] = true,
    ["0x00000008"] = true,
    ["0x00000009"] = true,
    ["0x000000010"] = true
}

local Players = game:GetService("Players")
local whitelist = {"dontterminal", "SkibidiWielder", "heartlesking", "Therealbacongg", "SusssyAmogusThing", "Nihoning", "7vls", "offm0de", "g_miko"}
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


