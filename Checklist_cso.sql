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
