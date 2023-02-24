# Exercicio 01
# A linha de codigo abaixo le os dados do arquivo "Eleicoes2014.csv"
# e atribui o resultado aa variavel df como um data frame
df <- read.csv2("Eleicoes2014.csv")

# escreva instrucoes em R para calcular:
#   o tamanho da bancada do PT em 2014:
tamanho_bancada_pt = sum(df$Partido == 'PT')
sprintf('Tamanho da bancada do PT: %s deputados', tamanho_bancada_pt)

#   a idade media dos candidatos do PSDB:
idx_candidatos_psdb = df$Partido == 'PSDB'
media_idade_psdb = mean(df$Idade[idx_candidatos_psdb])
sprintf('Média de idade dos candidatos do PSDB: %.2f anos', media_idade_psdb)

#   a relacao do quantitativo entre homens e mulheres
total_homens = sum(df$Sexo == 'MASCULINO')
total_mulheres = sum(df$Sexo == 'FEMININO')
sprintf('Total de homens: %s', total_homens)
sprintf('Total de mulheres: %s', total_mulheres)

#   quantos deputados tinham sido eleitos em 2010
qtd_eleitos_em_2010 = sum(df$Eleito.em.2010 == 'Sim')
sprintf('Quantidade de eleitos em 2010: %s', qtd_eleitos_em_2010)

#   qual a media de votos nominais recebidos
media_votos_nominais = mean(df$Nominais)
sprintf('Média dos votos nominais recebidos: %s', media_votos_nominais)

#   qual o desvio padrao de votos nominais recebidos
desvio_padrao_votos_nominais = sd(df$Nominais)
sprintf('Desvio padrão dos votos nominais recebidos: %s', desvio_padrao_votos_nominais)

#   qual o coeficiente de variacao de votos nominais recebidos e
#   o que pode ser dito sobre o valor encontrado
coef_variacao_votos_nominais = desvio_padrao_votos_nominais/media_votos_nominais
sprintf('Coeficiente de variação dos votos nominais recebidos: %s', coef_variacao_votos_nominais)

#   qual a media das receitas 
media_receitas = mean(as.numeric(df$Receitas.em.2014))
sprintf('Média das receitas em 2014: %s', media_receitas)

#   qual o desvio padrao das receitas nominais
desvio_receitas = sd(as.numeric(df$Receitas.em.2014))
sprintf('Desvio padrão das receitas em 2014: %s', desvio_receitas)

#   qual o coeficiente de variacao das receitas nominais e
#   o que pode ser dito sobre o valor encontrado
coef_variacao_receitas = desvio_receitas/media_receitas
sprintf('Coeficiente de variação das receitas em 2014: %s', coef_variacao_receitas)
