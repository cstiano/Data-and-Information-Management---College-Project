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
INSERT INTO ceps (cep,rua) VALUES (00000004, 'Rua do Aranha');
INSERT INTO ceps (cep,rua) VALUES (00000005, 'Rua dos Anjos');
INSERT INTO ceps (cep,rua) VALUES (00000006, 'Rua dos Desconhecidos');
INSERT INTO ceps (cep,rua) VALUES (00000007, 'Rua do Hanks');
INSERT INTO ceps (cep,rua) VALUES (00000008, 'Rua das Panteras');
INSERT INTO ceps (cep,rua) VALUES (00000009, 'Rua dos Doutores');
INSERT INTO ceps (cep,rua) VALUES (00000010, 'Rua dos Ricos');
INSERT INTO ceps (cep,rua) VALUES (00000011, 'Rua das Velas');
INSERT INTO ceps (cep,rua) VALUES (00000012, 'Rua das Godzilla');
INSERT INTO ceps (cep,rua) VALUES (00000013, 'Rua das Interestelar');

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

INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000012, 11111111111111, 'Marc Webb', 				00000004, 'n 1241', to_date('31/08/1974', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000013, 11111111111111, 'Alvin Sargent', 			00000004, 'n 1231', to_date('12/04/1973', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000014, 11111111111111, 'James Vanderbilt', 		00000004, 'n 2135', to_date('24/07/1970', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000015, 11111111111111, 'Steve Kloves ', 			00000004, 'n 1234', to_date('26/05/1962', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000016, 11111111111111, 'Andrew Garfield', 		00000004, 'n 1242', to_date('20/08/1983', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000017, 11111111111111, 'Emma Stone', 			00000004, 'n 1235', to_date('06/11/1988', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000018, 11111111111111, 'Rhys Ifans', 			00000004, 'n 1236', to_date('22/07/1967', 'dd/mm/yy'), 'M');

INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000018, 11111111111111, 'Ron Howard', 			00000005, 'n 1236', to_date('01/03/1954', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000019, 11111111111111, 'David Koepp', 			00000006, 'n 1312', to_date('09/06/1963', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000020, 11111111111111, 'Akiva Goldsman', 		00000004, 'n 1671', to_date('07/07/1962', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000021, 11111111111111, 'Tom Hanks', 				00000007, 'n 1316', to_date('09/07/1956', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000022, 11111111111111, 'Ewan McGregor', 			00000005, 'n 1261', to_date('31/03/1971', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000023, 11111111111111, 'Ayelet Zurer', 			00000006, 'n 1127', to_date('28/06/1969', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000024, 11111111111111, 'Dan Brown', 				00000006, 'n 1285', to_date('22/06/1964', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000025, 11111111111111, 'John Calley', 			00000007, 'n 1764', to_date('13/09/1930', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000026, 11111111111111, 'William M. Connor', 		00000005, 'n 1523', to_date('25/04/1967', 'dd/mm/yy'), 'M');

INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000027, 11111111111111, 'Joseph McGinty Nichol', 	00000008, 'n 1872', to_date('09/08/1968', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000028, 11111111111111, 'Ivan Goff', 				00000008, 'n 1822', to_date('25/04/1967', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000029, 11111111111111, 'Drew Barrymore', 		00000003, 'n 1897', to_date('22/02/1975', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000030, 11111111111111, 'Lucy Liu', 				00000001, 'n 1292', to_date('02/12/1968', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000031, 11111111111111, 'Cameron Diaz', 			00000006, 'n 1235', to_date('30/08/1972', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000032, 11111111111111, 'Demi Moore', 			00000009, 'n 1611', to_date('11/11/1962', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000033, 11111111111111, 'Ed Shearmur', 			00000010, 'n 1831', to_date('28/02/1966', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000034, 11111111111111, 'Jenno Topping', 			00000011, 'n 1773', to_date('12/06/1967', 'dd/mm/yy'), 'M');

INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000035, 22222222222222, 'Gareth Edwards', 		00000012, 'n 102, apto 123', to_date('23/01/1980', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000036, 22222222222222, 'Max Borenstein', 		00000012, 'n 102, apto 106', to_date('16/11/1977', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000037, 22222222222222, 'Elizabeth Olsen', 		00000012, 'n 102, apto 201', to_date('16/02/1989', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000038, 22222222222222, 'Bryan Cranston', 		00000012, 'n 234', 			 to_date('07/04/1956', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000039, 22222222222222, 'Dave Callaham', 			00000012, 'n 212', 			 to_date('24/10/1977', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000040, 22222222222222, 'Martin Cohen', 			00000012, 'n 241', 			 to_date('02/05/1979', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000041, 22222222222222, 'Bob Ducsay', 			00000012, 'n 204', 			 to_date('16/12/1971', 'dd/mm/yy'), 'M');

INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000042, 66666666666666, 'Ellen Burstyn', 			00000013, 'n 201', to_date('07/12/1932', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000043, 66666666666666, 'Matthew McConaughey', 	00000013, 'n 202', to_date('04/11/1969', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000044, 66666666666666, 'Mackenzie Foy', 			00000013, 'n 203', to_date('10/11/2000', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000045, 66666666666666, 'Anne Hathaway', 			00000013, 'n 204', to_date('12/11/1982', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000046, 66666666666666, 'Collette Wolfe', 		00000013, 'n 205', to_date('04/04/1980', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000047, 66666666666666, 'Jonathan Nolan', 		00000013, 'n 206', to_date('06/06/1976', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000048, 66666666666666, 'Stacey Douglas', 		00000013, 'n 207', to_date('16/12/1971', 'dd/mm/yy'), 'M');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000049, 66666666666666, 'Luisa Abel',		 		00000013, 'n 208', to_date('03/10/1976', 'dd/mm/yy'), 'F');
INSERT INTO funcionario (cpf,cnpj_c,nome,cep,complemento,dt_nascimento, salario) VALUES (00000000050, 66666666666666, 'Mary Zophres',	 		00000013, 'n 209', to_date('23/03/1964', 'dd/mm/yy'), 'F');

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

INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000016, 'Spider-Man',	'Agencia11', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000017, 'Gwen Stacy',	'Agencia11', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000018, 'The Lizard',	'Agencia13', NULL);

INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000021, 'Robert Langdon',	'Agencia16', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000022, 'Camerlengo',		'Agencia12', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000023, 'Vittoria Vetra',	'Agencia14', NULL);

INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000029, 'Natalie Cook',	'Agencia15', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000030, 'Dylan Sanders',	'Agencia16', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000031, 'Alex Munday',		'Agencia16', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000032, 'Madison Lee',		'Agencia17', NULL);

INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000037, 'Elle Brody',		'Agencia18', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000038, 'Young Ford',		'Agencia19', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000039, 'Joe Brody',		'Agencia20', NULL);

INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000042, 'Murph 2',		'Agencia21', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000043, 'Cooper',		'Agencia21', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000044, 'Murph 1',		'Agencia22', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000045, 'Brand',		'Agencia22', NULL);
INSERT INTO ator (cpf,personagem,agencia,carac_fisicas) VALUES (00000000046, 'Ms. Hanley',	'Agencia23', NULL);

--INSERINDO EDITORES
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (33333333333,	1,	'IMAGEM',	12);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (88888888888,	0,	'SOM',		4);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000004,	1,	'IMAGEM',	10);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000010,	2,	'IMAGEM',	3);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000011,	8,	'SOM',		14);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000015,	1,	'IMAGEM',	10);

INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000024,	0,	'IMAGEM',	18);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000025,	4,	'IMAGEM',	23);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000026,	1,	'SOM',		20);

INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000033,	0,	'IMAGEM',	5);
INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000034,	0,	'SOM',		11);

INSERT INTO editor (cpf,quant_premiacoes,atuacao,quant_filmes_trabalhados) VALUES (00000000041,	0,	'IMAGEM',	17);

--INSERINDO DIRETORES
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (11111111111, 'O Hobbit', 5, 'GERAL', 	13, 	  NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (66666666666, 'O Hobbit', 0, 	'ARTE',   	1, 11111111111);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (77777777777, 'O Hobbit', 0, 	'DESIGN',  	1, 11111111111);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (99999999999, 'Batman: O cavaleiro das trevas', 9, 'GERAL', 			10, 	  NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000005, 'Batman: O cavaleiro das trevas', 1, 'CINEMATOGRAFIA', 	12, 	  99999999999);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000006, 'Batman: O cavaleiro das trevas', 5, 'DESIGN', 			19, 	  99999999999);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000007, 'Clube da Luta', 5, 'GERAL', 		19, 	  NULL);

INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000012, 'O espetacular Homem-Aranha', 0, 'GERAL', 				6, 	  NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000013, 'O espetacular Homem-Aranha', 1, 'CINEMATOGRAFIA', 		2, 	  00000000012);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000014, 'O espetacular Homem-Aranha', 0, 'SOM', 				1, 	  00000000012);

INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000018, 'Anjos e Demonios', 3, 'GERAL', 		9, 	  	NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000019, 'Anjos e Demonios', 1, 'SOM', 			4, 	  	00000000018);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000020, 'Anjos e Demonios', 6, 'MUSICAL', 		10, 	00000000018);

INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000020, 'As Panteras Detonando', 0, 'GERAL', 		14, 	NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000020, 'As Panteras Detonando', 0, 'MAQUIAGEM', 	5, 		00000000020);

INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000035, 'Godzilla', 0, 'GERAL', 			4, 			NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000036, 'Godzilla', 1, 'CINEMATOGRAFIA', 	12, 		00000000035);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000040, 'Godzilla', 1, 'DESIGN', 			15, 		00000000035);

INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000047, 'Interestelar', 5, 'GERAL', 			15, 		NULL);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000048, 'Interestelar', 3, 'DESIGN', 			14, 	00000000047);
INSERT INTO diretor (cpf,nome_filme_dirigido,quant_premiacoes,atuacao,quant_filmes_trabalhados,cpf_supervisor) VALUES (00000000049, 'Interestelar', 2, 'MUSICAL', 			11, 	00000000047);

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
