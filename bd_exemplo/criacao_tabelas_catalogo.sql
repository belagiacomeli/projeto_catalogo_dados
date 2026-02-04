-- =========================
-- 1) CATÁLOGOS
-- =========================
CREATE TABLE catalogos (
    id_catalogo       INT AUTO_INCREMENT PRIMARY KEY,
    nome              VARCHAR(150) NOT NULL,
    descricao         TEXT NULL,
    owner             VARCHAR(150) NULL,
    criado_em         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em     DATETIME NULL ON UPDATE CURRENT_TIMESTAMP
);

-- =========================
-- 2) TABELAS (do catálogo)
-- =========================
CREATE TABLE tabelas_catalogo (
    id_tabela         INT AUTO_INCREMENT PRIMARY KEY,
    id_catalogo       INT NOT NULL,

    nome              VARCHAR(150) NOT NULL,
    descricao         TEXT NULL,
    owner             VARCHAR(150) NULL,

    sensitivity_score INT NOT NULL DEFAULT 0,
    sensitivity_level VARCHAR(30) NOT NULL DEFAULT 'PUBLICA',

    criado_em         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em     DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_tabelas_catalogo_catalogos
        FOREIGN KEY (id_catalogo) REFERENCES catalogos(id_catalogo),

    CONSTRAINT uq_tabelas_por_catalogo
        UNIQUE (id_catalogo, nome)
);

-- =========================
-- 3) COLUNAS (das tabelas)
-- =========================
CREATE TABLE colunas_catalogo (
    id_coluna         INT AUTO_INCREMENT PRIMARY KEY,
    id_tabela         INT NOT NULL,

    nome              VARCHAR(150) NOT NULL,
    data_type         VARCHAR(60) NOT NULL,
    descricao         TEXT NULL,

    is_nullable       BOOLEAN NOT NULL DEFAULT TRUE,
    is_primary_key    BOOLEAN NOT NULL DEFAULT FALSE,

    is_sensitive      BOOLEAN NOT NULL DEFAULT FALSE,
    sensitivity_level VARCHAR(30) NOT NULL DEFAULT 'PUBLICA',

    criado_em         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em     DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_colunas_catalogo_tabelas
        FOREIGN KEY (id_tabela) REFERENCES tabelas_catalogo(id_tabela),

    CONSTRAINT uq_colunas_por_tabela
        UNIQUE (id_tabela, nome)
);
