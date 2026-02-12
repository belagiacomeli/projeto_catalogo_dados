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

-- Inserindo mais dados para o projeto de catologo de dados.

-- Inserindo mais registros na tabela cliente 
INSERT INTO catalogo_dados.cliente
(nome_cliente, data_nascimento, genero, tipo_cliente, data_cadastro, status_cliente)
VALUES
('Bruno Henrique Souza', '1990-01-01', 'M', 'PF', NOW(), 'ATIVO'),
('Camila Rodrigues Lima', '1991-01-01', 'F', 'PF', NOW(), 'ATIVO'),
('Daniel Carvalho Mendes', '1992-01-01', 'M', 'PF', NOW(), 'INATIVO'),
('Eduarda Fernandes Alves', '1993-01-01', 'F', 'PF', NOW(), 'ATIVO'),
('Felipe Augusto Santos', '1994-01-01', 'M', 'PF', NOW(), 'ATIVO'),
('Gabriela Costa Ribeiro', '1995-01-01', 'F', 'PF', NOW(), 'ATIVO'),
('Henrique Oliveira Martins', '1996-01-01', 'M', 'PF', NOW(), 'INATIVO'),
('Isabela Duarte Rocha', '1997-01-01', 'F', 'PF', NOW(), 'ATIVO'),
('João Victor Almeida', '1998-01-01', 'M', 'PF', NOW(), 'ATIVO'),
('Larissa Gomes Pereira', '1999-01-01', 'F', 'PF', NOW(), 'ATIVO'),

('Matheus Barbosa Silva', '1980-02-02', 'M', 'PF', NOW(), 'ATIVO'),
('Natália Ferreira Costa', '1981-02-02', 'F', 'PF', NOW(), 'ATIVO'),
('Otávio Rodrigues Souza', '1982-02-02', 'M', 'PF', NOW(), 'INATIVO'),
('Patrícia Almeida Santos', '1983-02-02', 'F', 'PF', NOW(), 'ATIVO'),
('Rafael Mendes Oliveira', '1984-02-02', 'M', 'PF', NOW(), 'ATIVO'),
('Sabrina Lopes Fernandes', '1985-02-02', 'F', 'PF', NOW(), 'ATIVO'),
('Thiago Martins Costa', '1986-02-02', 'M', 'PF', NOW(), 'INATIVO'),
('Vanessa Ribeiro Silva', '1987-02-02', 'F', 'PF', NOW(), 'ATIVO'),
('William Santos Rocha', '1988-02-02', 'M', 'PF', NOW(), 'ATIVO'),
('Yasmin Duarte Almeida', '1989-02-02', 'F', 'PF', NOW(), 'ATIVO'),

('André Luiz Carvalho', '1990-03-03', 'M', 'PF', NOW(), 'ATIVO'),
('Beatriz Nogueira Lima', '1991-03-03', 'F', 'PF', NOW(), 'ATIVO'),
('Caio Henrique Pereira', '1992-03-03', 'M', 'PF', NOW(), 'INATIVO'),
('Débora Cristina Souza', '1993-03-03', 'F', 'PF', NOW(), 'ATIVO'),
('Eduardo Martins Lopes', '1994-03-03', 'M', 'PF', NOW(), 'ATIVO'),
('Fernanda Silva Costa', '1995-03-03', 'F', 'PF', NOW(), 'ATIVO'),
('Gustavo Almeida Ribeiro', '1996-03-03', 'M', 'PF', NOW(), 'INATIVO'),
('Helena Fernandes Rocha', '1997-03-03', 'F', 'PF', NOW(), 'ATIVO'),
('Igor Barbosa Mendes', '1998-03-03', 'M', 'PF', NOW(), 'ATIVO'),
('Juliana Duarte Santos', '1999-03-03', 'F', 'PF', NOW(), 'ATIVO'),

