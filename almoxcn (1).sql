-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/03/2026 às 20:35
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `almoxcn`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividade`
--

CREATE TABLE `atividade` (
  `id` int(11) NOT NULL,
  `nome_atividade` varchar(255) NOT NULL,
  `destino` varchar(255) NOT NULL,
  `data_inicio_emprestimo` datetime NOT NULL,
  `data_fim_emprestimo` datetime NOT NULL,
  `frequencia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `id_emprestimo` int(11) NOT NULL,
  `cpf_solicitante` varchar(255) NOT NULL,
  `data_emprestimo` datetime NOT NULL,
  `solicitante` varchar(255) NOT NULL,
  `nome_equipamento` varchar(255) NOT NULL,
  `codigo_de_barras` int(11) NOT NULL,
  `data_inicio_emprestimo` datetime NOT NULL,
  `data_fim_emprestimo` datetime NOT NULL,
  `destino` varchar(255) NOT NULL,
  `atividade` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id`, `id_emprestimo`, `cpf_solicitante`, `data_emprestimo`, `solicitante`, `nome_equipamento`, `codigo_de_barras`, `data_inicio_emprestimo`, `data_fim_emprestimo`, `destino`, `atividade`) VALUES
(2069, 1, '40504052888', '2026-03-08 18:58:38', 'jonathan v', 'Notebook Dell Inspiron', 100002, '2026-03-09 14:57:00', '2026-03-10 14:57:00', 'cruzeiro', 'teste'),
(2070, 2, '40504052888', '2026-03-08 19:04:02', 'jonathan v', 'Projetor Epson', 100003, '2026-03-09 15:03:00', '2026-03-10 15:03:00', 'CP', 'teste12'),
(2072, 2, '40504052888', '2026-03-08 19:05:09', 'jonathan v', 'Microfone AKG C214', 100025, '2026-03-09 15:03:00', '2026-03-10 15:03:00', 'CP', 'teste12'),
(2073, 3, '40504052888', '2026-03-08 19:10:36', 'jonathan v', 'Teclado Redragon Kumara', 100019, '2026-03-09 15:09:00', '2026-03-10 15:10:00', 'CP', 'teste'),
(2076, 4, '40504052888', '2026-03-08 19:15:35', 'administrador', 'Câmera Panasonic Lumix', 100031, '2026-03-09 15:11:00', '2026-03-10 15:11:00', 'CP', 'teste'),
(2080, 5, '40504052888', '2026-03-08 19:56:35', 'jonathan v', 'Notebook Dell Inspiron', 100002, '2026-03-14 15:56:00', '2026-03-15 15:56:00', 'CP', 'teste'),
(2081, 6, '40504052888', '2026-03-08 19:57:45', 'administrador', 'Câmera Fujifilm X-T4', 100029, '2026-03-09 15:11:00', '2026-03-10 15:11:00', 'CP', 'teste'),
(2082, 7, '40504052888', '2026-03-08 19:59:04', 'Almoxerife', 'Notebook Acer Aspire', 100022, '2026-03-14 15:58:00', '2026-03-15 15:58:00', 'CP', 'teste'),
(2083, 8, '40504052888', '2026-03-08 20:00:14', 'administrador', 'Teclado Redragon Kumara', 100019, '2026-03-14 15:59:00', '2026-03-15 15:59:00', 'cruzeiro', 'teste'),
(2084, 9, '40504052888', '2026-03-08 20:10:02', 'jonathan v', 'SSD 1TB Samsung', 100030, '2026-03-14 16:09:00', '2026-03-15 16:09:00', 'CP', 'teste'),
(2086, 10, '40504052888', '2026-03-08 20:14:39', 'administrador', 'Projetor Optoma', 100033, '2026-03-14 16:10:00', '2026-03-15 16:10:00', 'cruzeiro', 'broadcast'),
(2087, 11, '40504052888', '2026-03-08 20:34:31', 'administrador', 'Câmera Panasonic Lumix', 100031, '2026-03-14 16:10:00', '2026-03-15 16:10:00', 'cruzeiro', 'broadcast'),
(2088, 12, '40504052888', '2026-03-08 20:34:55', 'jonathan v', 'Notebook Dell Inspiron', 100002, '2026-03-21 16:34:00', '2026-03-22 16:34:00', 'CP', 'teste');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamento`
--

