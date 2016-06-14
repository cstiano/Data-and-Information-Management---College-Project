set serveroutput on;

-- 1. Criação de tipo e subtipo
-- 2. Criação de um tipo que contenha um atributo que seja de um outro tipo
-- 5. Criação e chamada de um método construtor (diferente do padrão)
-- 6. Criação e chamada de um função membro em um comando SELECT e em um bloco PL
-- 7. Criação e chamada de um método MAP em um comando SELECT e em um bloco PL
-- 10. Redefinição de método do supertipo dentro do subtipo

DROP TABLE tb_ingresso_digital force;
DROP TYPE tp_ingressoDigital force;
DROP TYPE tp_ingresso force;

CREATE OR REPLACE TYPE tp_ingresso AS OBJECT(
	numero_ingresso NUMBER,
	filme tp_filme,
	sessao DATE,
	valor NUMBER(5,2),

	MEMBER FUNCTION impostoIngresso RETURN NUMBER,

	MAP MEMBER FUNCTION ingressoToNumber RETURN NUMBER

)NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_ingresso IS

	MEMBER FUNCTION impostoIngresso RETURN NUMBER IS

	BEGIN
		RETURN valor*0.048;
	END;

	MAP MEMBER FUNCTION ingressoToNumber RETURN NUMBER IS
		p NUMBER := numero_ingresso;
	BEGIN
		RETURN p;
	END;
END;
/

CREATE OR REPLACE TYPE tp_ingressoDigital UNDER tp_ingresso(
	nome_cliente VARCHAR2(20),

	CONSTRUCTOR FUNCTION tp_ingressoDigital (x1 tp_ingresso, nome VARCHAR2) RETURN SELF AS RESULT,

	OVERRIDING MEMBER FUNCTION impostoIngresso RETURN NUMBER

) FINAL;
/

CREATE OR REPLACE TYPE BODY tp_ingressoDigital IS

	CONSTRUCTOR FUNCTION tp_ingressoDigital(x1 tp_ingresso, nome VARCHAR2) RETURN SELF AS RESULT IS
	BEGIN
		numero_ingresso := x1.numero_ingresso;
		filme := x1.filme;
		sessao := x1.sessao;
		valor := x1.valor;
		nome_cliente := nome;
		RETURN;
	END;

	OVERRIDING MEMBER FUNCTION impostoIngresso RETURN NUMBER IS
	BEGIN
		RETURN valor*0.051;
	END;


END;
/

-- CHAMADA DO CONSTRUTOR

CREATE TABLE tb_ingresso_digital OF tp_ingressoDigital(
	PRIMARY KEY(numero_ingresso)
);

INSERT INTO tb_ingresso_digital VALUES ( tp_ingressoDigital( tp_ingresso(08062016, tp_filme('O espetacular Homem-Aranha',
																		11111111111111,
																		to_date('02/11/2001', 'dd/mm/yy'),
																		50000000.00,
																		to_date('02/11/2000', 'dd/mm/yy'),
																		(SELECT REF(F) FROM tb_produtora F WHERE F.cnpj = 11111111111111)
																		), 
										 to_date('08/06/2016', 'dd/mm/yyyy'), 25.00), 'Anderson Silva'));

-- CHAMADA DA MEMBER FUNCTION E DO MAP

SELECT *
FROM tb_ingresso_digital ID
WHERE ID.impostoIngresso() > 1.10

SELECT ID.filme.nome
FROM tb_ingresso_digital ID
WHERE ID.ingressoToNumber() = 08062016

DECLARE
	ingresso tp_ingressoDigital;
	imposto NUMBER;
	num NUMBER;
BEGIN
	SELECT VALUE(ID) INTO ingresso
	FROM tb_ingresso_digital ID
	WHERE ID.numero_ingresso = 08062016;

	imposto := ingresso.impostoIngresso();
	num := ingresso.ingressoToNumber();

	DBMS_OUTPUT.PUT_LINE('Numero do ingresso :' || num);
	DBMS_OUTPUT.PUT_LINE('Imposto cobrado no ingresso: ' || imposto);

END;
/

-- 3. Criação de um tipo que contenha um atributo que seja de um tipo VARRAY

-- 4. Criação de um tipo que contenha um atributo que seja de um tipo NESTED TABLE

