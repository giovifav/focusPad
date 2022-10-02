local nuklear = require('nuklear')
local class = require('external.classic.classic')

local toolBar = class:extend()

function toolBar:new()
    self.ui = nuklear.newUI()
    self.active = true
    local w,h = love.graphics.getDimensions()
    self.width = 100
    self.height = 300
    self.border = 30
    self.x = w - self.border - self.width
    self.y = self.border 
end

function toolBar:update(dt)
    local ui = self.ui
    ui:frameBegin()
    if ui:windowBegin("toolBar", self.x,self.y,self.width,self.height,'border') then
        ui:layoutRow('dynamic', 40, 1)
        if ui:button('<- Pages') then
            
        end
        if ui:button('Font +') then
            
        end
        if ui:button('Font -') then
            
        end
        if ui:button('Preview') then
            
        end
        if ui:button('Copy') then
            
        end
        if ui:button('Paste') then
            
        end
    end
    ui:windowEnd()

    ui:frameEnd()
end

function toolBar:draw()
    if self.active then
        self.ui:draw()
    end
end

function toolBar:keypressed(key, scancode, isrepeat)
    if self.active then
        if self.active and self.ui:keypressed(key, scancode, isrepeat) then
            return -- event consumed
        end
    end
end

function toolBar:keyreleased(key, scancode)
    if self.active then
        if self.active and self.ui:keyreleased(key, scancode) then
            return -- event consumed
        end
    end
end

function toolBar:mousepressed(x, y, button, istouch, presses)
    if self.active then
        if self.ui:mousepressed(x, y, button, istouch, presses) then
            return -- event consumed
        end
    end
end

function toolBar:mousereleased(x, y, button, istouch, presses)
    if self.active then
        if self.ui:mousereleased(x, y, button, istouch, presses) then
            return -- event consumed
        end
    end
end

function toolBar:mousemoved(x, y, dx, dy, istouch)
    if self.active then
        if self.ui:mousemoved(x, y, dx, dy, istouch) then
            return -- event consumed
        end
    end
end

function toolBar:textinput(text)
    if self.active then
        if self.ui:textinput(text) then
            return -- event consumed
        end
    end
end

function toolBar:wheelmoved(x, y)
    if self.active then
        if self.ui:wheelmoved(x, y) then
            return -- event consumed
        end
    end
end

return toolBar
