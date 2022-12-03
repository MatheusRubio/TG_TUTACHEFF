--Inserindo melhoria
insert into tb_melhoria (descricaoMelhoria, dataHoraMelhoria) values 
('Olá, gostaria de deixar como sugestão, acrescentar um campo para comentários nas receitas', sysdate); 

insert into tb_melhoria (descricaoMelhoria, dataHoraMelhoria) values 
('Seria legal se pudessemos adicionar fotos no perfil', '19/10/22'); 

insert into tb_melhoria (descricaoMelhoria, dataHoraMelhoria) values 
('Gostaria de poder adicionar vídeos na receita', '23/11/22'); 

--Inserindo usuário
insert into tb_usuario (nomeusuario, email, telefone, senha) values
('Julia Almeida', 'julia.almeida@gmail.com', '99796-4052', 'julinha10');
insert into tb_usuario (nomeusuario, email, telefone, senha) values
('Carlos Pessoa', 'carlos.pessoa@gmail.com', '99896-5053', 'helloWorld');
insert into tb_usuario (nomeusuario, email, telefone, senha, tipo) values
('Ketni Camargo', 'ketni_camargo@hotmail.com', '99663-2343', 'ninjadeKonoha',1);--admin
insert into tb_usuario (nomeusuario, email, telefone, senha, tipo) values
('Andressa Couto', 'andressa_couto@gmail.com', '99767-5698', 'vampireDiares',1);--admin
insert into tb_usuario (nomeusuario, email, telefone, senha, tipo) values
('Vinicius Zanon', 'vinicius.zanon@fatec.sp.gov', '99143-4565', 'jogadordeMagic',1); --admin
insert into tb_usuario (nomeusuario, email, telefone, senha, tipo) values
('Matheus Rubio', 'matheus.rubio@fatec.sp.gov', '87451-8401', 'jogadorValorant',1); --admin
insert into tb_usuario (nomeusuario, email, telefone, senha, tipo) values
('Grace Zanon', 'grace.zanon@fatec.sp.gov.br', '78494-4895', 'ViVa2nOis',1); 

select * from tb_usuario;


--Inserindo Categoria de Ingrediente
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Fruta');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Lácteos'); --categoria de leite condensado
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Refresco'); --categoria do suco em pó
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Gelatinoso'); --categoria da gelatina
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Aquoso'); --categoria da água
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Ovos');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Grãos');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Cereais');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Carne-Boi');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Carne-Porco');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Frango');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Legume');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Verdura');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Peixe');
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Laticínios e Derivados'); --categoria de manteiga
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Hortaliça'); --categoria da cebola
insert into tb_categoria_ingrediente (nomecategoriaingrediente) values
('Farináceos'); --categoria da farinha de mandioca

select * from tb_categoria_ingrediente;


--Inserindo Unidade de medida
insert into tb_unidade_medida (tipomedida) values
('Gramas');
insert into tb_unidade_medida (tipomedida) values
('Unidade');
insert into tb_unidade_medida (tipomedida) values
('Caixinha');
insert into tb_unidade_medida (tipomedida) values
('Saquinho'); --suco
insert into tb_unidade_medida (tipomedida) values
('ML');
insert into tb_unidade_medida (tipomedida) values
('Colher de Sopa');
insert into tb_unidade_medida (tipomedida) values
('Colher de Chá');
insert into tb_unidade_medida (tipomedida) values
('Colher de Café');
insert into tb_unidade_medida (tipomedida) values
('Xícara');
insert into tb_unidade_medida (tipomedida) values
('Copo');
insert into tb_unidade_medida (tipomedida) values
('Copo Americano');
insert into tb_unidade_medida (tipomedida) values
('Kilo');
insert into tb_unidade_medida (tipomedida) values
('Litro');
insert into tb_unidade_medida (tipomedida) values
('Duzia');
insert into tb_unidade_medida (tipomedida) values
('Maço');
insert into tb_unidade_medida (tipomedida) values
('Lata');

