-- 1. Uso de BETWEEN com ​valores numéricos
-- 17. Operadores aritméticos no SELECT (salário por mês)
SELECT nome, (salario/12) FROM funcionario
WHERE salario BETWEEN 360000 AND 500000;
-- 2. Uso de BETWEEN com ​datas
SELECT nome, sexo FROM funcionario
WHERE dt_nascimento BETWEEN to_date('01/Jan/1965', 'dd/mm/yy')AND to_date('01/Jan/1970', 'dd/mm/yy');
-- 3. Uso de LIKE/NOT LIKE com tokens (% ou _)
SELECT cpf, sexo FROM funcionario
WHERE nome LIKE 'Te%';
-- 4. Uso de IN com subconsulta
-- 5. Uso de IS NULL/IS NOT NULL
-- 6. Uso de ORDER BY
SELECT nome, sexo FROM funcionario
WHERE cpf IN
(SELECT cpf FROM diretor WHERE atuacao = 'GERAL' AND cpf_supervisor IS NULL)
ORDER BY salario;
-- 7. Criação de VIEW
CREATE VIEW chefes AS SELECT cpf, quant_premiacoes, atuacao FROM diretor
WHERE cpf_supervisor IS NULL;
-- 8. Consulta sobre VIEW
SELECT cpf FROM chefes WHERE atuacao = 'GERAL';
-- 9. Deleção de VIEW
DROP VIEW chefes;
-- 10. Criar CHECKs
ALTER TABLE editor ADD CONSTRAINT c_filmes_t CHECK (quant_filmes_trabalhados >= 1);
-- 11. Criar PK ​Composta
ALTER TABLE telefone_func DROP CONSTRAINT telefone_func_pk;
ALTER TABLE telefone_func ADD CONSTRAINT telefone_func_pk PRIMARY KEY (cpf, fone);
-- 13. Usar Valor DEFAULT ​(Ex: Data do Sistema)
ALTER TABLE contratos MODIFY data_fim DEFAULT to_date('01/Jan/2000', 'dd/mm/yyyy');
-- 14. Usar ALTER TABLE para Modificação de Coluna
ALTER TABLE equipamentos MODIFY preco DECIMAL(10,2);
-- 15. Usar ALTER TABLE para Adicionar Coluna
ALTER TABLE filme ADD prod_fone number;
ALTER TABLE filme ADD temp number;
-- 12. Criar FK ​Composta
ALTER TABLE filme ADD CONSTRAINT prod_fone_fk FOREIGN KEY (cnpj_prod, prod_fone) REFERENCES prod_fone(cnpj, fone);
-- 16. Usar ALTER TABLE para Remover de Coluna
ALTER TABLE filme DROP COLUMN temp;
-- 18. Função de agregação sem ​GROUP BY
SELECT max(salario) from funcionario
WHERE cpf IN (SELECT cpf FROM diretor WHERE atuacao = 'GERAL');
-- 19. Função de agregação com ​GROUP BY
SELECT atuacao, max(quant_filmes_trabalhados) FROM diretor
GROUP BY atuacao;
-- 20. Uso de DISTINCT
SELECT DISTINCT atuacao FROM diretor
WHERE quant_premiacoes >= 4;

-- 21. Uso de HAVING
SELECT atuacao, count(*) FROM diretor
GROUP BY atuacao
HAVING count(*)>=3;

--22. Uso de HAVING com subconsulta
--24. Junção entre duas tabelas
SELECT diretor.atuacao, count(diretor.atuacao) as Quant_por_atucao, avg(diretor.atuacao) as Media_Salarial
FROM diretor, funcionario WHERE funcionario.cpf = diretor.cpf
GROUP BY diretor.atuacao
HAVING avg(diretor.atuacao)> (SELECT avg(salario) WHERE funcionario);

--23. Uso de WHERE + HAVING
SELECT atuacao, count(*) FROM diretor
WHERE quant_premiacoes > 1
GROUP BY atuacao
HAVING count(*)>=3;

