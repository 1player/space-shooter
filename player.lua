local class = require 'hump.class'

Player = class{}

local SIZE = 32
local HSIZE = SIZE/2
local SPEED = 10
local COLOR = {51, 51, 204}

function Player:init(posv)
	-- position vector of the center of the player
	self.posv = posv
end

function Player:update(dt)
end

function Player:draw()
	love.graphics.setColor(COLOR[1], COLOR[2], COLOR[3])

	local base1 = vector.new(self.posv.x - HSIZE, self.posv.y + HSIZE)
	local base2 = vector.new(self.posv.x + HSIZE, self.posv.y + HSIZE)
	local top = vector.new(self.posv.x, self.posv.y - HSIZE)

	love.graphics.polygon('fill',
		base1.x, base1.y,
		base2.x, base2.y,
		top.x, top.y)
end

return Player