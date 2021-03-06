DROP TABLE adquirir;
DROP TABLE revisa;
DROP TABLE monta;
DROP TABLE contratos;
DROP TABLE email_func;
DROP TABLE telefone_func;
DROP TABLE lentes;
DROP TABLE camera;
DROP TABLE computador;
DROP TABLE cenario;
DROP TABLE equipamentos;
DROP TABLE ambiente_de_gravacao;
DROP TABLE diretor;
DROP TABLE editor;
DROP TABLE ator;
DROP TABLE filme;
DROP TABLE prod_fone;
DROP TABLE funcionario;
DROP TABLE produtora;
DROP TABLE ceps;

CREATE TABLE ceps(
	cep NUMBER,
	rua VARCHAR2(50),
	CONSTRAINT ceps_pk PRIMARY KEY (cep)
);

CREATE TABLE produtora(
	cnpj NUMBER,
	nome VARCHAR2(50),
	cep NUMBER,
	complemento VARCHAR2(50),
	CONSTRAINT cnpj_produtora_pk PRIMARY KEY (cnpj),
	CONSTRAINT cep_produtora_fk FOREIGN KEY (cep) REFERENCES ceps(cep)
);

CREATE TABLE funcionario(
	cpf NUMBER,
	cnpj_c NUMBER NOT NULL,
	nome VARCHAR2(50) NOT NULL,
	cep NUMBER,
	complemento VARCHAR2(50),
	dt_nascimento DATE,
	sexo VARCHAR2(1) NOT NULL,
	salario DECIMAL(12,2),
	CONSTRAINT cpf_funcionario_pk PRIMARY KEY (cpf),
	CONSTRAINT cnpj_c_funcionario_fk FOREIGN KEY (cnpj_c) REFERENCES produtora(cnpj),
	CONSTRAINT cep_funcionario_fk FOREIGN KEY (cep) REFERENCES ceps(cep)
);


CREATE TABLE prod_fone(
	cnpj NUMBER,
	fone NUMBER,
	CONSTRAINT prod_fone_pk PRIMARY KEY (cnpj,fone),
	CONSTRAINT cnpj_prod_fone_fk FOREIGN KEY (cnpj) REFERENCES produtora(cnpj)
);

CREATE TABLE filme(
	nome_filme VARCHAR2(50),
	cnpj_prod NUMBER,
	data_lan DATE,
	faturamento DECIMAL(12,2),
	data_inicio DATE,
	CONSTRAINT filme_pk PRIMARY KEY (nome_filme),
	CONSTRAINT filme_fk FOREIGN KEY (cnpj_prod) REFERENCES produtora(cnpj)
);

CREATE TABLE ator(
	cpf NUMBER,
	personagem VARCHAR2(15),
	agencia VARCHAR2(15),
	carac_fisicas VARCHAR2(50),
	CONSTRAINT ator_pk PRIMARY KEY (cpf),
	CONSTRAINT ator_fk FOREIGN KEY (cpf) REFERENCES funcionario (cpf)
);


CREATE TABLE editor(
	cpf NUMBER,
	quant_premiacoes INTEGER,
	atuacao VARCHAR2(20),
	quant_filmes_trabalhados INTEGER,
	CONSTRAINT editor_pk PRIMARY KEY (cpf),
	CONSTRAINT editor_fk FOREIGN KEY (cpf) REFERENCES funcionario (cpf),
	CONSTRAINT editor_atuacao_ck CHECK (atuacao IN ('IMAGEM', 'SOM'))
);

CREATE TABLE diretor(
	cpf NUMBER,
	nome_filme_dirigido VARCHAR2(50),
	quant_premiacoes INTEGER,
	atuacao VARCHAR2(20),
	quant_filmes_trabalhados INTEGER,
	cpf_supervisor NUMBER,
	CONSTRAINT diretor_pk PRIMARY KEY (cpf),
	CONSTRAINT diretor_fk FOREIGN KEY (cpf) REFERENCES funcionario (cpf),
	CONSTRAINT diretor_fk2 FOREIGN KEY (cpf) REFERENCES diretor (cpf),
	CONSTRAINT diretor_fk3 FOREIGN KEY (nome_filme_dirigido) REFERENCES filme(nome_filme),
	CONSTRAINT diretor_atuacao_ck CHECK (atuacao IN ('GERAL', 'CINEMATOGRAFIA', 'DESIGN', 'SOM', 'MUSICAL', 'EDICAO', 'ARTE', 'MAQUIAGEM'))
);

