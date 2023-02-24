# Exercicio 01
# A linha de codigo abaixo le os dados do arquivo "exercicio.csv"
# e atribui o resultado aa variavel df como um data frame
df <- read.csv("exercicio.csv",sep=",", header=TRUE)

# escreva instrucoes em R para calcular
#   a media, mediana, desvio padrao, variancia e amplitude
#   das variaveis contidas no arquivo;
# crie um vetor para cada variavel (coluna do arquivo), que contenha os
#   respectivos resultados, na ordem em que foi solicitado o calculo
media = apply(df, 2, mean)
mediana = apply(df, 2, median)
desvio_padrao = apply(df, 2, sd)
variancia = apply(df, 2, var)
amplitude = apply(df, 2, max) - apply(df, 2, min)

coluna = 'a1'
resultados_a1 = c(media[coluna], mediana[coluna], desvio_padrao[coluna],
                  variancia[coluna], amplitude[coluna])
names(resultados_a1) = c('media', 'mediana', 'desvio_padrao', 'variancia', 'amplitude')

coluna = 'a2'
resultados_a2 = c(media[coluna], mediana[coluna], desvio_padrao[coluna],
                  variancia[coluna], amplitude[coluna])
names(resultados_a2) = c('media', 'mediana', 'desvio_padrao', 'variancia', 'amplitude')

coluna = 'a3'
resultados_a3 = c(media[coluna], mediana[coluna], desvio_padrao[coluna],
                  variancia[coluna], amplitude[coluna])
names(resultados_a3) = c('media', 'mediana', 'desvio_padrao', 'variancia', 'amplitude')

# crie uma matriz cujas colunas sejam a media, mediana, desvio padrao, 
#   variancia e amplitude, e as linhas correspondam aos vetores criados
#   anteriormente
nome_colunas = c('media', 'mediana', 'desvio_padrao', 'variancia', 'amplitude')
nome_linhas = c('a1', 'a2', 'a3')
matriz_resultado = matrix(c(media, mediana, desvio_padrao, variancia, amplitude),
       ncol=5, dimnames = list(nome_linhas, nome_colunas))

# calcule a media das linhas da matriz
media_linhas = rowMeans(matriz_resultado)

# calcule a media das colunas da matriz
media_colunas = colMeans(matriz_resultado)

# escreva uma instrucao R para mostrar a 4a coluna da matriz
quarta_coluna = matriz_resultado[,4]

# escreva uma instrucao R para mostrar a 2a linha da matriz
segunda_linha = matriz_resultado[2,]

# escreva uma instrucao R para mostrar a celula que coorresponde
# aa 2a coluna e aa 3a linha da matriz
celula_coluna2_linha3 = matriz[3,2]

# crie uma nova coluna no data frame df que indique
# quando o valor da primeira coluna eh maior que o da segunda
df = cbind(df, a1Maiora2 = df$a1 > df$a2)

# em quantas linhas voce encontrou a condicao anterior como verdadeira?
total_a1_maior_a2 = sum(df$a1Maiora2)

# crie uma nova coluna no data frame df que indique
# quando o valor da segunda coluna eh menor ou igual ao valor da terceira
df$a2MenorOuIgualA3 = df$a2 <= df$a3

# em quantas linhas voce encontrou a condicao anterior como verdadeira?
total_a2_menor_ou_igual_a3 = sum(df$a2MenorOuIgualA3)