select * from tb_unidade_medida;


--Inserindo Categoria Ingrediente Unidade de Medida
insert into tb_catingr_unimedida (id_unidMedida, id_categoriaIngrediente) values
(2,1); --morango e banana
insert into tb_catingr_unimedida (id_unidMedida, id_categoriaIngrediente) values
(3,2); -- leite condensado e creme de leite
insert into tb_catingr_unimedida (id_unidMedida, id_categoriaIngrediente) values
(4,3); -- Suco em pó
insert into tb_catingr_unimedida (id_unidMedida, id_categoriaIngrediente) values
(3,4); --gelatina
insert into tb_catingr_unimedida (id_unidMedida, id_categoriaIngrediente) values
(5,5); --água
insert into tb_catingr_unimedida (id_unidMedida, id_categoriaIngrediente) values
(2,6); --ovo
insert into tb_catingr_unimedida (id_unidMedida, id_categoriaIngrediente) values
(6,15); --manteiga de amendoin
insert into tb_catingr_unimedida (id_unidMedida, id_categoriaIngrediente) values
(15,1); --suco de limão

select * from tb_categoria_ingrediente;


--Inserindo Ingrediente
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Morango', 1);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Leite Condensado', 2);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Creme de Leite', 2);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Suco em pó de Morango', 3);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Gelatina', 4);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Água Gelada', 5);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Água Quente', 5);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Ovo', 6);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Banana', 1);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Maçã', 1);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Abacaxi', 1);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Alface', 13);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Rúcula', 13);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Cebola', 16);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Manteiga de Amendoim', 15);
insert into tb_ingrediente (nomeingrediente, id_categoriaingrediente) values
('Suco de Limão', 1);

select * from tb_categoria_ingrediente;


--Inserindo Categoria de Receita
insert into tb_categoria_receita (nomecategoriareceita) values
('Doce');
insert into tb_categoria_receita (nomecategoriareceita) values
('Salgado');
insert into tb_categoria_receita (nomecategoriareceita) values
('Salgado-Assado');
insert into tb_categoria_receita (nomecategoriareceita) values
('Salgado-Frito');
insert into tb_categoria_receita (nomecategoriareceita) values
('Salgado-Massa');
insert into tb_categoria_receita (nomecategoriareceita) values
('Salgado-Geladeira');
insert into tb_categoria_receita (nomecategoriareceita) values
('Caldos');
insert into tb_categoria_receita (nomecategoriareceita) values
('Saladas');
insert into tb_categoria_receita (nomecategoriareceita) values
('Doce-Assado');
insert into tb_categoria_receita (nomecategoriareceita) values
('Doce-Frito');
insert into tb_categoria_receita (nomecategoriareceita) values
('Doce-Geladeira');

select * from tb_categoria_receita;


--Inserindo Receita
insert into tb_receita (nomereceita, id_categoriareceita, id_usuario, mododepreparo, sugestaocheff) values
('SOBREMESA SIMPLES DE MORANGO', 1, 1, 'Pique e separe os morangos.
Misture as latas de leite condensado e creme de leite, e o suco em pó no liquidificador até ficar bem homogêneo.
Depois coloque em um recipiente e misture com os morangos picados.
Se quiser que fique cremoso coloque na geladeira, se preferir mais sólido coloque no congelador.', 
'Pode fazer também de abacaxi e outras frutas de sua preferência. Lembrando que se mudar a fruta é necessário mudar o suco em pó também.');

