local ScriptContext = game:GetService("ScriptContext")

for i,v in next, getconnections(ScriptContext.Error) do
    v:Disable()
end

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local illusionists = {}
local illusionistCounter = 0

Check = function(plr)
    if plr == Players.LocalPlayer then return false end
    if not plr.Character then return false end

    if plr.Character:FindFirstChild("Observe") then
        return true
    else
        if plr.Backpack:FindFirstChild("Observe") then
            return true
        else
            return false
        end
    end
end

for _,v in pairs(Players:GetPlayers()) do
    if Check(v) == true then
        StarterGui:SetCore("SendNotification", {
            Title = "Illusionist detected";
            Text = v.Name.." is a illusionist.";
            Duration = 15;
            Button1 = "OK"
        })
        illusionistCounter = illusionistCounter +1
        table.insert(illusionists, illusionistCounter, v)
    end
    v.CharacterAdded:Connect(function()
        if not table.find(illusionists, v) then
            RunService.RenderStepped:Wait()
            if Check(v) == true then
                StarterGui:SetCore("SendNotification", {
                    Title = "Illusionist detected";
                    Text = v.Name.." is a illusionist.";
                    Duration = 15;
                    Button1 = "OK"
                })
                illusionistCounter = illusionistCounter +1
                table.insert(illusionists, illusionistCounter, v)
            end
        end
    end)
end

Players.PlayerAdded:Connect(function(plr)
    if Check(v) == true then
        StarterGui:SetCore("SendNotification", {
            Title = "Illusionist detected";
            Text = v.Name.." is a illusionist.";
            Duration = 15;
            Button1 = "OK"
        })
        illusionistCounter = illusionistCounter +1
        table.insert(illusionists, illusionistCounter, v)
    end
end)

Players.PlayerRemoving:Connect(function(plr)
    if table.find(illusionists, plr) then
        for i,v in pairs(illusionists) do
            if v == plr then
                table.remove(illusionists, i)
                illusionistCounter = illusionistCounter -1
            end
        end
        StarterGui:SetCore("SendNotification", {
            Title = "Illusionist left";
            Text = v.Name.." has been left from server!";
            Duration = 15;
            Button1 = "OK"
        })
    end
end)
