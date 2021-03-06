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

--48. Bloco anônimo com declaração de variável e instrução
--49. Bloco anônimo com exceção
--50. Uso de IF­THEN­ELSE
--51. Uso de ELSIF
--52. Uso de CASE
--53. LOOP com instrução de saída
--54. WHILE LOOP
--55. FOR LOOP
--56. Recuperação de dados para variável
--57. Recuperação de dados para registro


--58. Output de string com variável

--59. Uso de cursor explícito com ​variável

--60. Uso de cursor explícito com ​registro

--61. Uso de cursor explícito com ​parâmetro

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

--- outro
SET serveroutput ON;
DECLARE 
	v_media funcionario.salario%TYPE;
	v_novo_salario funcionario.salario%TYPE;
	e funcionario%ROWTYPE;
BEGIN
	SELECT avg(funcionario.salario) INTO v_media FROM diretor, funcionario WHERE funcionario.cpf = diretor.cpf and diretor.atuacao = 'GERAL';  
	FOR e IN (SELECT * FROM funcionario)
	LOOP
		IF e.salario < v_media THEN
			UPDATE funcionario SET funcionario.salario = e.salario + e.salario*0.5 WHERE funcionario.cpf = e.cpf;
			dbms_output.put_line('Funcionario promovido com 50%:' || e.nome);
		END IF; 
	END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE print_ruas IS 
	v_rua ceps%ROWTYPE;
BEGIN
	FOR v_rua IN (SELECT * FROM ceps)
	LOOP
		dbms_output.put_line(v_rua.cep||' -----> '||v_rua.rua);
	END LOOP;
	COMMIT;
END print_ruas;


SET serveroutput ON;

DECLARE
	PROCEDURE print_ruas IS 
		v_rua ceps%ROWTYPE;
	BEGIN
		FOR v_rua IN (SELECT * FROM ceps)
		LOOP
		dbms_output.put_line(v_rua.cep||' -----> '||v_rua.rua);
		END LOOP;
	END print_ruas;
BEGIN
	print_ruas;
END;
/

BEGIN
	insere_produtora('alksjda', 11111111111111, 919291, 'arrocha');
END;
/

DECLARE
	dir funcionario.nome%TYPE;
	dir_cpfss funcionario.cpf%TYPE; 
BEGIN	
	diretor_bem_pago(dir,dir_cpfss);
	dbms_output.put_line(dir|| '  ' || dir_cpfss);
END;
/