('Kevin Augusto Lima', '1980-04-04', 'M', 'PF', NOW(), 'ATIVO'),
('Letícia Rodrigues Alves', '1981-04-04', 'F', 'PF', NOW(), 'ATIVO'),
('Marcelo Ferreira Souza', '1982-04-04', 'M', 'PF', NOW(), 'INATIVO'),
('Nicole Martins Pereira', '1983-04-04', 'F', 'PF', NOW(), 'ATIVO'),
('Paulo Henrique Costa', '1984-04-04', 'M', 'PF', NOW(), 'ATIVO'),
('Renata Carvalho Lopes', '1985-04-04', 'F', 'PF', NOW(), 'ATIVO'),
('Samuel Oliveira Mendes', '1986-04-04', 'M', 'PF', NOW(), 'INATIVO'),
('Tatiane Barbosa Rocha', '1987-04-04', 'F', 'PF', NOW(), 'ATIVO'),
('Uelinton Santos Almeida', '1988-04-04', 'M', 'PF', NOW(), 'ATIVO'),
('Vitória Fernanda Lima', '1989-04-04', 'F', 'PF', NOW(), 'ATIVO');


-- Inserindo mais registros na tabela contato
INSERT INTO catalogo_dados.contato (id_cliente, email, telefone) VALUES
(11, 'bruno.souza@email.com', '(31) 98888-0011'),
(12, 'camila.lima@email.com', '(41) 98888-0012'),
(13, 'daniel.mendes@email.com', '(51) 98888-0013'),
(14, 'eduarda.alves@email.com', '(61) 98888-0014'),
(15, 'felipe.santos@email.com', '(71) 98888-0015'),
(16, 'gabriela.ribeiro@email.com', '(81) 98888-0016'),
(17, 'henrique.martins@email.com', '(91) 98888-0017'),
(18, 'isabela.rocha@email.com', '(21) 98888-0018'),
(19, 'joao.almeida@email.com', '(11) 98888-0019'),
(20, 'larissa.pereira@email.com', '(19) 98888-0020'),

(21, 'matheus.silva@email.com', '(27) 98888-0021'),
(22, 'natalia.costa@email.com', '(31) 98888-0022'),
(23, 'otavio.souza@email.com', '(41) 98888-0023'),
(24, 'patricia.santos@email.com', '(51) 98888-0024'),
(25, 'rafael.oliveira@email.com', '(61) 98888-0025'),
(26, 'sabrina.fernandes@email.com', '(71) 98888-0026'),
(27, 'thiago.costa@email.com', '(81) 98888-0027'),
(28, 'vanessa.silva@email.com', '(91) 98888-0028'),
(29, 'william.rocha@email.com', '(21) 98888-0029'),
(30, 'yasmin.almeida@email.com', '(11) 98888-0030'),

(31, 'andre.carvalho@email.com', '(19) 98888-0031'),
(32, 'beatriz.lima@email.com', '(27) 98888-0032'),
(33, 'caio.pereira@email.com', '(31) 98888-0033'),
(34, 'debora.souza@email.com', '(41) 98888-0034'),
(35, 'eduardo.lopes@email.com', '(51) 98888-0035'),
(36, 'fernanda.costa@email.com', '(61) 98888-0036'),
(37, 'gustavo.ribeiro@email.com', '(71) 98888-0037'),
(38, 'helena.rocha@email.com', '(81) 98888-0038'),
(39, 'igor.mendes@email.com', '(91) 98888-0039'),
(40, 'juliana.santos@email.com', '(21) 98888-0040'),

(41, 'kevin.lima@email.com', '(11) 98888-0041'),
(42, 'leticia.alves@email.com', '(19) 98888-0042'),
(43, 'marcelo.souza@email.com', '(27) 98888-0043'),
(44, 'nicole.pereira@email.com', '(31) 98888-0044'),
(45, 'paulo.costa@email.com', '(41) 98888-0045'),
(46, 'renata.lopes@email.com', '(51) 98888-0046'),
(47, 'samuel.mendes@email.com', '(61) 98888-0047'),
(48, 'tatiane.rocha@email.com', '(71) 98888-0048'),
(49, 'uelinton.almeida@email.com', '(81) 98888-0049'),
(50, 'vitoria.lima@email.com', '(91) 98888-0050');


