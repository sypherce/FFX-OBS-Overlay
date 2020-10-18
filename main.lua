--local push = require "push"
  
-- Example: Loading an Image and displaying it
--[[Description:
Load an image using love.graphics.newImage(image_path)
Draw it using love.graphics.draw
]]
local timer_start

--push:setupScreen(854, 480, 854, 480, {fullscreen = false})

local gameWidth, gameHeight = 1920, 1080 --fixed game resolution
local windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = windowWidth-500, windowHeight-500 --make the window a bit smaller than the screen itself
scale_width = windowWidth / gameWidth
scale_height = windowHeight / gameHeight

--push:setupScreen(1920, 1080, 426, 240, {fullscreen = false})
--push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})


--
--1920x1080
--1280x720
--854x480
function love.load()
	love.window.setMode(windowWidth, windowHeight, {resizable=true, vsync=false, minwidth=1, minheight=1,usedpiscale=false})
	
	love.graphics.setDefaultFilter("nearest","nearest", 0)

    image = love.graphics.newImage("assets/background.png")
    tidus_image = love.graphics.newImage("assets/tidus.png")
    yuna_image = love.graphics.newImage("assets/yuna.png")
    auron_image = love.graphics.newImage("assets/auron.png")
    kimahri_image = love.graphics.newImage("assets/kimahri.png")
    wakka_image = love.graphics.newImage("assets/wakka.png")
    lulu_image = love.graphics.newImage("assets/lulu.png")
    rikku_image = love.graphics.newImage("assets/rikku.png")
    seymour_guado_image = love.graphics.newImage("assets/seymour_guado.png")
	-- Create a new font with 32pt size and set it as default.
	local f = love.graphics.newFont("PixelEmulator-xq08.ttf", 24)
	love.graphics.setFont(f)
	
	timer_start = love.timer.getTime()
end

function love.resize(w, h)
	windowWidth, windowHeight = w, h
	scale_width = windowWidth / gameWidth
	scale_height = windowHeight / gameHeight
end

function readFile(filename)
    if love.filesystem.getInfo(filename) then
        return love.filesystem.read(filename)
	end

	return ""
end
gilText = readFile("gil.txt");


function love.update(dt)
	if(love.timer.getTime() - timer_start >= 1.0)then
		timer_start = love.timer.getTime()
		gilText =	"Gil: " .. readFile("gil.txt") ..
					"\n: Tidus\nHP: " .. readFile("tidus/curr_hp.txt") ..
					"\nMP: " .. readFile("tidus/curr_mp.txt") ..
					"\nS.Lv: " .. readFile("tidus/cslvl.txt") ..
					"/" .. readFile("tidus/slvl.txt")
	end
end

local function draw_background(this_image)
	local sx = love.graphics.getWidth()  / this_image:getWidth()
	local sy = love.graphics.getHeight() / this_image:getHeight()
	love.graphics.draw(this_image, 0, 0, 0, sx, sy) -- x: 0, y: 0, rot: 0, scale x and scale y
end

local function draw_image(this_image, x, y)
	local sx = 1--push:getWidth()  / this_image:getWidth()
	local sy = 1--push:getHeight() / this_image:getHeight()
	love.graphics.draw(this_image, x * scale_width, y * scale_height, 0, scale_width, scale_height) -- x: 0, y: 0, rot: 0, scale x and scale y
end

function love.draw()
	--push:start()
	love.graphics.scale(1,1)
	draw_background(image)
	draw_image(tidus_image, 0, 123 + (120 * 0))
	draw_image(yuna_image, 0, 123 + (120 * 1))
	draw_image(auron_image, 0, 123 + (120 * 2))
	draw_image(kimahri_image, 0, 123 + (120 * 3))
	draw_image(wakka_image, 0, 123 + (120 * 4))
	draw_image(lulu_image, 0, 123 + (120 * 5))
	draw_image(rikku_image, 0, 123 + (120 * 6))
	draw_image(seymour_guado_image, 0, 123 + (120 * 7))   
    
	--push:finish()
end