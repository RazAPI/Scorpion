function KillSwitchActivated()
game.Players.LocalPlayer:Kick("Slaze is currently down for maintenance, Please wait until we are back. \n Service Disabled:101:")
  KillSwitchDisabled = false
end
function KillSwitchDisabled()
  KillSwitchActivated = false
end
KillSwitchActivated()
