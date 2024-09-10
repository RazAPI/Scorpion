getgenv().getsenv = function(Scr)
    for i,v in pairs(getreg()) do
        if (type(v) == "function") then
            if getfenv(v).script then
                if getfenv(v).script == Scr then
                    return getfenv(v)
                end
            end
        end
    end
end

getgenv().getsenv = function(instance)
    for _, v in next, getreg() do
        if type(v) == "function" then
            if getfenv(v).script == instance then
                return getfenv(v)
            end
        end
    end
end