-- Inserindo mais registros na tabela documento 
INSERT INTO catalogo_dados.documento (id_cliente, tipo_documento, numero_documento) VALUES
(11, 'CPF', '321.654.987-11'),
(12, 'CPF', '654.321.987-12'),
(13, 'CPF', '987.654.321-13'),
(14, 'CPF', '159.753.486-14'),
(15, 'CPF', '753.159.486-15'),
(16, 'CPF', '852.456.123-16'),
(17, 'CPF', '456.852.123-17'),
(18, 'CPF', '147.258.369-18'),
(19, 'CPF', '258.369.147-19'),
(20, 'CPF', '369.147.258-20'),

(21, 'CPF', '111.222.333-21'),
(22, 'CPF', '222.333.444-22'),
(23, 'CPF', '333.444.555-23'),
(24, 'CPF', '444.555.666-24'),
(25, 'CPF', '555.666.777-25'),
(26, 'CPF', '666.777.888-26'),
(27, 'CPF', '777.888.999-27'),
(28, 'CPF', '888.999.000-28'),
(29, 'CPF', '999.000.111-29'),
(30, 'CPF', '000.111.222-30'),

(31, 'CPF', '123.987.654-31'),
(32, 'CPF', '987.123.654-32'),
(33, 'CPF', '456.123.789-33'),
(34, 'CPF', '789.456.123-34'),
(35, 'CPF', '321.789.456-35'),
(36, 'CPF', '654.987.321-36'),
(37, 'CPF', '147.369.258-37'),
(38, 'CPF', '258.147.369-38'),
(39, 'CPF', '369.258.147-39'),
(40, 'CPF', '741.852.963-40'),

(41, 'CPF', '852.741.963-41'),
(42, 'CPF', '963.852.741-42'),
(43, 'CPF', '159.357.951-43'),
(44, 'CPF', '357.159.951-44'),
(45, 'CPF', '951.753.159-45'),
(46, 'CPF', '753.951.159-46'),
(47, 'CPF', '258.456.852-47'),
(48, 'CPF', '456.258.852-48'),
(49, 'CPF', '147.951.753-49'),
(50, 'CPF', '951.147.753-50');

-- Inserindo mais registros na tabela endereco
INSERT INTO catalogo_dados.endereco (id_cliente, rua, cidade, estado, cep) VALUES
(11, 'Rua das Acácias', 'Belo Horizonte', 'MG', '30100-000'),
(12, 'Av. Atlântica', 'Rio de Janeiro', 'RJ', '22000-000'),
(13, 'Rua XV de Novembro', 'Curitiba', 'PR', '80020-000'),
(14, 'Rua das Laranjeiras', 'Salvador', 'BA', '40040-000'),
(15, 'Av. Beira Mar', 'Fortaleza', 'CE', '60060-000'),
(16, 'Rua Dom Pedro I', 'Recife', 'PE', '50050-000'),
(17, 'Rua Amazonas', 'Manaus', 'AM', '69010-000'),
(18, 'Rua Goiás', 'Goiânia', 'GO', '74010-000'),
(19, 'Av. Vitória', 'Vitória', 'ES', '29010-000'),
(20, 'Rua Potengi', 'Natal', 'RN', '59010-000'),

(21, 'Rua Sete de Setembro', 'Porto Alegre', 'RS', '90010-000'),
(22, 'Av. Brasil', 'Florianópolis', 'SC', '88010-000'),
(23, 'Rua Pernambuco', 'João Pessoa', 'PB', '58010-000'),
(24, 'Rua Sergipe', 'Aracaju', 'SE', '49010-000'),
(25, 'Av. Central', 'Palmas', 'TO', '77010-000'),
(26, 'Rua Maranhão', 'São Luís', 'MA', '65010-000'),
(27, 'Rua Pará', 'Belém', 'PA', '66010-000'),
(28, 'Av. Afonso Pena', 'Campo Grande', 'MS', '79010-000'),
(29, 'Rua Tiradentes', 'Cuiabá', 'MT', '78010-000'),
(30, 'Rua das Palmeiras', 'Maceió', 'AL', '57010-000'),

