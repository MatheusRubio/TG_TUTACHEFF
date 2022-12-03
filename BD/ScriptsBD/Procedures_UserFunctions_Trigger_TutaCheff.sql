--Parte PL/SQL - Esta parte envolve o desenvolvimento de Procedures, UserFunctions e Trigger que implementem 
--l�gica necess�ria para atender �s regras de neg�cios de uma aplica��o que use a base de dados selecionada.
--N�o se esque�a de indicar o objetivo de cada procedimento criado nos itens abaixo.
							    
--a.	Escreva uma Stored Procedure que realize algum procedimento que seja �til implementar reuso para a aplica��o e indique uma forma de test�-la. (0,75)
/*Recebe o codigo de ingrediente e, com base na quantidade de vezes que ele j� foi utilizado, escrever informa��es na tabela 'tb_relatorio_ingr'
se codigo inexistente: escrever na tabela como c�digo inv�lido.
se qtde utilizado = 0 receitas, ent�o '<nome ingrediente> nunca utilizado'
se qtde utilizado entre < 10 receitas, ent�o '<nome> utilizado moderadamente, em <qtde> receitas'
se supera 10 receitas, ent�o '<nome> utilizado com muita frequencia, em <qtde> receitas'*/

create table tb_relatorio_ingr(
dataExe DATE, 
mensagem varchar2(200)
);

CREATE OR REPLACE PROCEDURE SP_FREQ_INGRED (P_IDINGRE NUMBER) AS
V_QTDEUTILIZADO NUMBER(5);
V_MENSAGEM VARCHAR(200);
V_NOMEINGRE TB_INGREDIENTE.nomeIngrediente%TYPE;
BEGIN
	SELECT COUNT(IR.id_ingrReceita)QUANTIDADE  INTO V_QTDEUTILIZADO
	 FROM TB_Ingrediente I LEFT JOIN  TB_item_receita IR ON I.id_ingrediente=IR.fk_id_ingrediente
	WHERE IR.fk_id_ingrediente=P_IDINGRE;
    
    SELECT nomeIngrediente INTO V_NOMEINGRE
     FROM TB_INGREDIENTE WHERE ID_INGREDIENTE=P_IDINGRE;
     
    IF V_QTDEUTILIZADO = 0 THEN
        V_MENSAGEM:='"'||V_NOMEINGRE || '" nunca utilizado!';
    ELSIF V_QTDEUTILIZADO <= 10 THEN
        V_MENSAGEM:='"'||V_NOMEINGRE || '" utilizado moderadamente, em ' || V_QTDEUTILIZADO || ' receitas.';
    ELSE
        V_MENSAGEM:='"'||V_NOMEINGRE || '" muito utilizado, em ' || V_QTDEUTILIZADO || ' receitas.';
    END IF;
    
    INSERT INTO  tb_relatorio_ingr(dataExe, mensagem)
	 VALUES(SYSDATE, V_MENSAGEM);
COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO tb_relatorio_ingr VALUES(SYSDATE, 'C�d de ingrediente inv�lido: ' || P_IDINGRE);
END;
/*SP CRIADA COM O PROP�SITO DE ENTENDER QUAIS OS INGREDIENTES MAIS UTILIZADOS E APRIMORAR A PESQUISA DO USU�RIO*/


--b.	Escreva uma fun��o que retorna alguma informa��o �til para a aplica��o e indique uma forma de test�-la. (0,5)
/*Fun��o recebe o cod do usu�rio e retorna a quantidade TOTAL de den�ncias que o usu�rio j� recebeu em suas receitas.*/
CREATE OR REPLACE FUNCTION FN_DENUNCIAS_RECEB (P_IDUSUARIO NUMBER) RETURN NUMBER AS
V_QTDEDENUNCIAS NUMBER;
BEGIN
    SELECT COUNT(*)QTDE INTO V_QTDEDENUNCIAS
     FROM TB_Usuario US INNER JOIN TB_RECEITA RE ON RE.fk_id_usuario=US.id_usuario INNER JOIN TB_DENUNCIA DE ON DE.fk_id_receita=RE.id_receita
	 WHERE US.id_usuario=P_IDUSUARIO
     
    RETURN V_QTDEDENUNCIAS;        
END FN_PACIENTE;

/*Testar se o usu�rio recebe muitas den�ncias em suas receitas*/
SELECT 'Total de denuncias : ' || FN_DENUNCIAS_RECEB () FROM DUAL;

--c.	Escreva um trigger de auditoria para cria��o e uso de logs sempre que alguma opera��o cr�tica for realizada. Dever� usar :NEW e :OLD.   (0,75)
/*FAZER UMA TRIGGER QUE ATIVA SEMPRE QUE UMA RECEITA SOFRER UM UPDATE*/
CREATE TABLE TB_HIST_RECEITAS(
DATAALTER DATE,
ID_RECEITA NUMBER,
NOMERECEITA VARCHAR2(100),
MODODEPREPARO VARCHAR2(500),
SUGESTAOCHEFF VARCHAR2(500)
);

Create or Replace trigger HistoricoReceita
AFTER UPDATE on TB_RECEITA
for each row
begin
  insert into TB_HIST_RECEITAS(DATAALTER,  ID_RECEITA, NOMERECEITA, MODODEPREPARO, SUGESTAOCHEFF)
   values(SYSDATE, :NEW.ID_RECEITA, :OLD.nomeReceita, :OLD.modoDePreparo, :OLD.sugestaoCheff);
end HistoricoReceita;

--d.	Escreva um trigger para impor uma integridade de dados mais complexa do que uma restri��o Check(por exemplo).(0,6)
/*VERIFICAR SE A RECEITA TEM PELO MENOS 2 INGREDIENTES CADASTRADOS ANTES DE INSERT OU UPDATE NO BANCO*/

Create or Replace trigger VerificaIngredientes
AFTER UPDATE on TB_RECEITA
for each row
begin
  insert into TB_HIST_RECEITAS(DATAALTER,  ID_RECEITA, NOMERECEITA, MODODEPREPARO, SUGESTAOCHEFF)
   values(SYSDATE, :NEW.ID_RECEITA, :OLD.nomeReceita, :OLD.modoDePreparo, :OLD.sugestaoCheff);
