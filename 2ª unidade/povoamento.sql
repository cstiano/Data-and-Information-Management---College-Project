--tb_produtora
INSERT INTO tb_produtora VALUES(
	11111111111111, 
	'Sony Pictures Entertainment', 
	tp_nt_fone(081981621412, 081981621413, 081981621342),
	tp_endereco(11111111,'Rua da Sony','blablabla')
	);

INSERT INTO tb_produtora VALUES(
	22222222222222, 
	'Time Warner', 
	tp_nt_fone(081981621322, 081981121413, 08133321342),
	tp_endereco(22222222,'Rua da Warner','tchuchu')
	);

INSERT INTO tb_produtora VALUES(
	33333333333333, 
	'The Walt Disney', 
	tp_nt_fone(0819816214352, 081981621333, 081981621142),
	tp_endereco(33333333,'The Walt Disney Company','balaca')
	);

--tb_filme
INSERT INTO tb_filme VALUES(
	'O espetacular Homem-Aranha',
	11111111111111,
	to_date('02/11/2001', 'dd/mm/yy'),
	50000000.00,
	to_date('02/11/2000', 'dd/mm/yy'),
	(SELECT REF(F) FROM tb_produtora F WHERE F.cnpj = 11111111111111)
	); 

INSERT INTO tb_filme VALUES(
	'O Hobbit',
	33333333333333,
	to_date('02/11/2005', 'dd/mm/yy'),
	50000000.00,
	to_date('02/11/2000', 'dd/mm/yy'),
	(SELECT REF(F) FROM tb_produtora F WHERE F.cnpj = 33333333333333)
	); 

INSERT INTO tb_filme VALUES(
	'Matrix',
	22222222222222,
	to_date('05/01/1999', 'dd/mm/yy'),
	50000000.00,
	to_date('02/05/1995', 'dd/mm/yy'),
	(SELECT REF(F) FROM tb_produtora F WHERE F.cnpj = 22222222222222)
	); 


--tb_ambiente_grav
INSERT INTO tb_ambiente_grav VALUES(
	'Set_1', 
	986,
	tp_endereco(00000023, 'Rua do Set_1','Galpao29')
);

INSERT INTO tb_ambiente_grav VALUES(
	'Set_2', 
	1015,
	tp_endereco(00000024, 'Rua do Set_2','Galpao73')
);

INSERT INTO tb_ambiente_grav VALUES(
	'Set_3', 
	435,
	tp_endereco(00000025, 'Rua do Set_3','Galpao25')
);

--tb_camera
INSERT INTO tb_camera VALUES(
	19,
	'Equipamento19',
	19456.00, 
	'4 anos',
	'SZ071', 
	'Pentax',
	tp_nt_lentes('BR071')
);

INSERT INTO tb_camera VALUES(
	16,
	'Equipamento16',
	1194.00, 
	'2 anos',
	'SZ074', 
	'Fujifilm',
	tp_nt_lentes('BR071','BR072')
);

INSERT INTO tb_camera VALUES(
	5,
	'Equipamento11',
	1456.00, 
	'3 anos',
	'SZ987', 
	'Nikon',
	tp_nt_lentes('SR045','SR023')
);

--tb_cenario
INSERT INTO tb_cenario VALUES(
	41, 
	'Equipamento41', 
	27808.00, 
	'8 anos',
	'Acao', 
	'Bloco', 
	483
);

INSERT INTO tb_cenario VALUES(
	76, 
	'Equipamento76', 
	34808.00, 
	'2 anos',
	'Acao', 
	'Bloco', 
	482
);

INSERT INTO tb_cenario VALUES(
	43, 
	'Equipamento43', 
	24558.00, 
	'6 anos',
	'Acao', 
	'Bloco', 
	 481
);
--tb_diretor
INSERT INTO tb_diretor VALUES(
	00000000012,
	11111111111111, 
	'Marc Webb', 
	to_date('31/08/1974', 'dd/mm/yy'), 
	'M', 
	966429.00,
	tp_nt_fone(081991247212),
	tp_nt_email('Marc@produtora.com.br'),
	tp_endereco(00000001, 'Rua do Aranha','n 1241'), 
	(SELECT REF(D) FROM tb_produtora D WHERE D.cnpj = 11111111111111),
	'O espetacular Homem-Aranha', 
	0, 
	'GERAL', 				
	6,
	NULL,
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'O espetacular Homem-Aranha'), 	 	  
	NULL
);

