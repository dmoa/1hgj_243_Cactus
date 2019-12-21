local Player = {
    x = 30,
    angle = 0,
    y = 0,
    yv = 0,
    image = lg.newImage("player.png"),
    jumping = true,
    doubleJumping = false,
    jumpPressed = false
}

function Player:draw()
    lg.draw(self.image, self.x, self.y)
end

function Player:update(dt)
    self.yv = self.yv + 30 * dt
    self.y = self.y + self.yv * 30 * dt

    self.jumping = true

    if self.y + self.image:getHeight() + 1 > gameWL - self.image:getHeight() then
        self.y = gameWL - self.image:getHeight() * 2 - 1
        self.yv = 0
        self.jumping = false
        self.doubleJumping = false
    end

    if self.y < 0 then
        self.y = 0
        self.yv = 0
    end

    if self.jumpPressed then
        self:jump()
        self.jumpPressed = false
    end

end

function Player:jump()
    if not self.doubleJumping and lk.isDown("space") then
        self.yv = -10
        if not self.jumping then 
            self.jumping = true
        else
            self.doubleJumping = true
        end
    end
end

return Player