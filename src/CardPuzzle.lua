---@class CardPuzzle
CardPuzzle = Class{}

local FIRST_CARD_X, FIRST_CARD_Y =  0, 0
local CARD_SPACING, CARD_INDENTATION = 10, 10

function CardPuzzle:init(rows, columns)
    self.m_table = {} ---@type Card
    self.m_rows, self.m_columns = rows, columns
    self.m_isSolved = false
    self.m_cardPairCount = (rows * columns) / 2

    local cardX, cardY
    for i = 1, rows do
        self.m_table[i] = {}
        for j = 1, columns do
            cardX = FIRST_CARD_X + (i - 1) * (CARD_WIDTH + CARD_SPACING)
            cardY = FIRST_CARD_Y + (j - 1) * (CARD_HEIGHT + CARD_INDENTATION)
            self.m_table[i][j] = Card(cardX, cardY, COLORS.GREEN, false)
        end
    end
end

function CardPuzzle:draw()
    for i = 1, self.m_rows do
        for j = 1, self.m_columns do
            self.m_table[i][j]:draw()
        end
    end
end

function CardPuzzle:update(dt) 
end