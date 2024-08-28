function KillSwitch()
game.Players.LocalPlayer:Kick("Slaze is currently down for maintenance! \n Sending user to homepage.. (3s)")
  task.wait(3)
  game:Shutdown()
end
KillSwitch()
