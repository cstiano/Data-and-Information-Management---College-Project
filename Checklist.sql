-- 1. Uso de BETWEEN com ​valores numéricos
-- 17. Operadores aritméticos no SELECT (salário por mês)
SELECT nome, (salario/12) FROM funcionario
WHERE salario BETWEEN 360000 AND 500000;
-- 2. Uso de BETWEEN com ​datas
SELECT nome, sexo FROM funcionario
WHERE dt_nascimento BETWEEN to_date('01/01/1965', 'dd/mm/yy')AND to_date('01/01/1970', 'dd/mm/yy');
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
ALTER TABLE contratos MODIFY data_fim DEFAULT to_date('01/01/2000', 'dd/mm/yyyy');
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
WHERE cpf IN (SELECT cpf FROM diretor WHERE atuacao = 'GERAL')
-- 19. Função de agregação com ​GROUP BY
SELECT atuacao, max(quant_filmes_trabalhados) from diretor
GROUP BY atuacao;
-- 20. Uso de DISTINCT
SELECT DISTINCT atuacao FROM diretor
WHERE quant_premiacoes >= 4;
