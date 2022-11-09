
create table endereco (
cod_endereco INTEGER UNSIGNED NOT NULL,
rua varchar(100) not null,
numero integer unsigned not null,
bairro varchar(50) not null,
cep varchar(20) not null,
PRIMARY KEY(cod_endereco)
);

create table cliente (
cod_cliente INTEGER UNSIGNED NOT NULL,
nome varchar(50) not null,
senha varchar(30) not null,
telefone varchar (20) not null,
email varchar(100) not null,
cpf varchar (20) not null,
PRIMARY KEY (cod_cliente),
cod_endereco INTEGER UNSIGNED NOT NULL,
foreign key (cod_endereco) references endereco(cod_endereco),
unique key (cpf),
unique key (email),
unique key (telefone)
);

create table produto (
cod_produto INTEGER UNSIGNED NOT NULL,
nome varchar(50) not null,
preco decimal(9,2) not null check(preco >=0),
descricao varchar(300) not null,
qtd_estoque integer unsigned check (qtd_estoque <= 1000),
PRIMARY KEY (cod_produto)
);

create table item (
cod_item INTEGER UNSIGNED NOT NULL,
qtd_produto integer unsigned,
subtotal decimal (9,2) check(subtotal >=0),
PRIMARY KEY (cod_item),
cod_produto INTEGER UNSIGNED NOT NULL,
foreign key (cod_produto) references produto(cod_produto)
);

create table pedido (
cod_pedido INTEGER UNSIGNED NOT NULL,
status_pedido enum('Preparando', 'Enviado', 'Entregue') not null,
total decimal (9,2) check(total >=0),
PRIMARY KEY (cod_pedido),
cod_item INTEGER UNSIGNED NOT NULL,
cod_cliente INTEGER UNSIGNED NOT NULL,
foreign key (cod_item) references item(cod_item),
foreign key (cod_cliente) references cliente(cod_cliente)
);

create table entregador (
cod_entregador INTEGER UNSIGNED NOT NULL,
nome varchar(50) not null,
telefone varchar(20) not null,
PRIMARY KEY (cod_entregador),
cod_endereco INTEGER UNSIGNED NOT NULL,
cod_pedido INTEGER UNSIGNED NOT NULL,
foreign key (cod_endereco) references endereco(cod_endereco),
foreign key (cod_pedido) references pedido(cod_pedido)
);


insert into endereco 
	(cod_endereco, rua, numero, bairro, cep)
values 
	(1,'Leonardo de Louco', 69, 'Piraponga', 04322069),
    (2,'General Licor', 420, 'Ipiranga', 05342169);
    
insert into cliente
	(cod_cliente, nome, senha, email, telefone, cpf, cod_endereco)
values
	(1, 'Kleber Lokão', '12345678', 'klebin.lok@gmail.com', '011987654321', 23423423433, 1),
    (2, 'Cludinho e Buchecha da Silva', '87654321', 'cludiobuchecha@gmail.com', '021912345678', 26374895711, 2);
    
insert into produto
	(cod_produto, nome, preco, descricao, qtd_estoque)
values
	(1,'Relógio', 299.99, 'Relógio Rolex', 20),
    (2,'Pé de Galinha', 200.01, 'Galinha Caipira', 300);
    
insert into item 
	(cod_item, qtd_produto, subtotal, cod_produto)
values
	(1, 2, 400.02, 2),
    (2, 1, 299.99, 2);
    
insert into pedido
	(cod_pedido, status_pedido, total , cod_item, cod_cliente)
values
	(1, 'Enviado', 299.99 , 1, 1),
    (2, 'Enviado', 200.01 , 2, 2);
    
insert into entregador
	(cod_entregador, nome, telefone, cod_endereco, cod_pedido)
values
	(1, 'Rodolfo da Motoca', '012123456789', 1, 1),
    (2, 'Kleidson Raspa a Placa', '022987654321', 2, 2);
    