--25. Junção entre três tabelas + condição de seleção (M:N)
SELECT funcionario.nome, filme.data_lan, editor.quant_filmes_trabalhados as Jobs
FROM filme, monta, funcionario, editor
WHERE monta.cpf = funcionario.cpf and filme.nome_filme = monta.nome_filme and editor.cpf = monta.cpf
and editor.quant_filmes_trabalhados >= (SELECT avg(quant_filmes_trabalhados) FROM editor);

--26. Junção usando INNER JOIN
SELECT cenario.tema, equipamentos.nome_equipamento
FROM cenario INNER JOIN equipamentos
ON cenario.tomb = equipamentos.tomb;

--27. Junção usando LEFT OUTER JOIN
SELECT filme.nome_filme, diretor.cpf
FROM filme LEFT OUTER JOIN diretor
ON filme.nome_filme = diretor.nome_filme_dirigido;

--28. Junção usando RIGHT OUTER JOIN
SELECT filme.nome_filme, diretor.cpf
FROM filme RIGHT OUTER JOIN diretor
ON filme.nome_filme = diretor.nome_filme_dirigido;

--29. Junção usando FULL OUTER JOIN
SELECT filme.nome_filme, diretor.cpf
FROM filme FULL OUTER JOIN diretor
ON filme.nome_filme = diretor.nome_filme_dirigido;

--30. Uma subconsulta com ​uso de ANY ou SOME
SELECT funcionario.nome, diretor.atuacao
FROM funcionario, diretor
WHERE funcionario.cpf = diretor.cpf and diretor.atuacao <> 'GERAL'
and diretor.quant_premiacoes > SOME(SELECT quant_premiacoes FROM diretor WHERE atuacao = 'GERAL')
ORDER BY funcionario.nome;

-- 31. Uma subconsulta com ​uso de ALL
SELECT nome, salario FROM funcionario
WHERE salario > ALL(500000, 800000);
-- 32. Uma subconsulta com ​uso de EXISTS/NOT EXISTS
-- 33. Uma subconsulta com ​uso de ALIAS ​com consultas aninhadas
SELECT F.nome FROM funcionario F
WHERE EXISTS (SELECT D.cpf_supervisor FROM diretor D WHERE F.cpf != D.cpf );
-- 34. Uso de UNION
(SELECT P.fone FROM prod_fone P)
UNION
(SELECT F.fone FROM telefone_func F);
-- 35. Uso de INTERSECT
(SELECT C.tomb FROM camera C)
INTERSECT
(SELECT L.tomb FROM lentes L);
-- 36. Uso de MINUS
(SELECT C.tomb FROM camera C)
MINUS
(SELECT L.tomb FROM lentes L WHERE lente LIKE 'X%' OR lente LIKE 'W%' OR lente LIKE 'O%');
-- 37. INSERT com subconsulta
INSERT INTO lentes (tomb, lente) VALUES ((SELECT MAX(tomb) FROM camera), 'XQ877');
-- 38. UPDATE com subconsulta
UPDATE filme SET data_inicio = to_date('16/Jan/2008', 'dd/mm/yy')
WHERE nome_filme IN (SELECT nome_filme FROM filme WHERE faturamento > 180004688);
-- 39. DELETE com subconsulta
DELETE FROM lentes WHERE tomb = 39;
-- 40. Uso de GRANT
CREATE ROLE Lucas;
GRANT DELETE
ON funcionario
TO Lucas;
-- 41. Uso de REVOKE
REVOKE DELETE ON funcionario FROM Lucas;


-- 42. Subconsulta dentro da cláusula FROM (VIEW implícita)
SELECT nome_equipamento, vida_util
FROM (	SELECT *
		FROM equipamentos
		WHERE preco > 70000.00);

-- 43. Operação aritmética com função de agregação como operador
SELECT nome_equipamento
FROM equipamentos
WHERE preco < 5000 + (	SELECT AVG(preco)/2
						FROM equipamentos);

