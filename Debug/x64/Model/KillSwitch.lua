function KillSwitchActivated()
game.Players.LocalPlayer:Kick("Scorpion's services are currently down for maintenance.")
  KillSwitchDisabled = false
end
function KillSwitchDisabled()
  KillSwitchActivated = false
end
KillSwitchDisabled()
