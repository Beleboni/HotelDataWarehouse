CREATE TABLE servico (
	chave_servico int not null primary key auto_increment,
    nome_servico varchar(50) not null
);

CREATE TABLE produto (
	chave_produto int not null primary key auto_increment,
    descricao varchar(50) not null
);

CREATE TABLE tempo (
	chave_tempo int not null primary key auto_increment,
    ano varchar(20) not null,
    trimestre char(1) not null,
    mes char(12) not null,
    data date not null
);

CREATE TABLE cliente (
	cpf_cliente int not null primary key auto_increment,
    nome_cliente varchar(50) not null,
    profissao_cliente varchar(40) not null
);

CREATE TABLE apartamento (
	chave_apto int not null primary key auto_increment,
    numero char(3) not null,
    andar char(3) not null
);

CREATE TABLE agencia (
	chave_agencia int not null primary key auto_increment, 
    NomeAgencia char(18) not null
);

CREATE TABLE consumos (
	chave_cons int not null primary key auto_increment,
    chave_apto int not null,
    cpf_cliente int not null,
    chave_tempo int not null,
    chave_produto int not null,
    chave_servico int not null,
    tipo_apartamento char(15) not null,
    descricao_motivo char(12) not null,
    descricao_meio_transp char(15) not null, 
    valor_consumo integer not null,
    quantidade int not null,
    
    foreign key(chave_servico) references servico(chave_servico),
    foreign key(chave_produto) references produto(chave_produto),
    foreign key(chave_tempo) references tempo(chave_tempo),
    foreign key(cpf_cliente) references cliente(cpf_cliente),
    foreign key(chave_apto) references apartamento(chave_apto)    
);

CREATE TABLE hospedagem (
	chave_de_hospedagem int not null primary key auto_increment,
    chave_apto int not null,
    chave_agencia int not null,
    cpf_cliente int not null,
    tipo_de_apartamento char(15) not null, 
    descricao_meio_transp char(15) not null,
    descricao_motivo char(12) not null,
    chave_tempo int not null,
    valor_faturado int not null,
    
    foreign key(chave_tempo) references tempo(chave_tempo),
    foreign key(chave_agencia) references agencia(chave_agencia),
    foreign key(chave_apto) references apartamento(chave_apto),
    foreign key(cpf_cliente) references cliente(cpf_cliente)
);