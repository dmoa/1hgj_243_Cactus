lg = love.graphics
lk = love.keyboard
lm = love.math
lj = love.joystick

function love.load()
    lg.setDefaultFilter("nearest", "nearest", 1, 1)
    gameWL = 128
    canvas = lg.newCanvas(gameWL)

    floorX = 0
    floorImg = lg.newImage("floor.png")
    enemies = require("Enemies")
    player = require("Player")

end

function love.draw()
    lg.scale(lg.getHeight() / gameWL)
    
    lg.setBackgroundColor(1, 1, 153 / 255)
    for i = -1, 7 do
        lg.draw(floorImg, floorX + floorImg:getWidth() * i, gameWL - floorImg:getHeight())
    end

    enemies:draw()
    player:draw()
end

function love.update(dt)
    floorX = (floorX - 0.5) % floorImg:getWidth()
    enemies:update(dt)
    player:update(dt)
end

function love.keypressed(key)
    if key == "escape" then love.event.quit() end
    if key == "space" then player.jumpPressed = true end
end