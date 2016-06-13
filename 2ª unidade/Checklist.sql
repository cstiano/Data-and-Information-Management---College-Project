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

SELECT DEREF(ref_chefe).nome FROM tb_diretor WHERE ref_chefe IS NOT DANGLING;

--Q17


--Q18
-- No script de criação

--Q19 / Q20
SELECT DEREF(ref_chefe).ref_filme.nome AS GOOD_MOVIE FROM tb_diretor A WHERE A.quant_filmes_trabalhados > 5;
