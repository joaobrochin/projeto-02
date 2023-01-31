-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2022-09-13 21:38:06 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_jk_agenda (
    cod_agenda               NUMBER(6) NOT NULL,
    dat_hor_agenda           DATE NOT NULL,
    t_jk_empresa_cod_empresa NUMBER(6) NOT NULL,
    des_agenda               VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_jk_agenda.cod_agenda IS
    'campo codigo ID agenda';

COMMENT ON COLUMN t_jk_agenda.dat_hor_agenda IS
    'campo data e horario da agenda
DD/MM/AAAA HH:mm:ss';

COMMENT ON COLUMN t_jk_agenda.t_jk_empresa_cod_empresa IS
    'chave estrangeria empresa';

COMMENT ON COLUMN t_jk_agenda.des_agenda IS
    'Nome do compromisso';

ALTER TABLE t_jk_agenda ADD CONSTRAINT t_jk_agenda_pk PRIMARY KEY ( cod_agenda );

CREATE TABLE t_jk_atendimento (
    cod_atendimento          NUMBER(6) NOT NULL,
    dat_hora_inicio          DATE NOT NULL,
    dat_hora_fim             DATE,
    des_laudo                VARCHAR2(4000) NOT NULL,
    sta_pagamento            CHAR(1) DEFAULT 'P' NOT NULL,
    val_atendimento          NUMBER(9, 2),
    val_desconto             NUMBER(5, 2),
    t_jk_maquina_cod_maquina NUMBER(6) NOT NULL,
    t_jk_visita_cod_visita   NUMBER(6) NOT NULL
);

ALTER TABLE t_jk_atendimento
    ADD CONSTRAINT ck_sta_pagamento CHECK ( sta_pagamento IN ( 'P', 'R' ) );

COMMENT ON COLUMN t_jk_atendimento.cod_atendimento IS
    'campo chave ID atendimento';

COMMENT ON COLUMN t_jk_atendimento.dat_hora_inicio IS
    'Data/hora do inicio do atendimento.
DD/MM/AAAA hh:mm:ss';

COMMENT ON COLUMN t_jk_atendimento.dat_hora_fim IS
    'Data/hora do fim do atendimento.
DD/MM/AAAA hh:mm:ss';

COMMENT ON COLUMN t_jk_atendimento.des_laudo IS
    'Armazenamento das informações do laudo';

COMMENT ON COLUMN t_jk_atendimento.sta_pagamento IS
    'Status de pagamento do atendimento/visita
P - Pendente
R - Realizado';

COMMENT ON COLUMN t_jk_atendimento.val_atendimento IS
    'campo contendo valor do atendimento
9999999,99';

COMMENT ON COLUMN t_jk_atendimento.val_desconto IS
    'campo contendo valor do desconto
999,99';

COMMENT ON COLUMN t_jk_atendimento.t_jk_maquina_cod_maquina IS
    'chave estrangeria maquina';

COMMENT ON COLUMN t_jk_atendimento.t_jk_visita_cod_visita IS
    'chave estrangeria visita';

CREATE UNIQUE INDEX t_jk_atendimento__idx ON
    t_jk_atendimento (
        t_jk_visita_cod_visita
    ASC );

ALTER TABLE t_jk_atendimento ADD CONSTRAINT t_jk_atendimento_pk PRIMARY KEY ( cod_atendimento );

CREATE TABLE t_jk_automacao (
    cod_automacao    NUMBER(3) NOT NULL,
    dt_hora_inicio   DATE NOT NULL,
    dt_hora_fim      DATE,
    t_jk_iot_cod_iot NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_automacao.cod_automacao IS
    'chave primária da tabela';

COMMENT ON COLUMN t_jk_automacao.dt_hora_inicio IS
    'Data e hora do inicio de uma automação
Formato: dd/mm/aaaa hh:mm:ss';

COMMENT ON COLUMN t_jk_automacao.dt_hora_fim IS
    'Data e hora de fim da automação
Formato: dd/mm/aaaa hh:mm:ss';

COMMENT ON COLUMN t_jk_automacao.t_jk_iot_cod_iot IS
    'chave estrangeira t__jk_oit';

CREATE UNIQUE INDEX t_jk_automacao__idx ON
    t_jk_automacao (
        t_jk_iot_cod_iot
    ASC );

ALTER TABLE t_jk_automacao ADD CONSTRAINT t_jk_automacao_pk PRIMARY KEY ( cod_automacao );

CREATE TABLE t_jk_bairro (
    cod_bairro             NUMBER(6) NOT NULL,
    nom_bairro             VARCHAR2(50) NOT NULL,
    t_jk_cidade_cod_cidade NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_bairro.cod_bairro IS
    'campo codigo do bairro';

COMMENT ON COLUMN t_jk_bairro.nom_bairro IS
    'campo nome do bairro';

ALTER TABLE t_jk_bairro ADD CONSTRAINT t_jk_bairro_pk PRIMARY KEY ( cod_bairro );

CREATE TABLE t_jk_cargo (
    cod_cargo         NUMBER(6) NOT NULL,
    nom_cargo         VARCHAR2(30) NOT NULL,
    dat_inicio        DATE NOT NULL,
    dat_fim           DATE,
    t_jk_func_num_mat NUMBER(6) NOT NULL,
    t_jk_dpt_cod_dpt  NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_cargo.cod_cargo IS
    'campo codigo do cargo';

COMMENT ON COLUMN t_jk_cargo.nom_cargo IS
    'nome do cargo';

COMMENT ON COLUMN t_jk_cargo.dat_inicio IS
    'campo data do inicio 
DD/MM/AAAA HH:mm:ss';

COMMENT ON COLUMN t_jk_cargo.dat_fim IS
    'campo data final 
DD/MM/AAAA HH:mm:ss';

COMMENT ON COLUMN t_jk_cargo.t_jk_func_num_mat IS
    'chave estrangeria funcionario';

COMMENT ON COLUMN t_jk_cargo.t_jk_dpt_cod_dpt IS
    'chave estrangeria departamento';

ALTER TABLE t_jk_cargo ADD CONSTRAINT t_jk_cargo_pk PRIMARY KEY ( cod_cargo );

CREATE TABLE t_jk_cat_maqui (
    cod_categoria NUMBER(6) NOT NULL,
    des_categoria VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_jk_cat_maqui.cod_categoria IS
    'codigo ID da categoria';

COMMENT ON COLUMN t_jk_cat_maqui.des_categoria IS
    'campo descricao da categoria
VARCHAR (30)';

ALTER TABLE t_jk_cat_maqui ADD CONSTRAINT t_jk_cat_maqui_pk PRIMARY KEY ( cod_categoria );

ALTER TABLE t_jk_cat_maqui ADD CONSTRAINT t_jk_cat_maq_des_cat_un UNIQUE ( des_categoria );

CREATE TABLE t_jk_cidade (
    cod_cidade             NUMBER(6) NOT NULL,
    nom_cidade             VARCHAR2(30) NOT NULL,
    t_jk_estado_cod_estado NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_cidade.cod_cidade IS
    'campo codigo cidade';

COMMENT ON COLUMN t_jk_cidade.nom_cidade IS
    'campo nome da cidade';

ALTER TABLE t_jk_cidade ADD CONSTRAINT t_jk_cidade_pk PRIMARY KEY ( cod_cidade );

CREATE TABLE t_jk_departamento (
    cod_departamento         NUMBER(6) NOT NULL,
    nom_departamento         VARCHAR2(30) NOT NULL,
    t_jk_empresa_cod_empresa NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_departamento.cod_departamento IS
    'campo codigo do departamento PK';

COMMENT ON COLUMN t_jk_departamento.nom_departamento IS
    'campo nome do departamento';

COMMENT ON COLUMN t_jk_departamento.t_jk_empresa_cod_empresa IS
    'chave estrangeria empresa';

ALTER TABLE t_jk_departamento ADD CONSTRAINT t_jk_departamento_pk PRIMARY KEY ( cod_departamento );

CREATE TABLE t_jk_email (
    cod_email NUMBER(6) NOT NULL,
    end_email VARCHAR2(255 CHAR) NOT NULL,
    sta_email CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE t_jk_email
    ADD CONSTRAINT ck_sta_email CHECK ( sta_email IN ( '', 'A', 'I' ) );

COMMENT ON COLUMN t_jk_email.cod_email IS
    'campo codigo e-mail';

COMMENT ON COLUMN t_jk_email.end_email IS
    'campo endereco de e-amail';

COMMENT ON COLUMN t_jk_email.sta_email IS
    'Status do e-mail
A - Ativo
I - Inativo';

ALTER TABLE t_jk_email ADD CONSTRAINT t_jk_email_pk PRIMARY KEY ( cod_email );

CREATE TABLE t_jk_emp_email (
    cod_emp_email            NUMBER(6) NOT NULL,
    t_jk_empresa_cod_empresa NUMBER(6) NOT NULL,
    t_jk_email_cod_email     NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_emp_email.cod_emp_email IS
    'campo chave ID emp_email';

COMMENT ON COLUMN t_jk_emp_email.t_jk_empresa_cod_empresa IS
    'chave estrangeria empresa';

COMMENT ON COLUMN t_jk_emp_email.t_jk_email_cod_email IS
    'chave estrangeria email';

ALTER TABLE t_jk_emp_email ADD CONSTRAINT t_jk_emp_email_pk PRIMARY KEY ( cod_emp_email );

CREATE TABLE t_jk_emp_end (
    cod_emp_end                  NUMBER(6) NOT NULL,
    t_jk_empresa_cod_empresa     NUMBER(6) NOT NULL,
    t_jk_endereco_cod_endereco   NUMBER(6) NOT NULL,
    t_jk_endereco_cod_logradouro NUMBER(6) NOT NULL,
    dt_inicio                    DATE NOT NULL,
    dt_fim                       DATE
);

COMMENT ON COLUMN t_jk_emp_end.cod_emp_end IS
    'campo codigo ID emp_end';

COMMENT ON COLUMN t_jk_emp_end.t_jk_empresa_cod_empresa IS
    'chave estrangeria empresa';

COMMENT ON COLUMN t_jk_emp_end.t_jk_endereco_cod_endereco IS
    'chave estrangeira end';

COMMENT ON COLUMN t_jk_emp_end.t_jk_endereco_cod_logradouro IS
    'chave estrangeria logradouro';

COMMENT ON COLUMN t_jk_emp_end.dt_inicio IS
    'Data de início das atividades da empresa no endereço associado
DD/MM/AAAA HH:mm:ss';

COMMENT ON COLUMN t_jk_emp_end.dt_fim IS
    'data de fim das atividades da empresa no endereço
DD/MM/AAAA HH:mm:ss';

ALTER TABLE t_jk_emp_end ADD CONSTRAINT t_jk_emp_end_pk PRIMARY KEY ( cod_emp_end );

CREATE TABLE t_jk_emp_tel (
    cod_emp_tel                NUMBER(6) NOT NULL,
    t_jk_empresa_cod_empresa   NUMBER(6) NOT NULL,
    t_jk_telefone_cod_telefone NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_emp_tel.cod_emp_tel IS
    'chave ID emp_tel';

COMMENT ON COLUMN t_jk_emp_tel.t_jk_empresa_cod_empresa IS
    'chave estrangeria empresa';

COMMENT ON COLUMN t_jk_emp_tel.t_jk_telefone_cod_telefone IS
    'chave estrangeria telefone';

ALTER TABLE t_jk_emp_tel
    ADD CONSTRAINT t_jk_emp_tel_pk PRIMARY KEY ( cod_emp_tel,
                                                 t_jk_empresa_cod_empresa,
                                                 t_jk_telefone_cod_telefone );

CREATE TABLE t_jk_empresa (
    cod_empresa        NUMBER(6) NOT NULL,
    num_cnpj           VARCHAR2(18) NOT NULL,
    nom_razao_social   VARCHAR2(50) NOT NULL,
    nom_fantasia       VARCHAR2(50),
    nom_origem_contato VARCHAR2(50),
    sta_empresa        CHAR(1) DEFAULT 'A' NOT NULL,
    t_jk_ramo_cod_ramo NUMBER NOT NULL
);

ALTER TABLE t_jk_empresa
    ADD CONSTRAINT ck_sta_empresa CHECK ( sta_empresa IN ( 'A', 'I' ) );

COMMENT ON COLUMN t_jk_empresa.cod_empresa IS
    'campo codigo ID da empresa';

COMMENT ON COLUMN t_jk_empresa.num_cnpj IS
    'campo numero CNJP';

COMMENT ON COLUMN t_jk_empresa.nom_razao_social IS
    'campo nome razao social';

COMMENT ON COLUMN t_jk_empresa.nom_fantasia IS
    'campo nome fantasia';

COMMENT ON COLUMN t_jk_empresa.nom_origem_contato IS
    'campo nome da origem do contato ';

COMMENT ON COLUMN t_jk_empresa.sta_empresa IS
    'Status da empresa
A - Ativo
I - Inativo';

ALTER TABLE t_jk_empresa ADD CONSTRAINT t_jk_empresa_pk PRIMARY KEY ( cod_empresa );

ALTER TABLE t_jk_empresa ADD CONSTRAINT t_jk_empresa_num_cnpj_un UNIQUE ( num_cnpj );

CREATE TABLE t_jk_endereco (
    cod_endereco                   NUMBER(6) NOT NULL,
    sta_endereco                   CHAR(1) DEFAULT 'A' NOT NULL,
    num_endereco                   NUMBER(6) NOT NULL,
    nom_complemento                VARCHAR2(50),
    t_jk_logradouro_cod_logradouro NUMBER(6) NOT NULL
);

ALTER TABLE t_jk_endereco
    ADD CONSTRAINT ck_sta_end CHECK ( sta_endereco IN ( '', 'A', 'I' ) );

COMMENT ON COLUMN t_jk_endereco.cod_endereco IS
    'campo codigo endereco';

COMMENT ON COLUMN t_jk_endereco.sta_endereco IS
    'Status do endereco
A - Ativo
I - Inativo';

COMMENT ON COLUMN t_jk_endereco.num_endereco IS
    'campo numero do local do endereco';

COMMENT ON COLUMN t_jk_endereco.nom_complemento IS
    'complemento do endereco';

ALTER TABLE t_jk_endereco ADD CONSTRAINT t_jk_endereco_pk PRIMARY KEY ( cod_endereco,
                                                                        t_jk_logradouro_cod_logradouro );

CREATE TABLE t_jk_estado (
    cod_estado NUMBER(6) NOT NULL,
    nom_estado VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_jk_estado.cod_estado IS
    'campo codigo do estado';

COMMENT ON COLUMN t_jk_estado.nom_estado IS
    'campo nome do estado';

ALTER TABLE t_jk_estado ADD CONSTRAINT t_jk_estado_pk PRIMARY KEY ( cod_estado );

CREATE TABLE t_jk_func_email (
    cod_func_email                 NUMBER(6) NOT NULL,
    t_jk_funcionario_num_matricula NUMBER(6) NOT NULL,
    t_jk_email_cod_email           NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_func_email.cod_func_email IS
    'campo chave ID PK';

COMMENT ON COLUMN t_jk_func_email.t_jk_funcionario_num_matricula IS
    'chave estrangeria func';

COMMENT ON COLUMN t_jk_func_email.t_jk_email_cod_email IS
    'chave estrangeria email';

ALTER TABLE t_jk_func_email ADD CONSTRAINT t_jk_func_email_pk PRIMARY KEY ( cod_func_email );

CREATE TABLE t_jk_func_end (
    cod_func_end                   NUMBER(6) NOT NULL,
    t_jk_funcionario_num_matricula NUMBER(6) NOT NULL,
    t_jk_endereco_cod_endereco     NUMBER(6) NOT NULL,
    t_jk_endereco_cod_logradouro   NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_func_end.cod_func_end IS
    'ID func_end';

COMMENT ON COLUMN t_jk_func_end.t_jk_funcionario_num_matricula IS
    'chave estrangeria funcionario';

COMMENT ON COLUMN t_jk_func_end.t_jk_endereco_cod_endereco IS
    'chave estrangeria cod_endereco';

COMMENT ON COLUMN t_jk_func_end.t_jk_endereco_cod_logradouro IS
    'chave estrangeira logradouro';

ALTER TABLE t_jk_func_end ADD CONSTRAINT t_jk_func_end_pk PRIMARY KEY ( cod_func_end );

CREATE TABLE t_jk_funcionario (
    num_matricula   NUMBER(6) NOT NULL,
    nom_funcionario VARCHAR2(45) NOT NULL,
    nom_login       VARCHAR2(20) NOT NULL,
    inf_senha       VARCHAR2(20) NOT NULL,
    dat_nascimento  DATE NOT NULL,
    num_rg          VARCHAR2(12) NOT NULL,
    num_cpf         VARCHAR2(14) NOT NULL,
    inf_genero      CHAR(1) NOT NULL,
    num_altura      NUMBER(3, 2) NOT NULL,
    num_peso        NUMBER(5, 2) NOT NULL
);

ALTER TABLE t_jk_funcionario
    ADD CONSTRAINT ck_genero_biologico CHECK ( inf_genero IN ( 'F', 'M' ) );

COMMENT ON COLUMN t_jk_funcionario.num_matricula IS
    'campo numero de matricula do funcionario';

COMMENT ON COLUMN t_jk_funcionario.nom_funcionario IS
    'campo nome do funcionario';

COMMENT ON COLUMN t_jk_funcionario.nom_login IS
    'campo login funcionario';

COMMENT ON COLUMN t_jk_funcionario.inf_senha IS
    'campo senha funcionario';

COMMENT ON COLUMN t_jk_funcionario.dat_nascimento IS
    'campo data de nascimento do funcionario 
DD/MM/AAAA';

COMMENT ON COLUMN t_jk_funcionario.num_rg IS
    'campo numero de RG do funcionario';

COMMENT ON COLUMN t_jk_funcionario.num_cpf IS
    'campo numero de CPF do funcionario';

COMMENT ON COLUMN t_jk_funcionario.inf_genero IS
    'Informação do gênero biológico
F - Feminino
M - Masculino
';

COMMENT ON COLUMN t_jk_funcionario.num_altura IS
    'campo altura funcionaro';

COMMENT ON COLUMN t_jk_funcionario.num_peso IS
    'campo peso funcionario';

ALTER TABLE t_jk_funcionario ADD CONSTRAINT t_jk_funcionario_pk PRIMARY KEY ( num_matricula );

ALTER TABLE t_jk_funcionario ADD CONSTRAINT t_jk_funcionario_nom_login_un UNIQUE ( nom_login );

ALTER TABLE t_jk_funcionario ADD CONSTRAINT t_jk_funcionario_num_cpf_un UNIQUE ( num_cpf );

ALTER TABLE t_jk_funcionario ADD CONSTRAINT t_jk_funcionario_num_rg_un UNIQUE ( num_rg );

CREATE TABLE t_jk_iot (
    cod_iot        NUMBER(6) NOT NULL,
    nom_fornecedor VARCHAR2(30) NOT NULL,
    sta_iot        CHAR(1) DEFAULT 'A' NOT NULL,
    num_serie      NUMBER(6) NOT NULL
);

ALTER TABLE t_jk_iot
    ADD CONSTRAINT ck_sta_iot CHECK ( sta_iot IN ( 'A', 'I' ) );

COMMENT ON COLUMN t_jk_iot.cod_iot IS
    'id do IOT';

COMMENT ON COLUMN t_jk_iot.nom_fornecedor IS
    'campo nome do fornecedor';

COMMENT ON COLUMN t_jk_iot.sta_iot IS
    'Status do IOT
A - Ativo
I - Inativo';

COMMENT ON COLUMN t_jk_iot.num_serie IS
    'número de sério do equipamento IOT';

ALTER TABLE t_jk_iot ADD CONSTRAINT t_jk_iot_pk PRIMARY KEY ( cod_iot );

ALTER TABLE t_jk_iot ADD CONSTRAINT t_jk_iot_num_serie_un UNIQUE ( num_serie );

CREATE TABLE t_jk_logradouro (
    cod_logradouro         NUMBER(6) NOT NULL,
    nom_logradouro         VARCHAR2(150) NOT NULL,
    num_cep                NUMBER(8) NOT NULL,
    t_jk_bairro_cod_bairro NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_logradouro.cod_logradouro IS
    'campo codigo do logradouro ';

COMMENT ON COLUMN t_jk_logradouro.nom_logradouro IS
    'campo nome do logradouro';

COMMENT ON COLUMN t_jk_logradouro.num_cep IS
    'campo numero do cep';

ALTER TABLE t_jk_logradouro ADD CONSTRAINT t_jk_logradouro_pk PRIMARY KEY ( cod_logradouro );

CREATE TABLE t_jk_maquina (
    cod_maquina          NUMBER(6) NOT NULL,
    sta_maquina          CHAR(1) DEFAULT 'A' NOT NULL,
    t_jk_emp_cod_emp     NUMBER(6) NOT NULL,
    t_jk_cat_maq_cod_cat NUMBER(6) NOT NULL,
    nom_maquina          VARCHAR2(30) NOT NULL,
    t_jk_iot_cod_iot     NUMBER(6) NOT NULL
);

ALTER TABLE t_jk_maquina
    ADD CONSTRAINT ck_sta_maquina CHECK ( sta_maquina IN ( 'A', 'I' ) );

COMMENT ON COLUMN t_jk_maquina.cod_maquina IS
    'campo codigo da maquina';

COMMENT ON COLUMN t_jk_maquina.sta_maquina IS
    'Status da maquina 
A - Ativo
I - Inativo';

COMMENT ON COLUMN t_jk_maquina.t_jk_emp_cod_emp IS
    'chave estrangeria empresa';

COMMENT ON COLUMN t_jk_maquina.t_jk_cat_maq_cod_cat IS
    'chave estrangeira categoria';

COMMENT ON COLUMN t_jk_maquina.nom_maquina IS
    'Nome da máquina';

COMMENT ON COLUMN t_jk_maquina.t_jk_iot_cod_iot IS
    'chave estrangeria iot';

CREATE UNIQUE INDEX t_jk_maquina__idx ON
    t_jk_maquina (
        t_jk_iot_cod_iot
    ASC );

ALTER TABLE t_jk_maquina ADD CONSTRAINT t_jk_maquina_pk PRIMARY KEY ( cod_maquina );

CREATE TABLE t_jk_prop (
    cod_prop       NUMBER(6) NOT NULL,
    nom_prop       VARCHAR2(30) NOT NULL,
    nom_apelido    VARCHAR2(30),
    dat_nascimento DATE NOT NULL,
    num_rg         VARCHAR2(12) NOT NULL,
    num_cpf        VARCHAR2(14) NOT NULL,
    des_genero     CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_jk_prop.cod_prop IS
    'campo codigo proprietario';

COMMENT ON COLUMN t_jk_prop.nom_prop IS
    'campo nome do proprietario';

COMMENT ON COLUMN t_jk_prop.nom_apelido IS
    'campo nome apelido';

COMMENT ON COLUMN t_jk_prop.dat_nascimento IS
    'campo data de nascimento do proprietario ';

COMMENT ON COLUMN t_jk_prop.num_rg IS
    'campo numero de RG do proprietario';

COMMENT ON COLUMN t_jk_prop.num_cpf IS
    'campo numero de CPF do proprietario';

COMMENT ON COLUMN t_jk_prop.des_genero IS
    'F - Feminino
M - Masculino
O - Outro';

ALTER TABLE t_jk_prop ADD CONSTRAINT t_jk_prop_pk PRIMARY KEY ( cod_prop );

ALTER TABLE t_jk_prop ADD CONSTRAINT t_jk_prop_num_cpf_un UNIQUE ( num_cpf );

ALTER TABLE t_jk_prop ADD CONSTRAINT t_jk_prop_num_rg_un UNIQUE ( num_rg );

CREATE TABLE t_jk_prop_email (
    cod_prop_email       NUMBER(6) NOT NULL,
    t_jk_prop_cod_prop   NUMBER(6) NOT NULL,
    t_jk_email_cod_email NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_prop_email.cod_prop_email IS
    'campo codigo id prop_email';

COMMENT ON COLUMN t_jk_prop_email.t_jk_prop_cod_prop IS
    'chave estrangeria prop';

COMMENT ON COLUMN t_jk_prop_email.t_jk_email_cod_email IS
    'chave estrangeria email';

ALTER TABLE t_jk_prop_email ADD CONSTRAINT t_jk_prop_email_pk PRIMARY KEY ( cod_prop_email );

CREATE TABLE t_jk_prop_empresa (
    cod_prop_empresa         NUMBER(6) NOT NULL,
    t_jk_prop_cod_prop       NUMBER(6) NOT NULL,
    t_jk_empresa_cod_empresa NUMBER(6) NOT NULL
);

COMMENT ON TABLE t_jk_prop_empresa IS
    'Tabela com dados do(s) proprietário(s) da empresa';

COMMENT ON COLUMN t_jk_prop_empresa.cod_prop_empresa IS
    'Codigo ID  proprietario empresa ';

COMMENT ON COLUMN t_jk_prop_empresa.t_jk_prop_cod_prop IS
    'chave estrangeira de proprietario';

COMMENT ON COLUMN t_jk_prop_empresa.t_jk_empresa_cod_empresa IS
    'chave estrangeria de empresa';

ALTER TABLE t_jk_prop_empresa
    ADD CONSTRAINT t_jk_prop_empresa_pk PRIMARY KEY ( cod_prop_empresa,
                                                      t_jk_prop_cod_prop,
                                                      t_jk_empresa_cod_empresa );

CREATE TABLE t_jk_prop_tel (
    cod_prop_tel               NUMBER(6) NOT NULL,
    t_jk_telefone_cod_telefone NUMBER(6) NOT NULL,
    t_jk_prop_cod_prop         NUMBER(6) NOT NULL
);

COMMENT ON COLUMN t_jk_prop_tel.cod_prop_tel IS
    'campo ID prop_tel';

COMMENT ON COLUMN t_jk_prop_tel.t_jk_telefone_cod_telefone IS
    'chave estrangeria codigo telefone';

COMMENT ON COLUMN t_jk_prop_tel.t_jk_prop_cod_prop IS
    'chave estrangeria proprietario';

ALTER TABLE t_jk_prop_tel
    ADD CONSTRAINT t_jk_prop_tel_pk PRIMARY KEY ( cod_prop_tel,
                                                  t_jk_telefone_cod_telefone,
                                                  t_jk_prop_cod_prop );

CREATE TABLE t_jk_prospeccao (
    cod_prospc             NUMBER(6) NOT NULL,
    t_jk_visita_cod_visita NUMBER(6) NOT NULL,
    des_pauta              VARCHAR2(4000) NOT NULL,
    dat_inicio             DATE NOT NULL,
    dat_fim                DATE
);

COMMENT ON COLUMN t_jk_prospeccao.cod_prospc IS
    'chave primária id ';

COMMENT ON COLUMN t_jk_prospeccao.t_jk_visita_cod_visita IS
    'chave estrangeria visita';

COMMENT ON COLUMN t_jk_prospeccao.des_pauta IS
    'Pauta das visitas de prospecção / reunião de negócios';

COMMENT ON COLUMN t_jk_prospeccao.dat_inicio IS
    'data de inicio
formato: DD/MM/AAAA HH:mm:ss';

COMMENT ON COLUMN t_jk_prospeccao.dat_fim IS
    'data de fim
formato: DD/MM/AAAA HH:mm:ss';

CREATE UNIQUE INDEX t_jk_prospeccao__idx ON
    t_jk_prospeccao (
        t_jk_visita_cod_visita
    ASC );

ALTER TABLE t_jk_prospeccao ADD CONSTRAINT t_jk_prospeccao_pk PRIMARY KEY ( cod_prospc );

CREATE TABLE t_jk_ramo (
    cod_ramo NUMBER NOT NULL,
    nom_ramo VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_jk_ramo.cod_ramo IS
    'codigo ID  do ramo';

COMMENT ON COLUMN t_jk_ramo.nom_ramo IS
    'campo nome do ramo
VARCHAR (30)';

ALTER TABLE t_jk_ramo ADD CONSTRAINT t_jk_ramo_pk PRIMARY KEY ( cod_ramo );

ALTER TABLE t_jk_ramo ADD CONSTRAINT t_jk_ramo_nom_ramo_un UNIQUE ( nom_ramo );

CREATE TABLE t_jk_telefone (
    cod_telefone NUMBER(6) NOT NULL,
    cod_ddi      VARCHAR2(4),
    cod_ddd      NUMBER(2),
    num_telefone NUMBER(9) NOT NULL,
    num_ramal    NUMBER(4),
    sta_telefone CHAR(1) DEFAULT 'A' NOT NULL
);

ALTER TABLE t_jk_telefone
    ADD CONSTRAINT ck_sta_tel CHECK ( sta_telefone IN ( 'A', 'I' ) );

COMMENT ON COLUMN t_jk_telefone.cod_telefone IS
    'Chave primarária da tabela de telefone';

COMMENT ON COLUMN t_jk_telefone.cod_ddi IS
    'código usado para ligações internacionais';

COMMENT ON COLUMN t_jk_telefone.cod_ddd IS
    'campo do código DDD - usado para ligações a distância';

COMMENT ON COLUMN t_jk_telefone.num_telefone IS
    'campo numero de telefone';

COMMENT ON COLUMN t_jk_telefone.num_ramal IS
    'campo numero do ramal';

COMMENT ON COLUMN t_jk_telefone.sta_telefone IS
    'Status do telefone
A - Ativo
I - Inativo';

ALTER TABLE t_jk_telefone ADD CONSTRAINT t_jk_telefone_pk PRIMARY KEY ( cod_telefone );

ALTER TABLE t_jk_telefone ADD CONSTRAINT t_jk_telefone_num_telefone_un UNIQUE ( num_telefone );

CREATE TABLE t_jk_visita (
    cod_visita             NUMBER(6) NOT NULL,
    sta_visita             CHAR(1) DEFAULT 'A' NOT NULL,
    tip_visita             VARCHAR2(30) NOT NULL,
    t_jk_agenda_cod_agenda NUMBER(6) NOT NULL
);

ALTER TABLE t_jk_visita
    ADD CONSTRAINT ck_sta_visita CHECK ( sta_visita IN ( 'A', 'C', 'E', 'F', 'O',
                                                         'P' ) );

COMMENT ON COLUMN t_jk_visita.cod_visita IS
    'campo codigo da visita';

COMMENT ON COLUMN t_jk_visita.sta_visita IS
    'Status da visita
C - concluido
P - pendente
A - aberto
E - Em atendimento
F - freeze
O - outros';

COMMENT ON COLUMN t_jk_visita.tip_visita IS
    'campo tipo da visita';

COMMENT ON COLUMN t_jk_visita.t_jk_agenda_cod_agenda IS
    'chave estrangeria agenda';

CREATE UNIQUE INDEX t_jk_visita__idx ON
    t_jk_visita (
        t_jk_agenda_cod_agenda
    ASC );

ALTER TABLE t_jk_visita ADD CONSTRAINT t_jk_visita_pk PRIMARY KEY ( cod_visita );

ALTER TABLE t_jk_agenda
    ADD CONSTRAINT t_jk_agenda_t_jk_empresa_fk FOREIGN KEY ( t_jk_empresa_cod_empresa )
        REFERENCES t_jk_empresa ( cod_empresa );

ALTER TABLE t_jk_atendimento
    ADD CONSTRAINT t_jk_atd_t_jk_maq_fk FOREIGN KEY ( t_jk_maquina_cod_maquina )
        REFERENCES t_jk_maquina ( cod_maquina );

ALTER TABLE t_jk_atendimento
    ADD CONSTRAINT t_jk_atd_t_jk_vis_fk FOREIGN KEY ( t_jk_visita_cod_visita )
        REFERENCES t_jk_visita ( cod_visita );

ALTER TABLE t_jk_automacao
    ADD CONSTRAINT t_jk_automacao_t_jk_iot_fk FOREIGN KEY ( t_jk_iot_cod_iot )
        REFERENCES t_jk_iot ( cod_iot );

ALTER TABLE t_jk_bairro
    ADD CONSTRAINT t_jk_bairro_t_jk_cidade_fk FOREIGN KEY ( t_jk_cidade_cod_cidade )
        REFERENCES t_jk_cidade ( cod_cidade );

ALTER TABLE t_jk_cidade
    ADD CONSTRAINT t_jk_cidade_t_jk_estado_fk FOREIGN KEY ( t_jk_estado_cod_estado )
        REFERENCES t_jk_estado ( cod_estado );

ALTER TABLE t_jk_cargo
    ADD CONSTRAINT t_jk_crg_t_jk_dpt_fk FOREIGN KEY ( t_jk_dpt_cod_dpt )
        REFERENCES t_jk_departamento ( cod_departamento );

ALTER TABLE t_jk_cargo
    ADD CONSTRAINT t_jk_crg_t_jk_func_fk FOREIGN KEY ( t_jk_func_num_mat )
        REFERENCES t_jk_funcionario ( num_matricula );

ALTER TABLE t_jk_departamento
    ADD CONSTRAINT t_jk_dpt_t_jk_emp_fk FOREIGN KEY ( t_jk_empresa_cod_empresa )
        REFERENCES t_jk_empresa ( cod_empresa );

ALTER TABLE t_jk_emp_email
    ADD CONSTRAINT t_jk_emp_email_t_jk_email_fk FOREIGN KEY ( t_jk_email_cod_email )
        REFERENCES t_jk_email ( cod_email );

ALTER TABLE t_jk_emp_email
    ADD CONSTRAINT t_jk_emp_email_t_jk_empresa_fk FOREIGN KEY ( t_jk_empresa_cod_empresa )
        REFERENCES t_jk_empresa ( cod_empresa );

ALTER TABLE t_jk_emp_end
    ADD CONSTRAINT t_jk_emp_end_t_jk_empresa_fk FOREIGN KEY ( t_jk_empresa_cod_empresa )
        REFERENCES t_jk_empresa ( cod_empresa );

ALTER TABLE t_jk_emp_end
    ADD CONSTRAINT t_jk_emp_end_t_jk_endereco_fk FOREIGN KEY ( t_jk_endereco_cod_endereco,
                                                               t_jk_endereco_cod_logradouro )
        REFERENCES t_jk_endereco ( cod_endereco,
                                   t_jk_logradouro_cod_logradouro );

ALTER TABLE t_jk_emp_tel
    ADD CONSTRAINT t_jk_emp_tel_t_jk_empresa_fk FOREIGN KEY ( t_jk_empresa_cod_empresa )
        REFERENCES t_jk_empresa ( cod_empresa );

ALTER TABLE t_jk_emp_tel
    ADD CONSTRAINT t_jk_emp_tel_t_jk_telefone_fk FOREIGN KEY ( t_jk_telefone_cod_telefone )
        REFERENCES t_jk_telefone ( cod_telefone );

ALTER TABLE t_jk_empresa
    ADD CONSTRAINT t_jk_empresa_t_jk_ramo_fk FOREIGN KEY ( t_jk_ramo_cod_ramo )
        REFERENCES t_jk_ramo ( cod_ramo );

ALTER TABLE t_jk_endereco
    ADD CONSTRAINT t_jk_end_t_jk_log_fk FOREIGN KEY ( t_jk_logradouro_cod_logradouro )
        REFERENCES t_jk_logradouro ( cod_logradouro );

ALTER TABLE t_jk_func_email
    ADD CONSTRAINT t_jk_func_email_t_jk_email_fk FOREIGN KEY ( t_jk_email_cod_email )
        REFERENCES t_jk_email ( cod_email );

ALTER TABLE t_jk_func_email
    ADD CONSTRAINT t_jk_func_email_t_jk_func_fk FOREIGN KEY ( t_jk_funcionario_num_matricula )
        REFERENCES t_jk_funcionario ( num_matricula );

ALTER TABLE t_jk_func_end
    ADD CONSTRAINT t_jk_func_end_t_jk_end_fk FOREIGN KEY ( t_jk_endereco_cod_endereco,
                                                           t_jk_endereco_cod_logradouro )
        REFERENCES t_jk_endereco ( cod_endereco,
                                   t_jk_logradouro_cod_logradouro );

ALTER TABLE t_jk_func_end
    ADD CONSTRAINT t_jk_func_end_t_jk_func_fk FOREIGN KEY ( t_jk_funcionario_num_matricula )
        REFERENCES t_jk_funcionario ( num_matricula );

ALTER TABLE t_jk_logradouro
    ADD CONSTRAINT t_jk_logradouro_t_jk_bairro_fk FOREIGN KEY ( t_jk_bairro_cod_bairro )
        REFERENCES t_jk_bairro ( cod_bairro );

ALTER TABLE t_jk_maquina
    ADD CONSTRAINT t_jk_maquina_t_jk_cat_maqui_fk FOREIGN KEY ( t_jk_cat_maq_cod_cat )
        REFERENCES t_jk_cat_maqui ( cod_categoria );

ALTER TABLE t_jk_maquina
    ADD CONSTRAINT t_jk_maquina_t_jk_empresa_fk FOREIGN KEY ( t_jk_emp_cod_emp )
        REFERENCES t_jk_empresa ( cod_empresa );

ALTER TABLE t_jk_maquina
    ADD CONSTRAINT t_jk_maquina_t_jk_iot_fk FOREIGN KEY ( t_jk_iot_cod_iot )
        REFERENCES t_jk_iot ( cod_iot );

ALTER TABLE t_jk_prop_email
    ADD CONSTRAINT t_jk_prop_email_t_jk_email_fk FOREIGN KEY ( t_jk_email_cod_email )
        REFERENCES t_jk_email ( cod_email );

ALTER TABLE t_jk_prop_email
    ADD CONSTRAINT t_jk_prop_email_t_jk_prop_fk FOREIGN KEY ( t_jk_prop_cod_prop )
        REFERENCES t_jk_prop ( cod_prop );

ALTER TABLE t_jk_prop_empresa
    ADD CONSTRAINT t_jk_prop_emp_t_jk_emp_fk FOREIGN KEY ( t_jk_empresa_cod_empresa )
        REFERENCES t_jk_empresa ( cod_empresa );

ALTER TABLE t_jk_prop_empresa
    ADD CONSTRAINT t_jk_prop_emp_t_jk_prop_fk FOREIGN KEY ( t_jk_prop_cod_prop )
        REFERENCES t_jk_prop ( cod_prop );

ALTER TABLE t_jk_prop_tel
    ADD CONSTRAINT t_jk_prop_tel_t_jk_prop_fk FOREIGN KEY ( t_jk_prop_cod_prop )
        REFERENCES t_jk_prop ( cod_prop );

ALTER TABLE t_jk_prop_tel
    ADD CONSTRAINT t_jk_prop_tel_t_jk_telefone_fk FOREIGN KEY ( t_jk_telefone_cod_telefone )
        REFERENCES t_jk_telefone ( cod_telefone );

ALTER TABLE t_jk_prospeccao
    ADD CONSTRAINT t_jk_prospeccao_t_jk_visita_fk FOREIGN KEY ( t_jk_visita_cod_visita )
        REFERENCES t_jk_visita ( cod_visita );

ALTER TABLE t_jk_visita
    ADD CONSTRAINT t_jk_visita_t_jk_agenda_fk FOREIGN KEY ( t_jk_agenda_cod_agenda )
        REFERENCES t_jk_agenda ( cod_agenda );



CREATE SEQUENCE t_jk_agenda_cod_agenda             START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_atendimento_cod_atendimento   START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_automacao_cod_automacao       START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_bairro_cod_bairro             START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_cargo_cod_cargo               START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_cat_maqui_cod_categoria       START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_cidade_cod_cidade             START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_departamento_cod_departamento START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_email_cod_email               START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_emp_email_cod_emp_email       START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_emp_end_cod_emp_end           START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_emp_tel_cod_tel_end           START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_empresa_cod_empresa           START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_endereco_cod_endereco         START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_estado_cod_estado             START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_func_email_cod_func_email     START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_func_end_cod_func_end         START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_funcionario_num_matricula     START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_iot_cod_iot                   START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_logradouro_cod_logradouro     START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_maquina_cod_maquina           START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_prop_cod_prop                 START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_prop_email_cod_prop_email     START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_prop_empresa_cod_prop_empresa START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_prop_tel_cod_prop_tel         START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_prospeccao_cod_prospc         START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_ramo_cod_ramo                 START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_telefone_cod_telefone         START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;
CREATE SEQUENCE t_jk_visita_cod_visita             START WITH 1 MINVALUE 1 MAXVALUE 999999 NOCACHE ORDER NOCYCLE;


-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            29
-- CREATE INDEX                             5
-- ALTER TABLE                             81
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
