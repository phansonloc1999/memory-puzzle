---@class CardPuzzle
CardPuzzle = Class{}

local FIRST_CARD_X, FIRST_CARD_Y = 0, 0
local CARD_SPACING, CARD_INDENTATION = 10, 10

function CardPuzzle:init(rows, columns, colors)
    self.m_table = {} ---@type Card[]
    self.m_rows, self.m_columns = rows, columns
    self.m_isSolved = false
    self.m_cardPairCount = (rows * columns) / 2
    self.m_faceUpTimer = Timer(2)

    self:createRandomPuzzle(rows, columns, colors)
end

function CardPuzzle:draw()
    for i = 1, self.m_rows do
        for j = 1, self.m_columns do
            if (self.m_table[i][j]) then
                self.m_table[i][j]:draw()
            end
        end
    end
end

function CardPuzzle:update(dt)
    self:matchCards(dt)
end

local selectedRow, selectedColumn, selectedColor
local currentRow, currentColumn, currentColor
function CardPuzzle:matchCards(dt)    
    local currentCard  ---@type Card

    if (self.m_faceUpTimer:finished()) then
        for i = 1, self.m_rows do
            for j = 1, self.m_columns do
                if (self.m_table[i][j]) then
                    currentCard = self.m_table[i][j]
                    if
                        (AaBbCollision(
                            currentCard.m_x,
                            currentCard.m_y,
                            CARD_WIDTH,
                            CARD_HEIGHT,
                            gCursorX,
                            gCursorY,
                            CURSOR.WIDTH,
                            CURSOR.HEIGHT
                        )) and love.mouse.wasPressed(1)
                    then
                        -- Check whether player has selected a card before
                        if (selectedRow) then
                            if (selectedRow ~= i) or (selectedColumn ~= j) then
                                currentRow, currentColumn, currentColor = i, j, currentCard.m_color
                                currentCard.m_isFacing = UP
                                self.m_faceUpTimer:start()
                                break
                            end
                        else
                            currentCard.m_isFacing = UP
                            selectedRow, selectedColumn, selectedColor = i, j, currentCard.m_color
                        end
                    end
                end
            end
        end
    end

    if (not self.m_faceUpTimer:finished()) then
        self.m_faceUpTimer:update(dt)
    else
        if (selectedRow ~= nil) and (currentRow ~= nil) then
            if (selectedColor == currentColor) then
                self.m_table[selectedRow][selectedColumn] = nil
                self.m_table[currentRow][currentColumn] = nil
            else
                self.m_table[selectedRow][selectedColumn]:setFacing(false)
                self.m_table[currentRow][currentColumn]:setFacing(false)
            end
            -- Reset selected and current after choosing 2 cards
            selectedRow, selectedColumn, selectedColor = nil, nil, nil
            currentRow, currentColumn, currentColor = nil, nil, nil
        end
    end
end

function CardPuzzle:createRandomPuzzle(rows, columns, colors)
    --- Initialze all possible positions
    local availablePositions = {}
    for i = 1, rows do
        for j = 1, columns do
            table.insert(availablePositions, {row = i, column = j})
        end
    end
    -- Initialze all possible colors
    local availableColors = {}
    for color, number in pairs(colors) do
        for i = 1, number do
            table.insert(availableColors, color)
        end
    end
    -- Initialze empty cards table
    for i = 1, rows do
        self.m_table[i] = {}
        for j = 1, columns do
            self.m_table[i][j] = {}
        end
    end

    local nextPosPairIndex, nextPosPair
    local nextColorIndex = 1
    local cardX, cardY
    local row, column
    while #availablePositions > 0 do
        -- Get a new randomized position from remaining available positions
        nextPosPairIndex = math.random(1, #availablePositions)
        nextPosPair = availablePositions[nextPosPairIndex]
        
        -- Create new colored card with the randomized (above) position
        row, column = nextPosPair.row, nextPosPair.column
        cardX = FIRST_CARD_X + (row - 1) * (CARD_WIDTH + CARD_SPACING)
        cardY = FIRST_CARD_Y + (column - 1) * (CARD_HEIGHT + CARD_INDENTATION)
        self.m_table[row][column] = Card(cardX, cardY, COLORS[availableColors[nextColorIndex]], false)

        table.remove(availablePositions, nextPosPairIndex)
        nextColorIndex = nextColorIndex + 1
    end
end