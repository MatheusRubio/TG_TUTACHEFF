--Parte PL/SQL - Esta parte envolve o desenvolvimento de Procedures, UserFunctions e Trigger que implementem 
--lógica necessária para atender às regras de negócios de uma aplicação que use a base de dados selecionada.
--Não se esqueça de indicar o objetivo de cada procedimento criado nos itens abaixo.
							    
--a.	Escreva uma Stored Procedure que realize algum procedimento que seja útil implementar reuso para a aplicação e indique uma forma de testá-la. (0,75)
Recebe o codigo de ingrediente e, com base na quantidade de vezes que ele já foi utilizado, escrever informações em uma nova tabela
se codigo inexistente: escrever na tabela de erro
se ingrediente foi utilizado em nenhuma receita: escrever '<nome ingrediente> nunca utilizado'
se utilizado entre 1 e 10 receitas: escrever '<nome> utilizado com certa frequencia. Total de <qtde> de receitas'
se supera 10 receitas: escrever '<nome> utilizado com muita frequencia. Totalde <qtde> receitas'

--b.	Escreva uma função que retorna alguma informação útil para a aplicação e indique uma forma de testá-la. (0,5)
verifica usuários que cadastraram mais de 1 receita no intervalo de um mês, e alguma das receitas têm mais de 10 curtidas

--c.	Escreva um trigger de auditoria para criação e uso de logs sempre que alguma operação crítica for realizada. Deverá usar :NEW e :OLD.   (0,75)
FAZER UMA TRIGGER SEMPRE QUE UMA RECEITA SEJA MODIFICADA

--d.	Escreva um trigger para impor uma integridade de dados mais complexa do que uma restrição Check(por exemplo).(0,6)
VERIFICAR SE A RECEITA TEM PELO MENOS 2 INGREDIENTES CADASTRADOS ANTES DE INSERT OU UPDATE NO BANCO
