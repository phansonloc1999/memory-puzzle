-- 2D AABB collision detection
function AaBbCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
           x2 < x1 + w1 and
           y1 < y2 + h2 and 
           y2 < y1 + h1
end

-- Mouse input handler
love.mouse.buttonsPressed = {}

function love.mousepressed(x, y, button)
    love.mouse.buttonsPressed[button] = true
end

function love.mouse.wasPressed(button)
    return love.mouse.buttonsPressed[button]
end

function love.mousereleased(x, y, button)
    love.mouse.buttonsPressed[button] = false
end

-- Remove element from 2D matrix
function removeFromMaxtrix(matrix, i, j) matrix[i][j] = nil end

-- Set random seed
math.randomseed(os.time())