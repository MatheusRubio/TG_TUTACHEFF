create table TB_Melhoria
(
id_melhoria  NUMBER GENERATED AS IDENTITY,
descricaoMelhoria varchar2(500) not null,
status varchar2(20),
dataHoraMelhoria date
);

create table TB_Usuario
(
id_usuario  NUMBER GENERATED AS IDENTITY,
email varchar2(100) not null,
senha varchar2(20) not null,
telefone varchar2(15),
nomeUsuario varchar2(50) not null,
tipo number(1)
);

create table TB_Categoria_Ingrediente
(
id_categoriaIngrediente  NUMBER GENERATED AS IDENTITY,
nomeCategoriaIngrediente varchar2(50)not null
);

create table TB_Unidade_Medida
(
id_unidMedida  NUMBER GENERATED AS IDENTITY,
tipoMedida varchar2(20) not null
);

CREATE TABLE TB_catIngr_uniMedida (
id_catMedida NUMERIC GENERATED AS IDENTITY,
id_unidMedida NUMERIC,
id_categoriaIngrediente NUMERIC 
);

create table TB_Ingrediente
(
id_ingrediente  NUMBER GENERATED AS IDENTITY,
id_categoriaIngrediente number,
nomeIngrediente varchar2(50) not null
);

create table TB_Categoria_Receita
(
Id_categoriaReceita  NUMBER GENERATED AS IDENTITY,
nomeCategoriaReceita varchar2(20) not null
);

create table TB_Receita
(
id_receita  NUMBER GENERATED AS IDENTITY,
id_categoriaReceita number,
id_usuario number,
nomeReceita varchar2(60) not null,
modoDePreparo varchar2(500) not null,
sugestaoCheff varchar2(300),
curtidas number(10)
);

CREATE TABLE TB_item_receita (
id_ingrReceita NUMERIC GENERATED AS IDENTITY,
id_catMedida NUMERIC,
id_ingrediente NUMERIC,
id_receita NUMERIC,
quantidadeIngrediente NUMERIC(4) not null
);

create table TB_Denuncia
(
id_denuncia NUMBER GENERATED AS IDENTITY,
id_receita number,
descricaoDenuncia varchar2(500) not null,
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
--Denuncia
ALTER TABLE TB_Denuncia
ADD CONSTRAINT fk_Denuncia_id_receita FOREIGN KEY(id_receita) REFERENCES TB_Receita;

--Receita
ALTER TABLE TB_Receita
ADD CONSTRAINT fk_receita_id_catReceita FOREIGN KEY (id_categoriaReceita)
REFERENCES TB_Categoria_Receita;

ALTER TABLE TB_Receita
ADD CONSTRAINT fk_receita_id_usuario FOREIGN KEY (id_usuario)
REFERENCES TB_Usuario;
 
--ItemReceita
ALTER TABLE TB_Item_Receita
ADD CONSTRAINT fk_item_receita_id_receita FOREIGN KEY (id_receita)
REFERENCES TB_Receita;

ALTER TABLE TB_Item_Receita
ADD CONSTRAINT fk_id_ingrediente FOREIGN KEY (id_ingrediente)
REFERENCES TB_Ingrediente;

ALTER TABLE TB_Item_Receita
ADD CONSTRAINT fk_id_catMedida FOREIGN KEY (id_catMedida)
REFERENCES TB_catIngr_uniMedida;


--Ingrediente
ALTER TABLE TB_Ingrediente
ADD CONSTRAINT fk_id_categoriaIngrediente FOREIGN KEY (id_categoriaIngrediente)
REFERENCES TB_Categoria_Ingrediente;

--CategoriaIngrediente
ALTER TABLE TB_Categoria_Ingrediente
ADD CONSTRAINT fk_id_unidMedida FOREIGN KEY (id_unidMedida)
REFERENCES TB_Unidade_Medida;


--TB_catIngr_uniMedida
ALTER TABLE TB_catIngr_uniMedida
ADD CONSTRAINT fk_id_unidMedida FOREIGN KEY (id_unidMedida)
REFERENCES TB_Unidade_Medida;

ALTER TABLE TB_catIngr_uniMedida
ADD CONSTRAINT fk_catIngr_uniMedida_id_catIngrediente FOREIGN KEY (id_categoriaIngrediente)
REFERENCES TB_Categoria_Ingrediente;