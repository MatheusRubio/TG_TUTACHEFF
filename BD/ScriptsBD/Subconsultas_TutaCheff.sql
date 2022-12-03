--4.	Subconsultas (sobre o tema escolhido)			
--a.	exemplo de um comando utilizando subconsultas que utilize o operador in.
--Objetivo: verificar usuários que cadastraram receitas.
select nomeusuario from tb_usuario where id_usuario in (select id_usuario from tb_receita);


--b.	exemplo de um comando utilizando subconsultas que utilize o operador not exists
--Objetivo: Verificar ingredientes que não estão em nenhuma receita

select nomeingrediente from tb_ingrediente where id_ingrediente
not in (
select id_ingrediente from tb_item_receita );

--c.	exemplo de uma subconsulta utilizada dentro de um comando Update.
--Objetivo: Alterar o tipo de usuário que cadastrou determinada receita

update tb_usuario set tipo = 2 where id_usuario in(
select id_usuario from tb_receita where nomereceita= 'SOBREMESA SIMPLES DE MORANGO');

--d.	exemplo de uma subconsulta utilizada dentro de um comando Delete.
--Objetivo: Excluir os itens da receita que teve a receita denunciada com status = Atendida

delete from tb_item_receita  where id_receita in (select id_receita from tb_denuncia where status = 'Atendida');
