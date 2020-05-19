--[[
  __ _  _  __  _  _  __   ___ __  __   __  
 (  ) )( \/ _\/ )( \/  \ / __)  \/  \ /  \ 
  )() __ (    \ \/ (  O | (_(_/ (  0 |_/ / 
 (__)_)(_|_/\_/\__/ \__/ \___|__)\__/ (__) 

]]

local library = loadstring(game:HttpGet("https://pastebin.com/raw/eKwyeQa0", true))()
farmtoggle = "OFF"
farmspeed = "0.1"
Bodypart = "Head"
killguy = "someone"
killtoggle = "OFF"
killalltoggle = "OFF"
whitelist = "Someone"
whitelist2 = "Someone"
enabled = "OFF"
studs = 20
_G.KGod_ = "OFF"


local target = game.Players.LocalPlayer.Name






--[[
-----------------------------------------------------------------
 ____ __  ____     __  
(_  _) _\(  _ \   /  \ 
  )(/    \) _ (  (_/ / 
 (__)_/\_(____/   (__) 

-----------------------------------------------------------------
]]


local tab1 = library:CreateTab("Autofarm", true)

local toggle = library:MakeToggle(tab1,"Farm",false,function(toggle)
	print(toggle.Text)
	farmtoggle = toggle.Text
end)


local box = library:MakeBox(tab1,"Farmspeed","Input",function(box)
	print("Farmspeed:"..box.Text)
	farmspeed = box.Text
end)

local dropdown = library:MakeDropdown(tab1,"BodyPart",{"UpperTorso","LowerTorso","Head"},"UpperTorso",function(dropdown)
	print(dropdown.Text)
	Bodypart = dropdown.Text
end)



--[[
-----------------------------------------------------------------
 ____ __  ____    ____ 
(_  _) _\(  _ \  (___ \
  )(/    \) _ (   / __/
 (__)_/\_(____/  (____)

-----------------------------------------------------------------
]]


local tab2 = library:CreateTab("Kill", false)

local box = library:MakeBox(tab2,"Username","Target",function(box)
	print (box.Text)
	killguy = box.Text
end)

local button = library:MakeButton(tab2,"Kill",function(button)
	print("Killing...")
	kill()
end)

local toggle = library:MakeToggle(tab2,"Toggle Loop",false,function(toggle)
	print(toggle.Text)
	killtoggle = toggle.Text
end)




-----------------------
local text = library:MakeLabel(tab2,"   ")


local box = library:MakeBox(tab2,"Whitelist","Input",function(box)
	print (box.Text)
	whitelist = box.Text
end)

local box = library:MakeBox(tab2,"Whitelist2","Input",function(box)
	print(box.Text)
	whitelist2 = box.Text
end)


local toggle = library:MakeToggle(tab2,"Toggle Loop",false,function(toggle)
	print(toggle.Text)
	killalltoggle = toggle.Text
end)


local button = library:MakeButton(tab2,"Kill-All",function(button)
	print ("KILLALL")
	for i = 1,50 do
    	wait(0.1)
		killall()
	end
end)




--[[
-----------------------------------------------------------------
 ____ __  ____    ____ 
(_  _) _\(  _ \  ( __ \
  )(/    \) _ (   (__ (
 (__)_/\_(____/  (____/

-----------------------------------------------------------------
]]

local tab3 = library:CreateTab("Extras", false, Color3.new(0,.7,.5))

local toggle = library:MakeToggle(tab3,"Loop-Killall",false,function(toggle)
	print(toggle.Text)
	_G.KGod_ = toggle.Text
end)


local button = library:MakeButton(tab3,"Soup",function(button)
	print("GOD")
	while game:GetService("RunService").RenderStepped:Wait() do
    	if _G.KGod_ == "ON" then
        	for i = 1, 36 do
            	game:GetService("ReplicatedStorage").Remotes.Gameplay.DrinkSoup:InvokeServer()
        	end
    	end
	end
end)


local button = library:MakeButton(tab3,"Clean",function(button)
       for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        	if v:IsA("ParticleEmitter") then
            game:GetService("RunService").RenderStepped:Wait()
            v:Destroy()
        end
    end
end)





--[[
--------------------------------------------
 ____ _  _ __ _  ___ ____ __ __  __ _  ____ 
(  __) )( ( (/ \/ __|_  _|  )  \(  ( \/ ___)
 ) _)) \/ (    ( (__  )(  )(  O )    /\___ \
(__) \____|_)__)\___)(__)(__)__/\_)__)(____/

--------------------------------------------
]]


game:GetService('RunService').Heartbeat:connect(function()
  if farmtoggle == "ON" then
    wait(farmspeed)
	game.ReplicatedStorage.Remotes.Gameplay.PunchDamage:FireServer(Workspace[target].Humanoid, Workspace[target].RightFoot)
  end
  if killalltoggle == "ON" then
    wait(0.5)
	killall()
  end
end)


game:GetService('RunService').Heartbeat:connect(function()
  if killtoggle == "ON" then
	wait(0.1)
	kill()
  end
end)


function kill()
	for i = 1,20 do
		wait(0.5)
		game.ReplicatedStorage.Remotes.Gameplay.PunchDamage:FireServer(Workspace[killguy].Humanoid, Workspace[killguy].UpperTorso)
	end
end


function killall()
	for i,v in pairs(game.Workspace:GetChildren()) do
    	if v:FindFirstChild("Humanoid") and v:IsA("Model") and v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= whitelist and v.Name ~= whitelist2 then
        	game:GetService("ReplicatedStorage").Remotes.Gameplay.PunchDamage:FireServer(v:WaitForChild("Humanoid"))
    	end
	end
end



--killaura


