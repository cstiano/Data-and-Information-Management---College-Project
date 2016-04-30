--INSERINDO CEPS
INSERT INTO ceps (cep,rua) VALUES (11111111, 'Rua da Sony');
INSERT INTO ceps (cep,rua) VALUES (22222222, 'Rua da Warner');
INSERT INTO ceps (cep,rua) VALUES (33333333, 'Rua da Disney');
INSERT INTO ceps (cep,rua) VALUES (44444444, 'Rua da Universal');
INSERT INTO ceps (cep,rua) VALUES (55555555, 'Rua da Fox');
INSERT INTO ceps (cep,rua) VALUES (55555555, 'Rua da Paramount');
INSERT INTO ceps (cep,rua) VALUES (77777777, 'Rua da Weinstein');
INSERT INTO ceps (cep,rua) VALUES (88888888, 'Rua da MGM');
INSERT INTO ceps (cep,rua) VALUES (99999999, 'Rua da Globo');
INSERT INTO ceps (cep,rua) VALUES (12345678, 'Rua do Hobbit');
INSERT INTO ceps (cep,rua) VALUES (23456789, 'Rua do Batman');
INSERT INTO ceps (cep,rua) VALUES (01923884, 'Rua do Bale');
INSERT INTO ceps (cep,rua) VALUES (21236213, 'Rua do Coringa');
INSERT INTO ceps (cep,rua) VALUES (23456789, 'Rua da Maggie');
INSERT INTO ceps (cep,rua) VALUES (00000001, 'Rua da Luta');
INSERT INTO ceps (cep,rua) VALUES (00000002, 'Rua do Pit');
INSERT INTO ceps (cep,rua) VALUES (00000003, 'Rua do Norton');

--INSERINDO PRODUTORAS
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (11111111111111, 'Sony Pictures Entertainment', 		11111111, NULL);
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (22222222222222, 'Time Warner', 						22222222, NULL);
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (33333333333333, 'The Walt Disney Company', 			33333333, NULL);
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (44444444444444, 'Universal Pictures', 				44444444, NULL);
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (55555555555555, '21st Century Fox', 					55555555, NULL);
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (66666666666666, 'Paramount Motion Pictures Group', 	66666666, NULL);
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (77777777777777, 'The Weinstein Company', 				77777777, NULL);
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (88888888888888, 'MGM - Metro Goldwyn Mayer', 			88888888, NULL);
INSERT INTO produtora (cnpj,nome,cep,complemento) VALUES (99999999999999, 'Globo Filmes', 						99999999, NULL);

