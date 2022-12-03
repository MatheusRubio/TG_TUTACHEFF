--3.	Consultas: Criar consultas significativas para a aplicação.    

--a.	Uma consulta usando junção de mais de 2 tabelas.
-- Objetivo: Verificar nome dos ingredientes, quantidade e tipo de medida que determinada receita está usando 
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

--b.	Uma consulta que seja útil para a lógica de negócios usando totalização e uma função de data.
--Objetivo: Verificar a quantidade de denúncias feitas entre hoje e 30 dias atrás

select count(*)as totalDenuncias from tb_denuncia 
where dataHoraDenuncia between sysdate -30  and sysdate;


--c.	Uma consulta usando junção externa left join ou right join 
--Objetivo: Verificar receitas que possuem denúncias com status vazio

select 
    r.nomereceita
    ,d.status  
From tb_receita r
LEFT join tb_denuncia d on d.id_receita = r.id_receita where status is null;

--d.	Uma consulta  usando o operador de União. 
--Objetivo: Verificar id de denúncias validadas e denúncias rejeitadas no mês de novembro de 2022

select id_denuncia from tb_denuncia where status = 'Validada'
UNION
select id_denuncia from tb_denuncia where status = 'Rejeitada' and datahoradenuncia between '01/11/22' and '30/11/22';

--e.	Uma consulta usando o operador Minus
--Objetivo: Verificar o nome das receitas que não receberam curtidas

select nomereceita from tb_receita 
MINUS
select nomeReceita from tb_receita where curtidas is not Null;



--f.	Uma consulta usando o operador de intersecção
--Objetivo: Verificar id de usuários que cadastraram receitas que contenham categoria de receita determinada.


select id_usuario from tb_usuario
INTERSECT
select id_usuario from tb_receita where tb_receita.id_categoriareceita = 2;