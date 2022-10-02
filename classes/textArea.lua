local class = require('external.classic.classic')
local textField = require('external.inputField')

local textArea = class:extend()

function textArea:new(text)
    self.fieldPadding = 6
    self.fontLIneHeight = 1.3
    self.scrollbarWidth = 5
    self.blickInterval = 0.3
    self.x = 10
    self.y = 10
    local w, h = love.graphics.getDimensions()
    self.width = w - (self.x * 2)
    self.height = h - (self.y * 2)
    self.alignment = "left"
    self.font = love.graphics.newFont(20)
    self.textField = textField(text or "dumb text", "multiwrap")
    self.textField:setFont(self.font)
    self.textField:setDimensions(self.width - 2 * self.fieldPadding, self.height - 2 * self.fieldPadding)
    self.textField:setAlignment(self.alignment)
    self.isPressing = false
end

function textArea:keypressed(key, scancode, isRepeat)
    self.textField:keypressed(key, isRepeat)
end

function textArea:textinput(text)
    self.textField:textinput(text)
end

function textArea:mousepressed(mx, my, mbutton, pressCount)
    if not self.isPressing then
        local fieldX = self.x + self.fieldPadding
        local fieldY = self.y + self.fieldPadding
        self.textField:mousepressed(mx - fieldX, my - fieldY, mbutton, pressCount)
        self.isPressing = true
    end
end

function textArea:mousemoved(mx, my, dx, dy)
    if self.isPressing then
        local fieldX = self.x + self.fieldPadding
        local fieldY = self.y + self.fieldPadding
        self.textField:mousemoved(mx - fieldX, my - fieldY)
    end
end

function textArea:mousereleased(mx, my, mbutton, pressCount)
    if self.isPressing then
        local fieldX = self.x + self.fieldPadding
        local fieldY = self.y + self.fieldPadding
        self.textField:mousereleased(mx - fieldX, my - fieldY, mbutton)
        self.isPressing = false
    end
end

function textArea:wheelmoved(dx, dy)
    self.textField:wheelmoved(dx, dy)
end

function textArea:update(dt)
    self.textField:update(dt)
end

function textArea:draw()
    local field  = self.textField
    local fieldX = self.x + self.fieldPadding
    local fieldY = self.y + self.fieldPadding
    -- Background.
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    -- text area
    love.graphics.setScissor(self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1, .3)
    for _, x, y, w, h in field:eachSelection() do
        love.graphics.rectangle("fill", fieldX + x, fieldY + y, w, h)
    end
    -- Text.
    love.graphics.setFont(field:getFont())
    love.graphics.setColor(1, 1, 1, 1)
    for _, line, x, y in field:eachVisibleLine() do
        love.graphics.print(line, fieldX + x, fieldY + y)
    end
    -- Cursor.
    if (field:getBlinkPhase() / self.blickInterval) % 1 < .5 then
        local w       = 2
        local x, y, h = field:getCursorLayout()
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", fieldX + x - w / 2, fieldY + y, w, h)
    end
    love.graphics.setScissor()
    -- Scrollbars.
    local canScrollH, canScrollV                 = field:canScroll()
    local hOffset, hCoverage, vOffset, vCoverage = field:getScrollHandles()

    local hHandleLength = hCoverage * self.textField.width
    local vHandleLength = vCoverage * self.textField.height
    local hHandlePos    = hOffset * self.textField.width
    local vHandlePos    = vOffset * self.textField.height
    -- Backgrounds.
    love.graphics.setColor(0, 0, 0, .3)
    if canScrollV then love.graphics.rectangle("fill", self.x + self.width, self.y, self.scrollbarWidth,
            self.height)
    end -- Vertical scrollbar.

    -- Handles.
    love.graphics.setColor(.7, .7, .7)
    if canScrollV then love.graphics.rectangle("fill", self.x + self.textField.width, self.y + vHandlePos,
            self.scrollbarWidth, vHandleLength)
    end -- Vertical scrollbar.
    if canScrollH then love.graphics.rectangle("fill", self.x + hHandlePos, self.y + self.textField.height, hHandleLength
            , self.scrollbarWidth)
    end -- Horizontal scrollbar.
end

return textArea
