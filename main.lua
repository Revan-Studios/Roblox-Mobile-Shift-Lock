-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__UserInputService__2 = game:GetService("UserInputService");
local v3 = {};
while not l__Players__1.LocalPlayer do
	wait();
end;
local l__LocalPlayer__4 = l__Players__1.LocalPlayer;
local l__PlayerGui__5 = l__LocalPlayer__4:WaitForChild("PlayerGui");
local v6 = true;
v3.OnShiftLockToggled = Instance.new("BindableEvent");
local l__GameSettings__1 = UserSettings().GameSettings;
local function v7()
	local v8 = l__LocalPlayer__4.DevEnableMouseLock;
	if v8 then
		v8 = false;
		if l__GameSettings__1.ControlMode == Enum.ControlMode.MouseLockSwitch then
			v8 = false;
			if l__LocalPlayer__4.DevComputerMovementMode ~= Enum.DevComputerMovementMode.ClickToMove then
				v8 = false;
				if l__GameSettings__1.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove then
					v8 = l__LocalPlayer__4.DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable;
				end;
			end;
		end;
	end;
	return v8;
end;
if not l__UserInputService__2.TouchEnabled then
	v6 = v7();
end;
local u2 = true;
local u3 = v6;
function v3.IsShiftLocked(p1)
	return u3 and u2;
end;
local u4 = false;
function v3.SetIsInFirstPerson(p2, p3)
	u4 = p3;
end;
local function u5()
	u2 = not u2;
	v3.OnShiftLockToggled:Fire();
end;
local l__mouse__6 = l__LocalPlayer__4:GetMouse();
local u7 = nil;
local u8 = false;
local function u9(p4, p5)
	if p5 then
		return;
	end;
	if p4.UserInputType == Enum.UserInputType.Keyboard and p4.KeyCode ~= Enum.KeyCode.LeftShift and p4.KeyCode == Enum.KeyCode.RightShift then

	end;
end;
local function u10()
	u3 = v7();
	if u3 then
		if u2 then
			v3.OnShiftLockToggled:Fire();
		end;
		if not u8 then
			u7 = l__UserInputService__2.InputBegan:connect(u9);
			u8 = true;
		end;
	end;
end;
local function u11()
	u3 = false;
	l__mouse__6.Icon = "";
	if u7 then
		u7:disconnect();
		u7 = nil;
	end;
	u8 = false;
	v3.OnShiftLockToggled:Fire();
end;
l__GameSettings__1.Changed:connect(function(p6)
	if p6 == "ControlMode" then
		if l__GameSettings__1.ControlMode == Enum.ControlMode.MouseLockSwitch then
			u10();
			return;
		else
			u11();
			return;
		end;
	end;
	if p6 == "ComputerMovementMode" then
		if l__GameSettings__1.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove then
			u10();
			return;
		end;
	else
		return;
	end;
	u11();
end);
l__LocalPlayer__4.Changed:connect(function(p7)
	if p7 == "DevEnableMouseLock" then
		if l__LocalPlayer__4.DevEnableMouseLock then
			u10();
			return;
		else
			u11();
			return;
		end;
	end;
	if p7 == "DevComputerMovementMode" then
		if l__LocalPlayer__4.DevComputerMovementMode ~= Enum.DevComputerMovementMode.ClickToMove and l__LocalPlayer__4.DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable then
			u10();
			return;
		end;
	else
		return;
	end;
	u11();
end);
local function u12()
	print("enabled");
end;
l__LocalPlayer__4.CharacterAdded:connect(function(p8)
	if not l__UserInputService__2.TouchEnabled then
		u12();
	end;
end);
if not l__UserInputService__2.TouchEnabled then
	u12();
	if v7() then
		u7 = l__UserInputService__2.InputBegan:connect(u9);
		u8 = true;
	end;
end;
u10();
return v3;
