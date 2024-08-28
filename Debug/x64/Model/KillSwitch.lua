function KillSwitchActivated()
game.Players.LocalPlayer:Kick("Slaze's services are currently down for maintenance, Please wait until we are back up and working.")
  KillSwitchDisabled = false
end
function KillSwitchDisabled()
  KillSwitchActivated = false
end
KillSwitchDisabled()
