-- create database outsorcing_printers;

use outsorcing_printers;

-- persistinddo equipamentos

-- Produtos (nome_equipamento, tipo enum('Impresora Laser mono', 'Impressora Laser Color', 'Impressora Tanque', 'Impressora jato de tinta', 'Multifuncionais Tinta', 'Multifuncionais Laser', 'Suprimentos'),
-- resolucao, velocidade_impressao, interface, capacidade_entrada, ciclo_mensal, grupo_trabalho, preco, peso, volume)

insert into Produto(nome_equipamento, tipo, resolucao, velocidade_impressao, interface, capacidade_entrada, ciclo_mensal, grupo_trabalho, preco, peso, volume)
	values ('Impressora Brother HL-1202', 'Impresora Laser mono', '1200 x 12000 dpi', 50, 'USB 2.0', 150, 10000,  'Home Office/Small Office', 1034, 4, 0.018),
		   ('Multifuncional Mono Brother MFC-6902DW', 'Multifuncionais Laser', '2400 x 600 dpi', 20, 'USB 2.0, Ethernet 10/100, Wifi 802.11 b/g/n', 250, 150000,  'Médio Porte', 7127, 19, 0.110),
           ('Multifuncional Color Brother DCP-T820DW', 'Multifuncionais Tinta', '4800 x 1200 dpi', 26, 'USB 2.0, Ethernet 10/100, Wifi 802.11 b/g/n', 150, 2500,  'Small Office/Medio Porte', 3999, 9, 0.035);

-- Suprimentos (nome_suprimento, tipo enum('Cilindro', 'Toner', 'Tinta', 'Papel A4', 'Acessorios'), capacidade, compativel_com, preco, peso, volume) separado por ter metricas diferentes

insert into Suprimentos(nome_suprimento, tipo, compativel_com, preco, peso, volume)
values ('Cilindro Brohther DR-1060', 'Cilindro', 'Impressora Brother HL-1202', 459, 0.5, 0.01),
       ('Toner preto Brohther TN-1060', 'Toner', 'Impressora Brother HL-1202', 230, 0.5, 0.01),
       ('Cilindro Brohther DR-3400', 'Cilindro', 'Multifuncional Mono Brother MFC6902DW', 559, 0.5, 0.01),
       ('Toner preto Brohther TN-3472', 'Toner', 'Multifuncional Mono Brother MFC6902DW', 799, 0.5, 0.01),
       ('Bandeja adicional Brotherr LT-5505', 'Cilindro', 'Multif. Mono Brother MFC6902DW', 1949, 1.0, 0.018),
       ('Garrafa tinta preta BTD-60BK', 'Tinta', 'Multifuncional Color Brother DCP-T820DW', 54, 0.1, 0.001),
       ('Garrafa tinta ciano BTD-5001C', 'Tinta', 'Multifuncional Color Brother DCP-T820DW', 54, 0.1, 0.001),
       ('Garrafa tinta magenta BTD-5001M', 'Tinta', 'Multifuncional Color Brother DCP-T820DW', 54, 0.1, 0.001),
       ('Garrafa tinta anarelo BTD-5001Y', 'Tinta', 'Multifuncional Color Brother DCP-T820DW', 54, 0.1, 0.001),
       ('Papel chamequinho com 500 fohas 75g', 'Papel A4', 'todos', 25, 0.5, 0.01),
       ('Papel chamequinho com 500 fohas 90g', 'Papel A4', 'todos', 35, 0.5, 0.01),
       ('Papel chamequinho com 250 fohas 120g', 'Papel A4', 'todos', 45, 0.5, 0.01);

-- persistindo personas clientes, funcionarios e fornecedores

-- Clientes (id_cliente_CPF, nome, sobrenome, CEP, endereco, bairro, cidade, UF, contato_1, contato_2, contato_3)

