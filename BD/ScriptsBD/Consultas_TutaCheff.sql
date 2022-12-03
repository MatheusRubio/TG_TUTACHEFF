--3.	Consultas: Criar consultas significativas para a aplica��o.    

--a.	Uma consulta usando jun��o de mais de 2 tabelas.
-- Objetivo: Verificar nome dos ingredientes, quantidade e tipo de medida que determinada receita est� usando 
select
    i.nomeIngrediente
    ,ir.quantidadeIngrediente
    ,um.tipomedida
from tb_receita r
inner join tb_item_receita ir on ir.id_receita = r.id_receita
inner join tb_ingrediente i on i.id_ingrediente = ir.id_ingrediente
inner join tb_catingr_unimedida catuni on ir.id_catmedida = catuni.id_catmedida
inner join tb_unidade_medida um on catuni.id_unidmedida = um.id_unidmedida
where r.nomeReceita = 'SOBREMESA SIMPLES DE MORANGO';

--b.	Uma consulta que seja �til para a l�gica de neg�cios usando totaliza��o e uma fun��o de data.
--Objetivo: Verificar a quantidade de den�ncias feitas entre hoje e 30 dias atr�s

select count(*)as totalDenuncias from tb_denuncia 
where dataHoraDenuncia between sysdate -30  and sysdate;


--c.	Uma consulta usando jun��o externa left join ou right join 
--Objetivo: Verificar receitas que possuem den�ncias com status vazio

select 
    r.nomereceita
    ,d.status  
From tb_receita r
LEFT join tb_denuncia d on d.id_receita = r.id_receita where status is null;

--d.	Uma consulta  usando o operador de Uni�o. 
--Objetivo: Verificar id de den�ncias validadas e den�ncias rejeitadas no m�s de novembro de 2022

select id_denuncia from tb_denuncia where status = 'Validada'
UNION
select id_denuncia from tb_denuncia where status = 'Rejeitada' and datahoradenuncia between '01/11/22' and '30/11/22';

--e.	Uma consulta usando o operador Minus
--Objetivo: Verificar o nome das receitas que n�o receberam curtidas

select nomereceita from tb_receita 
MINUS
select nomeReceita from tb_receita where curtidas is not Null;



--f.	Uma consulta usando o operador de intersec��o
--Objetivo: Verificar id de usu�rios que cadastraram receitas que contenham categoria de receita determinada.


select id_usuario from tb_usuario
INTERSECT
select id_usuario from tb_receita where tb_receita.id_categoriareceita = 2;