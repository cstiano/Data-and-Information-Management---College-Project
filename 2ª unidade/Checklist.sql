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