insert into Clientes (id_cliente_CPF, nome, sobrenome, CEP, endereco, bairro, cidade, UF, contato_1, contato_2, contato_3)
	values ("79397680576","Gustavo","Gomes","86200000","das Montanhas Avenida dos","Bairro das","Ibipora","PR","43991914583","43925273721","43950244494"),
		   ("72312418270","Camila","Barbosa","86200000","Rua das","Bairro das","Ibipora","PR","43904915133","43934682821","43960656922"),
		   ("57479997017","Isabela","Carvalho","86200000","Rua Floriano Avenida das","das Águias","Ibipora","PR","43959541821","43949654123","43917677684"),
		   ("63343581526","Fernando","Vasconcelos","86200000","dos Encantos Travessa das","Bairro das","Ibipora","PR","43947241281","43997626759","43941984288"),
		   ("35764256821","Luiza","Costa","86200000","Brumas Rua das","das Fontes","Ibipora","PR","43938365734","43974087486","43968371737"),
		   ("48162313415","Giovanna","Pereira","86200000","das Águas Avenida das","das Canções","Ibipora","PR","43928422768","43970353311","43912532439"),
		   ("36832274311","Matheus","Mendes","86200000","Colinas Avenida da","Maravilhas Bairro","Ibipora","PR","43945819693","43955771533","43937834453"),
		   ("11415082454","Rodrigo","Cunha","86200000","dos Anjos Rua das","das Colinas","Ibipora","PR","43982717745","43942481273","43982510322");


-- Funcionarios(id_funcionario_CPF char(11), id_funcionario_RG char(11), id_funcionario_NIS char(11), nome, sobrenome, CEP, endereco varchar(255), bairro, cidade, UF,  contato_1, contato_2, contato_3)

insert into Funcionarios(id_funcionario_CPF, id_funcionario_RG, id_funcionario_NIS, nome, sobrenome, CEP, endereco, bairro, cidade, UF,  contato_1, contato_2, contato_3)
	 values ("09252918159","16526648185","15852948515","Juliana","Castro","86200000","Travessa da Lua","Cachoeiras Bairro","Ibipora","PR","43922119898","43958315514","43961415181"),
			("68146359442","18758911758","63420123887","Larissa","Sousa","86200000","Sonhos Rua das Águas","Bairro das","Ibipora","PR","43959439672","43957344821","43911054213"),
			("73334538828","10657714775","80748616839","Caio","Vasconcelos","86200000","Rua das Cachoeiras Avenida","Lua Bairro","Ibipora","PR","43935805457","43940195445","43984878353"),
			("50616436663","11291419128","41532404605","Caio","Rodrigues","86200000","Marés Avenida","Brumas Bairro","Ibipora","PR","43919616376","43923785065","43955758173"),
			("07029045436","19833821446","75876436204","Luiza","Lima","86200000","das Maravilhas Rua","Brumas Bairro","Ibipora","PR","43933638395","43925486138","43934278108"),
			("84312478624","16398666747","85427048476","André","Gomes","86200000","Neves Avenida dos","Marés Bairro","Ibipora","PR","43901787426","43975980341","43971812671"),
			("08982040713","16923581408","64853928869","Yasmin","Almeida","86200000","das Marés Avenida","Bairro das","Ibipora","PR","43981536546","43982492582","43918736500"),
			("26846640820","10512406560","62386034216","Isabela","Silva","86200000","das Fontes Avenida","das Águias","Ibipora","PR","43967867703","43988407450","43983744697");

-- Fornecedores(id_fornecedores_CNPJ, nome_fantasia, contato_1, contato_2)

insert into Fornecedores (id_fornecedores_CNPJ, nome_fantasia, contato_1, contato_2)
		 values (62202189000152, 'Brother International Corporation Do Brasil Ltda', 1133713555, 1133715500),
				(16404287000155, 'Suzano Papel e Celuilose Ltda', 7333710422, 7333700000);
                
insert into EstoqueNovos (produto_em_estoque, localizacao, quantidade)
	values ('Impressora Brother HL-1202', 'Sala 101', 10),
		   ('Multifuncional Mono Brother MFC-6902DW', 'Sala 201', 5),
		   ('Multifuncional Color Brother DCP-T820DW', 'Sala 301', 7);
           