-- 44. Uso de BETWEEN com valores numéricos retornados por funções de agregação
-- 46. ORDER BY com mais de dois campos
SELECT nome, cpf, salario, dt_nascimento, sexo
FROM funcionario
WHERE salario BETWEEN (SELECT MIN(salario) FROM funcionario) AND (SELECT AVG(salario) FROM funcionario)
ORDER BY sexo, salario DESC, dt_nascimento;

-- 45. Junção entre três tabelas usando INNER JOIN ou OUTER JOIN
SELECT P.nome as Produtora, F.nome_filme as Filme, Fc.nome as Funcionario
FROM produtora P 	LEFT OUTER JOIN filme F ON P.cnpj = F.cnpj_prod
					LEFT OUTER JOIN funcionario Fc ON P.cnpj = Fc.cnpj_c;


-- 47. EXISTS com mais de uma tabela, sem fazer junção
SELECT P.nome
FROM produtora P
WHERE EXISTS (	SELECT *
				FROM funcionario Func, filme F
				WHERE F.faturamento > 30000000 AND Func.salario < 15300);



-- PL ­ básicas
-- 48. Bloco anônimo com declaração de variável e instrução
-- 49. Bloco anônimo com exceção
-- 50. Uso de IF­THEN­ELSE
-- 51. Uso de ELSIF
SET SERVEROUTPUT ON;
DECLARE
maximus funcionario.nome%type;
BEGIN
SELECT nome INTO maximus FROM funcionario
WHERE salario >= 1009931;
dbms_output.put_line(to_char(maximus));
IF maximus = 'Joao Pedro' THEN
dbms_output.put_line('Joao Over');
ELSIF maximus = 'Pedro Paulo' THEN
dbms_output.put_line('Pedro Over');
ELSE
dbms_output.put_line('Over for: ' || maximus);
END IF;
EXCEPTION
WHEN TOO_MANY_ROWS THEN
dbms_output.put_line('Wrong my Dear');
END;
/
-- 52. Uso de CASE
DECLARE
atua diretor.atuacao%type;
BEGIN
SELECT D.atuacao INTO atua FROM diretor D, funcionario F
WHERE F.salario > 200000 AND F.cpf = D.cpf AND cpf_supervisor IS NULL
AND quant_premiacoes > 5;
  CASE
  WHEN atua = 'GERAL' THEN
  dbms_output.put_line('Do everything');
  WHEN atua = 'DESIGN' THEN
  dbms_output.put_line('Is right for it');
  ELSE
  dbms_output.put_line('Sorry, he can`t');
  END CASE;
END;

-- 53. LOOP com instrução de saída
-- 56. Recuperação de dados para variável
-- 57. Recuperação de dados para registro
-- 60. Uso de cursor explícito com registro
SET SERVEROUTPUT ON;
DECLARE
CURSOR CD IS (SELECT * FROM diretor WHERE cpf_supervisor IS NULL);
e_dir diretor%ROWTYPE;
nomes funcionario.nome%type;
BEGIN
  OPEN CD;
  LOOP
  FETCH CD INTO e_dir;
  EXIT WHEN CD%NOTFOUND;
  SELECT nome INTO nomes FROM funcionario WHERE e_dir.cpf = cpf;
  dbms_output.put_line(nomes);
  END LOOP;
  CLOSE CD;
END;
/
-- 54. WHILE LOOP
-- 58. Output de string com variável
-- 59. Uso de cursor explícito com ​variável
-- 61. Uso de cursor explícito com ​parâmetro
SET SERVEROUTPUT ON;
DECLARE
CURSOR CD (sall funcionario.salario%type) IS (SELECT cpf FROM funcionario WHERE salario >= sall);
e_cpf diretor.cpf%type;
BEGIN
  OPEN CD (950000);
  FETCH CD INTO e_cpf;
  WHILE CD%FOUND LOOP
  FETCH CD INTO e_cpf;
  dbms_output.put_line('Func com CPF:' || to_char(e_cpf));
  END LOOP;
  CLOSE CD;
END;
/


-- 55. FOR LOOP
SET SERVEROUTPUT ON;
DECLARE
BEGIN
  FOR i IN (SELECT * FROM funcionario WHERE sexo = 'F') LOOP
        dbms_output.put_line(to_char(i.nome));
  END LOOP;