(31, 'Rua da Paz', 'Campinas', 'SP', '13010-000'),
(32, 'Av. Independência', 'Ribeirão Preto', 'SP', '14010-000'),
(33, 'Rua São José', 'Santos', 'SP', '11010-000'),
(34, 'Rua do Comércio', 'Sorocaba', 'SP', '18010-000'),
(35, 'Av. Paulista', 'São Paulo', 'SP', '01310-100'),
(36, 'Rua das Flores', 'Niterói', 'RJ', '24010-000'),
(37, 'Av. Paraná', 'Londrina', 'PR', '86010-000'),
(38, 'Rua Bahia', 'Uberlândia', 'MG', '38400-000'),
(39, 'Av. Getúlio Vargas', 'Juiz de Fora', 'MG', '36010-000'),
(40, 'Rua Ceará', 'Teresina', 'PI', '64010-000'),

(41, 'Rua Amazonas', 'Boa Vista', 'RR', '69300-000'),
(42, 'Av. Rio Branco', 'Macapá', 'AP', '68900-000'),
(43, 'Rua Tocantins', 'Porto Velho', 'RO', '76800-000'),
(44, 'Rua Acre', 'Rio Branco', 'AC', '69900-000'),
(45, 'Av. das Nações', 'Brasília', 'DF', '70040-000'),
(46, 'Rua Mato Grosso', 'Dourados', 'MS', '79800-000'),
(47, 'Rua João Pessoa', 'Caruaru', 'PE', '55010-000'),
(48, 'Av. Recife', 'Olinda', 'PE', '53010-000'),
(49, 'Rua do Sol', 'Ilhéus', 'BA', '45650-000'),
(50, 'Av. das Dunas', 'São Luís', 'MA', '65070-000');

