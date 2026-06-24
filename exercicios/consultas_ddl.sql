CREATE SCHEMA mente_sa;

CREATE TABLE IF NOT EXISTS mente_sa.Pessoa (
    cpf char(11) PRIMARY KEY,
    email varchar(50) NOT NULL,
    nome varchar(100) NOT NULL,
    data_nasc date NOT NULL,
    endereco ,
    telefone varchar(15) NULL
    CONSTRAINT pessoa_un unique(email, nome)

);

CREATE TABLE IF NOT EXISTS mente_sa.Paciente (
    cpf_pessoa char(11) PRIMARY KEY,
    senha varchar(20) NOT NULL,
    plano_saude boolean NOT NULL default=('false'),
    CONSTRAINT cpf_pessoa_fk FOREIGN KEY (cpf_pessoa)
        REFERENCES mente_sa.Pessoa(cpf)  
);

CREATE TABLE IF NOT EXISTS mente_sa.Medico (
    cpf_pessoa char(11) PRIMARY KEY,
    crm varchar(10) UNIQUE NOT NULL,
    CONSTRAINT crm_un unique(crm),
    CONSTRAINT cpf_medico_fk FOREIGN KEY(cpf_medico)
        REFERENCES mente_sa.Pessoa(cpf)
);

CREATE TABLE IF NOT EXISTS mente_sa.Especialidade (
    id int PRIMARY KEY,
    descricao varchar(300) NOT NULL
);

CREATE TABLE IF NOT EXISTS mente_sa.MedicoEspecialidade(
    cpf_medico char(11),
    id_especialidade int,
    PRIMARY KEY (cpf_medico, id_especialidade),
    CONSTRAINT cpf_medico_fk FOREIGN KEY(cpf_medico)
        REFERENCES mente_sa.Medico(cpf_pessoa),
    CONSTRAINT identificador_fk FOREIGN KEY(id_especialidade)
        REFERENCES mente_sa.Especialidade(id) 
);

CREATE TABLE IF NOT EXISTS mente_sa.Agendamento (
    cpf_paciente char(11),
    cpf_medico char(11),
    dh_consulta timestamp,
    PRIMARY KEY (cpf_paciente, cpf_medico, dh_consulta),
    dh_agendamento timestamp NOT NULL DEFAULT=(current_timestamp),
    valor_consulta float NOT NULL DEFAULT=(0.0),
    CONSTRAINT cpf_paciente_pk FOREIGN KEY(cpf_paciente)
            REFERENCES mente_sa.Paciente(cpf_pessoa),
    CONSTRAINT cpf_medico_fk FOREIGN KEY(cpf_medico)
            REFERENCES mente_sa.Medico(cpf_pessoa) 
);