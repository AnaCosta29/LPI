--
-- Estrutura da tabela `avaliação`
--

CREATE TABLE `avaliação` (
  `idAvaliacao` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `peso` double NOT NULL,
  `altura` double NOT NULL,
  `gorduraCorporal` double NOT NULL,
  `CPF` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `avaliação`
--

INSERT INTO `avaliação` (`idAvaliacao`, `data`, `peso`, `altura`, `gorduraCorporal`, `CPF`) VALUES
(1, '2019-03-15 00:00:00', 62, 1, 14, 1784733679);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `CPF` bigint(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `idTipoUsuarios` int(11) NOT NULL,
  `idFicha` int(11) DEFAULT NULL,
  `senha` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cadastro`
--

INSERT INTO `cadastro` (`CPF`, `nome`, `dataNascimento`, `telefone`, `email`, `idTipoUsuarios`, `idFicha`, `senha`) VALUES
(1784733679, 'Lucas Fernando L Gomes', '1999-08-16', 999535397, 'lucaslages01ghs@gmail.com', 2, 1, '123456789'),
(14396465629, 'Admin', '1996-12-08', 992925162, 'yanlfs@hotmail.com', 1, NULL, '081296');

-- --------------------------------------------------------

--
-- Estrutura da tabela `exercicios`
--

CREATE TABLE `exercicios` (
  `idExercicios` int(11) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `idGrupos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `exercicios`
--

INSERT INTO `exercicios` (`idExercicios`, `desc`, `idGrupos`) VALUES
(1, 'Supino Reto', 27),
(2, 'Supino Inclinado', 27),
(3, 'Supino Declinado', 27),
(4, 'Crucifixo', 27),
(5, 'Iso Peitoral', 27),
(6, 'Voador', 27),
(7, 'Barra Fixa', 19),
(8, 'Remada Unilaretal', 19),
(9, 'Remada Curvada', 19),
(10, 'Remada Articulada', 19),
(11, 'Puxador Alto', 19),
(12, 'Puxador Baixo', 19),
(13, 'Remo Cavalinho', 19),
(14, 'Rosca Direta', 20),
(15, 'Rosca Scott', 20),
(16, 'Rosca Alternada', 20),
(17, 'Rosca Concentrada', 20),
(18, 'Rosca com barra EZ ou W e pegada fechada', 20),
(19, 'Rosca com barra EZ ou W e pegada aberta', 20),
(20, 'Rosca Punho', 21),
(21, 'Rosca Punho Inverso', 21),
(22, 'Penturrilha Sentada', 22),
(23, 'Panturrilha em Pé', 22),
(24, 'Desenvol. de Ombro', 23),
(25, 'Elevação Lateral', 23),
(26, 'Elevação Frotal', 23),
(27, 'Crucifixo Inverso', 23),
(28, 'Remada Alta', 23),
(29, 'Testa', 24),
(30, 'Francês', 24),
(31, 'Cabo', 24),
(32, 'Corda', 24),
(33, 'Elevação de Perna', 25),
(34, 'Rotação de Tronco', 25),
(35, 'Abdominal', 25),
(36, 'Flexão Lateral de Tronco', 25),
(37, 'Extensão Lateral', 25),
(38, 'Agachamento', 26),
(39, 'Leg Press', 26),
(40, 'Hack Maquina', 26),
(41, 'Extensora', 26),
(42, 'Avanço', 26),
(43, 'Flexora Deitada', 26),
(44, 'Flexora em Pé', 26),
(45, 'Cadeira Abdutora', 26);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ficha`
--

CREATE TABLE `ficha` (
  `idFicha` int(11) NOT NULL,
  `idExercicios` int(11) NOT NULL,
  `carga` double NOT NULL,
  `repeticao` int(11) NOT NULL,
  `serie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ficha`
--

INSERT INTO `ficha` (`idFicha`, `idExercicios`, `carga`, `repeticao`, `serie`) VALUES
(1, 27, 10, 15, 3),
(1, 35, 0, 25, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gruposmusculares`
--

CREATE TABLE `gruposmusculares` (
  `idGrupos` int(11) NOT NULL,
  `Desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `gruposmusculares`
--

INSERT INTO `gruposmusculares` (`idGrupos`, `Desc`) VALUES
(19, 'Costas'),
(20, 'Bíceps'),
(21, 'Ante Braço'),
(22, 'Pernas'),
(23, 'Ombros'),
(24, 'Triceps'),
(25, 'Abdomen'),
(26, 'Coxas/Glúteo'),
(27, 'Peito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiposusuarios`
--

CREATE TABLE `tiposusuarios` (
  `idTipoUsuarios` int(11) NOT NULL,
  `tipoUsuarios` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tiposusuarios`
--

INSERT INTO `tiposusuarios` (`idTipoUsuarios`, `tipoUsuarios`) VALUES
(1, 'Admin'),
(2, 'Cliente'),
(3, 'Medico'),
(4, 'Personal'),
(5, 'Atendente');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avaliação`
--
ALTER TABLE `avaliação`
  ADD PRIMARY KEY (`idAvaliacao`),
  ADD KEY `fkIdx_182` (`CPF`);

--
-- Indexes for table `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`CPF`),
  ADD KEY `fkIdx_135` (`idTipoUsuarios`),
  ADD KEY `fkIdx_161` (`idFicha`);

--
-- Indexes for table `exercicios`
--
ALTER TABLE `exercicios`
  ADD PRIMARY KEY (`idExercicios`),
  ADD KEY `fkIdx_172` (`idGrupos`);

--
-- Indexes for table `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`idFicha`,`idExercicios`),
  ADD KEY `fkIdx_175` (`idExercicios`);

--
-- Indexes for table `gruposmusculares`
--
ALTER TABLE `gruposmusculares`
  ADD PRIMARY KEY (`idGrupos`);

--
-- Indexes for table `tiposusuarios`
--
ALTER TABLE `tiposusuarios`
  ADD PRIMARY KEY (`idTipoUsuarios`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avaliação`
--
ALTER TABLE `avaliação`
  MODIFY `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `CPF` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483647;

--
-- AUTO_INCREMENT for table `exercicios`
--
ALTER TABLE `exercicios`
  MODIFY `idExercicios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `ficha`
--
ALTER TABLE `ficha`
  MODIFY `idFicha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gruposmusculares`
--
ALTER TABLE `gruposmusculares`
  MODIFY `idGrupos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tiposusuarios`
--
ALTER TABLE `tiposusuarios`
  MODIFY `idTipoUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `avaliação`
--
ALTER TABLE `avaliação`
  ADD CONSTRAINT `avaliação_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `cadastro` (`CPF`);

--
-- Limitadores para a tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD CONSTRAINT `FK_135` FOREIGN KEY (`idTipoUsuarios`) REFERENCES `tiposusuarios` (`idTipoUsuarios`),
  ADD CONSTRAINT `FK_161` FOREIGN KEY (`idFicha`) REFERENCES `ficha` (`idFicha`);

--
-- Limitadores para a tabela `exercicios`
--
ALTER TABLE `exercicios`
  ADD CONSTRAINT `FK_172` FOREIGN KEY (`idGrupos`) REFERENCES `gruposmusculares` (`idGrupos`);

--
-- Limitadores para a tabela `ficha`
--
ALTER TABLE `ficha`
  ADD CONSTRAINT `FK_175` FOREIGN KEY (`idExercicios`) REFERENCES `exercicios` (`idExercicios`);
COMMIT;