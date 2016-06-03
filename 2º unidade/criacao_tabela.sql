DROP TABLE tb_produtora;
DROP TABLE tb_filme;
DROP TABLE tb_ambiente_grav;
DROP TABLE tb_camera;
DROP TABLE tb_cenario;
DROP TABLE tb_computador;
DROP TABLE tb_diretor;
DROP TABLE tb_ator;
DROP TABLE tb_editor;
DROP TABLE tb_contrato_diretor;
DROP TABLE tb_contrato_ator;
DROP TABLE tb_contrato_editor;
DROP TABLE tb_utiliza;
DROP TABLE tb_adquirir;
DROP TABLE tb_monta;
DROP TABLE tb_revisa;

CREATE TABLE tb_produtora OF tp_produtora(
	PRIMARY KEY (cnpj)
)NESTED TABLE telefone STORE AS tb_telefone_prod;

CREATE TABLE tb_filme OF tp_filme(
	PRIMARY KEY (nome),
	FOREIGN KEY (ref_produtora) REFERENCES tb_produtora
);

CREATE TABLE tb_ambiente_grav OF tp_ambiente_grav(
	PRIMARY KEY(nome)
);

CREATE TABLE tb_camera OF tp_camera(
	PRIMARY KEY(tomb)
)NESTED TABLE lentes STORE AS tb_lentes;

CREATE TABLE tb_cenario OF tp_cenario(
	PRIMARY KEY(tomb)
);

CREATE TABLE tb_computador OF tp_computador(
	PRIMARY KEY(tomb)
);

CREATE TABLE tb_diretor OF tp_diretor(
	PRIMARY KEY(cpf),
	FOREIGN KEY (ref_produtora) REFERENCES tb_produtora,
	FOREIGN KEY (ref_filme) REFERENCES tb_filme,
	FOREIGN KEY (ref_chefe) REFERENCES tb_diretor
)NESTED TABLE telefone STORE AS tb_telefone_diretor
NESTED TABLE email STORE AS tb_email_diretor;

CREATE TABLE tb_ator OF tp_ator(
	PRIMARY KEY(cpf),
	FOREIGN KEY (ref_produtora) REFERENCES tb_produtora
)NESTED TABLE telefone STORE AS tb_telefone_ator
NESTED TABLE email STORE AS tb_email_ator;

CREATE TABLE tb_editor OF tp_editor(
	PRIMARY KEY(cpf),
	FOREIGN KEY (ref_produtora) REFERENCES tb_produtora
)NESTED TABLE telefone STORE AS tb_telefone_editor
NESTED TABLE email STORE AS tb_email_editor;

-- problema nessa tabela!!!!
CREATE TABLE tb_contrato_diretor OF tp_contrato_diretor(
	PRIMARY KEY(cpf, numero),
	FOREIGN KEY (ref_diretor) REFERENCES tb_diretor
);

CREATE TABLE tb_contrato_ator OF tp_contrato_ator(
	PRIMARY KEY(cpf, numero),
	FOREIGN KEY (ref_ator) REFERENCES tb_ator
);

CREATE TABLE tb_contrato_editor OF tp_contrato_editor(
	PRIMARY KEY(cpf, numero),
	FOREIGN KEY (ref_editor) REFERENCES tb_editor
);

CREATE TABLE tb_utiliza OF tp_utiliza(
	PRIMARY KEY(cpf,tomb),
	FOREIGN KEY (ref_computador) REFERENCES tb_computador
);

CREATE TABLE tb_aquirir OF tp_aquirir(
	PRIMARY KEY(nome_filme,tomb),
	nome_grav NOT NULL,
	FOREIGN KEY (ref_equipamentos) REFERENCES tb_equipamentos,
	FOREIGN KEY (ref_ambiente_grav) REFERENCES tb_ambiente_grav
);

CREATE TABLE tb_monta OF tp_monta(
	PRIMARY KEY(cpf,nome_filme),
	FOREIGN KEY (ref_editor) REFERENCES tb_editor,
	FOREIGN KEY (ref_filme) REFERENCES tb_filme
);

CREATE TABLE tb_revisa OF tp_revisa(
	PRIMARY KEY(cpf_diretor,nome_filme,cpf_editor),
	FOREIGN KEY (ref_diretor) REFERENCES tb_diretor,
	FOREIGN KEY (ref_monta) REFERENCES tb_monta
);