INSERT INTO tb_diretor VALUES(
	00000000013,
	22222222222222, 
	'John Nash', 
	to_date('31/08/1984', 'dd/mm/yy'), 
	'M', 
	916429.00,
	tp_nt_fone(081991209345),
	tp_nt_email('john@prod.com.br'),
	tp_endereco(00000014, 'Rua do Nash','n 1141'), 
	(SELECT REF(D) FROM tb_produtora D WHERE D.cnpj = 22222222222222),
	'Matrix', 
	0, 
	'GERAL', 				
	6,
	NULL,
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'Matrix'), 	  
	NULL
);

INSERT INTO tb_diretor VALUES(
	00000000014,
	33333333333333, 
	'Filipe Abreu', 
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


--tb_ator
INSERT INTO tb_ator VALUES(
	00000000015,
	33333333333333, 
	'Andrew Garfield', 		
	to_date('20/08/1983', 'dd/mm/yy'), 
	'M', 
	675123.00,
	tp_nt_fone(081991127216),
	tp_nt_email('Andrew@produtora.com.br'),
	tp_endereco(00000003, 'Rua do Aranha','n 1242'),
	(SELECT REF(A) FROM tb_produtora A WHERE A.cnpj = 33333333333333),
	'Spider-Man',	
	'Agencia11', 
	NULL
);

INSERT INTO tb_ator VALUES(
	00000000016,
	22222222222222, 
	'Horiu Garfield', 		
	to_date('20/08/1978', 'dd/mm/yy'), 
	'M', 
	675123.00,
	tp_nt_fone(081991634216),
	tp_nt_email('garfield@produtora.com.br'),
	tp_endereco(00000004, 'Rua do bing','n 42'),
	(SELECT REF(A) FROM tb_produtora A WHERE A.cnpj = 22222222222222),
	'MoscaMen',	
	'Agencia12', 
	NULL
);

INSERT INTO tb_ator VALUES(
	00000000017,
	22222222222222, 
	'Massa Moreno', 		
	to_date('20/08/1983', 'dd/mm/yy'), 
	'M', 
	455753.00,
	tp_nt_fone(081991127216),
	tp_nt_email('moreno@produtora.com.br'),
	tp_endereco(00000005, 'Rua do blag','n 12'),
	(SELECT REF(A) FROM tb_produtora A WHERE A.cnpj = 22222222222222),
	'BugMen',	
	'Agencia11', 
	NULL
);

--tb_editor
INSERT INTO tb_editor VALUES(
	00000000018,
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

INSERT INTO tb_editor VALUES(
	00000000019,
	22222222222222, 
	'Wosniak Pacmen', 	 
	to_date('26/05/1962', 'dd/mm/yy'), 
	'M', 
	732862.00,
	tp_nt_fone(08199188995),
	tp_nt_email('wos@produtora.com.br'),
	tp_endereco(00000007, 'Rua dos bobos','n 0'), 
	(SELECT REF(E) FROM tb_produtora E WHERE E.cnpj = 22222222222222),
	1,	
	'SOM',	
	10
);





--tb_computador
INSERT INTO tb_computador VALUES(
	1, 
	'Equipamento1', 
	31886.00, 
	'4 anos',
	'intel i8 877 quad core', 
	'8 GB', 
	'2 TB',
	NULL,
	NULL
);

INSERT INTO tb_computador VALUES(
	2, 
	'Equipamento2', 
	3188.00, 
	'2 anos',
	'intel i3 5667 quad core', 
	'4 GB', 
	'2 TB',
	00000000018,
	(SELECT REF(C) FROM tb_editor C WHERE C.cpf = 00000000018)
);

INSERT INTO tb_computador VALUES(
	3, 
	'Equipamento3', 
	20000.00, 
	'1 anos',
	'intel xeon 877 quad core', 
	'16 GB', 
	'2 TB',
	00000000019,
	(SELECT REF(C) FROM tb_editor C WHERE C.cpf = 00000000019)
);


--tb_contrato_diretor
INSERT INTO tb_contrato_diretor VALUES(
	00000000013, 
	21, 
	to_date('01/12/1990', 'dd/mm/yy'), 
	to_date('07/12/2018', 'dd/mm/yy'),
	(SELECT REF(C) FROM tb_diretor C WHERE C.cpf = 00000000013)
);

INSERT INTO tb_contrato_diretor VALUES(
	00000000014, 
	22, 
	to_date('01/12/1989', 'dd/mm/yy'), 
	to_date('07/12/2020', 'dd/mm/yy'),
	(SELECT REF(C) FROM tb_diretor C WHERE C.cpf = 00000000014)
);


--tb_contrato_ator
INSERT INTO tb_contrato_ator VALUES(
	00000000016, 
	23, 
	to_date('01/12/1980', 'dd/mm/yy'), 
	to_date('07/12/2017'),
	(SELECT REF(C) FROM tb_ator C WHERE C.cpf = 00000000016)
);

INSERT INTO tb_contrato_ator VALUES(
	00000000017, 
	24, 
	to_date('01/12/2000', 'dd/mm/yy'), 
	to_date('07/12/2025', 'dd/mm/yy'),
	(SELECT REF(C) FROM tb_ator C WHERE C.cpf = 00000000017)
);


--tb_contrato_editor
INSERT INTO tb_contrato_editor VALUES(
	00000000018, 
	25, 
	to_date('01/12/1990', 'dd/mm/yy'), 
	to_date('07/12/2016', 'dd/mm/yy'),
	(SELECT REF(C) FROM tb_editor C WHERE C.cpf = 00000000018)
);

INSERT INTO tb_contrato_editor VALUES(
	00000000019, 
	26, 
	to_date('01/12/1990', 'dd/mm/yy'), 
	to_date('07/12/2016', 'dd/mm/yy'),
	(SELECT REF(C) FROM tb_editor C WHERE C.cpf = 00000000019)
);

--tb_adquirir
INSERT INTO tb_adquirir_cam VALUES(
	'O espetacular Homem-Aranha', 
	16, 
	'Set_1',
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'O espetacular Homem-Aranha'),
	(SELECT REF(T) FROM tb_camera T WHERE T.tomb = 16),
	(SELECT REF(A) FROM tb_ambiente_grav A WHERE A.nome = 'Set_1')
);

INSERT INTO tb_adquirir_cen VALUES(
	'Matrix', 
	19, 
	'Set_2',
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'Matrix'),
	(SELECT REF(T) FROM tb_cenario T WHERE T.tomb = 19),
	(SELECT REF(A) FROM tb_ambiente_grav A WHERE A.nome = 'Set_2')
);