insert into tb_receita (nomereceita, id_categoriareceita, id_usuario, mododepreparo) values
('GELATINA COM CREME DE LEITE E LEITE CONDENSADO', 1, 2,'Passo 1 - 
Dissolva a gelatina na água quente, mexendo bem até diluir tudo; Passo 2 - 
Em seguida adicione a água gelada e misture bem; Passo 3 - 
Transfira essa mistura para o liquidificador e adicione o creme de leite e o leite condensado; Passo 4 - 
Bata tudo por 1 minutinho e em seguida despeje essa mistura numa travessa ou em taças individuais; Passo 5 - 
Leve para gelar por cerca de 4 horas ou até que fique bem firme; Passo 6 - 
Sirva em seguida.');

insert into tb_receita (nomereceita, id_categoriareceita, id_usuario, mododepreparo, curtidas) values
('OMELETE DE BANANA', 1, 4,'Corte a banana em rodelas e amasse com o garfo; Depois, misture com o ovo (clara e gema);
Unte uma frigideira com um fio de azeite e despeje a banana misturada com o ovo na frigideira;
Frite até o ponto que preferir.', 5);

insert into tb_receita (nomereceita, id_categoriareceita, id_usuario, mododepreparo, curtidas) values
('Sorvete de Banana e Manteiga de amendoin', 11, 6,'Coloque as bananas no congelador por cerca de duas horas.
Quando estiverem congeladas, coloque-as no liquidificador. Bata por um tempo, misturando com uma colher,
e volte a bater até alcançar uma textura homogênea. Se for difícil alcançar esta textura, adicione duas colheres de leite.
Quando estiver bem cremoso, adicione a manteiga de amendoim e bata até ficar bem cremosa. 
Se quiser um sorvete mais durinho, congele e depois sirva..', 10);

insert into tb_receita (nomereceita, id_categoriareceita, id_usuario, mododepreparo, curtidas) values
('Sorbet de limão', 11, 4,'Misture os dois ingredientes e leve ao refrigerador. Deixe gelar por quatro horas.', 3);

select * from tb_receita;

--Inserindo Item da Receita
--receita 1
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(1, 1, 1, 20); -- morango
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(2, 2, 1, 2); --leite condensado 
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(2, 3, 1, 2); -- creme de leite
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(3, 4, 1, 1);

--receita 2 --verificar id_receita
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(4, 5, 2, 1); --gelatina
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(2, 2, 2, 1); -- leite condensado
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(2, 3, 2, 1); --creme de leite
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(5, 6, 2, 250); --agua gelada
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(5, 7, 2, 250); -- água quente

--receita 3
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(1, 8, 3, 1); --ovo
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(6, 9, 3, 2); --banana

--receita 4
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(6, 9, 4, 4); --banana
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(7, 15, 4, 2); --manteiga de amendoin

--receita 5
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(2, 2, 5, 1); --leite condensado
insert into tb_item_receita (id_catmedida, id_ingrediente, id_receita, quantidadeingrediente) values
(8, 16, 5, 1);--suco de limão

select * from tb_item_receita;


--Inserindo Denuncia
insert into tb_denuncia (id_receita, descricaodenuncia, datahoraDenuncia) values
(1, 'Olá, gostaria que verificasse essa receita, pois achei que a pessoa utilizou palavras exdrúxulas', sysdate);

insert into tb_denuncia (id_receita, descricaodenuncia, status, datahoraDenuncia) values
(2, 'Segui a receita e não deu certo, tá faltando alguma coisa', 'Rejeitada', '12/11/22');

insert into tb_denuncia (id_receita, descricaodenuncia, ststus, datahoraDenuncia) values
(3, 'Passo a passo contém instruções indevidas', 'Rejeitada', '03/11/2022');

insert into tb_denuncia (id_receita, descricaodenuncia, datahoraDenuncia) values
(1, 'Essa receita é plagiada de outra receita que já existe no site do Tudo Gostoso', '15/11/2022');

insert into tb_denuncia (id_receita, descricaodenuncia, datahoraDenuncia) values
(4, 'A lista de ingredientes está errada. Tem ingrediente no modo de preparo que não consta na lista!', '03/12/2022');
select * from tb_denuncia;







