local textArea = require('classes.textArea')('this is a text')
local toolBar = require('classes.toolbar')()
local class = require('external.classic.classic')


local editorView = class:extend()

function editorView:new()

end

function editorView:keypressed(key, scancode, isRepeat)
	textArea:keypressed(key, scancode, isRepeat)
    toolBar:keypressed(key, scancode, isRepeat)
end
function editorView:textinput(text)
	textArea:textinput(text)
	toolBar:textinput(text)
end

function editorView:mousepressed(x, y, button, istouch, presses)
	textArea:mousepressed(x, y, button, istouch, presses)
	toolBar:mousepressed(x, y, button, istouch, presses)
end
function editorView:mousemoved( x, y, dx, dy, istouch )
	textArea:mousemoved( x, y, dx, dy, istouch )
	toolBar:mousemoved( x, y, dx, dy, istouch )
end
function editorView:mousereleased(x, y, button, istouch, presses)
	textArea:mousereleased(x, y, button, istouch, presses)
	toolBar:mousereleased(x, y, button, istouch, presses)
end
function editorView:wheelmoved(dx, dy)
	textArea:wheelmoved(dx, dy)
	toolBar:wheelmoved(dx, dy)
end

function editorView:update(dt)
    textArea:update(dt)
    toolBar:update(dt)
end

function editorView:draw()
    textArea:draw()
    toolBar:draw()
end

return editorView