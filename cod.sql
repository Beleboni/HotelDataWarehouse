create table dm_servico(
	chave_servico int not null auto_increment primary key,
    nome_servico varchar(45)
);

insert into dm_servico(nome_servico)(select nome_servico from Servico);

create table dm_produto(
	chave_produto int not null auto_increment primary key,
    descricao varchar(45)
);

insert into dm_produto(descricao)(select descricao from Produto);

create table dm_tempo(
	chave_tempo int not null auto_increment primary key,
    ano varchar(45),
    trimestre varchar(1),
    mes varchar(12),
    data date
);

insert into dm_tempo(ano, trimestre, mes, data)(select ano, trimestre, mes, data from Tempo);

create table dm_cliente(
	cpf_cliente int not null auto_increment primary key,
	nome_cliente varchar(50),
    profissao_cliente varchar(40)
);

insert into dm_cliente(nome_cliente, profissao_cliente)(select nome_cliente, profissao_cliente from Cliente);

create table dm_apartamento(
	chave_apto int not null auto_increment primary key,
	numero varchar(3),
    andar varchar(3)
);

insert into dm_apartamento(numero, andar)(select numero, andar from Apartamento);

create table dm_agencia(
	chave_agencia int not null auto_increment primary key,
	NomeAgencia varchar(18)
);

insert into dm_agencia(NomeAgencia)(select NomeAgencia from Agencia);

create table dm_hospedagem (
    chave_apto int not null,
    chave_agencia int not null,
    cpf_cliente int not null,
    tipo_de_apartamento char(15) not null, 
    descricao_meio_transp char(15) not null,
    descricao_motivo char(12) not null,
    chave_tempo int not null,
    valor_faturado int not null,
    
    foreign key(chave_tempo) references dm_tempo(chave_tempo),
    foreign key(chave_agencia) references dm_agencia(chave_agencia),
    foreign key(chave_apto) references dm_apartamento(chave_apto),
    foreign key(cpf_cliente) references dm_cliente(cpf_cliente)
);

insert into dm_hospedagem (chave_apto, chave_agencia, cpf_cliente, tipo_de_apartamento, descricao_meio_transp, descricao_motivo, 
								chave_tempo, valor_faturado)(select chave_apto, chave_agencia, cpf_cliente, tipo_de_apartamento,
								descricao_meio_transp, descricao_motivo, chave_tempo, valor_faturado from Hospedagem);


create table dm_consumos(
	chave_cons int not null auto_increment primary key,
    chave_apto int(11),
    cpf_cliente int(11),
    chave_tempo int(11),
    chave_produto int(11),
    chave_servico int(11),
    tipo_apartamento varchar(15),
    descricao_motivo varchar(12),
    descricao_meio_transp char(15),
    valor_consumo int(11),
    quantidade int(11),
    
	foreign key(chave_servico) references dm_servico(chave_servico),
    foreign key(chave_produto) references dm_produto(chave_produto),
    foreign key(chave_tempo) references dm_tempo(chave_tempo),
    foreign key(cpf_cliente) references dm_cliente(cpf_cliente),
    foreign key(chave_apto) references dm_apartamento(chave_apto)    
);

insert into dm_consumos(chave_apto, cpf_cliente, chave_tempo, chave_produto, chave_servico, tipo_apartamento,
								descricao_motivo, descricao_meio_transp, valor_consumo, quantidade)
									(select chave_apto, cpf_cliente, chave_tempo, chave_produto, chave_servico, tipo_apartamento,
												descricao_motivo, descricao_meio_transp, valor_consumo, quantidade from Consumos);
                                                
select chave_apto from dm_consumos con join dm_cliente cli on con.cpf_cliente = cli.cpf_cliente where cli.cpf_cliente = 2;