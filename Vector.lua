local main = {}
local mt = {}
mt.__index = mt

mt.__add = function(a,b)
	return main.new(a.X+b.X,a.Y+b.Y)
end
mt.__sub = function(a,b)
	return main.new(a.X-b.X,a.Y-b.Y)
end

function main.new(X,Y)
	local self = setmetatable({}, mt)

	self.X = X
	self.Y = Y

	return self
end

function mt:Equals(b)
	return (self.X == b.X and self.Y == b.Y)
end

function mt:Lerp(b, t)
	return main.new(self.X + (b.X - self.X) * t, self.Y + (b.Y - self.Y) * t)
end

main.zero = main.new(0,0)

return main