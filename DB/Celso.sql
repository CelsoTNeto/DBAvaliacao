
use master
go

drop database Lojainfo
go
create database Lojainfo 
go 

use Lojainfo
go

create table tb_clientes(
       id_cliente int PRIMARY KEY IDENTITY(1,1),
       nome nvarchar(50) not null,
       endereco nvarchar(100),
       idade int NOT NULL,
       sexo char(1) NOT NULL,
       fone nvarchar(15),
       email nvarchar(70),
)
GO

create table tb_hardware(
       id_hardware int PRIMARY KEY IDENTITY(1,1),
       descricao nvarchar(50) not null,
       preco_unit decimal NOT NULL,
       qtde_atual int NOT NULL, --0 caso nao tenha no estoque
       qtde_minima int,
       img image DEFAULT NULL
)
GO

create table tb_vendas(
       id_venda int primary key IDENTITY(1,1),
       id_cliente int not null,
       data date not null,
       desconto decimal(2,2)
)
GO

create table tb_vendaCancelada(
				id_vendaCancelada int unique identity(1,1),
				id_venda int not null)
go

create table tb_vendas_itens(
       id_item int PRIMARY KEY identity(1,1),
       id_venda int not null,
       id_hardware int not null,
       qtde_item int not null,
       pco_vda decimal(8,2) not null
)
GO

alter table tb_vendas
      ADD CONSTRAINT fk_vda_cli
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
      go 

alter table tb_vendaCancelada
		add constraint fk_cancelamentos
		foreign key (id_vendaCancelada) references tb_vendas(id_venda)

alter table tb_vendaCancelada
	ADD CONSTRAINT fk_vda_cancelada 
	FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda)
	go

alter table tb_vendas_itens
	ADD CONSTRAINT fk_vda_venda 
	FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda)
	go
alter table tb_hardware
	ADD CONSTRAINT fk_vda_hardware
	FOREIGN KEY (id_hardware) REFERENCES tb_hardware(id_hardware)
	go
alter table tb_vendas_itens
	ADD CONSTRAINT fk_vda_hardware2
	FOREIGN KEY (id_hardware) REFERENCES tb_hardware(id_hardware)
	go
	
insert into tb_clientes (nome,idade,sexo,email,endereco,fone) VALUES ('jose',17,'M','marcos@gmail.com','Rua josézinho, 12', 25644523),
																					('Maria',45,'F','joao@gmail.com','Rua josézinho, 17', 25786817),
																					('Gustavo',18,'M','gustavooliver@gmail.com','Rua joaozinho, 24', 24242424),
																					('Celso',19,'M','celsinha@gmail.com','Rua solina, 69', 56789411),
																					('Joaquina',16,'F','maria@gmail.com','Rua da feira, 55', 77886633)
																					
go
 insert into tb_hardware (descricao,preco_unit,qtde_atual,qtde_minima) VALUES ('Teclado', 999.00, 20,15),
																			  ('Placa mae', 1000.00, 25, 10),
																			  ('fonte', 200.00, 10,1),
																			  ('Monitor', 150.00, 20,5),
																			  ('Mouse gamer', 100.00, 30,10)
go
insert into tb_vendas (data,id_cliente) VALUES ('07/08/2019', 1),
											 ('19/08/2000', 2 ),
											 ('20/05/1999', 3 ),
											 ('14/06/2001', 4 ),
											 ('30/01/2002', 5 )
go
insert into tb_vendas_itens (id_venda,id_hardware,pco_vda,qtde_item) VALUES 
														(1,2,1000.00,1),
														(2,1,999.00,1),
														(3,4,300.00,2),
														(4,5,400.00,4),
														(5,3,600.00,3)
go

insert into tb_vendaCancelada (id_venda) values ('1');
																			  
			go 																 
select * from tb_clientes
go
select * from tb_hardware
go
select * from tb_vendas
go
select * from tb_vendas_itens
go
select * from tb_vendaCancelada
go
