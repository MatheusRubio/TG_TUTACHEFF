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
fk_id_unidMedida NUMERIC not null,
fk_id_categoriaIngrediente NUMERIC not null
);

ALTER TABLE TB_catIngr_uniMedida
ADD CONSTRAINT PK_INGREDMEDIDA_ID PRIMARY KEY (id_catMedida);

ALTER TABLE TB_catIngr_uniMedida --FKS
ADD CONSTRAINT FK_INGREDMEDIDA_ID_UNIDMEDIDA   FOREIGN KEY(fk_id_unidMedida)
REFERENCES TB_Unidade_Medida;
ALTER TABLE TB_catIngr_uniMedida
ADD CONSTRAINT FK_INGREDMEDIDA_ID_CATINGR FOREIGN KEY(fk_id_categoriaIngrediente)
REFERENCES TB_Categoria_Ingrediente;

CREATE SEQUENCE seq_idIngMedida MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_catIngr_uniMedida(id_catMedida, fk_id_unidMedida, fk_id_categoriaIngrediente)
 VALUES(seq_idIngMedida.NEXTVAL, <medida>, <catIng>);*/


--tudo de TB_Ingrediente
create table TB_Ingrediente(
id_ingrediente  NUMBER not null,
fk_id_categoriaIngrediente number not null,
nomeIngrediente varchar2(50) not null
);

ALTER TABLE TB_Ingrediente
ADD CONSTRAINT PK_INGREDIENTE_ID PRIMARY KEY (id_ingrediente);

ALTER TABLE TB_INGREDIENTE --FK
ADD CONSTRAINT fk_INGR_ID_CATiNG FOREIGN KEY (fk_id_categoriaIngrediente)
REFERENCES TB_Categoria_Ingrediente;

CREATE SEQUENCE seq_idIngrediente MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_INGREDIENTE(id_ingrediente, fk_id_categoriaIngrediente, nomeIngrediente)
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
fk_id_categoriaReceita number,
fk_id_usuario number,
nomeReceita varchar2(60) not null,
modoDePreparo varchar2(500) not null,
sugestaoCheff varchar2(300),
curtidas number(10)
);

ALTER TABLE TB_Receita
ADD CONSTRAINT PK_Receita_ID PRIMARY KEY(id_receita);

ALTER TABLE TB_Receita  --FK
ADD CONSTRAINT fk_receita_id_catReceita FOREIGN KEY (fk_id_categoriaReceita)
REFERENCES TB_Categoria_Receita;
ALTER TABLE TB_Receita
ADD CONSTRAINT fk_receita_id_usuario FOREIGN KEY (fk_id_usuario)
REFERENCES TB_Usuario;

CREATE SEQUENCE seq_idReceita MINVALUE 0 start with 0 increment by 1 NOCACHE;

/*INSERT INTO TB_Receita(id_receita, fk_id_categoriaReceita, fk_id_usuario, nomeReceita, modoDePreparo, sugestaoCheff, curtidas)
 VALUES(seq_idReceita.NEXTVAL, 0, 0, <nome_receita>, <preparo>, <sugestao>, 0);*/
