-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 12-Mar-2021 às 17:07
-- Versão do servidor: 5.7.24
-- versão do PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `venda2021`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `backup_usuarios`
--

CREATE TABLE `backup_usuarios` (
  `idBackupusuarios` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `Loginbackup` varchar(80) DEFAULT NULL,
  `senhabackup` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `Nome_Categoria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `NomeCliente` varchar(100) DEFAULT NULL,
  `cpfcliente` char(14) DEFAULT NULL,
  `RGcliente` char(13) DEFAULT NULL,
  `sexocliente` char(1) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `debito` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato_cliente`
--

CREATE TABLE `contato_cliente` (
  `idcontatocliente` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `telefone` varchar(40) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Whatsapp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato_fornecedor`
--

CREATE TABLE `contato_fornecedor` (
  `idcontatofornecedor` int(11) NOT NULL,
  `idfornecedor` int(11) DEFAULT NULL,
  `telefone_fornecedor` varchar(80) DEFAULT NULL,
  `WhatsappFornecedor` varchar(30) DEFAULT NULL,
  `Email_fornecedor` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `devolucao`
--

CREATE TABLE `devolucao` (
  `idDevolucao` int(11) NOT NULL,
  `idvenda` int(11) DEFAULT NULL,
  `dataDevolucao` date DEFAULT NULL,
  `descricaodadevolucao` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_cliente`
--

CREATE TABLE `endereco_cliente` (
  `idEndereco_cliente` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  `Bairro` varchar(100) DEFAULT NULL,
  `Rua` varchar(100) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `CEP` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrada`
--

CREATE TABLE `entrada` (
  `identrada` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idfornecedor` int(11) DEFAULT NULL,
  `valortotaldanota` decimal(7,2) DEFAULT NULL,
  `datacompra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_de_pagamento`
--

CREATE TABLE `forma_de_pagamento` (
  `idForma_de_pagamento` int(11) NOT NULL,
  `tipo_pagamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idfornecedor` int(11) NOT NULL,
  `razaoSocial` varchar(100) DEFAULT NULL,
  `nomefantasia` varchar(100) DEFAULT NULL,
  `CNPJ` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensdevolucao`
--

CREATE TABLE `itensdevolucao` (
  `iditensDevolucao` int(11) NOT NULL,
  `idDevolucao` int(11) DEFAULT NULL,
  `idproduto` int(11) DEFAULT NULL,
  `quantidade_Devolvida` int(11) DEFAULT NULL,
  `datadevolvida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensentrada`
--

CREATE TABLE `itensentrada` (
  `iditensentrada` int(11) NOT NULL,
  `identrada` int(11) DEFAULT NULL,
  `idproduto` int(11) DEFAULT NULL,
  `Precocompra` decimal(7,2) DEFAULT NULL,
  `quantidadeitensentrada` decimal(7,2) DEFAULT NULL,
  `Unidade` char(2) DEFAULT NULL,
  `ipi` decimal(7,2) DEFAULT NULL,
  `frete_ItensEntrada` decimal(7,2) DEFAULT NULL,
  `icms` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_troca`
--

CREATE TABLE `itens_troca` (
  `iditenstroca` int(11) NOT NULL,
  `idtroca` int(11) DEFAULT NULL,
  `idproduto` int(11) DEFAULT NULL,
  `qntTrocada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_vendas`
--

CREATE TABLE `itens_vendas` (
  `iditensvendas` int(11) NOT NULL,
  `idvenda` int(11) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `quantidade` decimal(7,2) DEFAULT NULL,
  `Valorvenda` float DEFAULT NULL,
  `desconto` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL,
  `nomeMarca` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_acesso`
--

CREATE TABLE `nivel_acesso` (
  `idNivelacesso` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `Tipodeusuario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `idPagamento` int(11) NOT NULL,
  `idvenda` int(11) DEFAULT NULL,
  `idparcelas` int(11) DEFAULT NULL,
  `idForma_de_pagamento` int(11) DEFAULT NULL,
  `valor_pagamento` decimal(7,2) DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `parcelas`
--

CREATE TABLE `parcelas` (
  `idparcelas` int(11) NOT NULL,
  `idvenda` int(11) DEFAULT NULL,
  `numerodeparcelas` int(11) DEFAULT NULL,
  `valorparcela` decimal(7,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `vencimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prateleira`
--

CREATE TABLE `prateleira` (
  `idprateleira` int(11) NOT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `descricaoPrateleira` varchar(80) DEFAULT NULL,
  `quantidadeFrascos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL,
  `NomeDoProduto` varchar(80) DEFAULT NULL,
  `idmarca` int(11) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `icms` decimal(7,2) DEFAULT NULL,
  `ipi` decimal(7,2) DEFAULT NULL,
  `Frete` decimal(7,2) DEFAULT NULL,
  `valornaFabrica` decimal(7,2) DEFAULT NULL,
  `valordecompra` decimal(7,2) DEFAULT NULL,
  `lucro` decimal(7,2) DEFAULT NULL,
  `valorvenda` decimal(7,2) DEFAULT NULL,
  `desconto` decimal(7,2) DEFAULT NULL,
  `quantidade` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `troca`
--

CREATE TABLE `troca` (
  `idtroca` int(11) NOT NULL,
  `idvenda` int(11) DEFAULT NULL,
  `dataDaTroca` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `NomeUsuario` varchar(70) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(40) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idvenda` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `dataVenda` date DEFAULT NULL,
  `qntparcelas` int(11) DEFAULT NULL,
  `prazo` varchar(40) DEFAULT NULL,
  `descontototal` decimal(7,2) DEFAULT NULL,
  `descontoacerto` decimal(7,2) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `valortotal` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `backup_usuarios`
--
ALTER TABLE `backup_usuarios`
  ADD PRIMARY KEY (`idBackupusuarios`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Índices para tabela `contato_cliente`
--
ALTER TABLE `contato_cliente`
  ADD PRIMARY KEY (`idcontatocliente`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Índices para tabela `contato_fornecedor`
--
ALTER TABLE `contato_fornecedor`
  ADD PRIMARY KEY (`idcontatofornecedor`),
  ADD KEY `idfornecedor` (`idfornecedor`);

--
-- Índices para tabela `devolucao`
--
ALTER TABLE `devolucao`
  ADD PRIMARY KEY (`idDevolucao`),
  ADD KEY `idvenda` (`idvenda`);

--
-- Índices para tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD PRIMARY KEY (`idEndereco_cliente`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Índices para tabela `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`identrada`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idfornecedor` (`idfornecedor`);

--
-- Índices para tabela `forma_de_pagamento`
--
ALTER TABLE `forma_de_pagamento`
  ADD PRIMARY KEY (`idForma_de_pagamento`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idfornecedor`);

--
-- Índices para tabela `itensdevolucao`
--
ALTER TABLE `itensdevolucao`
  ADD PRIMARY KEY (`iditensDevolucao`),
  ADD KEY `idDevolucao` (`idDevolucao`),
  ADD KEY `idproduto` (`idproduto`);

--
-- Índices para tabela `itensentrada`
--
ALTER TABLE `itensentrada`
  ADD PRIMARY KEY (`iditensentrada`),
  ADD KEY `idproduto` (`idproduto`),
  ADD KEY `identrada` (`identrada`);

--
-- Índices para tabela `itens_troca`
--
ALTER TABLE `itens_troca`
  ADD PRIMARY KEY (`iditenstroca`),
  ADD KEY `idtroca` (`idtroca`),
  ADD KEY `idproduto` (`idproduto`);

--
-- Índices para tabela `itens_vendas`
--
ALTER TABLE `itens_vendas`
  ADD PRIMARY KEY (`iditensvendas`),
  ADD KEY `idvenda` (`idvenda`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idmarca`);

--
-- Índices para tabela `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  ADD PRIMARY KEY (`idNivelacesso`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`idPagamento`),
  ADD KEY `idvenda` (`idvenda`),
  ADD KEY `idparcelas` (`idparcelas`),
  ADD KEY `idForma_de_pagamento` (`idForma_de_pagamento`);

--
-- Índices para tabela `parcelas`
--
ALTER TABLE `parcelas`
  ADD PRIMARY KEY (`idparcelas`),
  ADD KEY `idvenda` (`idvenda`);

--
-- Índices para tabela `prateleira`
--
ALTER TABLE `prateleira`
  ADD PRIMARY KEY (`idprateleira`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcategoria` (`idcategoria`),
  ADD KEY `idmarca` (`idmarca`);

--
-- Índices para tabela `troca`
--
ALTER TABLE `troca`
  ADD PRIMARY KEY (`idtroca`),
  ADD KEY `idvenda` (`idvenda`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idvenda`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `backup_usuarios`
--
ALTER TABLE `backup_usuarios`
  ADD CONSTRAINT `backup_usuarios_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `contato_cliente`
--
ALTER TABLE `contato_cliente`
  ADD CONSTRAINT `contato_cliente_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);

--
-- Limitadores para a tabela `contato_fornecedor`
--
ALTER TABLE `contato_fornecedor`
  ADD CONSTRAINT `contato_fornecedor_ibfk_1` FOREIGN KEY (`idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`);

--
-- Limitadores para a tabela `devolucao`
--
ALTER TABLE `devolucao`
  ADD CONSTRAINT `devolucao_ibfk_1` FOREIGN KEY (`idvenda`) REFERENCES `venda` (`idvenda`);

--
-- Limitadores para a tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD CONSTRAINT `endereco_cliente_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);

--
-- Limitadores para a tabela `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `entrada_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `entrada_ibfk_2` FOREIGN KEY (`idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`);

--
-- Limitadores para a tabela `itensdevolucao`
--
ALTER TABLE `itensdevolucao`
  ADD CONSTRAINT `itensdevolucao_ibfk_1` FOREIGN KEY (`idDevolucao`) REFERENCES `devolucao` (`idDevolucao`),
  ADD CONSTRAINT `itensdevolucao_ibfk_2` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`);

--
-- Limitadores para a tabela `itensentrada`
--
ALTER TABLE `itensentrada`
  ADD CONSTRAINT `itensentrada_ibfk_1` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`),
  ADD CONSTRAINT `itensentrada_ibfk_2` FOREIGN KEY (`identrada`) REFERENCES `entrada` (`identrada`);

--
-- Limitadores para a tabela `itens_troca`
--
ALTER TABLE `itens_troca`
  ADD CONSTRAINT `itens_troca_ibfk_1` FOREIGN KEY (`idtroca`) REFERENCES `troca` (`idtroca`),
  ADD CONSTRAINT `itens_troca_ibfk_2` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`);

--
-- Limitadores para a tabela `itens_vendas`
--
ALTER TABLE `itens_vendas`
  ADD CONSTRAINT `itens_vendas_ibfk_1` FOREIGN KEY (`idvenda`) REFERENCES `venda` (`idvenda`),
  ADD CONSTRAINT `itens_vendas_ibfk_2` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idproduto`);

--
-- Limitadores para a tabela `nivel_acesso`
--
ALTER TABLE `nivel_acesso`
  ADD CONSTRAINT `nivel_acesso_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`idvenda`) REFERENCES `venda` (`idvenda`),
  ADD CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`idparcelas`) REFERENCES `parcelas` (`idparcelas`),
  ADD CONSTRAINT `pagamento_ibfk_3` FOREIGN KEY (`idForma_de_pagamento`) REFERENCES `forma_de_pagamento` (`idForma_de_pagamento`);

--
-- Limitadores para a tabela `parcelas`
--
ALTER TABLE `parcelas`
  ADD CONSTRAINT `parcelas_ibfk_1` FOREIGN KEY (`idvenda`) REFERENCES `venda` (`idvenda`);

--
-- Limitadores para a tabela `prateleira`
--
ALTER TABLE `prateleira`
  ADD CONSTRAINT `prateleira_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`);

--
-- Limitadores para a tabela `troca`
--
ALTER TABLE `troca`
  ADD CONSTRAINT `troca_ibfk_1` FOREIGN KEY (`idvenda`) REFERENCES `venda` (`idvenda`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