CREATE TABLE `equipamento` (
  `id` int(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `codigoDeBarra` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `equipamento`
--

INSERT INTO `equipamento` (`id`, `nome`, `tipo`, `codigoDeBarra`, `status`) VALUES
(2, 'Notebook Dell Inspiron', 'Informática', '100002', 'Disponível'),
(3, 'Projetor Epson', 'Áudio e Vídeo', '100003', 'disponível'),
(19, 'Teclado Redragon Kumara', 'Periféricos', '100019', 'disponível'),
(22, 'Notebook Acer Aspire', 'Informática', '100022', 'disponível'),
(24, 'Mesa de Som Mackie', 'Áudio', '100024', 'disponível'),
(25, 'Microfone AKG C214', 'Áudio', '100025', 'disponível'),
(28, 'Mouse Razer DeathAdder', 'Periféricos', '100028', 'disponível'),
(29, 'Câmera Fujifilm X-T4', 'Periféricos', '100029', 'disponível'),
(30, 'SSD 1TB Samsung', 'Armazenamento', '100030', 'disponível'),
(31, 'Câmera Panasonic Lumix', 'Fotografia', '100031', 'disponível'),
(32, 'Notebook HP Pavilion', 'Informática', '100032', 'disponível'),
(33, 'Projetor Optoma', 'Áudio e Vídeo', '100033', 'disponível'),
(34, 'Mesa de Som Soundcraft', 'Áudio', '100034', 'disponível'),
(35, 'Microfone Blue Yeti', 'Áudio', '100035', 'disponível'),
(36, 'Monitor BenQ 32\"', 'Informática', '100036', 'disponível'),
(37, 'Impressora Brother HL', 'Periféricos', '100037', 'disponível'),
(38, 'Mouse Corsair Dark Core', 'Periféricos', '100038', 'disponível'),
(39, 'Teclado Logitech G Pro', 'Periféricos', '100039', 'disponível'),
(40, 'HD Externo 2TB Toshiba', 'Armazenamento', '100040', 'disponível'),
(41, 'Câmera Fujifilm X-T4', 'Fotografia', '100041', 'disponível'),
(42, 'Notebook MSI GF63', 'Informática', '100042', 'disponível'),
(43, 'Projetor ViewSonic', 'Áudio e Vídeo', '100043', 'disponível'),
(44, 'Mesa de Som Roland', 'Áudio', '100044', 'disponível'),
(45, 'Microfone Samson Q2U', 'Áudio', '100045', 'disponível'),
(46, 'Monitor Acer Predator', 'Informática', '100046', 'disponível'),
(47, 'Impressora Samsung ML', 'Periféricos', '100047', 'disponível'),
(48, 'Mouse SteelSeries Rival', 'Periféricos', '100048', 'disponível'),
(49, 'Teclado Razer BlackWidow', 'Periféricos', '100049', 'disponível'),
(50, 'SSD 256GB Crucial', 'Armazenamento', '100050', 'disponível'),
(51, 'Câmera Olympus OM-D', 'Fotografia', '100051', 'disponível'),
(52, 'Notebook Asus ROG', 'Informática', '100052', 'disponível'),
(53, 'Projetor Vivitek', 'Áudio e Vídeo', '100053', 'disponível'),
(54, 'Mesa de Som Presonus', 'Áudio', '100054', 'disponível'),
(55, 'Microfone Audio-Technica AT2020', 'Áudio', '100055', 'disponível'),
(56, 'Monitor Philips 27\"', 'Informática', '100056', 'disponível'),
(57, 'Impressora Canon ImageClass', 'Periféricos', '100057', 'disponível'),
(58, 'Mouse Logitech G703', 'Periféricos', '100058', 'disponível'),
(59, 'Mouse Logitech G703', 'Periféricos', '100059', 'disponível'),
(60, 'SSD 1TB Western Digital', 'Armazenamento', '100060', 'disponível'),
(62, 'Notebook Samsung Expert', 'Informática', '100062', 'disponível'),
(63, 'Projetor LG PF50KG', 'Áudio e Vídeo', '100063', 'disponível'),
(64, 'Mesa de Som Tascam', 'Áudio', '100064', 'disponível'),
(65, 'Microfone AKG P220', 'Áudio', '100065', 'disponível'),
(66, 'Monitor AOC 24\"', 'Informática', '100066', 'disponível'),
(67, 'Impressora Epson Workforce', 'Periféricos', '100067', 'disponível'),
(68, 'Mouse Logitech G502', 'Periféricos', '100068', 'disponível'),
(69, 'Teclado Razer Huntsman', 'Periféricos', '100069', 'disponível'),
(70, 'HD Externo 4TB WD', 'Armazenamento', '100070', 'disponível'),
(71, 'Câmera Kodak Pixpro', 'Fotografia', '100071', 'disponível'),
(72, 'Notebook Toshiba Satellite', 'Informática', '100072', 'disponível'),
(73, 'Projetor Casio XJ-UT', 'Áudio e Vídeo', '100073', 'disponível'),
(74, 'Mesa de Som Alesis', 'Áudio', '100074', 'disponível'),
(75, 'Microfone Shure SM7B', 'Áudio', '100075', 'disponível'),
(76, 'Monitor ViewSonic VX', 'Informática', '100076', 'disponível'),
(77, 'Impressora Lexmark MS', 'Periféricos', '100077', 'disponível'),
(78, 'Mouse Microsoft Sculpt', 'Periféricos', '100078', 'disponível'),
(79, 'Teclado Logitech K780', 'Periféricos', '100079', 'disponível'),
(80, 'SSD 512GB SanDisk', 'Armazenamento', '100080', 'disponível'),
(81, 'Câmera Polaroid Now', 'Fotografia', '100081', 'disponível'),
(82, 'Notebook Fujitsu Lifebook', 'Informática', '100082', 'disponível'),
(83, 'Projetor Eiki', 'Áudio e Vídeo', '100083', 'disponível'),
(84, 'Mesa de Som Behringer X32', 'Áudio', '100084', 'disponível'),
(85, 'Microfone Sennheiser MK4', 'Áudio', '100085', 'disponível'),
(86, 'Monitor LG 32\"', 'Informática', '100086', 'disponível'),
(87, 'Impressora Xerox Phaser', 'Periféricos', '100087', 'disponível'),
(88, 'Mouse Corsair M65', 'Periféricos', '100088', 'disponível'),
(89, 'Teclado SteelSeries Apex', 'Periféricos', '100089', 'disponível'),
(90, 'HD Externo 500GB LaCie', 'Armazenamento', '100090', 'disponível'),
(91, 'Câmera Ricoh GR III', 'Fotografia', '100091', 'disponível'),
(92, 'Notebook Gateway', 'Informática', '100092', 'disponível'),
(93, 'Projetor Hitachi CP-X3022WN', 'Áudio e Vídeo', '100093', 'disponível'),
(94, 'Mesa de Som Yamaha MG', 'cabo', '100094', 'disponível'),
(95, 'Microfone Beyerdynamic M201', 'Áudio', '100095', 'disponível'),
(96, 'Monitor ASUS VG', 'Informática', '100096', 'disponível'),
(97, 'Impressora Brother HL-L', 'Periféricos', '100097', 'disponível'),
(98, 'Mouse Logitech MX Master', 'Periféricos', '100098', 'disponível'),
(99, 'Teclado Redragon K582', 'Periféricos', '100099', 'disponível'),
(100, 'SSD 2TB Intel', 'Armazenamento', '100100', 'disponível'),
(102, 'jonathan', 'jonathan', '1000131212', 'disponível'),
(103, 'jonathan', 'jonathan', '1212121', 'disponível'),
(104, 'jonathan', 'jonathan', '1000131212', 'disponível');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE `historico` (
  `id` int(11) NOT NULL,
  `id_equipamento` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `data_manutencao` datetime NOT NULL DEFAULT current_timestamp(),
  `responsavel` varchar(255) NOT NULL,
  `custo` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico`
--

INSERT INTO `historico` (`id`, `id_equipamento`, `descricao`, `data_manutencao`, `responsavel`, `custo`) VALUES
(23, 2, 'testeo', '2025-05-20 00:00:00', 'Carlos Silva', 250.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao`
--

CREATE TABLE `solicitacao` (
  `id` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `destino` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `data_inicio_emprestimo` datetime NOT NULL,
  `data_fim_emprestimo` datetime NOT NULL,
  `nome_atividade` varchar(255) NOT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `solicitacao`
--

INSERT INTO `solicitacao` (`id`, `id_usuarios`, `destino`, `status`, `data_inicio_emprestimo`, `data_fim_emprestimo`, `nome_atividade`, `observacao`) VALUES
(30, 11, 'CP', 'Aprovada', '2026-03-09 15:11:00', '2026-03-10 15:11:00', 'teste', 'teste de solicitação'),
(32, 11, 'cruzeiro', 'Aprovada', '2026-03-14 15:59:00', '2026-03-15 15:59:00', 'teste', 'bla bla'),
(33, 11, 'cruzeiro', 'Aprovada', '2026-03-14 16:10:00', '2026-03-15 16:10:00', 'broadcast', 'okokokok');

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao_equipamento`
--

CREATE TABLE `solicitacao_equipamento` (
  `id_solicitacao` int(10) UNSIGNED NOT NULL,
  `id_equipamento` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `solicitacao_equipamento`
--

INSERT INTO `solicitacao_equipamento` (`id_solicitacao`, `id_equipamento`) VALUES
(0, 100041),
(0, 100051),
(7, 100041),
(8, 100041),
(8, 100051),
(8, 100055),
(9, 100055),
(10, 100051),
(11, 100055),
(12, 100029),
(13, 100029),
(14, 100029),
(15, 100029),
(16, 100029),
(17, 100029),
(18, 100022),
(19, 100029),
(20, 100029),
(21, 100031),
(22, 100031),
(23, 100029),
(24, 100055),
(25, 100041),
(26, 100029),
(27, 100051),
(28, 100041),
(29, 100031),
(30, 100031),
(31, 100024),
(32, 100019),
(33, 100033);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `perfil` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `login`, `senha`, `email`, `perfil`, `cpf`) VALUES
(11, 'administrador', 'adm', '$2y$10$twD3ambMX94AB3UFvGiUPuFoBSiC7XGBKt3oQLQtxHTxv3FJkg5h.', 'teste@teste.com', 'Administrador', '40504052888'),
(12, 'Almoxerife', 'almox', '$2y$10$twD3ambMX94AB3UFvGiUPuFoBSiC7XGBKt3oQLQtxHTxv3FJkg5h.', 'teste@teste.com', 'Almoxerife', '40504052888'),
(13, 'Solicitante', 'solicitante', '$2y$10$XnUhH2AK6AHWjlvfC05Av.EiBtr5/VhoUhgyijChhibtWq2xZJJaW', 'teste@teste.com', 'Solicitante', '40504052888'),
(14, 'Manutencao', 'manutencao', '$2y$10$dmFq7ih7lBwQpeBYqEXp9.Zw/sRVrDzqu1ygtUK2/Gu/MeNK4bmpG', 'teste@teste.com', 'Manutenção', '40504052888');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `equipamento`
--
ALTER TABLE `equipamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_equipamento` (`id_equipamento`);

--
-- Índices de tabela `solicitacao`
--
ALTER TABLE `solicitacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atividade`
--
ALTER TABLE `atividade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2089;

--
-- AUTO_INCREMENT de tabela `equipamento`
--
ALTER TABLE `equipamento`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `solicitacao`
--
ALTER TABLE `solicitacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamento` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
