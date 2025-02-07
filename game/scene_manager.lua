local SceneManager = {}
SceneManager.scenes = {}
SceneManager.currentScene = nil

function SceneManager:add(name, scene)
    self.scenes[name] = scene
end

function SceneManager:switch(name, ...)
    if self.scenes[name] then
        if self.currentScene and self.currentScene.leave then
            self.currentScene:leave()
        end
        self.currentScene = self.scenes[name]
        if self.currentScene.enter then
            self.currentScene:enter(...)
        end
    else
        error("Cena '" .. name .. "' não encontrada!")
    end
end

function SceneManager:update(dt)
    if self.currentScene and self.currentScene.update then
        self.currentScene:update(dt)
    end
end

function SceneManager:draw()
    if self.currentScene and self.currentScene.draw then
        self.currentScene:draw()
    end
end

function SceneManager:keypressed(key)
    if self.currentScene and self.currentScene.keypressed then
        self.currentScene:keypressed(key)
    end
end

return SceneManager
