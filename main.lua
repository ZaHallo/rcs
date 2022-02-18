

local VectorService = require("Vector")
local RectService = require("Rect")
local CollisionService = require("CollisionCalculator")

local ShipVelocity = VectorService.new(0,0)
local KeyVelocity = VectorService.new(0,0)
local W,A,S,D = 0,0,0,0

local MapBorder = RectService.new(VectorService.new(0,0),VectorService.new(300,200));
local Player = RectService.new(VectorService.new(0,0),VectorService.new(30,30))

function DrawRect(Rect)

	local P1 = Rect.T[1]
	local P2 = Rect.T[2]
	local P3 = Rect.T[3]
	local P4 = Rect.T[4]
	local Center = VecterService.new((P1.X + P2.X + P3.X + P4.X)/4, (P1.Y + P2.Y + P3.Y + P4.Y)/4)
	local Rotation = Rect.Angle + KeyVelocity.X

	P1 = P1 - Center
	P2 = P2 - Center
	P3 = P3 - Center
	P4 = P4 - Center

	local Radius = math.abs(math.sqrt((P1.X - Center.X)^2 + (P1.Y - Center.Y)^2))

	P1 = VectorService.new(math.sin(R))
end

function love.load()

	Player:MoveTeleport(VectorService.new(150,100))
	love.window.setTitle("RCS")
	love.window.maximize()
	Player:MoveTeleport(VectorService.new(150,100))
end

local VelocityMax = 3
local VelocityTurnMax = 0.02
local Direction = 0

function love.update()
	if love.keyboard.isDown("up") then
		W = VelocityMax
	else
		W = 0
	end
	if love.keyboard.isDown("left") then
		A = VelocityTurnMax
	else
		A = 0
	end
	if love.keyboard.isDown("down") then
		S = -VelocityMax
	else
		S = 0
	end
	if love.keyboard.isDown("right") then
		D = -VelocityTurnMax
	else
		D = 0
	end
	
	KeyVelocity.Y = W+S
	KeyVelocity.X = A+D

	Direction = Direction + KeyVelocity.X
	ShipVelocity = ShipVelocity:Lerp(VectorService.new(math.sin(Direction)*KeyVelocity.Y,math.cos(Direction)*KeyVelocity.Y),0.01)

end

function love.draw()
		Player:MovePixels(ShipVelocity)
		local Center = Player:GetCenter()
		if Center.X > 300 then
			Player:MoveTeleport(VectorService.new(0,Center.Y))
		elseif Center.X < 0 then
			Player:MoveTeleport(VectorService.new(300,Center.Y))
		end
		if Center.Y > 200 then
			Player:MoveTeleport(VectorService.new(Center.X,0))
		elseif Center.Y < 0 then
			Player:MoveTeleport(VectorService.new(Center.X,200))
		end
		DrawRect(Player)
end