-- global libs
vector = require 'hump.vector'

-- game libs
Player = require 'player'

function love.load()
	gScreenWidth = love.graphics.getWidth()
	gScreenHeight = love.graphics.getHeight()

	gPlayer = Player(vector.new(gScreenWidth/2, gScreenHeight/2))
end

function love.update(dt)
	gPlayer:update(dt)
end

function love.draw()
	gPlayer:draw()
end