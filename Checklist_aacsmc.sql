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