END;
/


--62. Cursor dentro de FOR (sem DECLARE)
SET serveroutput ON;
DECLARE 
  v_dir funcionario%ROWTYPE;
BEGIN
  FOR v_dir IN (SELECT * FROM funcionario)
  LOOP
    dbms_output.put_line('Funcionario: '|| v_dir.nome ||'   Salario: '|| v_dir.salario);
  END LOOP;
END;
/

--63. Procedimento sem ​parâmetro
CREATE OR REPLACE PROCEDURE print_ruas IS 
  v_rua ceps%ROWTYPE;
BEGIN
  FOR v_rua IN (SELECT * FROM ceps)
  LOOP
    dbms_output.put_line(v_rua.cep||' -----> '||v_rua.rua);
  END LOOP;
  COMMIT;
END print_ruas;
/

--64. Procedimento com ​parâmetro IN
CREATE OR REPLACE PROCEDURE insere_produtora(
  p_nome produtora.nome%TYPE, 
  p_cnpj produtora.cnpj%TYPE,
  p_cep produtora.cep%TYPE,
  p_complemento produtora.complemento%TYPE
  ) IS 
  pro_cmp produtora.cnpj%TYPE;
  cep_cmp ceps.cep%TYPE;
  BEGIN
    SELECT cnpj INTO pro_cmp FROM produtora WHERE cnpj = p_cnpj;
    IF SQL%FOUND THEN
      dbms_output.put_line('Produtora ja existe no banco:  ' || pro_cmp);
    END IF;
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN
      INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (p_cnpj,p_nome,p_cep,p_complemento);
      dbms_output.put_line('Produtora ' || p_nome ||' inserida com sucesso');
    COMMIT; 
  END insere_produtora;
/

--65. Procedimento com ​parâmetro OUT
CREATE OR REPLACE PROCEDURE diretor_bem_pago(
  dir_nome OUT funcionario.nome%TYPE,
  dir_cpf OUT funcionario.cpf%TYPE
  ) IS 
  d_nome funcionario.nome%TYPE;
  BEGIN
    SELECT funcionario.nome, funcionario.cpf INTO dir_nome, dir_cpf FROM diretor, funcionario WHERE diretor.cpf = funcionario.cpf
    and salario = (SELECT max(salario) FROM funcionario);
  END diretor_bem_pago;
/

--66. Procedimento com ​parâmetro INOUT
CREATE OR REPLACE PROCEDURE atualizacao_salario(
  d_cpf funcionario.cpf%TYPE,
  at_salario IN OUT funcionario.cep%TYPE
  ) AS
  BEGIN
    at_salario := at_salario + at_salario*0.5; 
    UPDATE funcionario SET funcionario.salario = at_salario WHERE funcionario.cpf = d_cpf;
  END atualizacao_salario;
/

--67. Uso de procedimento dentro de outro bloco PL ​(pode­se usar um dos procedimentos criados anteriormente)
DECLARE
  dir funcionario%ROWTYPE; 
BEGIN 
  diretor_bem_pago(dir.nome,dir.cpf);
  dbms_output.put_line('Diretor com maior salario: '||dir.nome);
  SELECT salario INTO dir.salario FROM funcionario WHERE funcionario.cpf = dir.cpf;
  dbms_output.put_line('Salario atual: '|| dir.salario);
  atualizacao_salario(dir.cpf, dir.salario);
  dbms_output.put_line('Salario atualizado: '|| dir.salario);
END;
/

--
-- 68. Função sem ​parâmetro
CREATE OR REPLACE FUNCTION num_editor_som RETURN NUMBER IS qtd NUMBER;
BEGIN
  SELECT COUNT(*) INTO qtd FROM editor
  WHERE atuacao = 'SOM';
  RETURN qtd;
