function love.load()
	require "gradient"
	love.window.setMode(854, 480, {resizable=false, vsync=false, minwidth=1, minheight=1,usedpiscale=false})

end
local function myGradientFunction()
   love.graphics.rectangle("fill", 225, 200, 350, 300)
end

function love.draw()
	--linear, radial, angle, rhombus or square).
	--(function, mode, centerX, centerY, width, height, color1, color2[, angle, scaleX, scaleY])
	love.gradient.draw(myGradientFunction, "linear", 230, 100, 460, 200, {0,0,0}, {255,0,255}, 75, 1, 1)
end