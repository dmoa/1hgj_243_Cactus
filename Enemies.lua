local Enemies = {
    enemies = {
        {x = 50, y = 50}
    },
    image = lg.newImage("cactus.png")
}

function Enemies:draw()
    for k, v in ipairs(self.enemies) do
        lg.draw(self.image, v.x, v.y)
    end
end

function Enemies:update(dt)
    for k, v in ipairs(self.enemies) do
        v.x = v.x - 50 * dt
        if v.x < -self.image:getWidth() then
            v.x = gameWL + lm.random(100)
            v.y = lm.random(gameWL - self.image:getHeight() * 2)
        end
    end
end

return Enemies