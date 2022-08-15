-- Decompiled with the Synapse X Luau decompiler.

local l__RunService__1 = game:GetService("RunService");
local l__ContextActionService__2 = game:GetService("ContextActionService");
local l__LocalPlayer__3 = game:GetService("Players").LocalPlayer;
local v4 = l__LocalPlayer__3.Character or l__LocalPlayer__3.CharacterAdded:Wait();
local l__Parent__5 = script.Parent;
uis = game:GetService("UserInputService");
ismobile = uis.TouchEnabled;
l__Parent__5.Visible = ismobile;
local u1 = {
	OFF = "rbxasset://textures/ui/mouseLock_off@2x.png", 
	ON = "rbxasset://textures/ui/mouseLock_on@2x.png"
};
local l__Humanoid__2 = v4.Humanoid;
local l__HumanoidRootPart__3 = v4:WaitForChild("HumanoidRootPart");
local function u4(p1)
	l__Humanoid__2.AutoRotate = p1;
end;
local function u5(p2)
	l__Parent__5.Image = u1[p2];
end;
local function u6(p3, p4)
	return CFrame.new(l__HumanoidRootPart__3.Position, Vector3.new(p4.CFrame.LookVector.X * 900000, l__HumanoidRootPart__3.Position.Y, p4.CFrame.LookVector.Z * 900000));
end;
local l__CurrentCamera__7 = workspace.CurrentCamera;
local u8 = CFrame.new(1.7, 0, 0);
local u9 = CFrame.new(-1.7, 0, 0);
local u10 = false;
u5("OFF");
u10 = false;
local function u11()
	u4(false);
	u5("ON");
	l__HumanoidRootPart__3.CFrame = u6(l__HumanoidRootPart__3, l__CurrentCamera__7);
	l__CurrentCamera__7.CFrame = l__CurrentCamera__7.CFrame * u8;
end;
local function u12()
	u4(true);
	u5("OFF");
	l__CurrentCamera__7.CFrame = l__CurrentCamera__7.CFrame * u9;
	pcall(function()
		u10:Disconnect();
		u10 = nil;
	end);
end;
function ShiftLock()
	if not u10 then

	else
		u12();
		return;
	end;
	u10 = l__RunService__1.RenderStepped:Connect(function()
		u11();
	end);
end;
local v6 = l__ContextActionService__2:BindAction("ShiftLOCK", ShiftLock, false, "On");
l__ContextActionService__2:SetPosition("ShiftLOCK", UDim2.new(0.8, 0, 0.8, 0));
l__Parent__5.MouseButton1Click:Connect(function()
	if u10 then
		u12();
		return;
	end;
	u10 = l__RunService__1.RenderStepped:Connect(function()
		u11();
	end);
end);
return {};
