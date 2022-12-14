--tudo de TB_MELHORIA
create table TB_Melhoria(
id_melhoria  NUMBER,
descricaoMelhoria varchar2(500),
status varchar2(20),
dataHoraMelhoria date
);

ALTER TABLE TB_Melhoria
ADD CONSTRAINT PK_Melhoria_ID PRIMARY KEY(id_melhoria);

CREATE SEQUENCE seq_idMelhoria MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_MELHORIA(id_melhoria, descricaoMelhoria, status, dataHoraMelhoria)
VALUES (seq_idMelhoria.NEXTVAL, <desc>, <status>, SYSDATE);*/

--tudo de TB_Usuario
create table TB_Usuario(
id_usuario  NUMBER,
email varchar2(100) not null,
senha varchar2(20) not null,
telefone varchar2(15) not null,
nomeUsuario varchar2(50) not null,
tipo number(1) not null
);

ALTER TABLE TB_Usuario
ADD CONSTRAINT PK_Usuario_ID PRIMARY KEY(id_usuario);

CREATE SEQUENCE seq_idUsuario MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_Usuario(id_usuario, email, senha, telefone, nomeUsuario, tipo)
VALUES (seq_idUsuario.NEXTVAL, <email>, <senha>, <telefone>, <nome>, <tipo>);*/


--tudo de TB_Categoria_Ingrediente
create table TB_Categoria_Ingrediente(
id_categoriaIngrediente  NUMBER not null,
nomeCategoriaIngrediente varchar2(50) not null
);

ALTER TABLE TB_Categoria_Ingrediente
ADD CONSTRAINT PK_CategoriaIngrediente_ID PRIMARY KEY(Id_categoriaIngrediente);

CREATE SEQUENCE seq_idCatIng MINVALUE 0 start with 0 increment by 1 NOCACHE;


--tudo de TB_Unidade_Medida
create table TB_Unidade_Medida(
id_unidMedida  NUMBER not null,
tipoMedida varchar2(20) not null
);

ALTER TABLE TB_Unidade_Medida
ADD CONSTRAINT PK_UnidadeMedida_ID PRIMARY KEY(id_unidMedida);

CREATE SEQUENCE seq_idUnidadeMed MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_UNIDADE_MEDIDA(ID_UNIDMEDIDA, TIPOMEDIDA)
 VALUES(seq_idUnidadeMed.NEXTVAL, <MEDIDA>);*/


--tudo de TB_catIngr_uniMedida
CREATE TABLE TB_catIngr_uniMedida(
id_catMedida NUMERIC not null,
id_unidMedida NUMERIC not null,
id_categoriaIngrediente NUMERIC not null
);

ALTER TABLE TB_catIngr_uniMedida
ADD CONSTRAINT PK_INGREDMEDIDA_ID PRIMARY KEY (id_catMedida);

ALTER TABLE TB_catIngr_uniMedida --FKS
ADD CONSTRAINT FK_INGREDMEDIDA_ID_UNIDMEDIDA   FOREIGN KEY(id_unidMedida)
REFERENCES TB_Unidade_Medida;
ALTER TABLE TB_catIngr_uniMedida
ADD CONSTRAINT FK_INGREDMEDIDA_ID_CATINGR FOREIGN KEY(id_categoriaIngrediente)
REFERENCES TB_Categoria_Ingrediente;

CREATE SEQUENCE seq_idIngMedida MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_catIngr_uniMedida(id_catMedida, id_unidMedida, id_categoriaIngrediente)
 VALUES(seq_idIngMedida.NEXTVAL, <medida>, <catIng>);*/


--tudo de TB_Ingrediente
create table TB_Ingrediente(
id_ingrediente  NUMBER not null,
id_categoriaIngrediente number not null,
nomeIngrediente varchar2(50) not null
);

ALTER TABLE TB_Ingrediente
ADD CONSTRAINT PK_INGREDIENTE_ID PRIMARY KEY (id_ingrediente);

ALTER TABLE TB_INGREDIENTE --FK
ADD CONSTRAINT FK_INGR_ID_CATING FOREIGN KEY (id_categoriaIngrediente)
REFERENCES TB_Categoria_Ingrediente;

CREATE SEQUENCE seq_idIngrediente MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_INGREDIENTE(id_ingrediente, id_categoriaIngrediente, nomeIngrediente)
 VALUES(seq_idIngrediente.NEXTVAL, <id_categoriaIng>, <nome_Ing>);*/


