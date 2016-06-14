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

DROP TYPE tp_sala FORCE;
DROP TYPE tp_cartaz FORCE;
DROP TYPE tp_salas FORCE;
DROP TYPE tp_nt_cartaz FORCE;
DROP TYPE tp_cinema FORCE;

CREATE OR REPLACE TYPE tp_sala AS OBJECT(
	area NUMBER,
	poltronas NUMBER
);
/

CREATE OR REPLACE TYPE tp_cartaz AS OBJECT(
	filme tp_filme,
	largura NUMBER,
	altura NUMBER,
	data_estreia DATE
);
/

CREATE OR REPLACE TYPE tp_salas AS VARRAY(5) OF tp_sala;
/

CREATE OR REPLACE TYPE tp_nt_cartaz AS TABLE OF tp_cartaz;
/

CREATE OR REPLACE TYPE tp_cinema AS OBJECT(
	salas tp_salas,
	cartaz tp_nt_cartaz
);
/

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

--Q11, Q12, Q13, Q14, Q15
ALTER TYPE tp_endereco
ADD ATTRIBUTE (num INTERGER) CASCADE;

ALTER TYPE tp_endereco
MODIFY ATTRIBUTE (num NUMBER) CASCADE;

ALTER TYPE tp_endereco
DROP ATTRIBUTE (num) CASCADE; 


ALTER TYPE tp_filme
ADD ATTRIBUTE (n_filme NUMBER) CASCADE; 

ALTER TYPE TP_FUNCIONARIO
ADD ATTRIBUTE (no_filme NUMBER) INVALIDATE; 


--Q16
--Q17
SELECT DEREF(ref_chefe).nome FROM tb_diretor WHERE ref_chefe IS NOT DANGLING;


--Q18
-- No script de criação

--Q19 / Q20
SELECT DEREF(ref_chefe).ref_filme.nome AS GOOD_MOVIE FROM tb_diretor A WHERE A.quant_filmes_trabalhados > 5;



--Q20
select DEREF(T.ref_produtora) as Produtora from tb_ator T where T.cpf = 00000000016;


--Q21
select value(T) as Ator from tb_ator T where T.cpf = 00000000016;

--Q22
select* from table(select telefone from tb_produtora where cnpj = 22222222222222); 

--Q23
select F.nome,F.faturamento, F.data_lancamento AS data from tb_filme F where F.nome like 'O %' 
and F.faturamento between 20000000.00 and 70000000.00
group by F.nome,F.faturamento, F.data_lancamento
having F.faturamento >  40000000.00
order by F.nome DESC;

--Q24
select D.nome from tb_diretor D where D.nome_filme 
in (select F.nome from tb_filme F  where F.data_lancamento BETWEEN to_date('01/Jan/2002', 'dd/mm/yy') AND to_date('01/Jan/2100', 'dd/mm/yy'))
and D.quant_premiacoes < any (select D.quant_premiacoes + 2 from tb_diretor D)
and D.quant_premiacoes > all (select D.quant_premiacoes - 2 from tb_diretor D);

--Q25

--Q26

--Q27
select C.ref_editor.nome from tb_computador C 
where exists (select * from tb_editor where quant_premiacoes < 2);

--Q28. Criação de TRIGGER de linha ao ocorrer um INSERT, DELETE ou UPDATE, TEST APOS Q30
drop TRIGGER GoodOP;
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER GoodOP AFTER
UPDATE OR INSERT OR DELETE ON tb_ator for each row
DECLARE
BEGIN
dbms_output.put_line('Operacao feita com sucesso!');
END;
/

--Q29 Criação de TRIGGER de linha para impedir INSERT, DELETE ou UPDATE, TEST APOS Q30
drop TRIGGER INVALIDed;

CREATE OR REPLACE TRIGGER INVALIDed AFTER
UPDATE OR INSERT OR DELETE ON tb_editor for each row
DECLARE
BEGIN
RAISE_APPLICATION_ERROR(-20513, 'Por Favor não mudar esta linha');
END;
/

--Q30 Criação de TRIGGER de comando para impedir INSERT, DELETE ou UPDATE, TEST APOS A QUESTAO
drop TRIGGER INVAL;

CREATE OR REPLACE TRIGGER INVAL AFTER
UPDATE OR INSERT OR DELETE ON tb_diretor
DECLARE
BEGIN
RAISE_APPLICATION_ERROR(-20514, 'Por Favor não mudar esta tabela');
END;
/



INSERT INTO tb_ator VALUES(
	11211111125,
	33333333333333, 
	'Andrew Garafield', 		
	to_date('20/08/1983', 'dd/mm/yy'), 
	'M', 
	675123.00,
	tp_nt_fone(081111127216),
	tp_nt_email('Andrew@produtora.com.br'),
	tp_endereco(00010003, 'Rua do Aranha','n 1242'),
	(SELECT REF(A) FROM tb_produtora A WHERE A.cnpj = 33333333333333),
	'Spider-Man',	
	'Agencia11', 
	NULL
);

INSERT INTO tb_editor VALUES(
	10101010018,
	33333333333333, 
	'Steve Kloves ', 	 
	to_date('26/05/1962', 'dd/mm/yy'), 
	'M', 
	732862.00,
	tp_nt_fone(081991547215),
	tp_nt_email('steve@produtora.com.br'),
	tp_endereco(00000006, 'Rua do klovinho','n 1234'), 
	(SELECT REF(E) FROM tb_produtora E WHERE E.cnpj = 33333333333333),
	1,	
	'IMAGEM',	
	10
);

INSERT INTO tb_diretor VALUES(
	00101000014,
	33333333333333, 
	'Filpe Abreu', 
	to_date('31/08/1990', 'dd/mm/yy'), 
	'M', 
	966429.00,
	tp_nt_fone(081991244512),
	tp_nt_email('felps@produtora.com.br'),
	tp_endereco(00000002, 'Rua do men','n 12'), 
	(SELECT REF(D) FROM tb_produtora D WHERE D.cnpj = 33333333333333),
	'O Hobbit', 
	0, 
	'GERAL', 				
	6,
	NULL,
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'O Hobbit'), 	 	  
	NULL
);
