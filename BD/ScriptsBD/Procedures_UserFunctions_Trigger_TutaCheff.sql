--Parte PL/SQL - Esta parte envolve o desenvolvimento de Procedures, UserFunctions e Trigger que implementem 
--l�gica necess�ria para atender �s regras de neg�cios de uma aplica��o que use a base de dados selecionada.
--N�o se esque�a de indicar o objetivo de cada procedimento criado nos itens abaixo.
							    
--a.	Escreva uma Stored Procedure que realize algum procedimento que seja �til implementar reuso para a aplica��o e indique uma forma de test�-la. (0,75)
Recebe o codigo de ingrediente e, com base na quantidade de vezes que ele j� foi utilizado, escrever informa��es em uma nova tabela
se codigo inexistente: escrever na tabela de erro
se ingrediente foi utilizado em nenhuma receita: escrever '<nome ingrediente> nunca utilizado'
se utilizado entre 1 e 10 receitas: escrever '<nome> utilizado com certa frequencia. Total de <qtde> de receitas'
se supera 10 receitas: escrever '<nome> utilizado com muita frequencia. Totalde <qtde> receitas'

--b.	Escreva uma fun��o que retorna alguma informa��o �til para a aplica��o e indique uma forma de test�-la. (0,5)
verifica usu�rios que cadastraram mais de 1 receita no intervalo de um m�s, e alguma das receitas t�m mais de 10 curtidas

--c.	Escreva um trigger de auditoria para cria��o e uso de logs sempre que alguma opera��o cr�tica for realizada. Dever� usar :NEW e :OLD.   (0,75)
FAZER UMA TRIGGER SEMPRE QUE UMA RECEITA SEJA MODIFICADA

--d.	Escreva um trigger para impor uma integridade de dados mais complexa do que uma restri��o Check(por exemplo).(0,6)
VERIFICAR SE A RECEITA TEM PELO MENOS 2 INGREDIENTES CADASTRADOS ANTES DE INSERT OU UPDATE NO BANCO
