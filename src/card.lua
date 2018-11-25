---@class Card
Card = Class{}

CARD_WIDTH, CARD_HEIGHT = 50, 50

local UP, DOWN = 0, 1

function Card:init(x, y, color, isFacingUp)
    self.m_x, self.m_y = x, y
    self.m_color = color
    self.m_isFacing = isFacingUp and UP or DOWN
end

function Card:draw()
    if (self.m_isFacing == UP) then
        love.graphics.setColor(self.m_color)
        love.graphics.rectangle("fill", self.m_x, self.m_x, CARD_WIDTH, CARD_HEIGHT)
        love.graphics.setColor(COLORS.WHITE)
    else love.graphics.rectangle("fill", self.m_x, self.m_y, CARD_WIDTH, CARD_HEIGHT) end
end

function Card:setFacing(isFacingUp) self.m_isFacing = isFacingUp and UP or DOWN end