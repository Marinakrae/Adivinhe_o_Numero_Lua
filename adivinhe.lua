function abertura_do_jogo()
    print("\n    Bem-vindo ao jogo Adivinhe o Numero!\
    Este jogo foi criado pela Marina\
    Como forma de aprender Lua.\
    \nA licenca deste software eh a GPL3.0 \n")
end    

function manual()
    print("Voce deseja ler o manual do jogo? (digite sim ou nao)")
    local resposta = io.read()
    if resposta == "sim" then
        print("\n Este eh um jogo de adivinhacao onde o computador ira\
        escolher um numero aleatorio, e o jogador devera\
        descobri-lo por simples processo de tentativa e erro.\n")
    end        
end

function cria_numero_aleatorio()
    seed = os.clock()*100000000000
    math.randomseed(seed)
    return math.random(1,100)
end    

function captura_palpite()
    while true do
        print("Digite um numero:")
        palpite = io.read()
        if type(tonumber(palpite)) == "number" then
            palpite = tonumber(palpite)
            if palpite > 100 or palpite < 1 then
                print("\nSeu palpite foi invalido, use um numero entre 1 e 100!\n")
            else 
                return palpite
            end        
        else
            print("\nAmigo, por favor, digite UM NUMERO!\n")
        end    
    end
end

function compara_com_palpite(num_do_computador, palpite)
    if num_do_computador == palpite then
        return true 
    else
        if num_do_computador < palpite then variacao = "maior"
        else variacao = "menor" end           
        print("\nNao, este nao eh o numero certo :(")
        print("O numero que voce disse eh "..variacao.." que o que eu estou pensando ;)")
        return false
    end
end

function imprime_interacao(numero, resultado_da_tentativa)
    if resultado_da_tentativa then
        print("\nPARABENS! Eu realmente estava pensando no numero "..numero)
    else
        print("Que tal tentar novamente?\n")
    end
    return not resultado_da_tentativa
end

function partida(numero_secreto)
    palpite = captura_palpite()
    return imprime_interacao(numero_secreto, compara_com_palpite(numero_secreto, palpite))
end

function loop_principal()
    numero_secreto = cria_numero_aleatorio()
    --print(numero_secreto)
    continua_jogando = true

    while continua_jogando do
        continua_jogando = partida(numero_secreto)
    end  
end   

function jogo()
    repete_o_jogo = true
    repeat
        loop_principal()
        print("Deseja jogar novamente? (sim ou nao)")
        resposta = io.read()
        if resposta == "nao" then
            repete_o_jogo = false
        end
    until not repete_o_jogo
    
    print("\nObrigada por jogar!")
end

abertura_do_jogo()
manual()
jogo()  