insert into EstoqueSuprimentos (nome_suprimento, localizacao, quantidade)
values ('Cilindro Brohther DR-1060', 'Almoxarifado A', 20),
       ('Toner preto Brohther TN-1060', 'Almoxarifado B', 30),
       ('Cilindro Brohther DR-3400', 'Almoxarifado C', 15),
       ('Toner preto Brohther TN-3472', 'Almoxarifado D', 25),
       ('Bandeja adicional Brotherr LT-5505', 'Almoxarifado E', 10);
       
insert into EstoqueBackupOutsorcing (nome_equipamento, serial_no, tipo, velocidade_impressao, interface, capacidade_entrada, ciclo_mensal, contador_impressao, contador_suprimento, grupo_trabalho, peso, volume, funcional, em_campo)
values ('Impressora Brother HL-1202', 'SN12345', 'Impresora Laser mono', 50, 'USB 2.0', 150, 10000, 5000, 2500, 'Home Office/Small Office', 4.6, 0.018, 'sim', 'nao'),
       ('Multifuncional Mono Brother MFC-6902DW', 'SN67890', 'Multifuncionais Laser', 20, 'USB 2.0, Ethernet 10/100, Wifi 802.11 b/g/n', 250, 150000, 8000, 3500, 'Médio Porte', 19.0, 0.110, 'sim', 'nao'),
       ('Multifuncional Color Brother DCP-T820DW', 'SN54321', 'Multifuncionais Tinta', 26, 'USB 2.0, Ethernet 10/100, Wifi 802.11 b/g/n', 150, 2500, 6000, 3000, 'Small Office/Medio Porte', 9.6, 0.035, 'sim', 'nao');


-- queries

-- Listar todos os clientes que têm um segundo contato (contato_2) especificado:
SELECT * FROM Clientes WHERE contato_2 IS NOT NULL;

-- Contar quantos produtos de cada tipo existem no estoque de impressoras:
SELECT tipo, COUNT(*) AS quantidade FROM EstoqueNovos GROUP BY tipo;

-- Listar todos os produtos disponíveis com um preço menor que 1000:
SELECT * FROM Produto WHERE preco < 1000;

-- Listar todos os produtos com uma resolução específica (por exemplo, "2400 x 600 dpi"):

SELECT * FROM Produto WHERE resolucao = '2400 x 600 dpi';

-- Listar todos os produtos que têm um ciclo mensal superior a 5000:

SELECT * FROM Produto WHERE ciclo_mensal > 5000;

 -- Listar todos os pedidos que incluem suprimentos com nome e tipo de suprimento:

SELECT Pedidos.id_pedido, Pedidos.suprimento_em_pedido, suprimentos.tipo
FROM Pedidos
JOIN suprimentos ON Pedidos.suprimento_em_pedido = suprimentos.nome_suprimento;

-- Listar todos os produtos em estoque de impressoras com localização e quantidade:

SELECT EstoqueNovos.produto_em_estoque, EstoqueNovos.localizacao, EstoqueNovos.quantidade, Produto.tipo
FROM EstoqueNovos
JOIN Produto ON EstoqueNovos.produto_em_estoque = Produto.nome_equipamento
WHERE Produto.tipo LIKE 'Impressora%';

-- Calcular o total de vendas por tipo de produto:

SELECT Produto.tipo, SUM(Produto.preco) AS total_vendas
FROM Pedidos
JOIN Produto ON Pedidos.produto_em_pedido = Produto.nome_equipamento
GROUP BY Produto.tipo;

-- Listar todos os pedidos de um cliente com detalhes de produto (nome, tipo e preço) e tipo de pedido (por exemplo, "Avulso"):

SELECT Pedidos.id_pedido, Clientes.nome, Produto.nome_equipamento, Produto.tipo, Produto.preco, Pedidos.tipo_pedido
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente_pedido = Clientes.id_cliente_CPF
JOIN Produto ON Pedidos.produto_em_pedido = Produto.nome_equipamento
WHERE Pedidos.tipo_pedido = 'Avulso';