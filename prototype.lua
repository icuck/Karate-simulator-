--[[
  __ _  _  __  _  _  __   ___ __  __   __  
 (  ) )( \/ _\/ )( \/  \ / __)  \/  \ /  \ 
  )() __ (    \ \/ (  O | (_(_/ (  0 |_/ / 
 (__)_)(_|_/\_/\__/ \__/ \___|__)\__/ (__) 

]]


local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))()

whitelist = "Someone"
whitelist2 = "Someone"
killtarget = "someguy"
killalltoggle = false
lagkilltoggle = false
killtoggle = false
_G.KGod_ = false
Clean = false



local target = game.Players.LocalPlayer.Name




local w = library:CreateWindow("Window")

--folder one

local b = w:CreateFolder("Rage")

b:Label("Kill functions",Color3.fromRGB(38,38,38),Color3.fromRGB(0,216,111))

b:Box("Username","Input",function(value) -- "number" or "string"
    print(value)
    killtarget = value
end)

b:Button("Kill",function()
    print("Die")
    kill()
end)

b:Toggle("Toggle kill",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    killtoggle = shared.toggle
end)

b:Toggle("Lag kill",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    lagkilltoggle = shared.toggle
end)

b:Bind("Kill Bind",function()
    print("Yes")
    kill()
end)

--killall stuff
b:Box("Whitelist","Input",function(value) -- "number" or "string"
    print(value)
    whitelist = value
end)

b:Box("Whitelist","Input",function(value) -- "number" or "string"
    print(value)
    whitelist2 = value
end)


b:Button("Kill-All",function()
    print("Die guys")
    killall()
end)

b:Toggle("Toggle Kill-All",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    killalltoggle = shared.toggle
end)




b:Bind("Kill all Bind",function()
    print("Yes")
    killall()
end)






--folder two

local b1 = w:CreateFolder("Farm")

b1:Label("Autofarm",Color3.fromRGB(38,38,38),Color3.fromRGB(0,216,111))


b1:Toggle("Toggle kill",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    farmtoggle = shared.toggle
end)



-- folder three

local b2 = w:CreateFolder("Misc.")

b2:Label("Miscs",Color3.fromRGB(38,38,38),Color3.fromRGB(0,216,111))


b2:Button("Soup",function()
    print("healing")
    Soup()
end)

b2:Toggle("Toggle Soup",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    _G.KGod_ = shared.toggle
end)


b2:Button("Clean",function()
    print("Clean")
    Clean()
end)

b2:Toggle("Toggle Clean",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    Clean = shared.toggle
end)


b:Slider("Slider",50,function(value) --MaxValue
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)


b2:DestroyGUI()



--[[
--------------------------------------------
 ____ _  _ __ _  ___ ____ __ __  __ _  ____ 
(  __) )( ( (/ \/ __|_  _|  )  \(  ( \/ ___)
 ) _)) \/ (    ( (__  )(  )(  O )    /\___ \
(__) \____|_)__)\___)(__)(__)__/\_)__)(____/

--------------------------------------------
]]


game:GetService('RunService').Heartbeat:connect(function()
  if farmtoggle == true then
	Farm()
  end
  if killalltoggle == true then
	killall()
  end
  if killtoggle == true then
	kill()
  end
  if lagkilltoggle == true then
	lagkill()
  end
  if Clean == true then
	Clean()
  end
end)





function Farm()
	game.ReplicatedStorage.Remotes.Gameplay.PunchDamage:FireServer(Workspace[target].Humanoid, Workspace[target].RightFoot)
end


function killall()
	for i,v in pairs(game.Workspace:GetChildren()) do
    	if v:FindFirstChild("Humanoid") and v:IsA("Model") and v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= whitelist and v.Name ~= whitelist2 then
        	game:GetService("ReplicatedStorage").Remotes.Gameplay.PunchDamage:FireServer(v:WaitForChild("Humanoid"))
    	end
	end
end



function kill()
	for i = 1,5 do
		wait(0.2)
		game.ReplicatedStorage.Remotes.Gameplay.PunchDamage:FireServer(Workspace[killtarget].Humanoid, Workspace[killtarget].UpperTorso)
	end
end



function lagkill()
	for i = 1,10 do
		wait(0)
		game.ReplicatedStorage.Remotes.Gameplay.PunchDamage:FireServer(Workspace[killtarget].Humanoid, Workspace[killtarget].UpperTorso)
	end
end


function Clean()
	for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        	if v:IsA("ParticleEmitter") then
            game:GetService("RunService").RenderStepped:Wait()
            v:Destroy()
        end
    end
end


function Soup()
    while game:GetService("RunService").RenderStepped:Wait() do
    	if _G.KGod_ then
        	for i = 1, 36 do
            	game:GetService("ReplicatedStorage").Remotes.Gameplay.DrinkSoup:InvokeServer()
        	end
    	end
	end
end