-- 8. Criação e chamada de um método ORDER em um comando SELECT e em um bloco PL
DROP TABLE tb_ingresso force;
DROP TYPE tp_ingressoDigital force;
DROP TYPE tp_ingresso force;

CREATE OR REPLACE TYPE tp_ingresso AS OBJECT(
	numero_ingresso NUMBER,
	filme tp_filme,
	sessao DATE,
	valor NUMBER(5,2),

	ORDER MEMBER FUNCTION comparaValor(X tp_ingresso) RETURN NUMBER

)NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_ingresso IS

	ORDER MEMBER FUNCTION comparaValor(X tp_ingresso) RETURN NUMBER IS
	BEGIN
		RETURN SELF.valor - X.valor;
	END;
END;
/

CREATE TABLE tb_ingresso OF tp_ingresso(
	PRIMARY KEY(numero_ingresso)
);

INSERT INTO tb_ingresso VALUES (tp_ingresso(08062016, tp_filme('O espetacular Homem-Aranha',
																11111111111111,
																to_date('02/11/2001', 'dd/mm/yy'),
																50000000.00,
																to_date('02/11/2000', 'dd/mm/yy'),
																(SELECT REF(F) FROM tb_produtora F WHERE F.cnpj = 11111111111111)
																), 
										 to_date('08/06/2016', 'dd/mm/yyyy'), 25.00));

INSERT INTO tb_ingresso VALUES (tp_ingresso(01234567, tp_filme('O Hobbit',
																33333333333333,
																to_date('02/11/2005', 'dd/mm/yy'),
																50000000.00,
																to_date('02/11/2000', 'dd/mm/yy'),
																(SELECT REF(F) FROM tb_produtora F WHERE F.cnpj = 33333333333333)
																), 
										 to_date('09/06/2016', 'dd/mm/yyyy'), 19.00));

SELECT I.comparaValor(SELECT *
					  FROM tb_ingresso tb
					  WHERE numero_ingresso = 08062016)
FROM tb_ingresso I


DECLARE
	mb tp_ingresso;
	m NUMBER;
BEGIN
	SELECT VALUE(P) INTO mb
	FROM tb_ingresso P
	WHERE p.numero_ingresso = 08062016;

	SELECT D.comparaValor(mb) INTO m
	FROM tb_ingresso D
	WHERE D.numero_ingresso = 01234567;

	IF m > 0 THEN DBMS_OUTPUT.PUT_LINE('Ingresso mais caro que ' || mb.valor || ' reais.'); END IF;
	IF m = 0 THEN DBMS_OUTPUT.PUT_LINE('Ingresso com o mesmo valor que ' || mb.valor || ' reais.'); END IF;
	IF m < 0 THEN DBMS_OUTPUT.PUT_LINE('Ingresso mais barato que ' || mb.valor || ' reais.'); END IF;
END;
/

-- 9. Criação e chamada de método abstrato
DROP TYPE tp_midia force;
DROP TYPE tp_dvd force;
DROP TABLE tb_dvd;

CREATE OR REPLACE TYPE tp_midia AS OBJECT(
	num_serie NUMBER,
	cap_armazenamento NUMBER,
	num_faixas NUMBER,
	faixa_atual NUMBER,

	NOT INSTANTIABLE MEMBER PROCEDURE play(faixa NUMBER)

) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_dvd UNDER tp_midia(

	OVERRIDING MEMBER PROCEDURE play(faixa NUMBER)
)FINAL;
/

CREATE OR REPLACE TYPE BODY tp_dvd AS
	
	OVERRIDING MEMBER PROCEDURE play(faixa NUMBER) iS
	BEGIN

		IF faixa > SELF.num_faixas THEN
			DBMS_OUTPUT.PUT_LINE('Erro.');
		ELSE
			SELF.faixa_atual := faixa;
			DBMS_OUTPUT.PUT_LINE('Tocando a faixa ' || SELF.faixa_atual);
		END IF;
	END;

END;
/

CREATE TABLE tb_dvd OF tp_dvd(
	PRIMARY KEY(num_serie)
);

INSERT INTO tb_dvd VALUES (tp_dvd(512312, 1024, 10, 0));

DECLARE
dvd tp_dvd;
BEGIN
	SELECT VALUE(D) INTO dvd
	FROM tb_dvd D
	WHERE D.num_serie = 512312;

	dvd.play(3);
END;
/