END;
/
-- 69. Função com ​parâmetro IN
-- 70. Função com ​parâmetro OUT
SET SERVEROUT ON;
CREATE OR REPLACE FUNCTION num_dir_func (entrada IN VARCHAR2, saida OUT number) RETURN NUMBER IS qtd NUMBER;
BEGIN
  SELECT COUNT(*) INTO qtd FROM diretor WHERE atuacao = entrada;
  SELECT COUNT(*) INTO saida FROM diretor WHERE atuacao != entrada;
  RETURN qtd;
END;
/

DECLARE
nao NUMBER;
BEGIN
dbms_output.put_line(to_char(num_dir_func('GERAL', nao)));
dbms_output.put_line(to_char(nao));
END;
/

-- 71. Função com ​parâmetro INOUT
SET SERVEROUT ON;
CREATE OR REPLACE FUNCTION max_in (salary IN OUT NUMBER) RETURN NUMBER IS qtd_t NUMBER;
BEGIN
  SELECT COUNT(*) INTO qtd_t FROM funcionario WHERE salario >= salary;
  salary := qtd_t;
  SELECT COUNT(*) INTO qtd_t FROM funcionario;
  RETURN qtd_t;
END;
/

DECLARE
sall NUMBER := 550000;
BEGIN
  dbms_output.put_line(to_char(max_in(sall)));
  dbms_output.put_line(to_char(sall));
END;
/
-- 72. Criação de pacote (declaração e corpo) com pelo menos dois componentes
-- 90. Pacote com funções ou procedimentos que usem outros componentes do mesmo pacote
CREATE OR REPLACE PACKAGE procs IS
  PROCEDURE insert_cep (cepin IN NUMBER, ruain IN VARCHAR2);
  PROCEDURE insert_prod_fone (cnpjin IN NUMBER, fonein IN NUMBER);
  PROCEDURE insert_prod (cnpjin IN NUMBER, nomein IN VARCHAR2, cep2in IN NUMBER, comin IN VARCHAR2);
END procs;
/

CREATE OR REPLACE PACKAGE BODY procs IS
PROCEDURE insert_cep (cepin IN NUMBER, ruain IN VARCHAR2) IS
BEGIN
  INSERT INTO ceps(cep, rua) VALUES (cepin, ruain);
  commit;
END insert_cep;

PROCEDURE insert_prod (cnpjin IN NUMBER, nomein IN VARCHAR2, cep2in IN NUMBER, comin IN VARCHAR2) IS
BEGIN
  INSERT INTO produtora(cnpj, nome, cep, complemento) VALUES (cnpjin, nomein, cep2in, comin);
  insert_cep(cep2in, to_char('Rua' || nomein));
  commit;
END insert_prod;

PROCEDURE insert_prod_fone (cnpjin IN NUMBER, fonein IN NUMBER) IS
BEGIN
  INSERT INTO prod_fone(cnpj, fone) VALUES (cnpjin, fonein);
  commit;
END insert_prod_fone;
END procs;
/

-- Usando Package and Procedures
SET SERVEROUTPUT ON;
DECLARE
cepe NUMBER := 10000041;
ruae ceps.rua%type := 'Rua dos Bobos';
fonee NUMBER := 081883397436;
cnpje NUMBER := 44444444444444;
BEGIN
  procs.insert_cep(cepe, ruae);
  procs.insert_prod_fone(cnpje, fonee);
END;
/
-- 73. BEFORE TRIGGER
-- 76. TRIGGER de linha com ​condição
-- 78. Uso de NEW em TRIGGER de inserção
CREATE OR REPLACE TRIGGER limiteSalario BEFORE
INSERT OR UPDATE ON funcionario FOR EACH ROW
WHEN(NEW.salario > 9999999)
DECLARE
BEGIN
RAISE_APPLICATION_ERROR (-20015, 'Salário fora dos padrões');
END limiteSalario;
/
-- 74. AFTER TRIGGER
-- 75. TRIGGER de linha sem ​condição
-- 80. Uso de NEW e OLD em TRIGGER de atualização
CREATE OR REPLACE TRIGGER min_faturamento AFTER
UPDATE ON filme FOR EACH ROW
DECLARE
BEGIN
IF :NEW.faturamento < :OLD.faturamento/2 THEN
  RAISE_APPLICATION_ERROR(-20098, 'Cation: faturamento muito baixo, compromete lançamento do filme');
