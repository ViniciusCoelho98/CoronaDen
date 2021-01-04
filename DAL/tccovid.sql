-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Dez-2020 às 23:20
-- Versão do servidor: 5.7.20-log
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tccovid`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL,
  `mensagem` varchar(500) NOT NULL,
  `data` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `denuncia_iddenuncia` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `comentario_idcomentario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `idcontato` int(11) NOT NULL,
  `assunto` varchar(45) DEFAULT NULL,
  `mensagem` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `denuncia`
--

CREATE TABLE `denuncia` (
  `iddenuncia` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `status` int(11) NOT NULL,
  `localizacao_idlocalizacao` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--

CREATE TABLE `imagem` (
  `idimagem` int(11) NOT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `denuncia_iddenuncia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `localizacao`
--

CREATE TABLE `localizacao` (
  `idlocalizacao` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `thumb` varchar(100) DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) NOT NULL,
  `nascimento` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `status` int(11) NOT NULL,
  `permissao` int(11) NOT NULL,
  `ip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `email`, `senha`, `nascimento`, `sexo`, `status`, `permissao`, `ip`) VALUES
(1, 'comum', 'comum@gmail.com', '25f9e794323b453885f5181f1b624d0b', '1970-01-01', 'm', 1, 2, '::1'),
(2, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b', '1970-01-01', 'm', 1, 1, '::1');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idcomentario`),
  ADD KEY `fk_comentario_denuncia1_idx` (`denuncia_iddenuncia`),
  ADD KEY `fk_comentario_usuario1_idx` (`usuario_idusuario`),
  ADD KEY `fk_comentario_comentario1_idx` (`comentario_idcomentario`);

--
-- Índices para tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`idcontato`),
  ADD KEY `fk_contato_usuario1` (`usuario_idusuario`);

--
-- Índices para tabela `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`iddenuncia`),
  ADD KEY `fk_denuncia_localizacao1_idx` (`localizacao_idlocalizacao`),
  ADD KEY `fk_denuncia_usuario1_idx` (`usuario_idusuario`);

--
-- Índices para tabela `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`idimagem`),
  ADD KEY `fk_imagem_denuncia1_idx` (`denuncia_iddenuncia`);

--
-- Índices para tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD PRIMARY KEY (`idlocalizacao`),
  ADD KEY `fk_localizacao_usuario1_idx` (`usuario_idusuario`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `idcontato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `denuncia`
--
ALTER TABLE `denuncia`
  MODIFY `iddenuncia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imagem`
--
ALTER TABLE `imagem`
  MODIFY `idimagem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `idlocalizacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_comentario1` FOREIGN KEY (`comentario_idcomentario`) REFERENCES `comentario` (`idcomentario`),
  ADD CONSTRAINT `fk_comentario_denuncia1` FOREIGN KEY (`denuncia_iddenuncia`) REFERENCES `denuncia` (`iddenuncia`),
  ADD CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Limitadores para a tabela `contato`
--
ALTER TABLE `contato`
  ADD CONSTRAINT `fk_contato_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Limitadores para a tabela `denuncia`
--
ALTER TABLE `denuncia`
  ADD CONSTRAINT `fk_denuncia_localizacao1` FOREIGN KEY (`localizacao_idlocalizacao`) REFERENCES `localizacao` (`idlocalizacao`),
  ADD CONSTRAINT `fk_denuncia_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Limitadores para a tabela `imagem`
--
ALTER TABLE `imagem`
  ADD CONSTRAINT `fk_imagem_denuncia1` FOREIGN KEY (`denuncia_iddenuncia`) REFERENCES `denuncia` (`iddenuncia`);

--
-- Limitadores para a tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD CONSTRAINT `fk_localizacao_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
