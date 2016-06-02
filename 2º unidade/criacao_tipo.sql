DROP TYPE tp_nt_fone force;
DROP TYPE tp_nt_email force;
DROP TYPE tp_nt_lentes force;
DROP TYPE tp_endereco force;
DROP TYPE tp_produtora force;
DROP TYPE tp_filme force;
DROP TYPE tp_ambiente_grav force;
DROP TYPE tp_equipamentos force;
DROP TYPE tp_camera force;
DROP TYPE tp_cenario force;
DROP TYPE tp_computador force;
DROP TYPE tp_funcionario force;
DROP TYPE tp_diretor force;
DROP TYPE tp_ator force;
DROP TYPE tp_editor force;
DROP TYPE tp_contratos force;
DROP TYPE tp_utiliza force;
DROP TYPE tp_adquirir force;
DROP TYPE tp_monta force;
DROP TYPE tp_revisa force;

CREATE OR REPLACE TYPE tp_nt_fone AS TABLE OF NUMBER;
/ 
CREATE OR REPLACE TYPE tp_nt_email AS TABLE OF VARCHAR2(50);
/
CREATE OR REPLACE TYPE tp_nt_lentes AS TABLE OF VARCHAR2(50);
/
CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
	cep NUMBER,
	rua VARCHAR2(50),
	completo VARCHAR2(50)
)FINAL;
/
CREATE OR REPLACE TYPE tp_produtora AS OBJECT(
	cnpj NUMBER,
	nome VARCHAR2(50),
	telefone tp_nt_fone,
	endereco tp_endereco
)FINAL;
/
CREATE OR REPLACE TYPE tp_filme AS OBJECT(
	nome VARCHAR2(50),
	data_lancamento DATE,
	faturamento NUMBER,
	data_inicio DATE,
	ref_produtora REF tp_produtora
)FINAL;
/
CREATE OR REPLACE TYPE tp_ambiente_grav AS OBJECT(
	nome VARCHAR2(50),
	tamanho NUMBER,
	endereco tp_endereco
)FINAL;
/
CREATE OR REPLACE TYPE tp_equipamentos AS OBJECT(
	tomb NUMBER,
	nome_equipamento VARCHAR2(50),
	preco NUMBER(9,2),
	vida_util VARCHAR2(50)
)NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE tp_camera UNDER tp_equipamentos(
	modelo VARCHAR2(50),
	fabricante VARCHAR2(50)
);
/
CREATE OR REPLACE TYPE tp_cenario UNDER tp_equipamentos(
	tema VARCHAR2(50),
	material VARCHAR2(50),
	tamanho NUMBER
);
/
CREATE OR REPLACE TYPE tp_computador UNDER tp_equipamentos(
	processador VARCHAR2(30),
	memoria VARCHAR2(50),
	disco_rigido VARCHAR2(50)
);
/
CREATE OR REPLACE TYPE tp_funcionario AS OBJECT(
	cpf NUMBER,
	nome VARCHAR2(50),
	dt_nascimento DATE,
	sexo VARCHAR2(1),
	salario DECIMAL(12,2),
	telefone tp_nt_fone,
	email tp_nt_email,
	endereco tp_endereco,
	ref_produtora REF tp_produtora
)NOT FINAL NOT INSTANTIABLE;
/
CREATE OR REPLACE TYPE tp_diretor UNDER tp_funcionario(
	quant_premiacoes INTEGER,
	atuacao VARCHAR2(20),
	quant_filmes_trabalhados INTEGER,
	ref_filme REF tp_filme,
	ref_chef REF tp_diretor
);/
CREATE OR REPLACE TYPE tp_ator UNDER tp_funcionario(
	personagem VARCHAR2(15),
	agencia VARCHAR2(15),
	carac_fisicas VARCHAR2(50)
);/
CREATE OR REPLACE TYPE tp_editor UNDER tp_funcionario(
	quant_premiacoes INTEGER,
	atuacao VARCHAR2(20),
	quant_filmes_trabalhados INTEGER
);/
CREATE OR REPLACE TYPE tp_contratos AS OBJECT(
	numero NUMBER,
	data_in DATE,
	data_fim DATE,
	ref_funcionario REF tp_funcionario
);/
CREATE OR REPLACE TYPE tp_utiliza AS OBJECT(
	cpf NUMBER,
	tomb NUMBER,
	ref_editor REF tp_editor,
	ref_computador REF tp_computador
);/
CREATE OR REPLACE TYPE tp_adquirir AS OBJECT(
	nome_filme VARCHAR2(50),
	tomb NUMBER,
	nome_grav VARCHAR2(50),
	ref_filme REF tp_filme,
	ref_equipamentos REF tp_equipamentos,
	ref_ambiente_grav REF tp_ambiente_grav
);/
CREATE OR REPLACE TYPE tp_monta AS OBJECT(
	nome_filme VARCHAR2(50),
	cpf NUMBER,
	ref_editor REF tp_editor,
	ref_filme REF tp_filme
);/
CREATE OR REPLACE TYPE tp_revisa AS OBJECT(
	data DATE,
	cpf_editor NUMBER,
	cpf_diretor NUMBER,
	nome_filme VARCHAR2(50),
	ref_diretor REF tp_diretor,
	ref_monta REF tp_monta
);/