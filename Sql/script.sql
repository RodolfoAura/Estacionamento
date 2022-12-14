drop database if exists Estacionamento;
create database Estacionamento charset=UTF8 collate utf8_general_ci;
use Estacionamento;

create table clientes(
    id_cliente integer not null primary key auto_increment,
    nome varchar(50) not null,
    telefone date not null
);

create table telefones(
    id_cliente integer not null,
    numero varchar(15) not null,
    foreign key (id_cliente) references clientes(id_cliente)
);

create table Veiculo(
    id_cliente integer not null,
    placa_veiculo varchar(10) not null primary key,
    cor varchar(50) ,
    modelo varchar(30),
    tipo_veiculo varchar(10),
    foreign key (id_cliente) references clientes(id_cliente)
);

create table Vagas (
    id_vaga integer not null primary key,
    tipo varchar(20),
    stat boolean not null,
    hr_ent date,
    hr_sai date
);

create table entradas(
    id_cliente integer not null,
    placa_veiculo varchar(20),
    id_vaga integer not null,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (placa_veiculo) references Veiculo(placa_veiculo),
    foreign key (id_vaga) references Vagas(id_vaga)
);

create view vw_historico as
select s.id_cliente, s.placa_veiculo, s.tipo_veiculo , i.id_vaga, i.hr_ent,
i.hr_sai from Veiculo s
inner join clientes c on s.id_cliente = c.id_cliente
inner join entradas v on s.placa_veiculo = v.placa_veiculo
inner join  Vagas i on v.id_vaga = i.id_vaga;


