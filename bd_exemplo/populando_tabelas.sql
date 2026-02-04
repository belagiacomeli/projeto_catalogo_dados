-- Inserindo os dados nas tabelas cliente, documento, endereco e contato.'

INSERT INTO catalogo_dados.cliente
(nome_cliente, data_nascimento, genero, tipo_cliente, data_cadastro, status_cliente)
VALUES
('João da Silva',       '1990-05-12', 'M', 'PF', NOW(), 'ATIVO'),
('Maria Oliveira',      '1988-03-22', 'F', 'PF', NOW(), 'ATIVO'),
('Carlos Pereira',      '1979-11-10', 'M', 'PF', NOW(), 'INATIVO'),
('Ana Santos',          '1995-07-01', 'F', 'PF', NOW(), 'ATIVO'),
('Pedro Almeida',       '1985-01-30', 'M', 'PF', NOW(), 'ATIVO'),
('Juliana Costa',       '1992-09-18', 'F', 'PF', NOW(), 'INATIVO'),
('Rafael Rocha',        '1987-12-05', 'M', 'PF', NOW(), 'ATIVO'),
('Fernanda Lima',       '1998-04-14', 'F', 'PF', NOW(), 'ATIVO'),
('Lucas Martins',       '1991-06-25', 'M', 'PF', NOW(), 'ATIVO'),
('Patricia Nogueira',   '1983-10-09', 'F', 'PF', NOW(), 'INATIVO');


INSERT INTO catalogo_dados.documento (id_cliente, tipo_documento, numero_documento) VALUES
(1, 'CPF', '123.456.789-01'),
(2, 'CPF', '123.456.789-02'),
(3, 'CPF', '123.456.789-03'),
(4, 'CPF', '123.456.789-04'),
(5, 'CPF', '123.456.789-05'),
(6, 'CPF', '123.456.789-06'),
(7, 'CPF', '123.456.789-07'),
(8, 'CPF', '123.456.789-08'),
(9, 'CPF', '123.456.789-09'),
(10,'CPF', '123.456.789-10');

INSERT INTO catalogo_dados.endereco (id_cliente, rua, cidade, estado, cep) VALUES
(1, 'Rua das Flores', 'São Paulo', 'SP', '01000-000'),
(2, 'Av. Paulista', 'São Paulo', 'SP', '01310-100'),
(3, 'Rua A', 'Campinas', 'SP', '13000-000'),
(4, 'Rua B', 'Santos', 'SP', '11000-000'),
(5, 'Rua C', 'Sorocaba', 'SP', '18000-000'),
(6, 'Rua D', 'Ribeirão Preto', 'SP', '14000-000'),
(7, 'Av. Brasil', 'Rio de Janeiro', 'RJ', '20000-000'),
(8, 'Rua das Palmeiras', 'Rio de Janeiro', 'RJ', '22200-000'),
(9, 'Rua E', 'Curitiba', 'PR', '80000-000'),
(10,'Rua F', 'Porto Alegre', 'RS', '90000-000');

INSERT INTO catalogo_dados.contato (id_cliente, email, telefone) VALUES
(1, 'joao.silva@email.com',      '(11) 98888-0001'),
(2, 'maria.oliveira@email.com',  '(11) 98888-0002'),
(3, 'carlos.pereira@email.com',  '(19) 98888-0003'),
(4, 'ana.santos@email.com',      '(13) 98888-0004'),
(5, 'pedro.almeida@email.com',   '(15) 98888-0005'),
(6, 'juliana.costa@email.com',   '(16) 98888-0006'),
(7, 'rafael.rocha@email.com',    '(21) 98888-0007'),
(8, 'fernanda.lima@email.com',   '(21) 98888-0008'),
(9, 'lucas.martins@email.com',   '(41) 98888-0009'),
(10,'patricia.nogueira@email.com','(51) 98888-0010');
