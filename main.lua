require("src/Dependencies")

gHighScore = 0

function love.load()
    gPlayerScore = 0

    love.window.setTitle("Memory puzzle")

    ---@type CardPuzzle
    newPuzzle = CardPuzzle(5, 6, { RED = 5, GREEN = 5, BLUE = 5, PURPLE = 5, ORANGE = 5, YELLOW = 5 })
end

function love.draw()
    newPuzzle:render()

    love.graphics.print("Score: "..gPlayerScore)
end

function love.update(dt)
    require("./lib/LoveBird").update()

    gCursorX, gCursorY = love.mouse.getPosition()

    newPuzzle:update(dt)

    love.mouse.buttonsPressed = {}
end