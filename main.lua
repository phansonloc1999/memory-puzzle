require("src/Dependencies")

function love.load()
    foo = CardPuzzle(5, 5, { RED = 5, GREEN = 5, BLUE = 5, YELLOW = 5, ORANGE = 5 }) ---@type CardPuzzle
end

function love.draw()
    foo:draw()
end

function love.update(dt)
    require("./lib/LoveBird").update()

    gCursorX, gCursorY = love.mouse.getPosition()

    foo:update(dt)

    love.mouse.buttonsPressed = {}
end