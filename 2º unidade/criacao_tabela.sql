DROP TABLE tb_produtora force;
DROP TABLE tb_filme force;
DROP TABLE tb_ambiente_grav force;
DROP TABLE tb_camera force;
DROP TABLE tb_cenario force;
DROP TABLE tb_computador force;
DROP TABLE tb_diretor force;
DROP TABLE tb_ator force;
DROP TABLE tb_editor force;
DROP TABLE tb_contratos force;
DROP TABLE tb_utiliza force;
DROP TABLE tb_adquirir force;
DROP TABLE tb_monta force;
DROP TABLE tb_revisa force;

CREATE TABLE tb_produtora OF tp_produtora(
	PRIMARY KEY (cnpj),
	nome NOT NULL
)NESTED TABLE telefone STORE AS tb_telefone_prod;

CREATE TABLE tb_filme OF tp_filme(
	PRIMARY KEY (nome),
	data_lancamento NOT NULL,
	faturamento NOT NULL,
	data_inicio NOT NULL
);

CREATE TABLE tb_ambiente_grav OF tp_ambiente_grav(
	PRIMARY KEY(nome),
	tamanho NOT NULL
);

CREATE TABLE tb_camera OF tp_camera(
	PRIMARY KEY(tomb)
);

CREATE TABLE tb_cenario OF tp_cenario(
	PRIMARY KEY(tomb)
);

CREATE TABLE tb_computador OF tp_computador(
	PRIMARY KEY(tomb)
);

