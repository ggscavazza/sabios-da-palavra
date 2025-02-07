local SceneManager = require("game.scene_manager")
local Login = require("game.login")

function love.load()
    love.window.setTitle("Sábios da Palavra")
    love.window.setMode(800, 600)
    SceneManager:add("login", Login)
    SceneManager:switch("login")
end

function love.update(dt)
    SceneManager:update(dt)
end

function love.draw()
    SceneManager:draw()
end

function love.keypressed(key)
    SceneManager:keypressed(key)
end