--INSERINDO FUNCIONARIOS
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (11111111111, 88888888888888, 'Peter Jackson', 			12345678, 'n 100, apto 200', to_date('31/10/1961', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (22222222222, 88888888888888, 'Ian McKellen', 			12345678, 'n 100, apto 100', to_date('25/05/1939', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (33333333333, 88888888888888, 'Jabez Olssen', 			12345678, 'n 100, apto 101', to_date('05/08/1975', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (44444444444, 88888888888888, 'Martin Freeman', 		12345678, 'n 100, apto 102', to_date('08/09/1971', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (55555555555, 88888888888888, 'Evangeline Lilly', 		12345678, 'n 100, apto 103', to_date('03/08/1979', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (66666666666, 88888888888888, 'Andy McLaren', 			12345678, 'n 100, apto 104', to_date('03/08/1975', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (77777777777, 88888888888888, 'Mykyta Brazhnyk', 		12345678, 'n 100, apto 105', to_date('12/06/1972', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (88888888888, 88888888888888, 'Duane Agate', 			12345678, 'n 100, apto 106', to_date('11/06/1976', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (99999999999, 22222222222222, 'Christopher Nolan', 		23456789, 'n 200, apto 101', to_date('30/07/1970', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000001, 22222222222222, 'Christian Bale', 		01923884, 'n 200, apto 106', to_date('30/01/1974', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000002, 22222222222222, 'Heath Ledger', 			21236213, 'n 200, apto 106', to_date('04/04/1979', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000003, 22222222222222, 'Maggie Gyllenhaal', 		23456789, 'n 200, apto 106', to_date('16/11/1977', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000004, 22222222222222, 'Masayuki Nakano', 		23456789, 'n 200, apto 102', to_date('30/07/1970', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000005, 22222222222222, 'Michiyuki Kawashima', 	23456789, 'n 200, apto 103', to_date('30/07/1970', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000006, 22222222222222, 'Ritchie Coster', 		23456789, 'n 200, apto 104', to_date('30/07/1970', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000007, 55555555555555, 'David Fincher', 			00000001, 'n 222, apto 100', to_date('28/07/1962', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000008, 55555555555555, 'Brad Pitt', 				00000002, 'n 182, apto 104', to_date('18/12/1963', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000009, 55555555555555, 'Edward Norton', 			00000003, 'n 182, apto 101', to_date('18/08/1969', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000010, 55555555555555, 'Meat Loaf', 				00000001, 'n 182, apto 102', to_date('27/09/1947', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000011, 55555555555555, 'Chuck Palahniuk', 		00000001, 'n 182, apto 103', to_date('21/02/1962', 'dd/mm/yy'), 'M');


--INSERINDO TELEFONES PRODUTORA
INSERT INTO prod_fone (cnpj,fone) VALUES (11111111111111, 081981621412);
INSERT INTO prod_fone (cnpj,fone) VALUES (11111111111111, 081981621413);
INSERT INTO prod_fone (cnpj,fone) VALUES (11111111111111, 081981621342);
INSERT INTO prod_fone (cnpj,fone) VALUES (22222222222222, 081882930213);
INSERT INTO prod_fone (cnpj,fone) VALUES (22222222222222, 081882890213);
INSERT INTO prod_fone (cnpj,fone) VALUES (33333333333333, 081889338232);
INSERT INTO prod_fone (cnpj,fone) VALUES (44444444444444, 081883728134);
INSERT INTO prod_fone (cnpj,fone) VALUES (44444444444444, 081883397437);
INSERT INTO prod_fone (cnpj,fone) VALUES (55555555555555, 081737328143);
INSERT INTO prod_fone (cnpj,fone) VALUES (66666666666666, 082331238134);
INSERT INTO prod_fone (cnpj,fone) VALUES (66666666666666, 082387874277);
INSERT INTO prod_fone (cnpj,fone) VALUES (66666666666666, 082331237482);
INSERT INTO prod_fone (cnpj,fone) VALUES (66666666666666, 082331232974);
INSERT INTO prod_fone (cnpj,fone) VALUES (66666666666666, 081298731142);
INSERT INTO prod_fone (cnpj,fone) VALUES (77777777777777, 082334112341);
INSERT INTO prod_fone (cnpj,fone) VALUES (77777777777777, 082331512334);
INSERT INTO prod_fone (cnpj,fone) VALUES (88888888888888, 082331294172);
INSERT INTO prod_fone (cnpj,fone) VALUES (99999999999999, 082331213442);
INSERT INTO prod_fone (cnpj,fone) VALUES (99999999999999, 081234333332);

--INSERINDO FILMES
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('O Hobbit',												88888888888888,to_date('02/11/2001', 'dd/mm/yy'), 50000000.00,	to_date('02/11/2000', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Batman: O cavaleiro das trevas',							22222222222222,to_date('02/11/2008', 'dd/mm/yy'), 35000000.00,	to_date('18/07/2007', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('CLube da Luta',											55555555555555,to_date('12/11/1999', 'dd/mm/yy'), 1500000.00,	to_date('01/03/1997', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('A Origem',												22222222222222,to_date('23/03/2010', 'dd/mm/yy'), 5912814.00,	to_date('16/07/2008', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('O espetacular Homem-Aranha',								11111111111111,to_date('22/04/2012', 'dd/mm/yy'), 62004688.00,	to_date('06/07/2010', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Anjos e Demonios',										11111111111111,to_date('12/06/2009', 'dd/mm/yy'), 150000000.00,	to_date('16/05/2007', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('As Panteras Detonando',									11111111111111,to_date('12/06/2003', 'dd/mm/yy'), 15000000.00,	to_date('16/05/2001', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Godzilla',												22222222222222,to_date('12/06/2014', 'dd/mm/yy'), 160000000.00,	to_date('16/05/2012', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Matrix',													22222222222222,to_date('02/04/1999', 'dd/mm/yy'), 63000000.00,	to_date('02/05/1995', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Interestelar',											66666666666666,to_date('07/11/2014', 'dd/mm/yy'), 165000000.00,	to_date('02/05/2013', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Alien, o Oitavo Passageiro',								55555555555555,to_date('07/10/2003', 'dd/mm/yy'), 11000000.00,	to_date('02/12/2000', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Piratas do Caribe: Navegando em Aguas Misteriosaso',		33333333333333,to_date('20/05/2011', 'dd/mm/yy'), 250000000.00,	to_date('02/12/2009', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Tron: O Legado',											33333333333333,to_date('10/12/2010', 'dd/mm/yy'), 170000000.00,	to_date('02/12/2007', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Alice no País das Maravilhas', 							33333333333333,to_date('05/03/2010', 'dd/mm/yy'), 200000000.00,	to_date('02/10/2008', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Jurassic World: O Mundo dos Dinossauros', 				44444444444444,to_date('12/06/2015', 'dd/mm/yy'), 150000000.00,	to_date('02/01/2013', 'dd/mm/yy'));
INSERT INTO filme (nome_filme,cnpj_prod,data_lan,faturamento,data_inicio) VALUES ('Cidade de Deus', 										99999999999999,to_date('30/08/2002', 'dd/mm/yy'), 3300000.00,	to_date('02/12/1999', 'dd/mm/yy'));

--INSERINDO ATORES
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (22222222222, 'Gandalf',			'Agencia1', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (44444444444, 'Bilbo Baggins',	'Agencia2', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (55555555555, 'Tauriel',			'Agencia1', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000001, 'Batman',			'Agencia3', 'Flexivel');
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000002, 'Coringa',			'Agencia2', 'Loiro');
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000003, 'Rachel',			'Agencia8', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000008, 'Tyler Durden',	'Agencia9', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000009, 'The Narrator',	'Agencia10', NULL);

--INSERINDO EDITORES
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (33333333333,	1,	'IMAGEM',	12);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (88888888888,	0,	'SOM',		4);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000004,	1,	'IMAGEM',	10);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000010,	2,	'IMAGEM',	3);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000011,	8,	'SOM',		14);

--INSERINDO DIRETORES
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (11111111111, 'O Hobbit', 5, 'GERAL', 	13, 	  NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (66666666666, 'O Hobbit', 0, 	'ARTE',   	1, 11111111111);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (77777777777, 'O Hobbit', 0, 	'DESIGN',  	1, 11111111111);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (99999999999, 'Batman: O cavaleiro das trevas', 9, 'GERAL', 			10, 	  NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000005, 'Batman: O cavaleiro das trevas', 1, 'CINEMATOGRAFIA', 	12, 	  99999999999);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000006, 'Batman: O cavaleiro das trevas', 5, 'DESIGN', 			19, 	  99999999999);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000007, 'Clube da Luta', 5, 'GERAL', 		19, 	  NULL);

--INSERINDO AMBIENTE DE GRAVACAO
INSERT INTO ambiente_de_gravacao (nome_amb_grav, tamanho, cep, complemento) VALUES ('Set 1 - hobbit', 100, 93012034, 'Galpao 2');

--INSERINDO EQUIPAMENTOS
INSERT INTO equipamentos (tomb,nome_equipamento,preco,vida_util) VALUES (1, 'EQ 1', 1500, '1 ano');

--INSERINDO CENARIOS
INSERT INTO cenario (tomb,tema,material,tamanho) VALUES ();

--INSERINDO COMPUTADORES
INSERT INTO computador (tomb,cpf_editor,processador,memoria,disco_rigido) VALUES ();

--INSERINDO CAMERAS
INSERT INTO camera (tomb, modelo, fabricante) VALUES ();

--INSERINDO LENTES
INSERT INTO lentes (tomb, lente) VALUES ();

--INSERINDO TELEFONE DOS FUNCIONARIOS
INSERT INTO telefone_func (cpf, fone) VALUES ();

--INSERINDO EMAIL DE FUNCIONARIOS
INSERT INTO email_func (cpf, email) VALUES ();

--INSERINDO CONTRATOS
INSERT INTO contratos (cpf, numero, data_in, data_fim) VALUES ();

--INSERINDO MONTAGENS
INSERT INTO monta (cpf, nome_filme) VALUES ();

--INSERINDO REVISOES
INSERT INTO revisa (cpf_editor,cpf_diretor,nome_filme,data_revisao) VALUES ();

--INSERINDO EQUIPAMENTOS ADQUIRIDOS POR FILMES
INSERT INTO adquirir (nome_filme,tomb,nome_amb_grav) VALUES ();
