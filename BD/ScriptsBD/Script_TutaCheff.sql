create table TB_Denuncia
(
id_denuncia NUMBER GENERATED AS IDENTITY,
id_receita number references TB_Receita,
descricaoDenuncia varchar2(500),
status varchar2(20),
dataHoraDenuncia date
);

create table TB_Receita
(
id_receita  NUMBER GENERATED AS IDENTITY,
id_categoriaReceita number references TB_Categoria_Receita,
id_usuario number references TB_Usuario,
nomeReceita varchar2(60),
modoDePreparo varchar2(500),
sugestaoCheff varchar2(300),
curtidas number(10)
);

create table TB_Categoria_Receita
(
Id_categoriaReceita  NUMBER GENERATED AS IDENTITY,
nomeCategoriaReceita varchar2(20)
);

create table TB_Item_Receita
(
id_receita number references TB_Receita ,
id_ingrediente number references TB_Ingrediente,
id_unidMedida  number references TB_Unidade_Medida,
quantidadeIngrediente number(4)
);

create table TB_Ingrediente
(
id_ingrediente  NUMBER GENERATED AS IDENTITY,
id_categoriaIngrediente number references TB_Categoria_Ingrediente,
nomeIngrediente varchar2(50)
);

create table TB_Unidade_Medida
(
id_unidMedida  NUMBER GENERATED AS IDENTITY,
tipoMedida varchar2(10)
);

create table TB_Categoria_Ingrediente
(
id_categoriaIngrediente  NUMBER GENERATED AS IDENTITY,
id_unidMedida number references TB_Unidade_Medida,
nomeCategoriaIngrediente varchar2(50)
);

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

--Criando as PK

ALTER TABLE TB_Denuncia
 ADD CONSTRAINT PK_Denuncia_ID PRIMARY KEY(id_denuncia);
 
 ALTER TABLE TB_Receita
 ADD CONSTRAINT PK_Receita_ID PRIMARY KEY(id_receita);
 
 ALTER TABLE TB_Categoria_Receita
 ADD CONSTRAINT PK_CategoriaReceita_ID PRIMARY KEY(Id_categoriaReceita);
 
 ALTER TABLE TB_Item_Receita
 ADD CONSTRAINT PK_ID PRIMARY KEY(id_receita, id_ingrediente);
 
 ALTER TABLE TB_Ingrediente
 ADD CONSTRAINT PK_Ingrediente_ID PRIMARY KEY(id_ingrediente);
 
 ALTER TABLE TB_Unidade_Medida
 ADD CONSTRAINT PK_UnidadeMedida_ID PRIMARY KEY(id_unidMedida);
 
 ALTER TABLE TB_Categoria_Ingrediente
 ADD CONSTRAINT PK_CategoriaIngrediente_ID PRIMARY KEY(Id_categoriaIngrediente);
 
 ALTER TABLE TB_Melhoria
 ADD CONSTRAINT PK_Melhoria_ID PRIMARY KEY(id_melhoria);
 
 ALTER TABLE TB_Usuario
 ADD CONSTRAINT PK_Usuario_ID PRIMARY KEY(id_usuario);

--- Criando as FK 


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
