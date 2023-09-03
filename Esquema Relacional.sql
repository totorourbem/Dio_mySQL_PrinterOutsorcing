-- 2º tarefa dio

create database outsorcing_printers;

use outsorcing_printers;

-- Tabelas de clientes, funcionários e fornecedores

create table Clientes(
	id_cliente_CPF char(11) not null primary key,  -- apliquei CPF como identificador, visto que o mesmo é unico e obrigatório, retirando a obrigação de alter table
    nome varchar(10),
    sobrenome varchar(20),
    CEP char(8) not null, -- importante pra calculo de frete volume
    endereco varchar(255)not null, 
    bairro varchar (45)not null,
    cidade varchar (100) not null,
    UF char(2) not null,
    contato_1 char (11) not null, -- manter no cadastro ao mesnos um telefone válido
    contato_2 char (11)default null,
    contato_3 char (11)default null,
    constraint unique_cpf_cliente unique (id_cliente_CPF) -- regra de CPF unico
);
create table Funcionarios(
	id_funcionario_CPF char(11) not null primary key,  -- apliquei CPF como identificador, visto que o mesmo é unico e obrigatório, retirando a obrigação de alter table
    id_funcionario_RG char(11),
    id_funcionario_NIS char(11),
    nome varchar(10),
    sobrenome varchar(20),
    CEP char(8) not null, -- importante pra calculo de frete volume
    endereco varchar(255)not null,  
    bairro varchar (45)not null,
    cidade varchar (100) not null,
    UF char(2) not null,
    contato_1 char (11) not null, -- manter no cadastro ao mesnos um telefone válido
    contato_2 char (11) not null,
    contato_3 char (11) not null,
    constraint unique_cpf_funcionario unique (id_funcionario_CPF), -- regra de CPF unico
    constraint unique_nis_funcionario unique (id_funcionario_NIS) -- regra de NIS unico
);
create table Fornecedores(
	id_fornecedores_CNPJ varchar(14) not null primary key, -- mesma lógica de cliente
    nome_fantasia varchar(255) not null,
    contato_1 char (11) not null, -- mater no cadastro ao menos um telefone válido
    contato_2 char (11) not null,
    constraint unique_fornecedor unique(id_fornecedores_CNPJ)
);

-- Tableas de entradas e saídas de equipamentos e serviços

create table Produto(
	id_estoque_novos int primary key auto_increment,
    nome_equipamento varchar(255) not null,
    tipo enum('Impresora Laser mono', 'Impressora Laser Color', 'Impressora Tanque', 'Impressora jato de tinta', 'Multifuncionais Tinta', 'Multifuncionais Laser'),
    resolucao varchar(45) not null,
    velocidade_impressao int not null,
    interface varchar(45),
    capacidade_entrada int,
    ciclo_mensal int,
    grupo_trabalho varchar(45),
    preco decimal (6,2),
    peso decimal (6,4) not null, -- para calculo de frete, registrar em quilos
    volume decimal (6,4) not null-- para calculo de frete, registrar em m³ ( multiplicação das três dimensões)
    );
    
    CREATE INDEX idx_nome_equipamento ON Produto(nome_equipamento);
    
    create table suprimentos(
	id_suprimentos int primary key auto_increment,
    nome_suprimento varchar(255) not null,
    tipo enum('Cilindro', 'Toner', 'Tinta', 'Papel A4'),
    compativel_com varchar(45) not null,
	preco decimal (6,2),
    peso decimal (4,2) not null, -- para calculo de frete, registrar em quilos
    volume decimal (6,4)not null -- para calculo de frete, registrar em m³ ( multiplicação das três dimensões)
);
CREATE INDEX idx_nome_suprimento ON suprimentos(nome_suprimento);
create table Pedidos(
    id_pedido int auto_increment primary key,
    id_cliente_pedido char(11),
    produto_em_pedido varchar(255), -- Adicione esta coluna para referência a produtos
    suprimento_em_pedido varchar(255), -- Adicione esta coluna para referência a suprimentos
    tipo_pedido enum('Avulso', 'Outsourcing', 'Assistência') not null default 'Avulso',
    id_subscription INT default 0,
    status_pedido enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    descricao_pedido varchar(255),
    frete enum('PAC', 'Sedex', 'Transportadora', 'Retirada no local'),
    tecnico_responsavel char(11), -- aqui busca o técnico ou vendedor responsável  
    Constraint fk_cliente_pedido foreign key (id_cliente_pedido) references Clientes(id_cliente_CPF),
    foreign key (produto_em_pedido) references Produto(nome_equipamento), -- Chave estrangeira para a tabela Produto
    foreign key (suprimento_em_pedido) references suprimentos(nome_suprimento) -- Chave estrangeira para a tabela suprimentos
);
create table ContratosOutsorcing(
    id_contratos int auto_increment primary key,
    id_cliente char(11),
    data_inicio date,
    data_fim date,
    resumo_contrato varchar(255) not null,
    contrato_status ENUM('Ativa', 'Pausada', 'Cancelada') not null,
    valor_contratot decimal(6, 2) not null,
    tecnico_responsavel char(11) not null, -- aqui busca o tecnico responsável
    vendedor_responsavel char(11) not null, -- aqui busca o vendedor responsável
    foreign key (id_cliente) references Clientes(id_cliente_CPF),
    Constraint fk_tecnico_responsavel foreign key (tecnico_responsavel) references Funcionarios(id_funcionario_CPF),
    Constraint fk_vendedor_responsavel foreign key (vendedor_responsavel) references Funcionarios(id_funcionario_CPF)
);

create table EstoqueNovos(
	id_produto_estoque int auto_increment,
    produto_em_estoque varchar(255) not null,
    localizacao varchar(255),
    quantidade int default 0,
    primary key(id_produto_estoque)
);
create table EstoqueSuprimentos(
	id_produto_estoque int auto_increment,
    nome_suprimento varchar(255) not null,
    localizacao varchar(255),
    quantidade int default 0,
    primary key(id_produto_estoque)
);

create table EstoqueBackupOutsorcing(
	id_estoque_backup_outsorcing int primary key auto_increment,
    nome_equipamento varchar(255) not null,
    serial_no varchar(10) not null,
    tipo enum('Impresora Laser mono', 'Impressora Laser Color', 'Impressora Tanque', 'Impressora jato de tinta', 'Multifuncionais Tinta', 'Multifuncionais Laser'),
    velocidade_impressao int not null,
    interface varchar(45),
    capacidade_entrada int,
    ciclo_mensal int,
    contador_impressao int not null,
    contador_suprimento int not null,
    grupo_trabalho varchar(45),
    peso decimal (6,2) not null, -- idem anterior
    volume decimal (6,4)not null, -- idem anterior 
    funcional enum('sim', 'nao') not null default 'sim', -- saber se o equipamento pode repor outro em contrato
    em_campo  enum('sim', 'nao') not null default 'nao' -- verificar se oequipamento não está atendendo cliente
    );
