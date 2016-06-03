--tb_produtora
INSERT INTO tb_produtora VALUES(
	11111111111111, 
	'Sony Pictures Entertainment', 
	tp_nt_fone(081981621412, 081981621413, 081981621342),
	tp_endereco(11111111,'Rua da Sony','blablabla')
	);
--tb_filme
INSERT INTO tb_filme(
	'O espetacular Homem-Aranha',
	11111111111111,
	to_date('02/11/2001', 'dd/mm/yy'),
	50000000.00,
	to_date('02/11/2000', 'dd/mm/yy'),
	(SELECT REF(F) FROM tb_produtora F WHERE F.cnpj = 11111111111111)
	); 
--tb_ambiente_grav
INSERT INTO tb_ambiente_grav (
	'Set_1', 
	986,
	tp_endereco(00000023, 'Rua do Set_1','Galpao29')
);
--tb_camera
INSERT INTO tb_camera (
	19,
	'Equipamento19',
	19456.00, 
	'4 anos',
	'SZ071', 
	'Pentax',
	tp_nt_lentes('BR071')
);
--tb_cenario
INSERT INTO tb_cenario(
	41, 
	'Equipamento41', 
	27808.00, 
	'8 anos',
	'Acao', 
	'Bloco', 
	483
);
--tb_computador
INSERT INTO tb_computador(
	1, 
	'Equipamento1', 
	31886.00, 
	'4 anos',
	'intel i8 877 quad core', 
	'8 GB', 
	'2 TB'
);
--tb_diretor
INSERT INTO tb_diretor(
	00000000012,
	11111111111111, 
	'Marc Webb', 
	to_date('31/08/1974', 'dd/mm/yy'), 
	'M', 
	966429.00,
	tp_nt_fone(081991247212),
	tp_nt_email('Marc@produtora.com.br'),
	tp_endereco(00000004, 'Rua do Aranha','n 1241'), 
	'O espetacular Homem-Aranha', 
	0, 
	'GERAL', 				
	6, 	  
	NULL,
	(SELECT REF(D) FROM tb_produtora D WHERE D.cnpj = 11111111111111)
);
--tb_ator
INSERT INTO tb_ator(
	00000000016,
	11111111111111, 
	'Andrew Garfield', 		
	to_date('20/08/1983', 'dd/mm/yy'), 
	'M', 
	675123.00,
	tp_nt_fone(081991647216),
	tp_nt_email('Andrew@produtora.com.br'),
	tp_endereco(00000004, 'Rua do Aranha','n 1242'),
	'Spider-Man',	
	'Agencia11', 
	NULL,
	(SELECT REF(A) FROM tb_produtora A WHERE A.cnpj = 11111111111111)
);
--tb_editor
INSERT INTO tb_editor(
	00000000015,
	11111111111111, 
	'Steve Kloves ', 	 
	to_date('26/05/1962', 'dd/mm/yy'), 
	'M', 
	732862.00,
	tp_nt_fone(081991547215),
	tp_nt_email('Steve@produtora.com.br'),
	tp_endereco(00000004, 'Rua do Aranha','n 1234'), 
	1,	
	'IMAGEM',	
	10,
	(SELECT REF(E) FROM tb_produtora E WHERE E.cnpj = 11111111111111)
);
--tb_contrato_diretor
INSERT INTO tb_contrato_diretor(
	00000000012, 
	21, 
	to_date('01/12/1990', 'dd/mm/yy'), 
	to_date('07/12/2018'),
	(SELECT REF(C) FROM tb_diretor C WHERE C.cpf = 00000000015)
);
--tb_contrato_ator
INSERT INTO tb_contrato_ator(
	00000000016, 
	25, 
	to_date('01/12/1990', 'dd/mm/yy'), 
	to_date('07/12/2018'),
	(SELECT REF(C) FROM tb_ator C WHERE C.cpf = 00000000015)
);

--tb_contrato_editor
INSERT INTO tb_contrato_editor(
	00000000015, 
	24, 
	to_date('01/12/1990', 'dd/mm/yy'), 
	to_date('07/12/2016'),
	(SELECT REF(C) FROM tb_editor C WHERE C.cpf = 00000000015)
);
--tb_utiliza
INSERT INTO tb_utiliza(
	00000000015,
	1,
	(SELECT REF(U) FROM tb_editor U WHERE U.cpf = 00000000015),
	(SELECT REF(C) FROM tb_computador C WHERE C.tomb = 1)
);
--tb_adquirir
INSERT INTO tb_adquirir(
	'O espetacular Homem-Aranha', 
	20, 
	'Set_1',
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'O espetacular Homem-Aranha'),
	(SELECT REF(T) FROM tb_camera T WHERE T.tomb = 20),
	(SELECT REF(A) FROM tb_ambiente_grav A WHERE A.nome = 'Set_1')
);
--tb_monta
INSERT INTO tb_monta(
	00000000015, 
	'O espetacular Homem-Aranha',
	(SELECT REF(E) FROM tb_editor E WHERE E.cpf = 00000000015),
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'O espetacular Homem-Aranha')	
);
--tb_revisa
INSERT INTO tb_revisa(
	00000000015, 
	00000000012, 
	'O espetacular Homem-Aranha', 
	to_date('01/12/2011', 'dd/mm/yy'),
	(SELECT REF(E) FROM tb_editor E WHERE E.cpf = 00000000015),
	(SELECT REF(M) FROM tb_monta M WHERE M.cpf = 00000000015 AND M.nome_filme = 'O espetacular Homem-Aranha')
);