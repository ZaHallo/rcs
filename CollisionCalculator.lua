local main = {}
local mt = {}
mt.__index = mt

function main.GetWithinPoint(Point, Rect)
	local WithinX = Point.X >= Rect.P1.X and Point.X <= Rect.P2.X
	local WithinY = Point.Y <= Rect.P1.Y and Point.Y >= Rect.P2.Y
	return WithinX and WithinY
end

function main.GetWithinRect(RectA, RectB)
	local Colliding = false

	return Colliding
end

return main