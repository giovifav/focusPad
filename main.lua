local editor = require('views.editor')()


function love.load()
    love.keyboard.setKeyRepeat(true)
end

function love.keypressed(key, scancode, isRepeat)
	editor:keypressed(key, scancode, isRepeat)
end
function love.textinput(text)
	editor:textinput(text)
end

function love.mousepressed(x, y, button, istouch, presses)
	editor:mousepressed(x, y, button, istouch, presses)
end
function love.mousemoved( x, y, dx, dy, istouch )
	editor:mousemoved( x, y, dx, dy, istouch )
end
function love.mousereleased(x, y, button, istouch, presses)
	editor:mousereleased(x, y, button, istouch, presses)
end
function love.wheelmoved(dx, dy)
	editor:wheelmoved(dx, dy)
end

function love.update(dt)
    editor:update(dt)
end

function love.draw()
    editor:draw()
end