--tudo de TB_Categoria_Receita
create table TB_Categoria_Receita(
Id_categoriaReceita  NUMBER,
nomeCategoriaReceita varchar2(20) not null
);

ALTER TABLE TB_Categoria_Receita
ADD CONSTRAINT PK_CategoriaReceita_ID PRIMARY KEY(Id_categoriaReceita);

CREATE SEQUENCE seq_idCatReceita MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_Categoria_Receita(Id_categoriaReceita, nomeCategoriaReceita)
 VALUES(seq_idCatReceita.NEXTVAL, 'TESTE');*/
 
 
--tudo de TB_Receita
create table TB_Receita(
id_receita  NUMBER,
id_categoriaReceita number,
id_usuario number,
nomeReceita varchar2(60) not null,
modoDePreparo varchar2(500) not null,
sugestaoCheff varchar2(300),
curtidas number(10)
);

ALTER TABLE TB_Receita
ADD CONSTRAINT PK_Receita_ID PRIMARY KEY(id_receita);

ALTER TABLE TB_Receita  --FK
ADD CONSTRAINT fk_receita_id_catReceita FOREIGN KEY (id_categoriaReceita)
REFERENCES TB_Categoria_Receita;
ALTER TABLE TB_Receita
ADD CONSTRAINT fk_receita_id_usuario FOREIGN KEY (id_usuario)
REFERENCES TB_Usuario;

CREATE SEQUENCE seq_idReceita MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_Receita(id_receita, id_categoriaReceita, id_usuario, nomeReceita, modoDePreparo, sugestaoCheff, curtidas)
 VALUES(seq_idReceita.NEXTVAL, <id_catReceita>, <id_usuario>, <nome_receita>, <preparo>, <sugestao>, 0);*/


--tudo de TB_item_receita
CREATE TABLE TB_item_receita (
id_ingrReceita NUMERIC NOT NULL,
id_catMedida NUMERIC NOT NULL,
id_ingrediente NUMERIC NOT NULL,
id_receita NUMERIC NOT NULL,
quantidadeIngrediente NUMERIC(4) NOT NULL
);

ALTER TABLE TB_Item_Receita
ADD CONSTRAINT PK_ITEMRECEITA_ID PRIMARY KEY(id_ingrReceita);

ALTER TABLE TB_ITEM_RECEITA --FK
ADD CONSTRAINT FK_ITEMRECEITA_ID_INGRMEDIDA FOREIGN KEY (id_catMedida)
REFERENCES TB_catIngr_uniMedida;
ALTER TABLE TB_ITEM_RECEITA
ADD CONSTRAINT FK_ITEMRECEITA_ID_INGREDIENTE FOREIGN KEY (id_ingrediente)
REFERENCES TB_Ingrediente;
ALTER TABLE TB_ITEM_RECEITA
ADD CONSTRAINT FK_ITEMRECEITA_ID_RECEITA FOREIGN KEY (id_receita)
REFERENCES TB_RECEITA;

CREATE SEQUENCE seq_idItemReceita MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_ITEM_RECEITA(id_ingrReceita, id_catMedida, id_ingrediente, id_receita, quantidadeIngrediente)
 VALUES(seq_idItemReceita.NEXTVAL, <ID_INGRMEDIDA>, <ID_INGRE>, <ID_RECEITA>, 4);*/
 
 
 --tudo de TB_Denuncia
create table TB_Denuncia(
id_denuncia NUMBER not null,
id_receita number not null,
descricaoDenuncia varchar2(500) not null,
status varchar2(20) not null,
dataHoraDenuncia date not null
);

ALTER TABLE TB_Denuncia
 ADD CONSTRAINT PK_Denuncia_ID PRIMARY KEY(id_denuncia);

ALTER TABLE TB_Denuncia --FK
 ADD CONSTRAINT FK_Denuncia_IdReceita FOREIGN KEY(id_receita) REFERENCES TB_Receita;

CREATE SEQUENCE seq_idDenuncia MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_DENUNCIA(id_denuncia, id_receita, descricaoDenuncia, status, dataHoraDenuncia)
 VALUES(seq_idDenuncia.NEXTVAL, <id_receita>, <desc_denuncia>, 'pend', SYSDATE);*/