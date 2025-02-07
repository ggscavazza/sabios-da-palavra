-- Tela Inicial (Login)
local login = {}

-- Variáveis para assets
local background
local titleFont
local stars = {}
local buttons = {}
local selectedButton = 1
local starSelected

function login:load()
    -- Carregar assets
    background = love.graphics.newImage("assets/backgrounds/backgroundEmpty.png")
    titleFont = love.graphics.newFont("assets/font/KenneyFutureNarrow.ttf", 36)

    -- Carregar imagens das estrelas com letras
    local starLetters = {"B", "I", "B", "L", "I", "A"}
    local starColors = {"blue", "green", "yellow", "blue", "green", "yellow"} -- Sequência de cores
    for i, letter in ipairs(starLetters) do
        if starColors[i] == "blue" then
            starSelected = love.graphics.newImage("assets/png/Blue/Default/star.png")
        elseif starColors[i] == "green" then
            starSelected = love.graphics.newImage("assets/png/Green/Default/star.png")
        elseif starColors[i] == "yellow" then
            starSelected = love.graphics.newImage("assets/png/Yellow/Default/star.png")
        end

        local star = {
            image = starSelected,
            x = 200 + (i - 1) * 70,
            y = 200
        }
        table.insert(stars, star)
    end

    -- Configurar botões
    buttons = {
        {label = "ENTRAR", action = function() print("Entrar") end},
        {label = "CRIAR CONTA", action = function() print("Criar Conta") end},
        {label = "ENTRAR COM GOOGLE", action = function() print("Entrar com Google") end}
    }
end

function login:update(dt)
    -- Navegação dos botões
    if love.keyboard.isDown("up") then
        selectedButton = selectedButton > 1 and selectedButton - 1 or #buttons
    elseif love.keyboard.isDown("down") then
        selectedButton = selectedButton < #buttons and selectedButton + 1 or 1
    elseif love.keyboard.isDown("return") then
        buttons[selectedButton].action()
    end
end

function login:draw()
    -- Desenhar fundo
    love.graphics.draw(background, 0, 0)

    -- Desenhar título
    love.graphics.setFont(titleFont)
    love.graphics.printf("SÁBIOS DA PALAVRA", 0, 50, love.graphics.getWidth(), "center")

    -- Desenhar estrelas
    for _, star in ipairs(stars) do
        love.graphics.draw(star.image, star.x, star.y)
    end

    -- Desenhar botões
    for i, button in ipairs(buttons) do
    local x = love.graphics.getWidth() / 2 - 100
        local y = 400 + (i - 1) * 60
        if i == selectedButton then
            love.graphics.setColor(0, 0.5, 1)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.rectangle("fill", x, y, 200, 40, 5)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(button.label, x, y + 10, 200, "center")
    end
end

return login
