function love.load()
    love.window.setTitle("Jogo Bíblico")
    love.window.setMode(800, 600) -- Definir tamanho da tela
end

function love.draw()
    love.graphics.print("Bem-vindo ao Jogo Bíblico!", 300, 280)
end