INSERT INTO tb_adquirir_com VALUES(
	'O Hobbit', 
	5, 
	'Set_3',
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'Matrix'),
	(SELECT REF(T) FROM tb_computador T WHERE T.tomb = 5),
	(SELECT REF(A) FROM tb_ambiente_grav A WHERE A.nome = 'Set_3')
);
--tb_monta
INSERT INTO tb_monta VALUES(
	00000000018, 
	'O espetacular Homem-Aranha',
	(SELECT REF(E) FROM tb_editor E WHERE E.cpf = 00000000018),
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'O espetacular Homem-Aranha')	
);


INSERT INTO tb_monta VALUES(
	00000000019, 
	'Matrix',
	(SELECT REF(E) FROM tb_editor E WHERE E.cpf = 00000000019),
	(SELECT REF(F) FROM tb_filme F WHERE F.nome = 'Matrix')	
);


--tb_revisa
INSERT INTO tb_revisa VALUES(
	00000000018, 
	00000000012, 
	'O espetacular Homem-Aranha', 
	to_date('01/12/2011', 'dd/mm/yy'),
	(SELECT REF(E) FROM tb_diretor E WHERE E.cpf = 00000000018),
	(SELECT REF(M) FROM tb_monta M WHERE M.cpf = 00000000012 AND M.nome_filme = 'O espetacular Homem-Aranha')
);

INSERT INTO tb_revisa VALUES(
	00000000019, 
	00000000013, 
	'Matrix', 
	to_date('01/12/1995', 'dd/mm/yy'),
	(SELECT REF(E) FROM tb_diretor E WHERE E.cpf = 00000000019),
	(SELECT REF(M) FROM tb_monta M WHERE M.cpf = 00000000013 AND M.nome_filme = 'Matrix')
);
