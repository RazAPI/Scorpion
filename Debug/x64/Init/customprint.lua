-- Son of a bitch, insalada please remind your good old friend known as Carot to add some actual customprint functions. They completely work

getgenv().customprint = function(text: string, properties: table, imageId: rbxasset)
    print(text)
    task.wait(.025)
    local msg = game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView").ClientLog[tostring(#game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientLog:GetChildren())-1].msg
    for i, x in pairs(properties) do
        msg[i] = x
    end
    if imageId then msg.Parent.image.Image = imageId end
end
