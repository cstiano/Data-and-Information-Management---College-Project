INSERT INTO tb_produtora VALUES(
	99999999999999, 
	'Cris Studios', 
	tp_nt_fone(081999484724, 081994847249, 081916855665),
	tp_endereco(12345678,'Rua do Robo Azul','Claro')
	);

INSERT INTO tb_filme(
	'O espetacular mundo dos Aquarius',
	99999999999999,
	to_date('02/12/2021', 'dd/mm/yy'),
	50000000.01,
	to_date('01/01/2000', 'dd/mm/yy'),
	(SELECT REF(F) FROM tb_produtora F WHERE F.cnpj = 99999999999999)
	); 


INSERT INTO tb_ambiente_grav (
	'Set_4', 
	998,
	tp_endereco(00000026, 'Rua do Set_14','Galpao32')
);

INSERT INTO tb_camera (
	19,
	'Equipamento29',
	2045.00, 
	'1 anos',
	'CA021', 
	'LucasS',
	tp_nt_lentes('PE071')
);

INSERT INTO tb_cenario(
	28, 
	'Equipamento30', 
	99250.99, 
	'10 anos',
	'Mar', 
	'Bloco', 
	951
);

INSERT INTO tb_computador(
	6, 
	'Equipamento6', 
	31886.00, 
	'3 anos',
	'intel i5 877 duo core', 
	'4 GB', 
	'1 TB'
);

INSERT INTO tb_diretor(
	11151198780,
	99999999999999, 
	'Soares Santos'
	to_date('31/08/1996', 'dd/mm/yy'), 
	'M', 
	36520.00,
	tp_nt_fone(081916855872),
	tp_nt_email('SoSantos@produtora.com.br'),
	tp_endereco(00000001, 'Rua do Robo Vermelho','n 019'), 
	'O espetacular mundo dos Aquarius', 
	1, 
	'GERAL', 				
	3, 	  
	NULL,
	(SELECT REF(D) FROM tb_produtora D WHERE D.cnpj = 99999999999999)
);



INSERT INTO tb_ator(
	00000000116,
	99999999999999, 
	'Cris Brown', 		
	to_date('20/08/1998', 'dd/mm/yy'), 
	'M', 
	67523.00,
	tp_nt_fone(081991524216),
	tp_nt_email('CrisBrown@produtora.com.br'),
	tp_endereco(00000001, 'Rua do Robo Vermelho','n 020'), 
	'StrategyMan',	
	'Agencia15', 
	NULL,
	(SELECT REF(A) FROM tb_produtora A WHERE A.cnpj = 22222222222222)
);


INSERT INTO tb_editor(
	00000000118,
	99999999999999, 
	'Waldisney Severo  ', 	 
	to_date('26/05/2002', 'dd/mm/yy'), 
	'M', 
	732.00,
	tp_nt_fone(081992847215),
	tp_nt_email('waldisney@produtora.com.br'),
	tp_endereco(00000001, 'Rua do Robo Vermelho','n 24'), 
	1,	
	'IMAGEM',	
	1,
	(SELECT REF(E) FROM tb_produtora E WHERE E.cnpj = 99999999999999)
);

INSERT INTO tb_contrato_diretor(
	11151198780, 
	28, 
	to_date('01/12/1990', 'dd/mm/yy'), 
	to_date('07/12/2019', 'dd/mm/yy'),
	(SELECT REF(C) FROM tb_diretor C WHERE C.cpf = 11151198780)
);

INSERT INTO tb_contrato_ator(
	00000000116, 
	29, 
	to_date('01/10/1990', 'dd/mm/yy'), 
	to_date('07/02/2017', 'dd/mm/yy'),
	(SELECT REF(C) FROM tb_ator C WHERE C.cpf = 00000000116)
);

INSERT INTO tb_contrato_editor(
	00000000118, 
	30, 
	to_date('01/02/2000', 'dd/mm/yy'), 
	to_date('07/05/2010', 'dd/mm/yy'),
	(SELECT REF(C) FROM tb_editor C WHERE C.cpf = 00000000118)
);

INSERT INTO tb_utiliza(
	00000000118,
	2,
	(SELECT REF(U) FROM tb_editor U WHERE U.cpf = 00000000118),
	(SELECT REF(C) FROM tb_computador C WHERE C.tomb = 6)
);

INSERT INTO tb_adquirir(
	'O espetacular mundo dos Aquarius',
	19, 
	'Set_4',
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'O espetacular mundo dos Aquarius'),
	(SELECT REF(T) FROM tb_camera T WHERE T.tomb = 19),
	(SELECT REF(A) FROM tb_ambiente_grav A WHERE A.nome = 'Set_4')
);

INSERT INTO tb_monta(
	00000000118, 
	'O espetacular mundo dos Aquarius',
	(SELECT REF(E) FROM tb_editor E WHERE E.cpf = 00000000118),
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'O espetacular mundo dos Aquarius')	
);