END IF;
END min_faturamento;
/


-- 77. TRIGGER de comando
-- 81. Uso de TRIGGER para impedir inserção em tabela
CREATE OR REPLACE TRIGGER cool_insert BEFORE
INSERT ON filme
DECLARE
day DATE := sysdate;
BEGIN
  IF day > to_date('07/Jan/2000', 'dd/mm/yyyy') THEN
    RAISE_APPLICATION_ERROR(-20500, 'Nao sera liberado inserção');
  END IF;
END cool_insert;
/


-- 79. Uso de OLD em TRIGGER de deleção
CREATE OR REPLACE TRIGGER velhote AFTER
DELETE ON filme FOR EACH ROW
DECLARE
BEGIN
dbms_output.put_line('Você deletou' || :OLD.nome_filme);
END velhote;
/

-- 83. Uso de TRIGGER para impedir deleção em tabela
CREATE OR REPLACE TRIGGER no_delete BEFORE
DELETE ON funcionario
DECLARE
BEGIN
RAISE_APPLICATION_ERROR(-20503, 'Por Favor não demitir ninguém');
END no_delete;
/
--
-- 82. Uso de TRIGGER para impedir atualização em tabela
CREATE OR REPLACE TRIGGER no_update BEFORE
UPDATE ON diretor
DECLARE
BEGIN
RAISE_APPLICATION_ERROR(-20503, 'Por Favor não mudar de diretor');
END no_delete;
/

-- 84. Uso de TRIGGER para inserir valores em outra tabela
-- 85. Uso de TRIGGER para atualizar valores em outra tabela
-- 86. Uso de TRIGGER para apagar valores em outra tabela
CREATE OR REPLACE TRIGGER wrong_place BEFORE
INSERT OR UPDATE ON produtora FOR EACH ROW
DECLARE
BEGIN
INSERT INTO ceps(cep, rua) VALUES (:NEW.cep, 'Rua' || to_char(:NEW.nome));
UPDATE prod_fone SET fone = 081234333356 WHERE cnpj = :NEW.cnpj;
DELETE FROM filme WHERE cnpj_prod = :OLD.cnpj;
END wrong_place;
/

-- 87. Uso de função dentro de uma consulta SQL ​(pode­se usar uma das funções criadas anteriormente)
CREATE OR REPLACE FUNCTION maxSall RETURN NUMBER IS
maxer NUMBER;
BEGIN
 SELECT MAX(F.salario) INTO maxer FROM funcionario F, diretor D
 WHERE F.cpf = D.cpf;
 RETURN maxer;
END;
/
SELECT F.nome, F.dt_nascimento FROM diretor D, funcionario F
WHERE D.cpf = F.cpf AND F.salario = maxSall;

-- 88. Registro como parâmetro de função ou procedimento
-- 89. Função com registro como retorno
CREATE OR REPLACE FUNCTION regmode (linin IN telefone_func%ROWTYPE) RETURN ceps%ROWTYPE IS
saindo ceps%ROWTYPE;
BEGIN
  INSERT INTO telefone_func (cpf, fone) VALUES (linin.cpf, linin.fone);
  SELECT * INTO saindo FROM ceps WHERE cep = 12345678;
  RETURN saindo;
END;
/

-- 91. INSTEAD OF TRIGGER
CREATE VIEW filmes_up AS SELECT * FROM filme WHERE faturamento > 165000000;

CREATE OR REPLACE TRIGGER troca_up INSTEAD OF
UPDATE ON filmes_up
DECLARE
BEGIN
  DELETE FROM filme WHERE :OLD.nome_filme = nome_filme;
  INSERT INTO filme(nome_filme, cnpj_prod, data_lan, faturamento, data_inicio) VALUES
  (:NEW.nome_filme, :NEW.cnpj_prod, :NEW.data_lan, :NEW.faturamento, :NEW.data_inicio);
END troca_up;
/
-- END
