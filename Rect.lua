local main = {}
local mt = {}
mt.__index = mt

local VectorService = require("Vector")

function main.new(P1,P2)
	local self = setmetatable({}, mt)

	self.P1 = P1
	self.P2 = P2

	self.Angle = 0

	self.T = {
		P1;
		VectorService.new(P2.X,P1.Y);
		P2;
		VectorService.new(P1.X,P2.Y);
	}

	return self
end

function mt:MovePixels(Point)
	self.P1 = self.P1 + Point
	self.P2 = self.P2 + Point

	self.T = {
		self.P1;
		VectorService.new(self.P2.X,self.P1.Y);
		self.P2;
		VectorService.new(self.P1.X,self.P2.Y);
	}
end

function mt:GetCenter()
	return self.P1:Lerp(self.P2, 0.5)
end

function mt:MoveTeleport(Point)
	self:MovePixels(VectorService.zero-self:GetCenter())
	self:MovePixels(Point)
end

return main