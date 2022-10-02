local textArea = require('classes.textArea')()


function love.load()
    love.keyboard.setKeyRepeat(true)
end

function love.keypressed(key, scancode, isRepeat)
	textArea:keypressed(key, isRepeat)
end
function love.textinput(text)
	textArea:textinput(text)
end

function love.mousepressed(mx, my, mbutton, pressCount)
	textArea:mousepressed(mx, my, mbutton, pressCount)
end
function love.mousemoved(mx, my)
	textArea:mousemoved(mx, my)
end
function love.mousereleased(mx, my, mbutton)
	textArea:mousereleased(mx, my, mbutton)
end
function love.wheelmoved(dx, dy)
	textArea:wheelmoved(dx, dy)
end

function love.update(dt)
    textArea:update(dt)
end

function love.draw()
    textArea:draw()
end