-- Inserindo mais registros na tabela pedido 
INSERT INTO catalogo_dados.pedido
(id_cliente, data_pedido, valor_total, status_pedido, tipo_pagamento, canal_compra, numero_nota_fiscal, data_emissao_nf)
VALUES
(1,  '2026-01-05', 1299.90, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2001', '2026-01-05'),
(2,  '2026-01-07', 4599.00, 'ENTREGUE', 'Cartão Crédito', 'App', 'NF2002', '2026-01-07'),
(3,  '2026-01-09', 899.90,  'CANCELADO', 'PIX', 'Site', 'NF2003', '2026-01-09'),
(4,  '2026-01-10', 6999.00, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2004', '2026-01-10'),
(5,  '2026-01-12', 2499.90, 'ENTREGUE', 'Boleto', 'Loja', 'NF2005', '2026-01-12'),
(6,  '2026-01-15', 349.90,  'ENTREGUE', 'PIX', 'App', 'NF2006', '2026-01-15'),
(7,  '2026-01-18', 799.90,  'PENDENTE', 'Cartão Débito', 'Site', 'NF2007', '2026-01-18'),
(8,  '2026-01-20', 1599.90, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2008', '2026-01-20'),
(9,  '2026-01-22', 219.90,  'ENTREGUE', 'PIX', 'App', 'NF2009', '2026-01-22'),
(10, '2026-01-25', 3999.00, 'ENTREGUE', 'Cartão Crédito', 'Loja', 'NF2010', '2026-01-25'),

(11, '2026-01-27', 299.90,  'ENTREGUE', 'PIX', 'Site', 'NF2011', '2026-01-27'),
(12, '2026-01-29', 8999.00, 'ENTREGUE', 'Cartão Crédito', 'App', 'NF2012', '2026-01-29'),
(13, '2026-02-01', 179.90,  'CANCELADO', 'Boleto', 'Site', 'NF2013', '2026-02-01'),
(14, '2026-02-03', 3299.90, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2014', '2026-02-03'),
(15, '2026-02-05', 749.90,  'ENTREGUE', 'PIX', 'Loja', 'NF2015', '2026-02-05'),
(16, '2026-02-07', 2199.00, 'ENTREGUE', 'Cartão Débito', 'App', 'NF2016', '2026-02-07'),
(17, '2026-02-09', 599.90,  'PENDENTE', 'Boleto', 'Site', 'NF2017', '2026-02-09'),
(18, '2026-02-10', 1399.90, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2018', '2026-02-10'),
(19, '2026-02-12', 89.90,   'ENTREGUE', 'PIX', 'App', 'NF2019', '2026-02-12'),
(20, '2026-02-14', 4999.00, 'ENTREGUE', 'Cartão Crédito', 'Loja', 'NF2020', '2026-02-14'),

(21, '2026-02-16', 649.90,  'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2021', '2026-02-16'),
(22, '2026-02-18', 2999.90, 'ENTREGUE', 'PIX', 'App', 'NF2022', '2026-02-18'),
(23, '2026-02-20', 1099.90, 'CANCELADO', 'Boleto', 'Site', 'NF2023', '2026-02-20'),
(24, '2026-02-22', 249.90,  'ENTREGUE', 'Cartão Débito', 'Loja', 'NF2024', '2026-02-22'),
(25, '2026-02-24', 3799.00, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2025', '2026-02-24'),
(26, '2026-02-26', 129.90,  'ENTREGUE', 'PIX', 'App', 'NF2026', '2026-02-26'),
(27, '2026-02-28', 1999.90, 'PENDENTE', 'Cartão Crédito', 'Site', 'NF2027', '2026-02-28'),
(28, '2026-03-01', 549.90,  'ENTREGUE', 'Boleto', 'Loja', 'NF2028', '2026-03-01'),
(29, '2026-03-03', 999.90,  'ENTREGUE', 'Cartão Débito', 'App', 'NF2029', '2026-03-03'),
(30, '2026-03-05', 159.90,  'ENTREGUE', 'PIX', 'Site', 'NF2030', '2026-03-05'),

(31, '2026-03-07', 4299.00, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2031', '2026-03-07'),
(32, '2026-03-09', 349.90,  'ENTREGUE', 'Boleto', 'App', 'NF2032', '2026-03-09'),
(33, '2026-03-11', 899.90,  'CANCELADO', 'PIX', 'Site', 'NF2033', '2026-03-11'),
(34, '2026-03-13', 2199.90, 'ENTREGUE', 'Cartão Crédito', 'Loja', 'NF2034', '2026-03-13'),
(35, '2026-03-15', 499.90,  'ENTREGUE', 'Cartão Débito', 'App', 'NF2035', '2026-03-15'),
(36, '2026-03-17', 7999.00, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2036', '2026-03-17'),
(37, '2026-03-19', 149.90,  'PENDENTE', 'Boleto', 'Site', 'NF2037', '2026-03-19'),
(38, '2026-03-21', 1299.90, 'ENTREGUE', 'PIX', 'App', 'NF2038', '2026-03-21'),
(39, '2026-03-23', 2599.90, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2039', '2026-03-23'),
(40, '2026-03-25', 349.90,  'ENTREGUE', 'Cartão Débito', 'Loja', 'NF2040', '2026-03-25'),

(41, '2026-03-27', 599.90,  'ENTREGUE', 'PIX', 'App', 'NF2041', '2026-03-27'),
(42, '2026-03-29', 4999.90, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2042', '2026-03-29'),
(43, '2026-03-31', 799.90,  'CANCELADO', 'Boleto', 'App', 'NF2043', '2026-03-31'),
(44, '2026-04-02', 1399.90, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2044', '2026-04-02'),
(45, '2026-04-04', 2299.90, 'ENTREGUE', 'PIX', 'Loja', 'NF2045', '2026-04-04'),
(46, '2026-04-06', 199.90,  'ENTREGUE', 'Cartão Débito', 'App', 'NF2046', '2026-04-06'),
(47, '2026-04-08', 1599.90, 'PENDENTE', 'Cartão Crédito', 'Site', 'NF2047', '2026-04-08'),
(48, '2026-04-10', 649.90,  'ENTREGUE', 'PIX', 'Loja', 'NF2048', '2026-04-10'),
(49, '2026-04-12', 3499.00, 'ENTREGUE', 'Cartão Crédito', 'Site', 'NF2049', '2026-04-12'),
(50, '2026-04-15', 279.90,  'ENTREGUE', 'Boleto', 'App', 'NF2050', '2026-04-15');