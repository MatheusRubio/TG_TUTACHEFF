create table TB_Melhoria
(
id_melhoria  NUMBER GENERATED AS IDENTITY,
descricaoMelhoria varchar2(500),
status varchar2(20),
dataHoraMelhoria date
);

create table TB_Usuario
(
id_usuario  NUMBER GENERATED AS IDENTITY,
email varchar2(100),
senha varchar2(20),
telefone varchar2(15),
nomeUsuario varchar2(50),
tipo number(1)
);

create table TB_Categoria_Ingrediente
(
id_categoriaIngrediente  NUMBER GENERATED AS IDENTITY,
nomeCategoriaIngrediente varchar2(50)
);

create table TB_Unidade_Medida
(
id_unidMedida  NUMBER GENERATED AS IDENTITY,
tipoMedida varchar2(20)
);

CREATE TABLE TB_catIngr_uniMedida (
id_catMedida NUMERIC GENERATED AS IDENTITY,
fk_id_unidMedida NUMERIC references TB_Unidade_Medida,
fk_id_categoriaIngrediente NUMERIC references TB_Categoria_Ingrediente
);

create table TB_Ingrediente
(
id_ingrediente  NUMBER GENERATED AS IDENTITY,
fk_id_categoriaIngrediente number references TB_Categoria_Ingrediente,
nomeIngrediente varchar2(50)
);

create table TB_Categoria_Receita
(
Id_categoriaReceita  NUMBER GENERATED AS IDENTITY,
nomeCategoriaReceita varchar2(20)
);

create table TB_Receita
(
id_receita  NUMBER GENERATED AS IDENTITY,
fk_id_categoriaReceita NUMBER references TB_Categoria_Receita,
fk_id_usuario number references TB_Usuario,
nomeReceita varchar2(60),
modoDePreparo varchar2(500),
sugestaoCheff varchar2(300),
curtidas number(10)
);

CREATE TABLE TB_item_receita (
id_ingrReceita NUMERIC GENERATED AS IDENTITY,
fk_id_catMedida NUMERIC REFERENCES TB_catIngr_uniMedida,
fk_id_ingrediente NUMERIC REFERENCES TB_Ingrediente,
fk_id_receita NUMERIC REFERENCES TB_Receita,
quantidadeIngrediente NUMERIC(4),
);

create table TB_Denuncia
(
id_denuncia NUMBER GENERATED AS IDENTITY,
fk_id_receita number references TB_Receita,
descricaoDenuncia varchar2(500),
status varchar2(20),
dataHoraDenuncia date
);


--Criando as PK
ALTER TABLE TB_Melhoria
ADD CONSTRAINT PK_Melhoria_ID PRIMARY KEY(id_melhoria);

ALTER TABLE TB_Usuario
ADD CONSTRAINT PK_Usuario_ID PRIMARY KEY(id_usuario);

ALTER TABLE TB_Categoria_Ingrediente
ADD CONSTRAINT PK_CategoriaIngrediente_ID PRIMARY KEY(Id_categoriaIngrediente);

ALTER TABLE TB_Unidade_Medida
ADD CONSTRAINT PK_UnidadeMedida_ID PRIMARY KEY(id_unidMedida);

ALTER TABLE TB_catIngr_uniMedida
ADD CONSTRAINT PK_INGREDMEDIDA_ID PRIMARY KEY (id_catMedida);

ALTER TABLE TB_Ingrediente
ADD CONSTRAINT PK_Ingrediente_ID PRIMARY KEY(id_ingrediente);

ALTER TABLE TB_Categoria_Receita
ADD CONSTRAINT PK_CategoriaReceita_ID PRIMARY KEY(Id_categoriaReceita);

ALTER TABLE TB_Receita
ADD CONSTRAINT PK_Receita_ID PRIMARY KEY(id_receita);

ALTER TABLE TB_Item_Receita
ADD CONSTRAINT PK_ITEMRECEITA_ID PRIMARY KEY(id_ingrReceita);

ALTER TABLE TB_Denuncia
ADD CONSTRAINT PK_Denuncia_ID PRIMARY KEY(id_denuncia);


--- Criando as FK
--catIng_UnidMedida
ALTER TABLE TB_catIngr_uniMedida
 ADD CONSTRAINT FK_IngreMedida_idMedida FOREIGN KEY(fk_id_unidMedida)
 REFERENCES TB_Unidade_Medida(id_unidMedida)
 
ALTER TABLE TB_catIngr_uniMedida
 ADD CONSTRAINT FK_IngreMedida_idCategoria FOREIGN KEY(fk_id_categoriaIngrediente)
 REFERENCES TB_Categoria_Ingrediente(id_categoriaIngrediente)

--Denuncia
ALTER TABLE TB_Denuncia
 ADD CONSTRAINT FK_Denuncia_IdDenuncia FOREIGN KEY(id_receita) REFERENCES TB_Receita;

--Receita
ALTER TABLE TB_Receita
ADD CONSTRAINT FK_Receita_IdReceita FOREIGN KEY (id_categoriaReceita)
REFERENCES TB_Categoria_Receita;

ALTER TABLE TB_Receita
ADD CONSTRAINT FK_Receita_IdUsuario FOREIGN KEY (id_usuario)
REFERENCES TB_Usuario;

--ItemReceita
ALTER TABLE TB_Item_Receita 
ADD CONSTRAINT FK_ItemReceita_IdReceita FOREIGN KEY (id_receita)
REFERENCES TB_Receita;

ALTER TABLE TB_Item_Receita 
ADD CONSTRAINT FK_ItemReceita_IdIngrediente FOREIGN KEY (id_ingrediente)
REFERENCES TB_Ingrediente;

ALTER TABLE TB_Item_Receita 
ADD CONSTRAINT FK_ItemReceita_IdUniMedida FOREIGN KEY (id_unidMedida)
REFERENCES TB_Unidade_Medida;

--Ingrediente
ALTER TABLE TB_Ingrediente 
ADD CONSTRAINT FK_Ingrediente_IdCatIngrediente FOREIGN KEY (id_categoriaIngrediente)
REFERENCES TB_Categoria_Ingrediente;

--CategoriaIngrediente
ALTER TABLE TB_Categoria_Ingrediente 
ADD CONSTRAINT FK_Categoria_Ingrediente_IdCatIngrediente FOREIGN KEY (id_unidMedida)
REFERENCES TB_Unidade_Medida;