CREATE TABLE ambiente_de_gravacao(
	nome_amb_grav VARCHAR2(50),
	tamanho NUMBER,
	cep NUMBER,
	complemento VARCHAR2(50),
	CONSTRAINT ambiente_de_gravacao_pk PRIMARY KEY (nome_amb_grav),
	CONSTRAINT cep_ambiente_fk FOREIGN KEY (cep) REFERENCES ceps(cep)
);
CREATE TABLE equipamentos(
	tomb NUMBER,
	nome_equipamento VARCHAR2(50),
	preco NUMBER(9,2),
	vida_util VARCHAR2(50),
	CONSTRAINT equipamento_pk PRIMARY KEY (tomb)
);
CREATE TABLE cenario(
	tomb NUMBER,
	tema VARCHAR2(50),
	material VARCHAR2(50),
	tamanho NUMBER,
	CONSTRAINT cenario_pk PRIMARY KEY (tomb),
	CONSTRAINT cenario_fk FOREIGN KEY (tomb) REFERENCES equipamentos(tomb)
);
CREATE TABLE computador(
	tomb NUMBER,
	cpf_editor NUMBER,
	processador VARCHAR2(30),
	memoria VARCHAR2(50),
	disco_rigido VARCHAR2(50),
	CONSTRAINT computador_pk PRIMARY KEY (tomb),
	CONSTRAINT computador_fk FOREIGN KEY (tomb) REFERENCES equipamentos(tomb),
	CONSTRAINT computador_fk2 FOREIGN KEY (cpf_editor) REFERENCES editor (cpf),
	CONSTRAINT computador_const UNIQUE (cpf_editor)
);
CREATE TABLE camera(
	tomb NUMBER,
	modelo VARCHAR2(50),
	fabricante VARCHAR2(50),
	CONSTRAINT camera_pk PRIMARY KEY (tomb),
	CONSTRAINT camera_fk FOREIGN KEY (tomb) REFERENCES equipamentos(tomb)
);
CREATE TABLE lentes(
	tomb NUMBER,
	lente VARCHAR2(50),
	CONSTRAINT lentes_pk PRIMARY KEY (tomb, lente),
	CONSTRAINT lentes_fk FOREIGN KEY (tomb) REFERENCES camera (tomb)
);
CREATE TABLE telefone_func(
	cpf NUMBER,
	fone NUMBER,
	CONSTRAINT telefone_func_pk PRIMARY KEY (cpf,fone),
	CONSTRAINT telefone_func_fk FOREIGN KEY (cpf) REFERENCES funcionario(cpf)
);
CREATE TABLE email_func(
	cpf NUMBER,
	email VARCHAR2(50),
	CONSTRAINT email_func_pk PRIMARY KEY (cpf,email),
	CONSTRAINT email_func_fk FOREIGN KEY (cpf) REFERENCES funcionario(cpf)
);
CREATE TABLE contratos(
	cpf NUMBER,
	numero NUMBER,
	data_in DATE,
	data_fim DATE,
	CONSTRAINT contratos_pk PRIMARY KEY (cpf,numero),
	CONSTRAINT contratos_fk FOREIGN KEY (cpf) REFERENCES funcionario(cpf)
);
CREATE TABLE monta(
	cpf NUMBER,
	nome_filme VARCHAR2(50),
	CONSTRAINT monta_pk PRIMARY KEY (cpf,nome_filme),
	CONSTRAINT monta_fk FOREIGN KEY (cpf) REFERENCES editor(cpf),
	CONSTRAINT monta_fk2 FOREIGN KEY (nome_filme) REFERENCES filme(nome_filme)
);
CREATE TABLE revisa(
	cpf_editor NUMBER,
	cpf_diretor NUMBER,
	nome_filme VARCHAR2(50),
	data_revisao DATE,
	CONSTRAINT revisa_pk PRIMARY KEY (cpf_editor,cpf_diretor,nome_filme,data_revisao),
	CONSTRAINT revisa_fk FOREIGN KEY (cpf_editor) REFERENCES editor(cpf),
	CONSTRAINT revisa_fk2 FOREIGN KEY (cpf_diretor) REFERENCES diretor(cpf),
	CONSTRAINT revisa_fk3 FOREIGN KEY (nome_filme) REFERENCES filme(nome_filme)
);
CREATE TABLE adquirir(
	nome_filme VARCHAR2(50),
	tomb NUMBER,
	nome_amb_grav VARCHAR2(50) NOT NULL,
	CONSTRAINT adquirir_pk PRIMARY KEY (nome_filme, tomb),
	CONSTRAINT adquirir_fk FOREIGN KEY (nome_filme) REFERENCES filme(nome_filme),
	CONSTRAINT adquirir_fk2 FOREIGN KEY (tomb) REFERENCES equipamentos(tomb),
	CONSTRAINT adquirir_fk3 FOREIGN KEY (nome_amb_grav) REFERENCES ambiente_de_gravacao (nome_amb_grav)
);
