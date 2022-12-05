-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Dez-2022 às 15:50
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `luminata`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_carrinho`
--

CREATE TABLE `tb_carrinho` (
  `CODIGO` int(11) NOT NULL,
  `QUANT_ITENS` int(2) NOT NULL,
  `DATA_PEDIDO` date NOT NULL DEFAULT current_timestamp(),
  `COD_CLIENTE` int(3) NOT NULL,
  `PARCELAS` int(2) NOT NULL,
  `VALOR_TOTAL` int(15) NOT NULL,
  `STATU` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_carrinho`
--

INSERT INTO `tb_carrinho` (`CODIGO`, `QUANT_ITENS`, `DATA_PEDIDO`, `COD_CLIENTE`, `PARCELAS`, `VALOR_TOTAL`, `STATU`) VALUES
(15, 1, '2022-10-19', 42, 8, 42990, 'ENTREGUE'),
(16, 3, '2022-11-01', 41, 9, 2292090, 'ENTREGUE'),
(25, 1, '2022-10-09', 43, 5, 69090, 'ENTREGUE'),
(26, 1, '2022-11-09', 43, 10, 39090, 'ENTREGUE'),
(27, 1, '2022-11-25', 44, 10, 199090, 'ENVIADO'),
(28, 3, '2022-11-09', 45, 8, 132000, 'ENTREGUE'),
(29, 2, '2022-11-09', 46, 6, 369000, 'ENVIADO'),
(30, 2, '2022-12-05', 46, 5, 149000, 'SEPARANDO'),
(31, 1, '2022-12-05', 43, 7, 255090, 'SEPARANDO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cartao`
--

CREATE TABLE `tb_cartao` (
  `CODIGO` int(11) NOT NULL COMMENT 'Código cartão',
  `COD_CLIENTE` int(3) NOT NULL,
  `COD_CARRINHO` int(6) NOT NULL,
  `TIPO` int(1) NOT NULL,
  `NUMERO` int(16) NOT NULL,
  `NOME` varchar(100) CHARACTER SET utf8 NOT NULL,
  `VALIDADE` int(6) NOT NULL,
  `CVV` int(3) NOT NULL,
  `CPF` varchar(11) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_cartao`
--

INSERT INTO `tb_cartao` (`CODIGO`, `COD_CLIENTE`, `COD_CARRINHO`, `TIPO`, `NUMERO`, `NOME`, `VALIDADE`, `CVV`, `CPF`) VALUES
(4, 42, 15, 2, 2147483647, 'caROLINE GABRIEL', 202507, 654, '45654644644'),
(5, 42, 16, 1, 2147483647, 'caROLINE GABRIEL', 202409, 436, '45654644644'),
(6, 43, 25, 1, 2147483647, 'Keith goncalves', 202809, 875, '67826786276'),
(7, 43, 26, 2, 2147483647, 'Keith goncalves', 203008, 777, '33535353768'),
(8, 44, 27, 1, 2147483647, 'Manuela garcia', 202809, 888, '33535353768'),
(9, 45, 28, 2, 2147483647, 'Jose evaristo', 203007, 865, '67826786276'),
(10, 46, 29, 1, 2147483647, 'thiago xavier', 202211, 444, '22222222222'),
(11, 46, 30, 1, 2147483647, 'thiago', 203008, 778, '56465465467'),
(12, 43, 31, 1, 2147483647, 'Keith', 202506, 654, '56565655533');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `CODIGO` int(11) NOT NULL COMMENT 'Codigo do cliente',
  `NOME` varchar(50) NOT NULL COMMENT 'Nome do cliente',
  `SOBRENOME` varchar(30) NOT NULL,
  `GENERO` varchar(10) NOT NULL COMMENT 'Gúnero do cliente',
  `NASCIMENTO` date NOT NULL COMMENT 'Data de nascimento do cliente',
  `CPF` varchar(11) NOT NULL COMMENT 'cpf usuario',
  `CEP` int(10) NOT NULL COMMENT 'CEP do cliente',
  `CIDADE` text NOT NULL,
  `BAIRRO` varchar(80) NOT NULL,
  `RUA` varchar(80) NOT NULL,
  `NUMERO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`CODIGO`, `NOME`, `SOBRENOME`, `GENERO`, `NASCIMENTO`, `CPF`, `CEP`, `CIDADE`, `BAIRRO`, `RUA`, `NUMERO`) VALUES
(41, 'Caroline', 'Gabriel', 'fem', '2005-05-15', '14208823844', 18870070, 'Fartura - SP', 'Parque dos IpÃªs', 'Rua JosÃ© de Oliveira Bruno', 45),
(42, 'Caroline', 'Gabriel', 'fem', '2005-05-15', '14208823844', 18870070, 'Fartura - SP', 'Parque dos IpÃªs', 'Rua JosÃ© de Oliveira Bruno', 40),
(43, 'Keith', 'Gonï¿½alves', 'fem', '2004-09-23', '33535353768', 18740000, 'Taquarituba - SP', 'Centro', 'Rua Zico Leonel', 75),
(44, 'Manuela', 'Garcia', 'fem', '2004-11-25', '89887877777', 18890075, 'TaguaÃ­ - SP', 'Centro', 'Rua JosÃ© InÃ¡cio Ribeiro', 77),
(45, 'Jose Evaristo', 'Lima', 'masc', '2004-10-20', '7878678666', 18730011, 'ItaÃ­ - SP', 'Centro', 'Rua JosÃ© Floriano', 6),
(46, 'Thiago', 'Xavier', 'masc', '2004-09-23', '22222222222', 18740000, 'Taquarituba - SP', 'Centro', 'Rua JosÃ© Floriano', 88);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_codigo_prod`
--

CREATE TABLE `tb_codigo_prod` (
  `COD_CATEGORIA` int(11) NOT NULL COMMENT 'codigo da categoria do produto',
  `CATEGORIAS` varchar(40) NOT NULL COMMENT 'categoria do produto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_codigo_prod`
--

INSERT INTO `tb_codigo_prod` (`COD_CATEGORIA`, `CATEGORIAS`) VALUES
(1, 'oculos de grau masculino'),
(2, 'oculos de grau feminino'),
(3, 'oculos de sol masculino'),
(4, 'oculos de sol feminino'),
(5, 'relogio masculino'),
(6, 'relogio feminino'),
(7, 'pendente'),
(8, 'brinco'),
(9, 'anel'),
(10, 'pulseira'),
(11, 'colar'),
(12, 'pingente'),
(13, 'bracelete');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_item_carrinho`
--

CREATE TABLE `tb_item_carrinho` (
  `CODIGO` int(11) NOT NULL,
  `CODIGO_CARRINHO` int(11) NOT NULL,
  `COD_ITEM` int(11) NOT NULL,
  `QUANT_ITEM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_item_carrinho`
--

INSERT INTO `tb_item_carrinho` (`CODIGO`, `CODIGO_CARRINHO`, `COD_ITEM`, `QUANT_ITEM`) VALUES
(25, 15, 68, 1),
(26, 16, 103, 1),
(27, 16, 80, 1),
(29, 25, 174, 1),
(30, 26, 154, 1),
(31, 27, 243, 1),
(32, 28, 95, 1),
(33, 28, 213, 1),
(34, 28, 116, 1),
(35, 29, 277, 1),
(36, 29, 305, 1),
(37, 30, 96, 1),
(38, 30, 115, 1),
(39, 31, 311, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_marca`
--

CREATE TABLE `tb_marca` (
  `CODIGO` int(11) NOT NULL COMMENT 'Codigo da marca',
  `MARCA` varchar(40) NOT NULL COMMENT 'Marca do produto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_marca`
--

INSERT INTO `tb_marca` (`CODIGO`, `MARCA`) VALUES
(1, 'Ana Hickamann'),
(2, 'Carolina Herrera'),
(3, 'Chilli Beans'),
(4, 'Colcci'),
(5, 'Dolce&Gabbana'),
(6, 'Gucci'),
(7, 'Guess'),
(8, 'Lacoste'),
(9, 'Olivia Burtonby'),
(10, 'Polaroid'),
(11, 'Tommy Hilfiger'),
(12, 'Versace'),
(13, 'Vivara'),
(14, 'Cartier'),
(15, 'Pandora'),
(16, 'Monte Carlo'),
(17, 'Tiffany&Co'),
(18, 'Cassio'),
(19, 'Puma'),
(20, 'Diesel'),
(21, 'Nike'),
(22, 'Oakley'),
(23, 'Prada'),
(24, 'Ray Ban'),
(25, 'Louis Vuitton'),
(26, 'Tom Wood');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `COD_PRODUTO` int(11) NOT NULL COMMENT 'Código do produto',
  `MARCA` int(11) NOT NULL COMMENT 'Marca do produto',
  `CATEGORIAS` int(11) NOT NULL COMMENT 'Categoria do produto',
  `NOME` text NOT NULL COMMENT 'Nome do produto',
  `MODELO` varchar(10) NOT NULL COMMENT 'Modelo do produto',
  `DESCRICAO` varchar(2000) NOT NULL COMMENT 'Descrição do produto',
  `PRECO` varchar(15) NOT NULL COMMENT 'Preço do produto',
  `ESTOQUE` int(6) NOT NULL COMMENT 'Quantidade de produtos no estoque'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_produto`
--

INSERT INTO `tb_produto` (`COD_PRODUTO`, `MARCA`, `CATEGORIAS`, `NOME`, `MODELO`, `DESCRICAO`, `PRECO`, `ESTOQUE`) VALUES
(63, 1, 2, 'ï¿½culos de Grau Ana Hickmann ', 'AH1386', ' Ana Hickmann Eyewear sabe que cada pequeno detalhe na peï¿½a ï¿½ fundamental para alcanï¿½ar a perfeiï¿½ï¿½o nos ï¿½culos. Muito alï¿½m de apenas superioridade nas armaï¿½ï¿½es e lentes, a marca investe em pequenos integrantes dos ï¿½culos, como plaquetas, parafusos, elementos decorativos, pintura e tingimento. Suas coleï¿½ï¿½es sï¿½o dotadas de elegï¿½ncia e sofisticaï¿½ï¿½o, perfeitas para mulheres modernas sem fugir do requinte clï¿½ssico.', '455,00', 1),
(68, 1, 2, 'Óculos De Grau Ana Hickmann', 'AH 1357', 'O Óculos de Grau Ana Hickmann AH 1357 04A Bege Fosco e Dourado Brilho com seu design retangular é exatamente o formato de óculos que a maioria das pessoas preferem na hora de escolher seus óculos e isso acontece porque é um formato que cai bem para todos os tipos de rostos.</br>\r\nO modelo AH 1357 04A traz a combinação do aro aberto com o metal que é simplesmente a que mais agrada a maioria das pessoas. Talvez porque é um estilo coringa que veste bem na maioria dos rostos e também porque une a discrição e o estilo na medida certa!', '429,90', 0),
(76, 1, 2, 'Óculos de Grau Ana Hickmann ', '     AH640', ' Óculos de Grau Ana Hickmann AH 6402 P02 Vermelho e Dourado Brilho com seu design retangular é exatamente o formato de óculos que a maioria das pessoas preferem na hora de escolher seus óculos e isso acontece porque é um formato que cai bem para todos os tipos de rostos.', '469,99', 3),
(77, 1, 2, 'Óculos de Grau Ana Hickmann ', 'AH6367I', 'Os Óculos de Grau Feminino Ana Hickmann AH 6367l T01-53 possuem design imponente e linhas marcantes, feitos com materiais nobres, dando sofisticação e elegância à peça. No formato quadrado, feito em acetato leve e confortável nas cores nude brilho. Ideal para qualquer ocasião e para compor um visual moderno. A grife Anna Hickmann é a mais vendida do Brasil, seguindo as últimas tendências de moda com cores exclusivas e formatos arrojados. Conhecida pela alta qualidade com reconhecimento mundial, a grife possue peças únicas e diferenciadas para quem busca exclusividade.', '620,90', 20),
(79, 14, 9, 'Anel Clash Pequeno', 'B4229800', 'Ouro Rosa 18K <br>\r\nLargura 6,4 mm', '14000,00', 4),
(80, 14, 9, 'Anel Panthère de Cartier', 'B4230000', 'Ouro rosa 18K, ônix, engastado com duas granadas tsavorita.', '22000,00', 1),
(81, 14, 9, 'Anel Cravejado de Diamantes Destinée', 'N4722700', 'Ouro rosa 18K, engastada com 22 diamantes, lapidação brilhante, totalizando 1,34 ct, largura de 3,27 mm.', '60000,00', 4),
(82, 14, 9, 'Anel Panthère de Cartier', 'N4244700', 'Ouro branco 18K, engastado com 81 diamantes, lapidação brilhante, totalizando 0,75 ct.', '120000,00', 3),
(83, 14, 9, 'Anel Cravejado de Diamantes ', 'N4127500', 'Platina 950/1000, engastada com 18 diamantes, lapidação brilhante, totalizando 2,56 ct e largura de 4,1 mm.', '130000,00', 4),
(84, 14, 9, 'Anel Juste Un Clou ', 'B4211100', 'Ouro branco 18K, engastado com 77 diamantes, lapidação brilhante, totalizando 0,59 ct.', '60000,00', 6),
(85, 8, 3, 'Óculos de Sol Lacoste', 'L710S 466 ', 'Moderno, perfeito para fazer diferentes combinações, alia proteção com estilo e arrase por onde for com esse lindo solar Lacoste. Com armação e hastes de acetato na combinação do azul com verde, possui lentes azul degradê, que proporciona um conforto visual surpreendente, seja para você ou para presentear alguém especial é uma ótima opção. ', '435,00', 4),
(86, 8, 3, 'Óculos de Sol Lacoste', 'L705S 421-', 'Os Óculos de Sol Masculino Lacoste são clássicos com combinação de cores vivas e textura tornam essa peça incrível para completar o visual. O material é de alta qualidade sendo leve, confortável e com alta proteção contra os raios solares. Um modelo retangular feito em acetato azul brilho com camadas de cores contrastantes, nas hastes tem detalhe emborrachado e texturizado que dá um toque moderno, e ainda conta com lente cinza. Um óculos original e moderno, ideal para quem gosta de exclusividade e destaque. A Lacoste é conhecida e desejada mundialmente. Com suas raízes esportivas e aparência elegante, Os Óculos de sol e grau são os únicos com estilo de vida único, original, esportivo e elegante. Com cores vivas, que são referência da marca, e design exclusivo, esse acessório é muito desejado para compor estilo despojado. Para Lacoste, a vida é um belo esporte!', '860,00', 3),
(87, 8, 3, 'Óculos de Sol Lacoste', 'L210S 714 ', 'Fundada pela lenda do tênis francês René Lacoste, a marca Lacoste se inspira nos princípios e valores do esporte. Com o objetivo de promover a elegância e o otimismo como forma de ser e de inventar a vida, a Lacoste hoje está presente em quase todos os países, com sua qualidade e variedade de produtos tanto pra homens quanto pra mulheres, sendo um ícone da moda e uma marca de desejo de muitos, inclusive em óculos. Os óculos da Lacoste possuem a mesma qualidade e conforto de suas roupas, os símbolos e inspirações estampam também os acessórios ópticos, afirmando a identidade e o estilo da marca.', '200,00', 4),
(88, 8, 3, 'Óculos de Sol Lacoste', 'L3617s 001', 'Desde a sua criação em 1933, a Lacoste conta com uma linha esportiva autêntica para trazer otimismo e elegância ao mundo, graças a um estilo de vida único e original para mulheres, homens e crianças.</br>\r\nCom a visão de ser líder no mercado, a marca do Crocodilo está presente em 120 países através de uma rede de exclusividade.</br>\r\nA vontade da marca de explorar uma variedade de estilos de óculos a tornou uma favorita consistente em um mundo onde as tendências mudam a todo momento.\r\n\r\n ', '440,00', 2),
(89, 21, 3, 'Óculos de Sol Nike', 'L E DJ5560', 'A Nike Vision traz inspiração e inovação para atletas através de coleções de óculos projetadas para homens, mulheres e crianças que os ajudam a See Sport Better™ (Ver o Esporte Melhor).</br>\r\nÓculos de grau e solares de performance e lifestyle são desenvolvidos para cada categoria de esporte da Nike, projetados de forma inovadora para o atleta existente em cada um.</br>\r\nA lente Field Tint silencia a luz forte enquanto permite que você examine o horizonte em busca de objetos em movimento. Ideal para beisebol, esportes de campo e tênis, ele aprimora sua capacidade de rastrear e interceptar objetos sob luz forte e instável. ', '1400,00', 5),
(90, 21, 3, 'Óculos de Sol Nike', 'L E DJ5560', 'Como se o equipamento esportivo não bastasse, a Nike pretende ser uma marca de estilo de vida completa, incluindo armações oftálmicas e de óculos de sol para todos da família. Os estilos dos óculos Nike variam de brilhantes e descolados a profissionais e clássicos, e sempre dão um pouco do estilo Nike à mistura.\r\n', '1500,00', 2),
(91, 21, 3, 'Óculos de Sol Nike', 'DC3294 010', 'A vasta linha de produtos da Nike inclui equipamento de treinamento especializado, calçados, vestuário, acessórios e equipamentos esportivos. Por meio de produtos inovadores, publicidade e patrocínio de equipes e atletas, a Nike se tornou líder na indústria de roupas esportivas e uma das maiores marcas do mundo. Os óculos de sol e os óculos de grau da Nike Vision trazem a mesma inspiração e inovação para os atletas e amantes dos esportes.', '1040,00', 4),
(92, 21, 3, 'Óculos de Sol Nike', 'DJ2036 010', 'A Nike Vision Traz Inspiração E Inovação Para Atletas Através De Coleções De Óculos Projetadas Para Homens, Mulheres E Crianças Que Os Ajudam A See Sport Better (ver O Esporte Melhor). Óculos De Grau E Solares De Performance E Lifestyle São Desenvolvidos Para Cada Categoria De Esporte Da Nike, Projetados De Forma Inovadora Para O Atleta Existente Em Cada Um.</br>\r\nMarca: Nike</br>\r\nModelo: Show X3 Dj2036 010</br>\r\noleção: Performance\r\nGênero: Masculino</br>\r\nTipo De Lente: Proteção Uv</br>\r\nTamanho Da Lente: 72 Milímetros</br>\r\nAltura Da Lente: 44 Milímetros\r\nTamanho Da Haste: 130 Milímetros</br>\r\nTamanho Da Ponte: 9 Milímetros</br>\r\nCor Principal: Pretocor </br>\r\nFabricante: Black Grey Silver Flash</br>\r\nMaterial Da Armação: Injetado\r\nFormato Da Armação: Retangular</br>\r\nGarantia: 12 Meses Pelo Fabricante', '1250,00', 4),
(93, 22, 3, 'Óculos de Sol Oakley', '941703-3N ', 'O óculos Oakley Holbrook, é um modelo com estilo moderno que cai bem em qualquer tipo de rosto, lançado há mais de dois anos, já se tornou um ícone da marca Oakley, agora em mais uma versão ideal para rostos mais largos, e também possui excelente proteção contra os raios UV, além de armação leve e confortável, o modelo conta com Lentes com tecnologia Prizm.\r\n', '820,00', 3),
(94, 22, 3, 'Óculos de Sol Oakley', 'D63-4228-0', 'O Óculos Oakley Turbine Warm oferece máxima tecnologia para acompanhar o dia a dia. Em um design moderno, com proteção 100% contra raios UV e estrutura de material leve e confortável.\r\n\r\n', '730,00', 2),
(95, 22, 3, 'Óculos de Sol Oakley', '654-2190-0', 'Os Óculos Oakley Holbrook Especial Masculino são presença garantida nos looks de homens que procuram um acessório resistente e moderno. O modelo oferece proteção UV e alinhamento óptico preciso.', '410,00', 5),
(96, 22, 3, 'Óculos de Sol Oakley', 'OO9316-09', 'Design Oakley Thinlink: uma continuação da popular série link, produzido com muito estilo e performance. Possui formato retangular com a versatilidade do design das lentes em meio aro. Sua estrutura se adapta perfeitamente ao rosto, além de agregar muito\r\n\r\n', '700,00', 1),
(97, 23, 3, 'Óculos de Sol Prada', '17WS 1AB5S', 'Os óculos Prada são entre os mais brilhantes, coloridos e animados Muitas vezes antecipam e influenciam as tendências futuras: desde design originais enriquecidos com detalhes preciosos ate modelos vintage em diferentes tons de cores Uma coleção imperdível para aqueles que querem mostrar uma elegância aristocrática.', '1750,00', 3),
(98, 23, 3, 'Óculos de Sol Prada', '17WS 1AB5S', 'Os óculos Prada são entre os mais brilhantes, coloridos e animados Muitas vezes antecipam e influenciam as tendências futuras: desde design originais enriquecidos com detalhes preciosos ate modelos vintage em diferentes tons de cores Uma coleção imperdível para aqueles que querem mostrar uma elegância aristocrática', '1860,00', 4),
(99, 23, 3, 'Óculos de Sol Prada', 'SPS51V_FDG', 'Óculos de sol em metal com contorno ligeiramente curvo caracterizado por lentes geométricas e ponte dupla desportiva que lhes conferem um apelo contemporâneo. Logo Prada Linea Rossa.', '1000,00', 7),
(100, 23, 3, 'Óculos de Sol Prada', 'SPS 03Q', 'Os óculos Prada são entre os mais brilhantes, coloridos e animados Muitas vezes antecipam e influenciam as tendências futuras: desde design originais enriquecidos com detalhes preciosos ate modelos vintage em diferentes tons de cores Uma coleção imperdível para aqueles que querem mostrar uma elegância aristocrática', '1360,00', 3),
(101, 21, 1, 'Óculos de Grau Nike', '   7230 01', 'Óculos de grau Nike 7230 é um modelo unissex, com armação quadrada produzida com a fronte em acetato preto e hastes fume.</br>\r\nComercializamos online somente a armação, sem lentes de prescrição.', '430,00', 2),
(102, 21, 1, 'Óculos de Grau Nike', '7110 350', 'O óculos de sol NIKE ESSENTIAL SPREE R EV1004 117 é produzido em plástico injetado, mais leve que acetato e resistente a quedas e riscos. É confortável por não possuir ponteiras nas hastes e plaquetas em torno do nariz.\r\n\r\n', '550,00', 4),
(103, 21, 1, 'Óculos de Grau Nike', '7238 405 5', 'O óculos de grau Nike fabricado em acetato que deixa a sua peça mais resistente mantendo extrema leveza, tem sua frontal de formato quadrado na cor azul marinho fosco e suas hastes com o mesmo material e destaca trás cores como o azul marinho, cinza grafite e azul claro com o logo da marca também em azul claro e despertam o bom gosto de homens que buscam sofisticação e qualidade aliadas em um único produto.</br>\r\nEssa armação de grau masculino versão quadrada destaca um óculos jovial e veste principalmente em rostos por seu tamanho 54 médio, perfeito para homens que amam a marca e de um bom esporte.', '610,00', 3),
(104, 21, 1, 'Óculos de Grau Nike', '7095 001 5', 'O óculos Nike é um lançamento da marca, um modelo esportivo que tem muito mais que design, ele tem tecnologia que garante conforto e melhor performance para a pratica de esportes e para o dia a dia. Fabricado em grilamid, um material feito à base de plástico injetado que deixa a sua peça mais resistente mantendo extrema leveza. O óculos Nike 7095 001 é confeccionado na cor preto fosco com verde fluorescente nas hastes e logo de metal destacando ainda mais o rosto dos amantes da marca e ainda pode receber todos os tipos de lentes, e por ter aro fechado, deixa o visual com ainda mais personalidade.', '350,00', 7),
(105, 22, 1, 'Óculos de Grau Oakley', 'OX5113', 'Desde 1975, a Oakley desenvolve produtos icônicos em várias categorias. A equipe de design óptico da Oakley está baseada, guiada e influenciada pelo local onde a empresa começou, nas montanhas, nas trilhas, nas estradas e nas praias do sul da Califórnia. Todos os óculos de sol, óculos de grau e esportivos de proteção Oakley são projetados por uma equipe de designers, engenheiros, inventores e cientistas baseados na Califórnia. Escolha seu modelo e entre para a elite Oakley!', '580,00', 5),
(106, 22, 1, 'Óculos de Grau Oakley', 'OX8156 01-', 'Óculos de Grau Oakley Holbrook RX OX8156</br>\r\nO famoso Oakley Holbrook agora adaptado para a versão de grau.</br>\r\nCom um estilo atraente em uma armação robusta e funcional, os óculos de grau Oakley Holbrook XR contam com hastes AceFit para proporcionar um ajuste personalizado.', '660,00', 6),
(107, 22, 1, 'Óculos de Sol Oakley', 'OX3128 ', 'Desde 1975, a Oakley desenvolve produtos icônicos em várias categorias. A equipe de design óptico da Oakley está baseada, guiada e influenciada pelo local onde a empresa começou, nas montanhas, nas trilhas, nas estradas e nas praias do sul da Califórnia. Todos os óculos de sol, óculos de grau e esportivos de proteção Oakley são projetados por uma equipe de designers, engenheiros, inventores e cientistas baseados na Califórnia. Escolha seu modelo e entre para a elite Oakley!', '450,00', 4),
(108, 22, 1, 'Óculos de Grau Oakley', 'OX8031', 'Experimente os Óculos de Grau Oakley sem ter que ir a loja com o nosso VIRTUAL TRYON que permite que vocé experimente nossa coleção de óculos digitalmente. Habilmente trabalhada de Customizável , os óculos de grau Satin Black complementam uma grande variedade de formatos de rostos e combinam com diversos looks. ', '130,00', 7),
(109, 23, 1, 'Óculos de Grau Prada', ' PS 50GV 5', 'A Prada Linea Rossa é a extensão masculina da marca voltada a um segmento mais ativo e de lazer. Sua coleção active e leisure é inspirada no mundo dos esportes, trazendo um estilo casual para uso no dia a dia. Estilo elevado com conforto absoluto e visual diferenciados. Técnica artesanal de alta qualidade combinada com processos de fabricação avançados.', '1000,00', 7),
(110, 23, 1, 'Óculos de Grau Prada', '06R 1BO-1O', 'A Prada Linea Rossa é a extensão masculina da marca voltada a um segmento mais ativo e de lazer. Sua coleção active e leisure é inspirada no mundo dos esportes, trazendo um estilo casual para uso no dia a dia. Estilo elevado com conforto absoluto e visual diferenciados. Técnica artesanal de alta qualidade combinada com processos de fabricação avançados.', '1250,00', 4),
(111, 23, 1, 'Óculos de Grau Prada', 'VPR 19W 1A', 'ÓCULOS PRADA NA COR PRETO BRILHO E HASTES NA COR PRETO MESCLADA BRILHO.', '1300,00', 6),
(112, 23, 1, 'Óculos de Grau Prada', 'PR01WV01G1', 'Desde 1913, Prada é sinônimo de vanguarda. Seu universo intelectual combina o conceito, a estrutura e a imagem através de códigos que vão além das tendências. Sua moda transcende os produtos, traduzindo a conceitualidade em um universo que se tornou referência para quem ousa desafiar o convencional com foco na experiência.', '1200,00', 3),
(113, 24, 1, 'Óculos de Grau Ray Ban', 'RB5154', 'Os óculos de grau Clubmaster da Ray-Ban túm um estilo atemporal e retro. Inspirados na década de ‘50, o design inconfundível dos Clubmaster Optics é o preferido pelos intelectuais que com suas ideias mudam o futuro.</br>\r\nEscolha o icônico design dos óculos de grau Clubmaster em uma ampla gama de armações. Ao usar os Clubmaster Optics, modelo Ray-Ban RB5154, irá deixar sua marca.', '790,00', 4),
(114, 24, 1, 'Óculos de Grau Ray Ban', 'RB7047', 'Eis as armações perfeitas para acompanhar você, direto de nossa coleção Active. As hastes largas trazem o icônico logo modelado em 3D são criadas para garantir conforto o dia todo. Mantenha a energia em alto nível com cores pop da armação e hastes brilhantes, divertidas e esportivas.', '290,00', 6),
(115, 24, 1, 'Óculos de Grau Ray Ban', 'RB5279', 'Veja com clareza graças a estas molduras coloridas e modernas. Em acetato, estes óculos tem um ar moderno e elegante, atualizado pelas combinações de cor verde/azul, rosa/marrom e bege/marrom.</br>\r\nCada cor combina perfeitamente com as dinâmicas hastes em metal prateado, para um look elegante que todos notarão. As lentes de grau tornarão esta armação a escolha perfeita.', '790,00', 3),
(116, 24, 1, 'Óculos de Grau Ray Ban', 'RB7151 ', 'Se você quer uma armação com a qualidade Ray-Ban e num modelo diferenciado que se destaca na multidão, conheça o óculos de grau Ray-Ban.</br>\r\nCom ponte em formato de buraco de fechadura, que distribui igualmente o peso da armação no rosto, essa armação oferece conforto para quem precisa de correção visual.', '650,00', 4),
(117, 2, 2, 'Óculos de Grau Carolina Herrera', 'VHE188', 'A coleção Carolina Herrera tem o estilo despreocupado de elegância moderna e cosmopolita. A estética universalmente reconhecida une os óculos de grau a todos os produtos CH, desde a moda aos perfumes, e é uma fonte de inspiração e segurança para as mulheres que procuram um estilo contemporâneo e distinto para expressar elegância, mas embelezadas por detalhes. Elementos icônicos da marca, como listras e logomania, tornam-se acabamentos que valorizam a grande variedade de formas, linhas e cores, dentre as quais se destaca o vermelho. Interpretações únicas e incomuns caracterizam os modelos dedicados a quem procura um estilo único, eclético e sofisticado.', '659,90', 20),
(125, 2, 2, 'Óculos de Grau Carolina Herrera', '   VHE814', 'Óculos de Grau Carolina Herrera VHE814 0700-54</br>\r\nProduto: Óculos De Grau</br>\r\nMarca: Carolina Herrera</br>\r\nMaterial Armação (Frontal): Acetato E Metal</br>\r\nMaterial Haste: Acetato</br>\r\nGênero: Feminino</br>\r\nEstilo Do Modelo: Quadrado</br>\r\nApoio Do Nariz: Sem Plaquetas</br>\r\nGarantia Do Fabricante: 1 Ano</br>\r\nComprimento Da Haste: 13.5</br>\r\nLargura Frontal: 13.5cm</br>\r\nPonte: 1.6cm</br>\r\nAltura Da Lente: 4.0cm</br>\r\nLargura Da Lente: 5.4cm</br>\r\nTamanho: 54cm</br>\r\nTipo De Lente: Comum</br>\r\nAcabamento Armação: Brilho</br>\r\nCor Da Armação: Preto</br>\r\nCor Da Lente: Demonstrativa</br>', '1064,90', 90),
(126, 2, 2, 'Óculos de Grau Carolina Herrera', 'CH683', 'Características Principais:</br>\r\n- Óculos receituário Carolina Herrera</br>\r\n- Acompanha estojo Carolina Herrera + Flanela</br>\r\n- Material da Armação: Acetato</br>\r\n</br>\r\nMedidas:</br>\r\n- Total Frontal 134 mm</br>\r\n- Altura da Lente: 40 mm</br>\r\n- Comprimento da Lente: 53 mm</br>\r\n- Ponte: 15 mm</br>\r\n- Haste: 14 mm.', '750,00', 30),
(127, 2, 2, 'Óculos de Grau Carolina Herrera', '    CH683', 'Características Principais:</br>\r\n- Óculos receituário Carolina Herrera</br>\r\n- Acompanha estojo Carolina Herrera + Flanela</br>\r\n- Material da Armação: Acetato</br></br>\r\n\r\nMedidas:</br>\r\n- Total Frontal 134 mm</br>\r\n- Altura da Lente: 40 mm</br>\r\n- Comprimento da Lente: 53 mm</br>\r\n- Ponte: 15 mm</br>\r\n- Haste: 14 mm.', '730,50', 40),
(128, 5, 2, 'ÓCULOS DOLCE & GABBANA', 'DG5025', 'A coleção de óculos  Dolce & Gabbana é marcada pelo DNA e a tradição da marca. Criada para diferenciar seus consumidores, os óculos de sol D&G são um acessório exclusivo e perfeito. Vinte anos de design fizeram Domenico Dolce e Stefano Gabbana tão famosos quanto as estrelas que usam seus modelos.', '1380,00', 30),
(129, 5, 2, 'ÓCULOS DOLCE & GABBANA', 'DG3325', 'A Sicà­lia representa a origem da marca, demonstrado pela reinterpretação dos códigos da tradição italiana, da arte e da cultura mediterrâneas. O DNA e a tradição são dois elementos fortes da marca Dolce&Gabbana, ambos reconhecidos de forma absoluta e sempre presentes em todas as ações da marca. A essência do trabalho artesanal de todas as coleções de óculos de sol e óculos de grau é destacada por meio de uma atenção meticulosa aos detalhes e acabamentos feitos à  mão em todos os itens.', '1519,90', 50),
(130, 5, 2, 'ÓCULOS DOLCE & GABBANA', 'DG1298', 'Dolce & Gabbana é uma marca italiana criada pelos estilistas Domenico Dolce e Stefano Gabbana. A marca se inspira nas raízes e nos valores autênticos de seu próprio DNA: a Sicà­lia, a sensualidade e a habilidade artística. A essência de Dolce & Gabbana reside em suas características contrastantes e complementares. A linha eyewear caracteriza-se por formas glamorosas, não convencionais, materiais de prestígio e detalhes suntuosos.', '1099,00', 50),
(131, 5, 2, 'ÓCULOS DOLCE & GABBANA', 'DG5076 331', 'Com os Óculos de Grau Dolce & Gabbana DG5076 , a correção da visão não é mais uma tarefa obrigatória, mas um acessório fashion a mais que vai transformar seu estilo e look. Cuidadosamente desenvolvido a partir de Plástico , a armação Transparent Graffiti vai ficar ótima em qualquer ocasião. Adicione lentes de prescrição RX que são feitas sob encomenda especialmente para você, sem complicações e a preços imbatíveis.</br>\r\nMarca: Dolce & Gabbana</br>\r\nGênero: Women</br>\r\nAno: 2022</br>\r\nCor da Armação: Transparent Graffiti</br>\r\nFormato da Armação: Borboleta</br>\r\nEstilo da Armação: Aro Cheio</br>\r\nMaterial da Armação: Plástico</br>\r\nGrau da prescrição:: -7.00 ~ +7.00</br>\r\nMedida da DP:: 60-84mm</br>\r\nAdequação a lente progressiva: Sim</br>\r\nMaterial das Lentes: Customizável</br>', '1183,90', 90),
(132, 6, 2, 'Óculos Gucci', 'GG0026O', 'Com os Óculos de Grau Gucci GG0026O , a correção da visão não é mais uma tarefa obrigatória, mas um acessório fashion a mais que vai transformar seu estilo e look. Cuidadosamente desenvolvido a partir de Acetate , a armação Preto vai ficar ótima em qualquer ocasião. Marca: Gucci</br>\r\nGênero: Women</br>\r\nAno: 2017</br>\r\nCor da Armação: Preto</br>\r\nFormato da Armação: Cat Eye</br>\r\nEstilo da Armação: Aro Cheio</br>', '1160,00', 30),
(133, 6, 2, 'Óculos Gucci', 'GG0592O', 'Marca: Gucci</br>\r\nGênero: Women</br>\r\nAno: 2019</br>\r\nCor da Armação: Black/Gold</br>\r\nFormato da Armação: Oversized</br>\r\nEstilo da Armação: Aro Cheio</br>', '2550,00', 50),
(134, 6, 2, 'Óculos Gucci', 'GG0595', 'Fundada em Florença no ano de 1921, a grife italiano completará 100 anos em 2021. Ficou conhecida por suas malas de viagens, com alto padrão de qualidade feito por artesões nascidos na região da Toscana. Bolsas Gucci são objeto de desejo de mulheres no Brasil e no mundo inteiro, e a marca ainda conta com destaque para seus sapatos, cintos e óculos. Aqui, as óticas Paris Vision trás #domundopravoce a coleção de óculos de sol e óculos de grau da icônica marca italiana com muita elegância, luxo e glamour que definem a Gucci.', '2241,00', 30),
(135, 6, 2, 'Óculos Gucci', 'GG1070', 'O óculos Gucci modelo GG1070 é inovador e proporciona conforto e beleza', '975,00', 30),
(136, 12, 2, 'Óculos VERSACE', 'VE3291', 'Marca: VERSACE</br>\r\n\r\nModelo: 3291</br>\r\n\r\nClassificação: Receituário</br>\r\n\r\nMaterial: ACETATO</br>\r\n\r\nCor: NUDE</br>\r\n\r\nGênero: FEMININO</br>\r\n\r\nArmação: ARO TOTAL</br>\r\n\r\nTamanho: 51</br>\r\n\r\nPonte: 18</br>\r\n\r\nHaste: 140</br>', '879,90', 10),
(137, 12, 2, 'Óculos VERSACE', 'VE3298', 'Marca: Versace</br>\r\n\r\nModelo: 3298B</br>\r\n\r\nClassificação: Receituário</br>\r\n\r\nMaterial:  Acetato</br>\r\n\r\nCor: Rose</br>\r\n\r\nGênero: Feminino</br>\r\n\r\nArmação: Aro Total</br>\r\n\r\nTamanho: 55</br>\r\n\r\nPonte: 17</br>\r\n\r\nHaste: 140</br>', '1122,22', 50),
(138, 12, 2, 'Óculos VERSACE', 'VE3271 388', 'Vermelho transparente</br>\r\nMaterial da armação:\r\nMetal, Plástico', '1200,00', 10),
(139, 12, 2, 'Óculos VERSACE', 'VE3254', 'Os Óculos de Grau Feminino Versace VE3254 5215-54 são a última tendência de moda com design diferenciado. No formato gatinho em acetato e metal, na cor nude translúcido e rosé com acabamento brilho, torna essa peça incrível, sofisticada e moderna, perfeita para compor estilos diferenciados e únicos. Versace é uma grife italiana mundialmente conhecida pela alfaiataria de alto luxo e glamour, com acessórios e peças exclusivas feitas à  mão com qualidade impecável, design elegante e sofisticado. Veja o mundo através dos olhos de Versace.', '1700,00', 70),
(140, 3, 4, 'ÓCULOS DE SOL FEMININO CHILLI BEANS', 'OC.CL.3462', 'Óculos de Sol Feminino Chilli Beans P1 Trend Redondo Roxo produzido em policarbonato leve com aspecto de brilho.</br>\r\nAs lentes possuem proteção 100% UVA e UVB, protegendo seus olhos dos raios nocivos do sol reduzindo o risco de desenvolvimento das doenças oculares. Ponte em \"U\" com apoio nasal embutido. Hastes com detalhe em metal possuem assinatura Chilli Beans.', '259,99', 30),
(141, 3, 4, 'ÓCULOS DE SOL FEMININO CHILLI BEANS', 'OC.MT.3249', 'Óculos de Sol Unissex Chilli Beans Aviador Clássico Flap Rosé, feito em policarbonato + aço inoxidável de alta durabilidade. O shape aviador é um clássico e super fácil de combinar no dia a dia.</br>\r\nLentes com detalhe de flap lateral possuem proteção 100% contra raios UVA e UVB, protegendo seus olhos dos raios nocivos do sol reduzindo o risco de desenvolvimento das doenças oculares. Ponte dupla em liga metálica fina com apoio nasal em silicone e hastes com assinatura da marca mais apimentada, Chilli Beans.', '279,99', 50),
(142, 3, 4, 'ÓCULOS DE SOL FEMININO LOLLAPALOOZA ANOS 2000 ', 'OC.MT.3387', 'Coleção: Lollapalooza Brasil</br>\r\n\r\nO LOLLAPALOOZA Brasil 2022 vem aí recheado de atrações nacionais e internacionais que vão agitar São Paulo.</br>\r\n\r\nÓculos de Sol Feminino Lollapalooza Anos 2000 Hexagonal Marrom com shape super trend, que vem sendo revisitado, inspirado nos anos 2000 com detalhe de flap aberto na lateral. As lentes possuem proteção 100% contra raios UVA e UVB, protegendo seus olhos dos raios nocivos do sol reduzindo o risco de desenvolvimento das doenças oculares. Ponte em liga metálica com apoio nasal em silicone. As hastes sinuosas ganharam assinatura Chilli Beans e nas ponteiras inserimos uma estampa tribal.\r\n', '310,90', 49),
(143, 3, 4, 'ÓCULOS DE SOL FEMININO DC COMICS BATMAN', 'OC.CL.3634', 'Coleção: DC Comics</br>\r\n\r\nA Chilli Beans mais uma vez traz uma coleção pra lá de heroica: coleção DC Chilli Beans!</br>\r\n\r\nA coleção também traz um modelo feminino com o personagem Batman, visto que ele também é adorado pelas mulheres. Estes Óculos de Sol Feminino DC Comics Batman Degradê Preto, acompanha lentes com proteção 100% contra raios UVA e UVB, protegendo seus olhos nocivos do sol reduzindo o risco de desenvolvimento das doenças oculares. Com shape quadrado e clássico, traz curvas inspiradas nas asas dos morcegos, tendo os vértices mais evidentes. As hastes possuem o logo icônico do personagem seguida por uma divisão bem fina de dois aros representando os cabos que o Batman usa para escalar prédios e escapar de qualquer situação de perigo.', '299,99', 80),
(144, 3, 4, 'ÓCULOS DE SOL FEMININO DC COMICS BATMAN', 'OC.CL.3634', 'Coleção: DC Comics</br>\r\n\r\nA Chilli Beans mais uma vez traz uma coleção pra lá de heroica: coleção DC Chilli Beans!</br>\r\n\r\nA coleção também traz um modelo feminino com o personagem Batman, visto que ele também é adorado pelas mulheres. Estes Óculos de Sol Feminino DC Comics Batman Degradê Preto, acompanha lentes com proteção 100% contra raios UVA e UVB, protegendo seus olhos nocivos do sol reduzindo o risco de desenvolvimento das doenças oculares. Com shape quadrado e clássico, traz curvas inspiradas nas asas dos morcegos, tendo os vértices mais evidentes. As hastes possuem o logo icônico do personagem seguida por uma divisão bem fina de dois aros representando os cabos que o Batman usa para escalar prédios e escapar de qualquer situação de perigo.', '299,99', 80),
(145, 4, 4, 'Óculos de Sol Colcci Noa', 'C0185B7034', 'Marca: Colcci</br>\r\nModelo: C0185 B70 34</br>\r\nLinha: Noa</br>\r\nGênero: Unissex</br>\r\nTamanho: Adulto</br>\r\nFormato: Arredondado</br></br>\r\n\r\nARMAÇÃO</br>\r\nFrente: Poliamida</br>\r\nHaste: Metal</br>\r\nNose: Anatômico</br>\r\nDobradiça: Metal</br>\r\nPonteira: Poliamida</br>\r\nCor: Frontal Nude (marrom claro), Haste Dourada e Ponteira Nude (marrom claro)\r\nAcabamento: Polido</br></br>\r\nO óculos de sol Colcci Noa possui design autêntico e irreverente, muita personalidade e conforto devido seu material leve e seu caimento anatômico. O modelo é unissex, pode ser usado por homens ou mulheres e fica perfeito para rosto médio. No formato redondo que deixa o visual jovem e charmoso, com recortes retos na parte superior da armação e hastes em metal.', '499,99', 30),
(146, 4, 4, 'Óculos de Sol Colcci Jan Is', 'C0029C1433', 'Dê um up no visual com o Óculos De Sol Colcci. Com design moderno, sua armação é extremamente leve e confortável, além de proporcionar estética e praticidade simultânea é um acessório atemporal e cheio de estilo, com pegada no mood booster é um ótimo aliado para te acompanhar na composição de seus looks!.</br>\r\nNome: Óculos de Sol Colcci Jan Is C0029C1433 Feminino\r\nGênero: Feminino</br>\r\nDepartamento BS: Acessórios</br>\r\nIndicado para: Dia a Dia</br>\r\nOcasião: Dia a Dia</br>\r\nLentes: Proteção UVA/UVB</br>\r\nComposição Lentes: Policarbonato</br>\r\nComposição Armação: 80% policarbonato/ 20 % metal</br>\r\nFrontal: 140 mm</br>\r\nHorizontal: 63 mm</br>', '429,99', 60),
(147, 4, 4, 'Óculos de Sol Colcci Feminino Aretha', 'C0154F0834', 'Os óculos Colcci traduzem o estilo fashionista da marca, com design moderno e elegante. O solar Aretha foi desenhado pensando nas mulheres que buscam por acessórios atemporal e sofisticados. Com frontal maior, design gateado e linhas retas, esse estilo é o preferido entre as mulheres. Os detalhes desse solar ficam por conta das hastes e ponte produzidos em fino metal dourado fosco e frente em preto com demi branco brilho. </br>\r\nMarca: Colcci </br>\r\nModelo: Aretha </br>\r\nGênero: Feminino </br>\r\nFormato: Gatinho </br>\r\nMaterial da Armação: Poliamida</br>\r\nMaterial da Lente: Policarbonato</br>\r\nCor da Armação: Marrom</br>\r\nCor da Lente: Marrom </br>\r\nPolarizado: Não</br>\r\nTipo da Lente: Degradê</br>\r\n Largura da Lente: 5,2 cm</br>\r\nAltura da Lente: 4,5 cm</br>\r\nComprimento da Haste: 13,8 cm</br>\r\nMedida da Ponte: 2 cm </br>', '589,99', 80),
(148, 4, 4, 'Óculos de Sol Colcci Feminino Kim Bordá', 'C0165C8633', 'O modelo Kim ganha sua versão solar. Com um shape levemente arredondado e gateado, esta armação tem um ar retro. Sua estrutura, mesmo grande, é leve e superconfortável graças à  poliamida, material usado em sua fabricação. </br>\r\nMarca: Colcci </br>\r\nModelo: Kim </br>\r\nGênero: Feminino </br>\r\nFormato: Redondo </br>\r\nMaterial da Armação: Poliamida </br>\r\nMaterial da Lente: Policarbonato </br>\r\nCor da Armação: Bordá </br>\r\nCor da Lente: Cinza </br>\r\nPolarizado: Não </br>\r\nTipo da Lente: Degradê </br>\r\nLargura da Lente: 56 </br>\r\nAltura da Lente: 45 </br>\r\nComprimento da Haste: 138 </br>\r\nMedida da Ponte: 20 </br>\r\nItens inclusos ao produto: Estojo para armazenar o óculos; Flanela; Certificado de garantia, que garante a autenticidade e originalidade do produto; Nota fiscal de compra. Os óculos Colcci Eyewear possuem garantia de até 6 meses contra defeitos de fabricação. Com lentes que filtram 100% os raios UV.</br>\r\n\r\nNome: Óculos de Sol Colcci Feminino Kim Bordá C0165C8633</br>\r\nGênero: Feminino', '469,90', 90),
(149, 10, 4, 'ÓCULOS DE SOL POLAROID', 'PLD4083/F/', 'Polaroid é jovialidade e otimismo graças a estilos contemporâneos e a combinações cromáticas divertidas que preenchem os óculos da marca.</br>\r\n\r\nEstilo, cor e tecnologia são as três palavras-chave da Polaroid, cujo objetivo é proporcionar beleza ao rosto de todos e proteger contra os raios UV graças à s lentes polarizadas nos modelos solares.</br>\r\n\r\n \r\n\r\nMarca: Polaroid</br>\r\nModelo: PLD 4083/F/S</br>\r\nColeção: Fashion</br>\r\nCor: Preto</br>\r\nMaterial: Acetato</br>\r\nFormato: Gatinho</br>\r\nGênero: Feminino</br>\r\nTamanho: 56mm</br>\r\nTamanho da Haste: 145mm</br>', '260,90', 30),
(150, 10, 4, 'Óculos de Sol Polaroid', 'PLD2069/F', 'Marca: Polaroid</br>\r\nModelo: PLD2069/F/S/X 6LB5X</br>\r\nPolarizada: Sim</br>\r\nMaterial da Armação: Metal</br>\r\nMaterial da Lente: Policarbonato</br>\r\nCor da Armação: Prata</br>\r\nCor da Lente: Azul</br>\r\nApoio Nasal (Plaquetas): Sim</br>\r\nMedida da Haste: 145 mm</br>\r\nMedida da Lente: 61 mm</br>\r\nMedida da Ponte: 17 mm</br>\r\nmedida da lente na vertical:56 mm', '414,90', 60),
(151, 10, 4, 'Óculos de Sol Polaroid Polarizado', 'PLD4067/S', 'Os Óculos de Sol Feminino Polaroid Polarizado PLD 4067/S 086/LA-51 são peças únicas e incríveis que vão conquistar todos os olhares por onde passar. Um clássico sofisticado ideal para qualquer ocasião e que completa o seu visual. Modelo gatinho clássico, feito em acetato e metal leve e confortável, na cor marrom tartaruga brilho, hastes dourada brilho e lente degradê marrom. </br>Conhecida mundialmente a Polaroid Polarizado e Eyewear foi a empresa pioneira no desenvolvimento das lente polarizadas a mais de 90 anos. à‰ especialista no desenvolvimento de óculos de sol e grau seguindo as últimas tendências da moda, sempre muita qualidade e estilo. O mais importante é o espírito criativo e da Polaroid Polarizado Eyewear e que atualmente continua a ser fonte de inspiração.', '399,00', 55),
(152, 10, 4, 'Óculos de Sol Feminino Polaroid', 'PLD4062/S', 'O excelente Óculos de Sol Polaroid PLD 4062/S/X Polarized lentes de Plástico , que proporcionarão proteção completa contra os raios UV e disponível em diversas cores.</br>\r\n\r\n\r\n\r\nCor do fabricante: 086</br>\r\n\r\nCor da lente : Marrom Sf Pz</br>\r\n\r\nTratamento da lente: Não</br>\r\n\r\nCom lente polarizada: Não</br>\r\nMaterial da armação: Acetato</br>\r\n\r\nà‰ esportivo: Não</br>\r\n\r\nCom proteção UV: Sim</br>\r\n\r\nForma da armação: Quadrado</br>\r\n\r\nModelo alfanúmerico: PLD 4062/S/X</br>\r\n\r\nIdade: Adulto', '428,90', 50),
(153, 13, 4, 'Óculos de Sol Gatinho em Acetato Tartaruga', 'OC00000306', 'Material: \r\n\r\nAcetato</br>\r\n\r\nCor: \r\n\r\nTartaruga</br>\r\n\r\nCor armação: \r\n\r\nTartaruga</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nMaterial da Armação: \r\n\r\nAcetato</br>\r\nProteção: \r\n\r\nUVA / UVB</br>\r\nLentes: \r\n\r\nMarrom</br>\r\nGarantia: \r\n\r\n3 Meses</br>\r\nLente: \r\n\r\n56mm</br>\r\nPonte: \r\n\r\n18mm</br>\r\nHaste: \r\n\r\n135mm</br>\r\nFormato de Armação: \r\n\r\nGatinho</br>\r\nÓculos de Sol Gatinho, confeccionado em acetato cor tartaruga valorizada pelo \"V\" da marca que cria um design exclusivo, hastes cor tartaruga e lentes marrons.', '400,00', 50),
(154, 13, 4, 'Óculos de Sol Gatinho em Acetato Marrom', 'OC00000321', 'Material: \r\n\r\nAcetato</br>\r\n\r\nCor: \r\n\r\nMarrom</br>\r\n\r\nCor armação: \r\n\r\nMarrom</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nMaterial da Armação: \r\n\r\nAcetato</br>\r\nProteção: \r\n\r\nUVA / UVB</br>\r\nGarantia: \r\n\r\n3 Meses</br>\r\nLente: \r\n\r\n56 mm</br>\r\nPonte: \r\n\r\n22 mm</br>\r\nHaste: \r\n\r\n140 mm</br>\r\nFormato de Armação: \r\n\r\nGatinho</br>\r\nÓculos de Sol Gatinho, confeccionado em acetato cor marrom valorizada pelo \"V\" da marca que cria um design exclusivo, hastes cor marrom e lentes marrom.', '390,90', 49),
(156, 13, 4, 'Óculos de Sol Quadrado em Acetato Marrom', 'OC00000175', 'Material: \r\n\r\nAcetato</br>\r\n\r\nCor: \r\n\r\nMarrom</br>\r\n\r\nCor armação: \r\n\r\nMarrom</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nMaterial da Armação: \r\n\r\nAcetato</br>\r\nProteção: \r\n\r\nUVA / UVB</br>\r\nLentes: \r\n\r\nMarrom</br>\r\nGarantia: \r\n\r\n3 Meses</br>\r\nLente: \r\n\r\n57 mm</br>\r\nPonte: \r\n\r\n14 mm</br>\r\nHaste: \r\n\r\n132 mm</br>\r\nFormato de Armação: \r\n\r\nQuadrado</br>\r\nÓculos de Sol Quadrado, confeccionado em acetato marrom, com lentes marrons.', '390,90', 50),
(157, 13, 4, 'Óculos de Sol Redondo em Acetato Bege', 'OC00000183', 'Material: \r\n\r\nAcetato</br>\r\n\r\nCor: \r\n\r\nBege</br>\r\n\r\nCor armação: \r\n\r\nBege</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nMaterial da Armação: \r\n\r\nAcetato</br>\r\nProteção: \r\n\r\nUVA / UVB</br>\r\nLentes: \r\n\r\nMarrom</br>\r\nGarantia: \r\n\r\n3 Meses</br>\r\nLente: \r\n\r\n52 mm</br>\r\nPonte: \r\n\r\n21 mm</br>\r\nHaste: \r\n\r\n135 mm</br>\r\nFormato de Armação: \r\n\r\nRedondo</br>\r\nÓculos de Sol Redondo, confeccionado em acetato bege, com lentes marrons.', '390,90', 50),
(158, 7, 6, 'Relógio Guess Feminino Aço Rosé', 'W1152L3 03', 'Cor da Pulseira: \r\n\r\nRosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nModelo: \r\n\r\nW1152L3</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n12 Meses</br>\r\nTamanho: \r\n\r\n32 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nMaterial da Pulseira: \r\n\r\nAço</br>\r\nA Guess oferece qualidade em relógios para homens e mulheres, combinando o prestigio da manufatura e o conhecimento inerente a Guess. Contando com materiais de qualidade, glamour e técnica das ultimas tendências de moda, a Guess estatiza sua marca em uma benemérita posição na relojoaria mundial. Buscando o fascínio do fashion para a exuberância da alta tecnologia.', '960,90', 50),
(159, 7, 6, 'Relógio Guess Feminino Aço Dourado', 'W1018L2 92', 'Cor da Pulseira: \r\n\r\nDourado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nDois botões de pressionar juntos para abrir automaticamente</br>\r\nModelo: \r\n\r\nW1018L2 92671LPGSDA2</br>\r\nMecanismo: \r\n\r\nAnalógico</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nSim</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n12 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n40 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nBranco</br>\r\n\r\nCor da Caixa: \r\n\r\nDourado</br>\r\n\r\nEspessura da Caixa: \r\n\r\n11 mm</br>\r\nMaterial da Pulseira: \r\n\r\nAço</br>\r\nA Guess oferece qualidade em relógios para homens e mulheres, combinando o prestigio da manufatura e o conhecimento inerente a Guess. Contando com materiais de qualidade, glamour e técnica das ultimas tendências de moda, a Guess estatiza sua marca em uma benemérita posição na relojoaria mundial. Buscando o fascínio do fashion para a exuberância da alta tecnologia.', '750,49', 50),
(160, 7, 6, 'Relógio Guess Feminino Aço Rosé', 'W1228L3 03', 'Cor da Pulseira: Rosé <br>\r\n\r\nSugestão: Para ela <br>\r\n\r\nModelo: W1228L3 <br>\r\nMecanismo: Quartzo <br>\r\nModelo caixa: Redonda<br>\r\nDatador: Não <br>\r\nCronógrafo: Não <br>\r\nGarantia: 12 Meses <br>\r\nTamanho: 35 mm <br>\r\nMaterial vidro: Cristal Mineral <br>\r\nMaterial da Pulseira: Aço <br>\r\nA Guess oferece qualidade em relógios para homens e mulheres, combinando o prestigio da manufatura e o conhecimento inerente a Guess. Contando com materiais de qualidade, glamour e técnica das ultimas tendências de moda, a Guess estatiza sua marca em uma benemérita posição na relojoaria mundial. Buscando o fascí­nio do fashion para a exuberância da alta tecnologia.', '1190,90', 50),
(161, 7, 6, 'Relógio Guess Feminino Aço Dourado ', 'GW0106L2', 'Cor da Pulseira: \r\n\r\nDourado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nModelo: \r\n\r\nGW0106L2</br>\r\nMecanismo: \r\n\r\nAnalógico</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n12 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n28 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nDourado</br>\r\n\r\nCor da Caixa: \r\n\r\nDourado</br>\r\n\r\nMaterial da Pulseira: \r\n\r\nAço</br>\r\nA Guess oferece qualidade em relógios para homens e mulheres, combinando o prestigio da manufatura e o conhecimento inerente a Guess. Contando com materiais de qualidade, glamour e técnica das ultimas tendências de moda, a Guess estatiza sua marca em uma benemérita posição na relojoaria mundial. Buscando o fascínio do fashion para a exuberância da alta tecnologia.', '1150,00', 50),
(162, 7, 6, 'Relógio Feminino Analógico Prata Guess', 'GW0298L1', 'Moderno e autentico como sempre, a Guess oferece o melhor dos seus relógios para o visual que você sempre buscou. O look com acessório certo está aqui. Os relógios Guess não é apenas um acessório qualquer, ele carrega funções que completam seu dia, além de conforto e visual que você precisa para estar na moda.</br>\r\n\r\nNome: Relógio Feminino Analógico Prata Guess - GW0298L1</br>\r\nGênero: Feminino</br>\r\nIndicado para: Dia a Dia</br>', '1590,90', 50),
(163, 7, 6, 'Relógio Guess Feminino Rosé', 'GW0357L3', 'Características:</br>\r\n\r\nDiâmetro da caixa: 36 mm</br>\r\n\r\nMaterial da correia: Couro</br>\r\n\r\nMaterial da caixa: Aço inoxidável</br>\r\n\r\nDisplay: Analógico</br>\r\n\r\nVidro: Cristal mineral</br>\r\n', '990,00', 50),
(164, 8, 6, 'Relógio Lacoste Feminino Couro Bege', '2001141', 'Cor da Pulseira: \r\n\r\nBege</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nFecho: \r\n\r\nFivela</br>\r\nModelo: \r\n\r\n2001141</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n32 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nRosé</br>\r\nEspessura da Caixa: \r\n\r\n8.4 mm</br>\r\nMaterial da Pulseira: \r\n\r\nCouro</br>\r\n', '750,00', 50),
(165, 8, 6, 'Relógio Lacoste Feminino Couro Preto ', '2001139', 'Cor da Pulseira: Preto</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nFivela</br>\r\nModelo: \r\n\r\n2001139</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n32 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nBranco</br>\r\n\r\nEspessura da Caixa: \r\n\r\n8.4 mm</br>\r\nMaterial da Pulseira: \r\n\r\nCouro', '850,00', 50),
(166, 8, 6, 'Relógio Lacoste Feminino Aço Rosé', '2001172 ', 'Cor da Pulseira: \r\n\r\nRosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nBotões de pressionar juntos para abrir automaticamente</br>\r\nModelo: \r\n\r\n2001172</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\nTamanho: \r\n\r\n36 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nRosé</br>\r\n\r\nCor da Caixa: \r\n\r\nRosé</br>\r\n\r\nEspessura da Caixa: \r\n\r\n7.9 mm</br>\r\nMaterial da Pulseira: \r\n\r\nAço', '890,90', 50),
(167, 8, 6, 'Relógio Lacoste Feminino Borracha Branca', '2001023 ', 'Cor da Pulseira: \r\n\r\nBranco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nModelo: \r\n\r\n2001023</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nSim</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nTamanho: \r\n\r\n38 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nMaterial da Pulseira: \r\n\r\nBorracha\r\n', '690,90', 50),
(168, 8, 6, 'Relógio Lacoste Feminino Aço Rosé', '2001193', 'Cor da Pulseira: \r\n\r\nRosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nAbertura deslizante</br>\r\nModelo: \r\n\r\n2001193</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n38 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nCinza</br>\r\n\r\nCor da Caixa: \r\n\r\nRosé</br>\r\n\r\nEspessura da Caixa: \r\n\r\n8 mm</br>\r\nMaterial da Pulseira: \r\n\r\nAço', '870,90', 50),
(169, 8, 6, 'Relógio Lacoste Feminino Couro Preto ', '2001041 03', 'Cor da Pulseira: Preto\r\n</br>Sugestão: Para ela\r\n</br>Modelo: 2001041\r\n</br>Mecanismo: \r\n\r\nQuartzo\r\n</br>Modelo caixa: \r\n\r\nRedonda\r\n</br>Datador: \r\n\r\nNão\r\n</br>Cronógrafo: \r\n\r\nNão\r\n</br>Garantia: \r\n\r\n24 Meses\r\n</br>Tamanho: \r\n\r\n38 mm\r\n</br>Material vidro: \r\n\r\nCristal Mineral\r\n</br>Material da Pulseira: \r\n\r\nCouro', '850,90', 50),
(170, 9, 6, 'Relógio Olivia Burton Feminino Couro Branco', 'OB16US47', 'Cor da Pulseira: \r\nBranco</br>\r\nSugestão: \r\n\r\nPara ela</br>\r\nModelo: \r\n\r\nOB16US47</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n38 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nRosé</br>\r\n\r\nMaterial da Pulseira: \r\n\r\nCouro</br>\r\nOlivia Burton é uma marca inglesa de acessórios fundada pelas melhores amigas Jemma e Lessa. A dupla se conheceu no primeiro dia do London College of Fashion, onde se conectaram devido ao amor por design, uma paixão que fez com que elas começassem seu próprio negocio. Desenhados a mão, fazem alusão a natureza e cada detalhe é feito com perfeição.', '690,90', 50),
(171, 9, 6, 'Relógio Olivia Burton Feminino Aço ', 'OB16GD64', 'Cor da Pulseira: \r\n\r\nPrateado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nModelo: \r\n\r\nOB16GD64</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nTamanho: \r\n\r\n38 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nEspessura da Caixa: \r\n\r\n9.5 mm</br>\r\nMaterial da Pulseira: \r\n\r\nAço</br>\r\nOlivia Burton é uma marca inglesa de acessórios fundada pelas melhores amigas Jemma e Lessa. A dupla se conheceu no primeiro dia do London College of Fashion, onde se conectaram devido ao amor por design, uma paixão que fez com que elas começassem seu próprio negócio. Desenhados a mão, fazem alusão a natureza e cada detalhe é feito com perfeição.', '910,00', 50),
(172, 9, 6, 'Relógio Olivia Burton Feminino Couro Azul', '    OB16EG', 'Cor da Pulseira: \r\n\r\nAzul</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nModelo: \r\n\r\nOB16EG132</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nTamanho: \r\n\r\n34 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nEspessura da Caixa: \r\n\r\n8,1 mm</br>\r\nMaterial da Pulseira: \r\n\r\nCouro</br>\r\nOlivia Burton é uma marca inglesa de acessórios fundada pelas melhores amigas Jemma e Lessa. A dupla se conheceu no primeiro dia do London College of Fashion, onde se conectaram devido ao amor por design, uma paixão que fez com que elas começassem seu próprio negócio. Desenhados a mão, fazem alusão a natureza e cada detalhe é feito com perfeição.', '750,90', 50),
(173, 9, 6, 'Relógio Olivia Burton Feminino Couro Blush', '       OB1', 'Cor da Pulseira: \r\n\r\nBlush\r\n\r\nSugestão: \r\n\r\nPara ela\r\n\r\nFecho: \r\n\r\nFivela\r\nModelo: \r\n\r\nOB16MD100\r\nMecanismo: \r\n\r\nQuartzo\r\nModelo caixa: \r\n\r\nRedonda\r\nDatador: \r\n\r\nNão\r\nCronógrafo: \r\n\r\nNão\r\nGarantia: \r\n\r\n24 Meses\r\nMaterial da Caixa: \r\n\r\nAço\r\n\r\nTamanho: \r\n\r\n30 mm\r\nMaterial vidro: \r\n\r\nCristal Mineral\r\nCor Mostrador: \r\n\r\nMadrepérola\r\n\r\nCor da Caixa: \r\n\r\nPrateado\r\n\r\nEspessura da Caixa: \r\n\r\n7.90 mm\r\nMaterial da Pulseira: \r\n\r\nCouro\r\nOlivia Burton é uma marca inglesa de acessórios fundada pelas melhores amigas Jemma e Lessa. A dupla se conheceu no primeiro dia do London College of Fashion, onde se conectaram devido ao amor por design, uma paixão que fez com que elas começassem seu próprio negocio. Desenhados a mão, fazem alusão a natureza e cada detalhe é feito com perfeição.', '810,90', 50),
(174, 9, 6, 'Relógio Olivia Burton Feminino Couro Preto', 'OB16WG74', 'Cor da Pulseira: \r\n\r\nPreto</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nFivela</br>\r\nModelo: \r\n\r\nOB16WG74</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n34 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nFlorido</br>\r\n\r\nEspessura da Caixa: \r\n\r\n8,1 mm</br>\r\nMaterial da Pulseira: \r\n\r\nCouro</br>\r\nOlivia Burton é uma marca inglesa de acessórios fundada pelas melhores amigas Jemma e Lessa. A dupla se conheceu no primeiro dia do London College of Fashion, onde se conectaram devido ao amor por design, uma paixão que fez com que elas começassem seu próprio negocio. Desenhados a mão, fazem alusão a natureza e cada detalhe é feito com perfeição.', '690,90', 40);
INSERT INTO `tb_produto` (`COD_PRODUTO`, `MARCA`, `CATEGORIAS`, `NOME`, `MODELO`, `DESCRICAO`, `PRECO`, `ESTOQUE`) VALUES
(175, 9, 6, 'Relógio Olivia Burton Feminino Aço Prateado e Dourado', 'OB16MDW34 ', 'Cor da Pulseira: \r\n\r\nDourado, Prateado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nDois botões de pressionar para abrir automaticamente</br>\r\nModelo: \r\n\r\nOB16MDW34</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n30 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nBranco</br>\r\n\r\nCor da Caixa: \r\n\r\nPrateado</br>\r\n\r\nEspessura da Caixa: \r\n\r\n8.10 mm</br>\r\nMaterial da Pulseira: \r\n\r\nAço</br>\r\nOlivia Burton é uma marca inglesa de acessórios fundada pelas melhores amigas Jemma e Lessa. A dupla se conheceu no primeiro dia do London College of Fashion, onde se conectaram devido ao amor por design, uma paixão que fez com que elas começassem seu próprio negocio. Desenhados a mão, fazem alusão a natureza e cada detalhe é feito com perfeição.', '790,00', 50),
(176, 11, 6, 'Relógio Tommy Hilfiger Feminino Couro Cinza ', '1782131', 'Cor da Pulseira: \r\n\r\nCinza</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nModelo: \r\n\r\n1782131</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nSim</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nTamanho: \r\n\r\n38 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nEspessura da Caixa: \r\n\r\n7.9 mm</br>\r\nMaterial da Pulseira: \r\n\r\nCouro</br>\r\nTommy Hilfiger é uma marca de estilo de vida premium, vendida e adorada em mais de 95 países. Fundada em 1985 em Nova York, Tommy Hilfiger é uma marca global com um espírito americano. Tommy sempre foi inspirado pelo clássico Americano que pode ser notado no azul, vermelho e branco que predominam em todas as suas coleções. Ele deu ao mundo um estilo que estava faltando: Preppy com um twist. Tommy combina um estilo clássico com um toque moderno, inovador e vanguardista. Todos os seus produtos são de alta qualidade: vestuário, acessórios, fragrâncias e mobiliário. Esta tradição de elegância casual também se espelha nas criações de todas as coleções dos relógios que hoje são desenvolvidos sob um acordo de licenciamento exclusivo com o grupo Movado.\r\n', '750,50', 50),
(178, 11, 6, 'Relógio Tommy Hilfiger Feminino Aço Rosé ', '1782082', 'Cor da Pulseira: \r\n\r\nRosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nModelo: \r\n\r\n1782082</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nTamanho: \r\n\r\n38 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nEspessura da Caixa: \r\n\r\n8.5 mm</br>\r\nMaterial da Pulseira: \r\n\r\nAço</br>\r\n', '840,90', 50),
(179, 11, 6, 'Relógio Tommy Hilfiger Feminino Couro Cinza', '     17821', 'Cor da Pulseira: \r\n\r\nCinza</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nModelo: \r\n\r\n1782110</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nTamanho: \r\n\r\n38 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nEspessura da Caixa: \r\n\r\n6.2 mm</br>\r\nMaterial da Pulseira: \r\n\r\nCouro</br>', '650,49', 50),
(180, 11, 6, 'Relógio Tommy Hilfiger Feminino Aço', '     17823', 'Cor da Pulseira: \r\n\r\nPrateado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nAbertura deslizante</br>\r\nModelo: \r\n\r\n1782361</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n32 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nBranco</br>\r\n\r\nCor da Caixa: \r\n\r\nPrateado</br>\r\n\r\nEspessura da Caixa: \r\n\r\n7,8 mm</br>\r\nMaterial da Pulseira: \r\n\r\nAço', '650,00', 50),
(181, 11, 6, 'Relógio Tommy Hilfiger Feminino Aço', '1782401', 'Cor da Pulseira: \r\n\r\nPrateado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nDois botões de pressionar juntos para abrir automaticamente</br>\r\nModelo: \r\n\r\n1782401</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n36 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nPrateado</br>\r\n\r\nCor da Caixa: \r\n\r\nPrateado</br>\r\n\r\nEspessura da Caixa: \r\n\r\n8.25 mm</br>\r\nMaterial da Pulseira: \r\n\r\nAço', '950,00', 50),
(182, 11, 6, 'Relógio Tommy Hilfiger Feminino Couro Preto', '1782403', 'Cor da Pulseira: \r\n\r\nPreto</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nFecho: \r\n\r\nFivela</br>\r\nModelo: \r\n\r\n1782403</br>\r\nMecanismo: \r\n\r\nQuartzo</br>\r\nModelo caixa: \r\n\r\nRedonda</br>\r\nDatador: \r\n\r\nNão</br>\r\nCronógrafo: \r\n\r\nNão</br>\r\nGarantia: \r\n\r\n24 Meses</br>\r\nMaterial da Caixa: \r\n\r\nAço</br>\r\n\r\nTamanho: \r\n\r\n36 mm</br>\r\nMaterial vidro: \r\n\r\nCristal Mineral</br>\r\nCor Mostrador: \r\n\r\nPreto</br>\r\n\r\nCor da Caixa: \r\n\r\nDourado</br>\r\n\r\nEspessura da Caixa: \r\n\r\n8.25 mm</br>\r\nMaterial da Pulseira: \r\n\r\nCouro\r\n', '580,90', 50),
(183, 15, 9, 'Anel Pedras do Infinito de Os Vingadores da Marvel', '160779C01', 'Aproveite o poder das Pedras do Infinito com nosso Anel Pedras do Infinito de Os Vingadores da Marvel. Com equilíbrio perfeito, como tudo deve ser, nosso anel finalizado em ouro 14K ostenta seis cristais sintéticos coloridos, representando os objetos mais cobiçados do universo. O interior do aro conta com a gravação do poder correspondente de cada pedra: espaço, realidade, poder, alma, mente e tempo. Combine este anel com outras peças prontas para a batalha da nossa coleção Marvel x Pandora.', '1079,90', 30),
(184, 15, 9, 'Anel Chevron Brilhante', '196316CZ', 'Metal: Prata de Lei 925<br>\r\nPedras: Zircônia <br>\r\nCor: Sem Cor <br>', '489,90', 30),
(185, 15, 9, 'Anel Clássico Corações PANDORA de Ouro', '156238', 'Um toque surpreendente uma borda de pequenos corações vazados adiciona adoráveis detalhes esculturais a este elegante anel em ouro 14k. Use-o com outros anéis em tons contrastantes para criar um look moderno. Anel em ouro 14k com corações vazados.', '5599,90', 25),
(186, 15, 9, 'Anel Doces Promessas - \"I Love you\" (Eu te amo)', '196546PCZ', 'Este design marcante reluz com sentimento e estilo graças aos aros entrelaçados: um deles brilha com pedras rosa, enquanto o outro carrega a doce mensagem I love you (Te amo). Anel em prata de lei com 140 microzircônias cúbicas rosa com cravação em contas no tamanho 54 e a gravação I love you (Te amo).', '1249,90', 30),
(187, 15, 9, ' anel de prata com cristal preto', '190889NCK', 'Metal:	Prateada<br>\r\nCor:	Preta <br>\r\nPedras: Cristal <br>', '1449,90', 30),
(188, 15, 9, 'Anel Rosetm Nó Do Amor', '180997CZ', 'Metal: Pandora Rose Liga Metálica finalizado em Ouro Rose 14k <br>\r\nPedras: Zircônia', '1079,90', 30),
(189, 15, 9, 'Anel Solitário Coração Inclinado Vermelho', '199267C01', 'Metal: Prata de Lei 925 <br>\r\nPedras: Zircônia <br>\r\nCor: Vermelho ', '489,90', 40),
(190, 15, 9, 'Anel Coração Azul Brilhante Pandora Rose', '188421C01', 'Adicione um toque sofisticado ao seu visual com o Anel Coração Azul Brilhante Pandora Rosé. O anel é inspirado na coleção clássica de Pandora Timeless. Com acabamento à  mão em Pandora Rose (Mistura única finalizada a ouro rosa 14K), esta peça apresenta uma pedra elevada central em forma de coração azul. Pedras claras criam o halo e decoram metade da haste do anel, com o logotipo Pandora na parte interna da haste. Empilhe este anel com estilos acabados à  mão em prata de lei para uma aparência de metal misto de declaração.', '1249,90', 30),
(191, 15, 9, 'Anel Coração De Pandora', '150181CZ', 'O anel Coração De Pandora, possui um brilho fenomenal, ideal para acrescentar ao seu look. Com Ouro 14K e Zircônia.', '6319,90', 30),
(192, 15, 9, 'Anel Pandora Rose Brilho Entrelaçado', '180892CZ', 'Adicione um fascínio contemporâneo ao seu visual com este anel trançado cintilante feito em Pandora Rosé, uma mistura única de metal finalizado a ouro rosa 14K. O delicado design de duas camadas é adornado com linhas entrelaçadas de pedras cúbicas de zircônia que brilham e brilham conforme captam a luz.', '1719,90', 30),
(193, 13, 9, 'Aliança em Prata Heaven', 'AN00052852', 'Classificação: Anatômica <br>\r\nMaterial: Prata <br>\r\nSugestão: Para ele e para ela <br>\r\nRódio: Sim <br>\r\nPara celebrar momentos inesquecí­veis, a Vivara desenvolveu uma linha de alianças exclusivas. Criações com design clássico ou moderno, simbolizam o amor e a união dos casais. Estão presentes nas mais marcantes histórias de amor.', '230,90', 30),
(194, 13, 9, 'Anel Ouro Branco Ametista e Diamantes', 'AN00052191', 'Inspiração Coleção Rainbow\r\né composta por um mix de joias leves e modernas, inspirada na tendência rainbow collors, que é uma das principais tendências lançadas pelas joalherias do momento. As peças possuem uma delicadeza nas cores, que ao mesmo tempo transmite uma mensagem otimista através das pedras coloridas e o ar da modernidade. Essas peças fazem toda diferença no visual. <br>\r\nAnel, confeccionado em ouro branco 18k, ametistas e 12 pontos de diamantes.', '4490,00', 30),
(195, 13, 9, 'Anel Ouro Branco Safira e Diamantes', 'AN00052479', 'COLEÇÃO ESPECIAL <br>\r\n\r\nAnel Conjunto Clássico, confeccionado em ouro branco, safira e 30,8 pontos de diamantes. <br>\r\nDESCRIÇÃO E COMPOSIÇÃO <br>\r\n\r\nLargura: aproximadamente 19,6 mm <br>\r\nPedra: Diamante, Safira Azul, Diamante <br>\r\nNúmero de pedras: 1 safira, 28 diamantes <br>\r\nPontuação Média: 30,8 pontos de diamantes <br>\r\nMaterial: Ouro Branco <br>\r\nSugestão: Para ela <br>\r\nRódio: Sim <br>', '6690,00', 30),
(196, 13, 9, 'Anel Ouro Branco e Diamantes', 'AN00052802', 'COLEÇÃO VIVARA <br>\r\n\r\nAnel, confeccionado em ouro branco 18k e 9,3 pontos de diamantes.<br>\r\nDESCRIÇÃO E COMPOSIÇÃO <br>\r\n\r\nLargura: aproximadamente 2,76 mm <br>\r\nAltura: aproximadamente 20,93 mm<br>\r\nPedra: Diamante<br>\r\nNúmero de pedras: 31 diamantes<br>\r\nPontuação Média: 9,3 pontos de diamantes <br>\r\nMaterial: Ouro Branco<br>\r\nSugestão: Para ela<br>\r\nRódio: Sim<br>', '3690,00', 30),
(197, 13, 9, 'Anel Prata Prasiolita e Topázios', 'AN00052718', 'COLEÇÃO NAVETE PRATA<br>\r\n\r\nAnel Navete, confeccionado em prata 925, prasiolita e topázios incolores.<br>\r\nDESCRIÇÃO E COMPOSIÇÃO<br>\r\n\r\nLargura: aproximadamente 11,2 mm<br>\r\nPedra: Prasiolita, Topázio Incolor<br>\r\nNúmero de pedras: 1 prasiolita e 2 topázios incolores<br>\r\nMaterial: Prata<br>\r\nSugestão: Para ela<br>\r\nRódio: Não<br>', '690,90', 30),
(198, 13, 9, 'Anel Prata Rodolita Ametista e Topázios', 'AN00052627', 'COLEÇÃO DREAM PRATA<br>\r\n\r\nBrinco, confeccionado em prata 925, rodolitas, ametistas e topázios incolores<br>\r\nDESCRIÇÃO E COMPOSIÇÃO<br>\r\n\r\nLargura: aproximadamente 5,1 mm<br>\r\nPedra: Topázio, Ametista, Rodolita<br>\r\nNúmero de pedras: 1 prasiolita, 1 rodolita, 2 topázios<br>\r\nMaterial: Prata<br>\r\nSugestão: Para ela<br>\r\nRódio: Não<br>', '490,90', 30),
(199, 13, 9, 'Anel Prata Pérolas e Topázios', 'AN00052536', 'COLEÇÃO SONETO PRATA<br>\r\n\r\nAnel Pérola Soneto Prata, confeccionado em prata 925, pérola e topázios.<br>\r\nDESCRIÇÃO E COMPOSIÇÃO<br>\r\n\r\nLargura: aproximadamente 7 mm<br>\r\nPedra: Pérola, Topázio Incolor<br>\r\nNúmero de pedras: 1 pérola e 16 topázios incolores<br>\r\nMaterial: Prata<br>\r\nSugestão: Para ela<br>\r\nRódio: Sim<br>', '690,00', 50),
(200, 13, 9, 'Anel Ouro Amarelo', 'AN00052574', 'COLEÇÃO GOLD LEAF<br>\r\n\r\nAnel, confeccionado em ouro amarelo 18k.<br>\r\nDESCRIÇÃO E COMPOSIÇÃO<br>\r\n\r\nLargura: aproximadamente 13,1 mm<br>\r\nMaterial: Ouro Amarelo<br>\r\nSugestão: Para ela<br>\r\nRódio: Não<br>', '1590,00', 40),
(201, 15, 9, 'Anel Ouro Branco Rodolita e Diamantes', 'AN00052183', 'COLEÇÃO OLYMPIA<br>\r\n\r\nAnel Olympia, confeccionado em ouro branco 18k, rodolita e 13 pontos de diamantes.<br>\r\nDESCRIÇÃO E COMPOSIÇÃO<br>\r\nPedra: Diamante, Rodolita<br>\r\nNúmero de pedras: 14 diamantes e 1 rodolita<br>\r\nPontuação Média: 13 pontos de diamantes<br>\r\nMaterial: Ouro Branco<br>\r\nSugestão: Para ela<br>\r\nRódio: Sim<br>', '3691,00', 40),
(202, 13, 9, 'Aliança Ouro Branco e 120 Pontos de Diamantes', 'AN00048571', 'COLEÇÃO ALIANÇA INTEIRA</br>\r\n\r\nAliança, confeccionada em ouro branco 18k e 120 pontos de diamantes.</br>\r\nDESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nPontuação Média: \r\n\r\n120 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Branco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão', '21590,00', 40),
(203, 15, 8, 'Brinco Espigão Individual My Hamsa Hand', '298548C01', 'Exprime a tua identidade e personaliza o teu look com este divertido e simbólico brinco espigão que representa uma das tuas muitas facetas. Antigo talismã hamsá, símbolo da boa sorte e da fortuna em forma de palmeira, é desenvolvido em prata de origem responsável com um cristal lilás ao centro. Usa o teu individualmente ou como parte de um estilo desirmanado de brincos espigão com significado. Esta peça simbólica é um óptimo presente.\r\n</br>\r\nMetal:	Prata de lei</br>\r\nColor:	Roxo</br>\r\nPedras :	Cristal', '229,90', 40),
(204, 15, 8, 'Argolas Blue Pansy Flower', '290775C01', 'Ilumine o seu estilo com as nossas Argolas Blue Pansy Flower. Pétalas de amor perfeito pintadas à  mão e dispostas em pavé adornam estas argolas de prata. Cada argola contém uma fila de zircônias transparentes que lhe conferem brilho extra. O Amor Perfeito, flor mais recente a adornar o nosso jardim, simboliza o amor nas suas múltiplas formas. Use estas argolas para se recordar de quem mais ama na sua vida, e crie um look fresco e primaveril, ao conjugá-las com outras peças de prata, com o nosso Anel Triple Pansy Flowe.</br>\r\n\r\nMetal:	Prata de lei</br>\r\nMaterial:	Esmalte</br>\r\nColor:	Azul</br>\r\nPedras :	Zircônia', '919,90', 30),
(205, 15, 8, 'Argolas Pérolas Barrocas', '299426C01', 'Singulares como você, as Argolas Barrocas Pérolas de Cultura são excepcionalmente únicas. Não há duas pérolas de cultura iguais. Cada pérola tem o seu próprio tamanho, formato e cor, o que torna estes brincos o presente perfeito para quem é única na sua vida. O brilho natural iridescente da pérola cria uma aura luminosa, e as argolas de prata, com o pormenor de um coração na base da pérola, acrescentam um toque moderno num design clássico.</br>\r\n\r\nMetal:	Prata de lei</br>\r\nColor::	Branco</br>\r\nPedras :	Pérola de água doce\r\n', '1349,90', 30),
(206, 15, 8, 'Brincos Sparkling Statement Halo', '290040C01', 'Faça o seu look brilhar com os Brincos Sparkling Statement Halo. Os deslumbrantes cristais manmade ovais elevados, em azul princesa, são emoldurados por uma auréola de zircônias transparentes brilhantes, criando a sensação de uma jóia herdada. Com acabamento manual em prata, os brincos apresentam uma cravação de grifos para elevar a pedra principal da sua moldura pavé. Eleve o seu estilo para o dia a dia com estes brincos chamativos ou use-os apenas em ocasiões especiais, para as fazer brilhar ainda mais.</br>\r\n\r\nMetal:	Prata de lei</br>\r\nColor:	Multicolor</br>\r\nPedras :	Pedras mistas\r\n', '1249,90', 50),
(207, 15, 8, 'Brincos Pendente Forget Me Not', '290691ACZ', 'Brincos de prata com zircônias roxas e transparentes.</br>\r\nMetal:	Prata de lei</br>\r\nColor::	Roxo</br>\r\nPedras :	Zircônia\r\n', '1079,90', 40),
(208, 15, 8, 'Brincos Vintage Allure', '290722CZ', 'Brincos de prata com detalhes milgrain e zircônias</br>\r\nMetal:	Prata de lei</br>\r\nColor:	Transparente</br>\r\nPedras :	Zircônia\r\n', '849,90', 60),
(209, 15, 8, 'Brincos Laço Reluzente', '297234CZ', 'Estes lindos brincos em forma de laço são decorados com detalhes em zircônias cúbicas para criar um acabamento brilhante. Fabricado em prata de lei, o par texturizado dá um ar retro à s orelhas. Brincos de laço em prata de lei com 6 microzircônias cúbicas e 14 zircônias cúbicas transparentes com cravação em contas.</br>\r\n\r\nMetal:	Prateada</br>\r\nCor:	Transparente</br>\r\nPedras:	Zircônia\r\n', '1079,90', 40),
(210, 15, 8, 'May Droplets Stud Earrings', '290738NRG', 'Celebre as cores ou ocasiões com joias birthstone. Estes brincos de prata esterlina brilham gloriosamente com cristais verdes reais para maio.\r\n', '599,99', 40),
(211, 15, 8, 'Brincos brilhantes de argola de coração Halo', '291445C01', 'Um presente de amor para uma mãe elegante, os brincos Sparkling Halo Heart Hoop Earrings cada um apresenta um pingente de zircônia cúbica rosa em forma de coração cercado por um halo de pavé. O pavé no aro é acentuado com zircônias cúbicas transparentes redondas. Combine com um colar ou anel combinando para fazer uma declaração colorida adequada para qualquer ocasião.', '1200,00', 50),
(212, 18, 5, 'Relógio Casio', 'A700WG-9AD', 'O que acha de encontrar Casio Relógio a este preço? Incrível não é? Não espere mais e compre todos os produtos de que andava à  procura há tanto tempo na nossa loja moda. Equipe-se bem e desfrute ao máximo das suas atividades diárias com a Casio. E o melhor é que terá acesso aos melhores preços do mercado sobre os seus artigos de Eletrônica.', '230,00', 4),
(213, 18, 5, 'Relógio Casio', 'LTP-TW100D', 'Caixa, moldura: banhado a à­on, faixa de aço inoxidável, Vidro Mineral, Resistente à  água, Horário regular, Analógico: 3 ponteiros (hora, minuto, segundo) e Precisão: Â± 20 segundos por mês', '260,00', 7),
(214, 18, 5, 'Relógio Casio', 'B650WB-1BD', 'A linha Vintage da Casio foi inspirada nos relógios lançados entre os anos 70 e 80. São os famosos modelos retro e os queridinhos entre os fashionistas e blogueiros.', '220,00', 5),
(215, 18, 5, 'Relógio Casio', '152D-1AVDF', 'Se você gosta de usar relógios, então este relógio de forma redonda para homens da Casio foi feito para você. A carcaça sólida torna isso leve, enquanto a banda de aço inoxidável o torna confortável de usar. Além disso, é perfeito para presentear quem ama design e estilo.', '410,00', 4),
(216, 20, 5, 'Relógio Diesel', 'DZ1837', 'Este lindo relógio é um clássico da Diesel. Ele é feito de aço inoxidável. Este relógio é resistente a água (50 metros). A pulseira é couro. O relógio possui número de série emitido pelo fabricante. A caixa original acompanha manual de instruções.', '720,00', 4),
(217, 20, 5, 'Relógio Diesel', 'DZ1768 ', 'Relógio DIESEL, perfeição e estilo em um só relógio. Uma das marcas de relógios mais famosas do mundo, a grife que se tornou um ícone da moda fashion. Os relógios da DIESEL são fabricados com todo critério de qualidade e o GRUPO TECHNOS distribui os modelos para os revendedores autorizadas da DIESEL no Brasil.</br>\r\nA DIESEL é uma grife de relógios fashion, com diversos modelos diferenciados de relógios masculinos e relógios femininos que vem encantando seu público em todo mundo.', '800,00', 7),
(218, 20, 5, 'Relógio Diesel', 'DZ4469 ', 'RELOGIO DIESEL MASCULINO DZ4469. Esta marca faz sucesso em mais de 80 países e presenta inúmeros modelos modernos, com estilos e exclusivos, trazendo a mesma qualidade e inovação que a sua famosa linha de roupas.', '700,00', 5),
(219, 20, 5, 'Relógio Diesel', 'DZ1802', 'Compre o Relógio Diesel Masculino Rasp DZ1802/0CN na Eclock, a maior loja de relógios do Brasil. Vamos conhecer um pouco mais sobre o produto? Possui mecanismo Analógico, a pulseira é na cor Marrom, fabricada em Couro 100% Natural, com 27 cm de comprimento e possui Fecho Fivela. A Caixa (peça onde fica o mostrador) é fabricada em Aço, mede 4,6 cm de diâmetro, sem considerar a coroa, e 1,1 cm de espessura, o que é considerado tamanho Grande para relógios do gênero Masculino. O Relógio Diesel Masculino Rasp DZ1802/0CN tem nível de resistência à  água especificado em 5 ATM. Com relação as funções adicionais do relógio: possui Marcadores com Illuminator. ', '860,00', 4),
(220, 8, 5, 'Relógio Lacoste', '2010636 ', 'Caixa de aço inoxidável com uma pulseira de aço inoxidável. Moldura de alumínio azul giratória unidirecional. Mostrador azul com ponteiros prateados e marcadores de horas de índice. O numeral arábico marca a posição das 12 horas. Marcadores de minutos em torno da borda exterior.', '650,00', 3),
(221, 8, 5, 'Relógio Lacoste', '2010637', 'Caixa de aço inoxidável com uma pulseira de aço inoxidável. Moldura de alumínio laranja giratória unidirecional. Mostrador laranja com ponteiros esqueléticos em tom prateado e marcadores de horas de índice. O numeral arábico marca a posição das 12 horas. Marcadores de minutos em torno da borda exterior. O crocodilo Lacoste aparece abaixo da posição das 12 horas. Tipo de discagem: analógico. Mãos e marcadores luminescentes. Exibição de data entre as posições de 4 e 5 horas. Movimento de quartzo. Cristal de safira resistente a riscos. Puxe/empurre a coroa. Estojo sólido de volta. Diâmetro da caixa: 42 mm. Espessura da caixa: 11 mm. Forma de caixa redonda. Largura da faixa: 20 mm. Comprimento da banda: 8,5 polegadas. Dobre com fecho de liberação de segurança. Resistente à  água a 50 metros / 165 pés', '630,00', 4),
(222, 8, 5, 'Relógio Lacoste', '2010667', 'Relógio novo original e autêntico de Lacoste, modelo 2010667 / LC-53-1-44-2388, é feita de alta qualidade couro . Este pulseira de relógio novo é com pinos de mola / pushpins ligado à  caixa do relógio. Esta pulseira de relógio pode ser usada universalmente para diferentes modelos de relógios da mesma marca.', '760,00', 4),
(223, 8, 5, 'Relógio Lacoste', '2010676', 'Marca Lacoste, Tipo Analógico, Dimensões Embalagem: 9 x 9 x 9 cm e Peso Embalagem: 180g\r\n', '450,00', 4),
(224, 19, 5, 'Relógio Puma', 'P5003', 'Elegante e independente, o Relógio Puma reúne personalidade, estilo e riqueza de detalhes em seu acabamento', '300,00', 3),
(225, 19, 5, 'Relógio Puma', 'P5017', 'Como uma das principais marcas esportivas do mundo, a PUMA acredita em estar no mesmo campo que os atletas mais rápidos do planeta. Com a missão de Forever Faster, a Puma compartilha emoção no Teamsports, inova o golfe, traz estilo para a corrida e treinamento e desempenho para o automobilismo. A Puma tem associações com alguns dos atletas de elite.', '400,00', 7),
(226, 19, 5, 'Relógio Puma', 'PU91136100', 'O Relógio da Puma é um sofisticado produto de altíssima qualidade. Adapta-se perfeitamente a todas suas necessidades proporcionando um toque de glamour e estilo. Ideal para o seu uso cotidiano, ele também pode ser usado com todos os tipos de vestimenta, em reuniões, eventos, festas ou para o uso casual. Um relógio clássico que ajuda a organizar o seu tempo.', '290,00', 9),
(227, 19, 5, 'Relógio Puma', 'PU10378100', 'Conceda um charme todo especial as suas produções com as formas despojadas do Relógio Masculino Analógico Puma ', '540,00', 6),
(228, 13, 8, 'Brinco Prata e Topázios', 'BR00048098', 'Altura: \r\n\r\naproximadamente 16 mm</br>\r\nPedra: \r\n\r\nTopázio</br>\r\n\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nCor: \r\n\r\nPrateado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO INSIDE PRATA</br>\r\n\r\nBrinco Inside Prata, confeccionado em prata 925 com ródio negro, ágatas pretas e topázios brancos.', '1050,00', 50),
(229, 13, 8, 'Brinco Prata Pérolas e Topázios', 'BR00047032', 'Diâmetro: \r\n\r\naproximadamente Pérola: 9,00 mm - 9,50 mm</br>\r\nPedra: \r\n\r\nPérola, Topázio</br>\r\n\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nCor: \r\n\r\nBranco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO</br>\r\n\r\nBrinco Pérolas Prata, confeccionado em prata 925, pérolas de água doce e topázios.', '890,90', 50),
(230, 13, 8, 'Brinco Prata Espinélios e Aventurina', 'BR00047473', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nPedra: \r\n\r\nEspinélio, Aventurina</br>\r\n\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nCor: \r\n\r\nNegro</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO ESPERANÇA PRATA</br>\r\n\r\n\r\nO brinco Prata Espinélios e Aventurina é confeccionado em prata 925 e recebe pedras preciosas. As aventurinas verdes do brinco Prata Espinélios e Aventurina simbolizam crescimento, renovação e plenitude, já os espinélios pretos funcionam como um amuleto energizante. O design diferenciado do brinco Prata Espinélios e Aventurina garantem looks chiques e originais. </br>\r\n\r\nDetalhes</br>\r\n\r\nBrinco Prata Espinélios e Aventurinas</br>\r\n\r\nMateriais: prata 925, espinélios, aventurinas e ródio</br>\r\n\r\nColeção: Esperança Prata', '1550,50', 50),
(231, 13, 8, 'Brinco Prata e Topázios', 'BR00048099', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 19 mm</br>\r\nPedra: \r\n\r\nTopázio</br>\r\n\r\nMaterial: \r\n\r\nPrata</br>\r\nCor: \r\n\r\nPrateado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO INSIDE PRATA</br>\r\n\r\n\r\nO brinco Prata e Topázios é confeccionado em prata 925 e recebe aplicações de topázios brancos. O brinco Prata e Topázios é diferente de tudo que você já viu: ele possui duas peças principais, que podem ser recombinadas para montar looks únicos! Com o brinco Prata e Topázios, suas produções têm mais autenticidade e brilho, e, além disso, o brinco Prata e Topázios é super versátil e vai bem com qualquer combinação de joias.\r\n\r\nDetalhes</br>\r\n\r\nBrinco Prata e Topázios</br>\r\n\r\nMateriais: prata 925 e topázios white</br>\r\n\r\nColeção: Inside Prata', '1150,50', 50),
(232, 13, 8, 'Brinco Gota Ouro Branco Esmeraldas e Diamantes', 'BR00047553', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 10 mm</br>\r\nTarraxa: \r\n\r\nTarraxa M</br>\r\nPedra: \r\n\r\nDiamante, Esmeralda</br>\r\n\r\nNúmero de pedras: \r\n\r\n34 pedras diamantes e 2 pedras esmeraldas</br>\r\nCravação: \r\n\r\nGarra</br>\r\nPontuação Média: \r\n\r\n17 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Branco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO CLASSIC ORIENTAL</br>\r\n\r\nBrinco Gota Classic Oriental, confeccionado em ouro branco 18k, 17 pontos de diamantes e esmeralda.', '3190,90', 50),
(233, 13, 8, 'Brinco Prata Topázios e Espinélios', 'BR00048101', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 34 mm</br>\r\nPedra: \r\n\r\nEspinélio, Topázio</br>\r\n\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nCor: \r\n\r\nNegro</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO</br>\r\n\r\nBrinco Blue Prata, confeccionado em prata 925 com ródio negro, topázios london e espinélios.', '2890,90', 50),
(234, 13, 8, 'Brinco Ouro Amarelo e Diamantes', 'BR00044054', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 34 mm</br>\r\nAltura: \r\n\r\naproximadamente 73 mm</br>\r\nPedra: \r\n\r\nDiamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n264 diamantes</br>\r\nPontuação Média: \r\n\r\n210 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO ESPECIAL</br>\r\n\r\nBrinco Vitória, confeccionado em ouro amarelo 18k e 210 pontos de diamantes.</br>\r\n\r\nInspiração Coleção Especial</br>\r\nNa coleção Vitória o grafismo ganha força em joias ricas em detalhes, para mulheres imponentes que primam pelo clássico e chique. Com linhas inspiradas em traços da arquitetura, a sobreposição do metal é complementada pelos diamantes de forma exuberante e atemporal.', '22500,90', 50),
(235, 13, 8, 'Brinco Prata Topázios e Pedras da Lua', 'BR00048124', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 38 mm</br>\r\nPedra: \r\n\r\nPedra da Lua, Topázio</br>\r\n\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nCor: \r\n\r\nPrateado</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO</br>\r\n\r\nBrinco Blue Prata, confeccionado em prata 925, topázios brancos, topázios azuis e pedras da lua.', '1850,00', 50),
(236, 13, 8, 'Brinco Prata Topázio, Prasiolita e Safira Verde', 'BR00048899', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 14 mm</br>\r\nAltura: \r\n\r\naproximadamente 37,7 mm</br>\r\nPedra: \r\n\r\nSafira Azul, Prasiolita, Topázio</br>\r\n\r\nNúmero de pedras: \r\n\r\n4 Topázios, 2 Safiras, 2 Prasiolitas</br>\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO GOTAS PRATA</br>\r\n\r\nBrinco Gotas Prata, confeccionado em prata 925 com topázios, prasiolitas e safira. </br>\r\n\r\nColeção Gotas Prata</br>\r\nUma joia é um símbolo único que tem o poder de transcender lugares, culturas ou tornar alguém inesquecível! Capaz de traduzir, de forma simples, sentimentos e momentos que talvez precisasse de um livro inteiro para explicar. Porque, acima de tudo, uma joia é a história que ela conta. Cada coleção possui sua própria personalidade, sendo concebida com o cuidado e design inovador que leva nossa marca.', '1950,50', 50),
(237, 13, 8, 'Brinco Ouro Rosé Cristal e Diamantes', 'BR00046220', 'ESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 9 mm</br>\r\nAltura: \r\n\r\naproximadamente 24 mm</br>\r\nPedra: \r\n\r\nDiamante, Cristal</br>\r\n\r\nMaterial: \r\n\r\nOuro Rosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nCOLEÇÃO CHAGALL ROSE</br>\r\n\r\nBrinco Chagall Rosé, confeccionado em ouro rosé 18k, 2,4 pontos de diamantes e 2 cristais transparentes.</br>\r\n\r\nInspiração Coleção Chagall</br>\r\nColeção inspirada nos murais de Marc Chagall. A fluidez dos desenhos e o movimento da tinta é o que move a combinação entre ouro e cristais, principal gema da coleção.', '4800,00', 50),
(238, 15, 11, 'Colar Encanto Vintage', '590523CZ', 'Metal: Prata de Lei 925</br>\r\nPedras: Zircônia', '1070,90', 50),
(239, 15, 11, 'Colar Coracao E Asas De Anjo Pave', '398505C02', 'Nosso Colar Coração e Asas de Anjo Pavé caiu do céu. Perfeito para presentear o anjo em sua vida ou enriquecer sua coleção, este colar especial é finalizado à  mão em prata de lei e apresenta pavé de cristais rosa. Ajustável em três tamanhos diferentes, este pendente todo especial foi inspirado nos anjos como símbolos de amor e proteção.', '1080,00', 50),
(240, 15, 11, 'Colar O Pendente Com Fecho T Pandora Moments', '391157C00', 'Ande com sua história perto do coração com o colar O Pendente com fecho T Pandora Moments. Pela primeira vez combinamos dois porta-charms icônicos em um colar para que você leve a personalização a outro nível. Combine seis dos seus charms, pendentes ou charms pendentes preferidos no colar, três na corrente e três, no máximo, no pequeno O pendente. Abra o O pendente pelo fecho esférico. Abra a corrente girando o fecho T. Para colocar charms, pendentes ou charms pendentes, basta deslizá-los pelo fecho T.', '1950,00', 50),
(241, 15, 11, 'Colar De Corrente Espessa Em Trama', '399564C00', 'Linha: PANDORA Moments</br>\r\nMetal: Prata de Lei', '1250,00', 50),
(242, 15, 11, 'Colar Pandora Corrente De Elos Ouro Rose', '389410C00', 'Adicione uma peça clássica à  sua coleção com o Colar de Corrente de Elos. Finalizado à  mão em ouro rose 14K, este design está disponível em tamanho único. Use este colar com brincos simples finalizados em ouro rose 14K para obter um look tonal contemporâneo. Como alternativa, combine com Pendentes O Pandora pequenos, médios ou grandes para mudar a maneira com que você usa seus charms favoritos. Combine este look com colares em diferentes texturas e comprimentos para um look sobreposto com muita elegância.\r\n\r\n', '1990,00', 50),
(243, 15, 11, 'Colar Pequenos Elos Pandora Shine', '368638C00', 'Metal: Pandora Shine', '1990,90', 49),
(244, 15, 11, 'Colar Choker Pandora Essence', '397296', 'Metal: Prata de Lei 925', '1320,00', 50),
(245, 15, 11, 'Colar Amor Perfeito Azul', '390770C01', 'Empreste cor à  sua primavera com nosso Colar com Pendente Amor Perfeito Azul. Finalizado à  mão em prata de lei, cada pendente de flor é totalmente exclusivo com pétalas em esmalte pintadas à  mão e detalhes em pavé brilhante. Um pequenino charm de flor fica pendente a partir do fecho desta corrente um detalhe atencioso para quem ocupa seus pensamentos. A flor mais recente para agraciar nosso jardim, o amor-perfeito simboliza o amor em suas diversas formas. Use a sua como um lembrete de todas as pessoas queridas em sua vida.', '1300,00', 50),
(246, 15, 11, 'Colar Rose Chave Da Realeza', '387676', 'Metal: Pandora Rose Liga Metálica finalizado em Ouro Rose 14k</br>\r\nCor: Rosa', '2550,90', 50),
(247, 15, 11, 'Colar Shine Sementes da Vida', '367683CZ', 'Pendente de sementes em PANDORA Shineâ, com 28 microzircônias cúbicas transparentes com cravação em contas e 84 zircônias cúbicas transparentes com cravação em contas e colar de 60 cm com fecho deslizante', '3100,00', 50),
(248, 13, 11, 'Colar Prata Pérola e Topázio', 'CO00021409', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nPedra: \r\n\r\nPérola, Topázio</br>\r\n\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nCor: \r\n\r\nBranco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO</br>\r\n\r\n\r\nO colar de pérola e topázio, da Coleção Pérolas Prata, possui um design singular, perfeito para ser combinado com decotes um pouco mais abertos, por exemplo, porque o colar de prata com pérola estende-se pelo colo como uma elegante gota. A pérola de água doce utilizada neste colar de pérola Vivara já nasce pronta para compor a joia, não necessitando ser lapidada e, assim, a missão de quem as manuseia é deixar sua beleza natural em destaque. Além disso, a prata 925 harmoniza perfeitamente com o colar de pérola, e o topázio branco é um detalhe especial que dá ainda mais brilho e autenticidade à  joia.\r\n\r\nDetalhes:</br>\r\n\r\nColar de Prata com Pérola e Topázio</br>\r\n\r\nMateriais: prata 925, pérola de água doce, topázio e ródio</br>\r\n\r\nColeção: Pérolas Prata', '900,00', 50),
(249, 13, 11, 'Colar Prata àgata Preta e Topázios', 'CO00021870', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nPedra: \r\n\r\nágata, Topázio</br>\r\n\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nCor: \r\n\r\nNegro</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nFecho: \r\n\r\nLagosta</br>\r\nCOLEÇÃO INSIDE PRATA</br>\r\n\r\nColar Inside Prata, confeccionado em prata 925 e topázios brancos e topázio azul.', '1100,00', 50),
(250, 13, 11, 'Colar Prata Pérola e Topázios', 'CO00022212', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nDiâmetro: \r\n\r\naproximadamente 45 cm</br>\r\nPedra: \r\n\r\nTopázio, Pérola</br>\r\n\r\nNúmero de pedras: \r\n\r\n1 pérola, 7 topázios incolores</br>\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO Pérolas PRATA</br>\r\n\r\nColar, confeccionado em prata 925, pérola e topázios incolores.', '550,00', 50),
(251, 13, 11, 'Colar Ouro Amarelo e Diamantes', 'CO00022164', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 12,9 mm</br>\r\nPedra: \r\n\r\nDiamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n11 diamantes brancos</br>\r\nCravação: \r\n\r\nGarra</br>\r\nPontuação Média: \r\n\r\n5,5 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO VIVARA</br>\r\n\r\nColar Vivara, confeccionado em ouro amarelo 18k e 5,5 pontos de diamantes.', '4150,00', 50),
(252, 13, 11, 'Colar Ouro Rosé Quartzo Negro e Diamantes', 'CO00021474', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente Interno: 26 mm e Externo: 41 mm</br>\r\nAltura: \r\n\r\naproximadamente Interno: 11,5 mm e Externo: 19,7 mm</br>\r\nPedra: \r\n\r\nDiamante, Quartzo Negro</br>\r\n\r\nMaterial: \r\n\r\nOuro Rosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO SENSORIAL</br>\r\n\r\nColar Sensorial, confeccionado em ouro rosé 18k, quartzo negro com lapidação oval e 52,2 pontos de diamantes.</br>\r\n\r\nInspiração Coleção Sensorial</br>\r\nAs experiências sensoriais do corpo fluem de forma orgânica e crescente, partindo de pequenos estímulos e aumentando como ondas. Um leve toque na pele se transforma e o corpo descobre um novo olhar sobre si mesmo.', '9990,00', 50),
(253, 13, 11, 'Colar Ouro Branco Pérolas e Diamantes', 'CO00022226', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 9,50 mm</br>\r\nAltura: \r\n\r\naproximadamente 14,60 mm</br>\r\nPedra: \r\n\r\nPérola Branca, Pérola, Diamante, Pérola, Pérola</br>\r\n\r\nNúmero de pedras: \r\n\r\n9 diamantes e 7 pérolas</br>\r\nPontuação Média: \r\n\r\n17,1 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Branco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO NOIVAS</br>\r\n\r\nColar, confeccionado em ouro branco 18k, pérolas e 17,1 pontos de diamantes.</br>\r\n\r\nInspiração Coleção Noivas</br>\r\nFeita para brilhar, a coleção foi desenhada para complementar estilo do vestido branco, trazendo elegância e harmonia com materiais nobres e luxuosos. Suas pedras e designer transformam qualquer noiva em uma verdadeira rainha.', '5990,00', 50),
(254, 13, 11, 'Colar Linear Ouro Amarelo', 'CO00022117', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nFecho: \r\n\r\nFecho T e Argola</br>\r\nCOLEÇÃO LINEAR</br>\r\n\r\nColar Fecho T Linear, confeccionado em ouro amarelo 18k.</br>\r\n\r\nInspiração Coleção Linear</br>\r\nCom uma suave nostalgia vintage, a coleção Linear apresenta joias harmônicas com uma elegância natural. As estruturas simples combinadas à s pérolas alinhadas linearmente dão origem a peças atemporais e super femininas. Para completar o look com sofisticação, correntes Cartier foram utilizadas na confecção das joias.', '18700,00', 50),
(256, 13, 11, 'Escapulário Nossa Senhora Aparecida Ouro Amarelo', 'CO00022095', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente Medalha: 8 mm</br>\r\nAltura: \r\n\r\naproximadamente Medalha: 13 mm</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO MEDALHAS</br>\r\n\r\nEscapulário, confeccionado em ouro amarelo 18k.</br>\r\n\r\nInspiração Coleção Medalhas</br>\r\nSímbolos de fé e proteção, as medalhas são uma expressão de religiosidade e devoção. Carregando a imagem do Santo devoto acredita-se que este protetor estará sempre por perto, a coleção Vivara Medalhas possui peças em ouro, ricas em detalhes e amor. Para carregar junto ao coração e estar mais perto de Deus.', '3300,00', 50),
(257, 13, 11, 'Corrente Ouro Amarelo - 60 cm', 'CO00022087', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nEspessura média: \r\n\r\n1,95 mm</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO CORRENTES</br>\r\n\r\nCorrente, confeccionada em ouro amarelo 18k. A corrente possui 60 cm de comprimento.</br>\r\n\r\nInspiração Coleção Colares e Correntes</br>\r\nCriadas em sintonia com a qualidade e exclusividade dos pingentes Vivara, as correntes e colares de diversos materiais e tamanhos são garantia de sucesso em todos os momentos.\r\n', '2500,00', 50),
(258, 12, 9, 'Anel Versace', '10025751A0', 'Anel com letreiro de logo, monograma em tom dourado. </br>\r\nMaterial: metal.', '1900,00', 4),
(259, 12, 9, 'Anel Versace', 'DG57285DJM', 'Anel Medusa com detalhe de resina, com design bicolor.', '2400,00', 2),
(260, 12, 9, 'Anel Versace', '10020641A0', 'Anel Greca com vazado, acabamento polido e logo gravado. </br>\r\nMaterial: metal. </br>\r\nCor: Dourado.', '1800,00', 2),
(261, 12, 9, 'Anel Versace', '10040651A0', 'Detalhe cabeça de Medusa , ferragem dourada, modelagem slip-on e corte redondo.</br> \r\nCor: Dourado.', '2800,00', 4),
(262, 13, 9, 'Anel Vivara', 'AN00052482', 'Largura: aproximadamente 6 mm</br>\r\nPedra: calcedônia</br>\r\nNúmero de pedras: 1 calcedônia verde</br>\r\nMaterial: Prata', '790,00', 5),
(263, 13, 9, 'Anel Vivara', 'AN00052475', 'Inspirada nas serpentes, a textura agrega riqueza e sofisticação com um design minimalista. As safiras são detalhes que enriquecem a joia, trazendo a neutralidade para a linha, tornando-a uma coleção a ser explorada por todos os estilos.', '790,00', 6),
(264, 13, 9, 'Anel Vivara', 'AN00052269', 'Em uma atmosfera moderna e elegante, a Vivara traduz o universo masculino em uma coleção que traz estilo e sofisticação para o homem contemporâneo, que valoriza e celebra suas conquistas e está sempre em busca de novas experiências. A coleção masculina Vivara é inspirada no homem moderno, que gosta de se vestir bem e expressar seu estilo por meio de seus acessórios. Ao unir os diferentes tipos de materiais, a coleção traz tons sóbrios com detalhes sofisticados.', '790,00', 5),
(265, 13, 9, 'Anel Vivara', 'AN00052851', 'A Vivara desenvolveu uma linha exclusivas. Criações com design clássico ou moderno, simbolizam o amor. ', '330,00', 6),
(266, 16, 9, 'Anel Monte Carlo', 'ANPRPR0000', 'Coleção: APOLO</br>\r\nMetal: Prata</br>\r\nPedra: ágata Negra</br>\r\nAltura: 13.25(mm)', '890,00', 5),
(267, 16, 9, 'Anel Monte Carlo', 'ANPRPR0000', 'Coleção: SPEED</br>\r\nMetal: Prata</br>\r\nAltura: 9.70(mm)', '560,00', 5),
(268, 16, 9, 'Anel Monte Carlo', 'ANACAC0000', 'Coleção: BRAVE</br>\r\nMetal: Aço</br>\r\nAltura: 10.00(mm)', '250,00', 5),
(269, 16, 9, 'Anel Monte Carlo', 'ANACAC0000', 'Coleção: BRAVE</br>\r\nMetal: Aço</br>\r\nAltura: 08.02(mm)', '290,00', 7),
(270, 13, 11, 'Colar Vivara', 'CO00022084', 'Corrente, confeccionada em ouro amarelo 18k. A corrente possui 60 cm de comprimento.', '3590,00', 5),
(271, 13, 11, 'Colar Vivara', 'CO00022132', 'Corrente Prata, confeccionada em prata 925. A corrente possui 70 cm de comprimento.', '350,00', 3),
(272, 13, 11, 'Colar Vivara', 'CO00022102', 'Corrente, confeccionada em ouro amarelo 18k. Possui 60 cm de comprimento. E 3,6 mm de espessura.', '7690,00', 6),
(273, 13, 11, 'Colar Vivara', 'CO00022106', 'Corrente Prata, confeccionada em prata 925. A corrente possui 45 cm de comprimento.', '765,00', 3),
(274, 16, 11, 'Colar Monte Carlo', 'NIM025177', 'Coleção: MALHA CARTIER</br>\r\nMetal: Ouro Branco18k</br>\r\nComprimento: 60.00(cm)</br>\r\nEspessura: 0.95(mm)', '2370,00', 4),
(275, 16, 11, 'Colar Monte Carlo', 'NIM005774', 'Coleção: MALHA SINGAPURA</br>\r\nMetal: Ouro Amarelo 18k</br>\r\nComprimento: 45.00(cm)</br>\r\nEspessura: 1.17(mm)', '1610,00', 4),
(276, 16, 11, 'Colar Monte Carlo', 'NIM005845', 'Coleção: MALHA CARTIER</br>\r\nMetal: Ouro Branco 18K</br>\r\nComprimento: 45.00(cm)</br>', '1330,00', 4),
(277, 16, 11, 'Colar Monte Carlo', 'NIM014367', 'Coleção FÉ ESCAPULARIO</br>\r\nMetal: Ouro Branco 18K</br>\r\nComprimento60.00(cm)</br>\r\nAltura8.15(mm)</br>\r\nLargura6.15(mm)', '2590,00', 4),
(278, 17, 11, 'Colar Tiffany', '63448826', 'Feito com elos em prata de lei e detalhes em ouro 18k, este colar de elos capta o espírito útil do clássico design norte-americano. Feita com um símbolo dos artesãos inspirado na famosa oficina de objetos da Tiffany, a coleção Tiffany 1837â„¢ Makers homenageia o legado de habilidade artesanal especializada da Tiffany por meio de uma visão moderna. Este design transmite estilo mesmo se usado sozinho ou combinado com outras joias Tiffany.', '10850,00', 4),
(279, 17, 11, 'Colar Tiffany', '60153063', 'Uma corrente ousada e graduada de elos marcantes captura a essência urbana da cidade, passando uma mensagem contundente.', '8760,00', 6),
(281, 17, 11, 'Colar Tiffany', '60153372', 'Elegantemente subversiva, a coleção Tiffany HardWear captura o espírito de Nova York. Este colar ousado é ao mesmo tempo refinado e rebelde.', '16000,00', 4),
(283, 13, 12, 'Pingente Ouro Branco Safira e Diamantes', 'BE00051518', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 7,03 mm</br>\r\nAltura: \r\n\r\naproximadamente 12,9 mm</br>\r\nPedra: \r\n\r\nSafira Azul, Diamante, Diamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n32 diamantes e 1 safira azul</br>\r\nPontuação Média: \r\n\r\n35,2 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Branco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO ESPECIAL</br>\r\n\r\nPingente, confeccionado em ouro branco 18k e safira e 35,2 pontos de diamantes.', '6100,00', 50),
(284, 13, 12, 'Pingente Ouro Branco Esmeralda e Diamantes', 'BE00051397', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 11,72 mm</br>\r\nAltura: \r\n\r\naproximadamente 16,3 mm</br>\r\nPedra: \r\n\r\nDiamante, Esmeralda, Diamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n56 diamantes e 1 esmeralda</br>\r\nPontuação Média: \r\n\r\n61,6 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Branco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO ESPECIAL</br>\r\n\r\nPingente, confeccionado em ouro branco 18k, esmeralda e 61,6 pontos de diamantes.', '28990,00', 50),
(285, 13, 12, 'Pingente Ouro Rosé Ametista e Diamante', 'BE00051476', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 5,8 mm</br>\r\nAltura: \r\n\r\naproximadamente 11,3 mm</br>\r\nPedra: \r\n\r\nAmetista, Diamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n1 ametista e 1 diamante</br>\r\nPontuação Média: \r\n\r\n3 pontos de diamante</br>\r\nMaterial: \r\n\r\nOuro Rosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO POLICROMA</br>\r\n\r\nPingente, confeccionado em ouro rosé 18k, ametista e 3 pontos de diamante.', '2450,00', 50),
(286, 13, 12, 'Pingente Medalha Olho Grego Ouro Amarelo Safiras e Quartzo', 'BE00051379', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 20 mm</br>\r\nAltura: \r\n\r\naproximadamente 20 mm</br>\r\nPedra: \r\n\r\nQuartzo Fumê, Safira Incolor</br>\r\n\r\nNúmero de pedras: \r\n\r\n20 safiras, 1 quartzo</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO MEDALHAS TRENDS</br>\r\n\r\nPingente Medalha olho grego, confeccionado em ouro amarelo 18k e safira.\r\nSimboliza: a sorte, a energia positiva, a limpeza, a saúde, a luz, a paz, a proteção, bem como o olhar divino que protege as pessoas contra os males e a inveja.', '3990,00', 50),
(287, 13, 12, 'Pingente Ouro Rosé Topázio London e Diamantes', 'BE00050505', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 4 mm</br>\r\nAltura: \r\n\r\naproximadamente 18,5 mm</br>\r\nPedra: \r\n\r\nDiamante, Topázio</br>\r\n\r\nMaterial: \r\n\r\nOuro Rosé</br>\r\nCOLEÇÃO ENLACE</br>\r\n\r\nPingente Enlace, confeccionado em ouro rosé 18k, topázio london com lapidação gota e 3,3 pontos de diamantes.', '1550,00', 50),
(288, 13, 12, 'Pingente Ouro Amarelo e Cristal', 'BE00051513', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 4,37 mm</br>\r\nAltura: \r\n\r\naproximadamente 35,2 mm</br>\r\nPedra: \r\n\r\nCristal</br>\r\n\r\nNúmero de pedras: \r\n\r\n1 cristal</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\nCOLEÇÃO POP CRISTAL</br>\r\n\r\nPingente, confeccionado em ouro amarelo 18k e cristal.', '600,00', 50),
(289, 13, 12, 'Pingente Ouro Rosé Diamantes e Safiras', 'BE00050661', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 10 mm</br>\r\nPedra: \r\n\r\nDiamante, Safira Azul</br>\r\n\r\nMaterial: \r\n\r\nOuro Rosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO CLAVE</br>\r\n\r\nPingente Clave, confeccionado em ouro rosé 18k, safiras e 27,6 pontos de diamantes.', '11000,00', 50),
(290, 13, 12, 'Pingente Elos Ouro Amarelo e Diamantes', 'BE00051196', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 21,25 mm</br>\r\nAltura: \r\n\r\naproximadamente 21,2 mm</br>\r\nPedra: \r\n\r\nDiamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n10 pedras diamantes</br>\r\nCravação: \r\n\r\nGarra</br>\r\nPontuação Média: \r\n\r\n6,1 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO ELOS</br>\r\n\r\nPingente Elos, confeccionado em ouro amarelo 18k com 6,1 pontos de diamantes.', '7050,00', 50),
(291, 13, 12, 'Pingente Bold Ouro Amarelo e Diamantes', 'BE00051270', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 16,5 mm</br>\r\nPedra: \r\n\r\nDiamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n122 pedras de diamantes</br>\r\nCravação: \r\n\r\nPavê</br>\r\nPontuação Média: \r\n\r\n73,2 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO BOLD</br>\r\n\r\nPingente Bold, confeccionado em ouro amarelo 18k e 73,2 pontos de diamantes.', '13190,00', 50),
(292, 13, 12, 'Aparecida Ouro Amarelo Safiras e Diamantes', 'BE00050058', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\naproximadamente 15 mm</br>\r\nAltura: \r\n\r\naproximadamente 20 mm</br>\r\nPedra: \r\n\r\nDiamante, Safira Azul</br>\r\n\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO MEDALHAS</br>\r\n\r\nO pingente Nossa Senhora Aparecida Vivara leva, na manta, cravações perfeitas de safiras e diamantes. Moldado com extrema delicadeza, para que não falte nenhum detalhe, o pingente Nossa Senhora pode ser colocado em uma corrente de ouro, como o da imagem, mas também em correntes confeccionadas em outros materiais, pois suas cores e o profundo significado da imagem do pingente de Nossa Senhora o tornam uma joia única e atemporal, indispensável para acompanhar o dia a dia de um admirador da santa.</br>\r\n\r\nPingente de Nossa Senhora Aparecida</br>\r\n\r\nMateriais:\r\n\r\nOuro amarelo 18k,\r\nDiamantes,\r\nSafiras</br>\r\nPontos de diamantes: 6</br>\r\n\r\nColeção: Medalhas', '5350,00', 50);
INSERT INTO `tb_produto` (`COD_PRODUTO`, `MARCA`, `CATEGORIAS`, `NOME`, `MODELO`, `DESCRICAO`, `PRECO`, `ESTOQUE`) VALUES
(293, 15, 12, 'Charm Reator Arc Homem De Ferro_ Os Vingadores Marvel', '790788C01', 'Leve com você a fonte de energia do Homem de Ferro com nosso Charm Arc Reactior do Homem de Ferro de Os Vingadores da Marvel. Representando o coração artificial de Iron Man, nosso charm em prata de lei ostenta esmalte azul transparente e detalhes texturizados para recriar o look de maquinário mecânico. As palavras icônicas compartilhadas entre Tony Stark e Iron Man e sua filha estão gravadas no verso: \"I love you 3000\" (Eu te amor, 3000). Adicione este charm e mais de seus heróis favoritos ao nosso Bracelete em Trama com Fecho de Logotipo Os Vingadores da Marvel Pandora Moments.', '539,00', 50),
(294, 15, 12, 'Charm Pendente Escudo Capitao America_Os Vingadores Marvel', '790780C01', 'Colocando-se a postos: leve nosso Charm Escudo do Capitão América de Os Vingadores da Marvel e compartilhe seu amor pelo Universo Cinemático Marvel com o mundo. O lendário escudo do Capitão América brilha em esmalte vermelho, branco e azul aplicado à  mão. Contando com a gravação da mensagem \"TRUE TO YOURSELF\" (SEJA FIEL A SI MESMA), esta peça deslumbrante em prata de lei simboliza a esperança e a proteção. Adicione este charm e mais de seus heróis favoritos ao nosso Bracelete em Trama com Fecho de Logotipo Os Vingadores da Marvel Pandora Moments.', '649,00', 50),
(295, 15, 12, 'Charm Filtro Dos Sonhos Azul', '799341C01', 'Vista seu apoio com o Charm Filtro Dos Sonhos Azul, parte do programa Pandora for UNICEF. Um símbolo de ajudar as crianças de todo o mundo a tornarem os seus sonhos realidade, 15â de cada apanhador de sonhos vendido destina-se a apoiar as crianças mais vulneráveis ??do mundo. Com suas pedras brilhantes, detalhes em esmalte azul e gravura \"Acredite no poder dos seus sonhos\", este charme é uma bela peça de joalheria e um sinal significativo de esperança!', '750,00', 50),
(296, 15, 12, 'Charm Pendente Crayon Sonhos Do Futuro', '799600C01', 'Apoie jovens vozes com o Charm Pendente Crayon Sonhos do Futuro pertencente à  iniciativa Pandora for UNICEF. Finalizado à  mão em prata de lei, o pendente ostenta um giz de cera de seis lados com esmalte azul, rosa e amarelo aplicado à  mão para conferir um acabamento colorido à  peça. O giz de cera é alado e ostenta a gravação \"Supporting young voices\" (Apoie jovens vozes) em sua estrutura, que também conta com um pequeno detalhe de borboleta em esmalte azul. O charm representa o espírito das crianças atualmente e seus múltiplos anseios e sonhos, incluindo um mundo repleto de cores e oportunidades. Apoie jovens vozes: para cada charm Pandora for UNICEF vendido entre 30 de setembro de 2021 e 5 de janeiro de 2022, a Pandora doará â‚¬15 do valor da compra por charm para o trabalho da UNICEF com crianças e jovens, incluindo programas de educação, igualdade de gêneros, conscientização de direitos, empoderamento pessoal e engajamento cívico.', '750,00', 50),
(297, 15, 12, 'Charm Pendente Duplo Princesa Leia Star Wars', '799251C01', 'Charm Pendente Duplo Princesa Leia Star Wars', '750,00', 50),
(298, 15, 12, 'My Pink Starfish Dangle Charm', '799011C01', 'Expresse cada lado de sua personalidade com o My Pink Starfish Dangle Charm. Projetado em colaboração com a atriz, modelo e ativista Millie Bobby Brown como parte da coleção Pandora Me, o charme da estrela do mar é inspirado nos símbolos do oceano, verão, viagens e autodescoberta. A peça do oceano brilha com safiras cor-de-rosa sintéticas em forma de estrela do mar em prata de lei. Use-o no seu estilo Pandora Me favorito e adicione seu próprio significado para completar o visual.\r\nConsulte Mais informação', '350,00', 50),
(299, 15, 12, 'Charm Murano Rosetm Rosa Cintilante', '781650', 'Cuidadosamente elaborado a partir de vidro de Murano facetado em um tom rosa iridescente de sonho e equipado com um núcleo de PANDORA Rose, este charm cativante é simplesmente irresistível.', '750,00', 50),
(300, 15, 12, 'Charm Pandora Essence Rosetm Happiness (Felicidade)', '786202', 'Charm Pandora Essence Rosetm Happiness (Felicidade)', '1,79,00', 50),
(301, 15, 12, 'Charm Pandora Essence Rosetm Affection (Afeto)', '786303CZ', 'Charm Pandora Essence Rosetm Affection (Afeto)', '1079,00', 50),
(302, 15, 12, 'Charm Pandora Essence Rosetm Compassion (Compaixão)', '786302CZ', 'Charm Pandora Essence Rosetm Compassion (Compaixão)', '1080,00', 50),
(303, 15, 10, 'Bracelete Pandora Rigido Signature Id', '589493C00', 'Simplifique seu visual com o bracelete Pandora Signature ID. Com um perfil meio quadrado e meio arredondado, este bracelete finalizado em ouro rosé 14k tem acabamento feito à  mão. O perfil redondo polido faz a transição para um perfil quadrado maior no meio, que apresenta o logotipo Pandora em seus três lados externos. Cada extremidade da pulseira inclui o monograma Pandora Crown O. O bracelete tem um tamanho preciso para desempenho e ajuste ideais e não foi projetada para ser flexionada ou torcida quando colocada e removida.', '2100,00', 50),
(304, 15, 10, 'Bracelete Disney Pandora Moments', '569563C01', 'Homenageie seus sonhos com o Bracelete em Trama com Fecho de Coração Pandora Moments Disney. Finalizado à  mão em prata de lei e ouro 14K, este bracelete ostenta um fecho em formato de coração com um contorno de coroa adornado com zircánia cúbica transparente. A face traseira do fecho ostenta a mensagem \"Never give up on your dreams\" (Nunca desista de seus sonhos) e um coração pendente com uma pedra brilhante e uma coroa gravada. Inspirado nas princesas Disney e em suas virtudes, este bracelete atua como um lembrete de que os sonhos unem a todos nós.', '2100,00', 50),
(305, 15, 10, 'Bracelete Esfera Brilhante', '598342CZ', 'Quando você quer usar miçangas grossas e ousadas com um toque elegante, esta pulseira de miçangas e pavé em prata de lei é a escolha perfeita. A pulseira se inspira nos looks alternativos de piercings corporais e estilos inspirados no punk e adiciona um toque polido e refinado. Possui uma corrente totalmente frisada com uma grande conta em pavé e um fecho de barril. A pulseira foi projetada para ser usada sozinha ou empilhada com outras pulseiras em diferentes acabamentos de metal para a aparência final.', '1100,00', 49),
(306, 15, 10, 'Bracelete Pandora Moments_Fecho T Coracao Rose', '589285C00', 'Adicione um toque de tons quentes ao seu visual com a pulseira de corrente de cobra Pandora Moments Heart T-Bar. Com acabamento à  mão em nossa mistura única de metal finalizado em ouro rosa 14k, esta peça é uma versão atualizada da pulseira de corrente de cobra Pandora Moments. Apresentando um fecho de circulo duplo com barra em T em forma de coração, passe a barra em T pelo circulo menor para garantir que o fecho da pulseira esteja bem fechado. Use este estilo elegante e moderno com até 10-13 pingentes e pendentes Pandora Moments.', '2200,00', 50),
(307, 15, 10, 'Bracelete Pandora Moments Em Trama', '599338C00', 'Aumente o nível do seu estilo com o Bracelete Pandora Moments Em Trama. Finalizado à  mão em prata de lei, esta pulseira de corrente de cobra apresenta três correntes de cobra finas e um fecho em forma de bola com o icônico logotipo e monograma da Pandora. Carregue esta pulseira de prata esterlina com seus berloques Pandora Moments favoritos, que podem ser estilizados da mesma maneira que em uma pulseira Pandora Moments normal. Esta pulseira servirá como sua peça que finaliza qualquer look com estilo.', '1100,00', 50),
(308, 15, 10, 'Bracelete Com Barras Brilhantes Em Pave', '599217C01', 'Eleve seu visual com o Bracelete Com Barras Brilhantes Em Pave. Finalizado à  mão em prata de lei, este design é inspirado em uma peça do arquivo de Pandora. Com barras rígidas decoradas com pedras claras menores colocadas entre as azuis maiores, esta pulseira inclui um fecho lagosta com uma etiqueta de pedra na ponta. Ajustável em tamanho, compense os tons frios desta pulseira com peças acabadas à  mão em Pandora Roseâ, (mistura única banhada a ouro rosa 14k).', '1350,00', 50),
(309, 15, 10, 'Bracelete Pandora Rose Brilho Matte', '587915', 'Pandora Rose Liga Metálica finalizado em Ouro Rose 14k', '2300,00', 50),
(310, 15, 10, 'Bracelete Pandora Cordão Brilho Glacial', '597558CZ', 'Exiba A Jornada Na Qual Você Se Encontra Com Um Padrão De Zigue-Zague De Pedras Transparentes Em Lapidação Baguete Para Usar Com elegância Ao Redor Do Pulso. Ajuste-O Para Encontrar O Tamanho Perfeito Para Você.', '1200,00', 50),
(311, 15, 10, 'Bracelete Pandora Novas Aventuras', '568051CZ', 'Deixe os tons azuis adicionarem sabor ao seu visual com esta pulseira deslizante em Ouro 14k, nossa mistura de metal única banhada a ouro 18k. A pulseira é perfeita para dar uma sensação de verão ao seu look e foi detalhada com esmalte azul aplicado à  mão e pedras de zircônias cúbicas transparentes, inspiradas nas linhas dos triângulos. Ajuste o fecho para o ajuste perfeito. Junte várias camadas para criar uma pilha de pulseiras personalizada ou use sozinha com a roupa perfeita.', '2550,90', 49),
(312, 15, 10, 'Bracelete Pandora Reflexions Com Fecho Em Pave', '589358C01', 'Adicione um pouco de brilho ao seu visual com o Bracelete Pandora Reflexions Com Fecho Em Pave. Apresentando um formato de fecho alongado com linhas diagonais de pavé de zircônias cúbicas transparentes na frente e uma parte traseira polida com o logotipo da Pandora, esta pulseira de malha fina finalizada com ouro rosa 14k é acabada à  mão. Projetada na estética minimalista moderna de Pandora Reflexions, esta pulseira em tons quentes é uma adição elegante, deslumbrante e sofisticada a qualquer visual.', '2300,00', 50),
(313, 13, 10, 'Pulseira Ouro Vivara e Rodolita', 'PU00016421', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\n3 mm</br>\r\nAltura: \r\n\r\naproximadamente 55,7 mm</br>\r\nPedra: \r\n\r\nRodolita</br>\r\n\r\nNúmero de pedras: \r\n\r\n1 rodolita</br>\r\nMaterial: \r\n\r\nOuro Vivara</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO ICONA</br>\r\n\r\nPulseira, confeccionada em ouro vivara 18k, rodolita e 19 pontos de diamantes.</br>\r\n\r\nInspiração Coleção Icona</br>\r\nSeguindo a inspiração do clássico repaginado, somado a força do Empoderamento feminino, a Vivara apresenta mais uma extensão de Icona, na sua primeira versão Color, que abre o lançamento com destaque a gema natural Granada Rodolita de tom pink intensa e hipnotizante que da match com o contexto inspiracional de imponência e poder.\r\n', '18990,00', 50),
(314, 13, 10, 'Pulseira Icona Prata', 'PU00016291', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 7 mm</br>\r\nDiâmetro: \r\n\r\naproximadamente 60x50 mm</br>\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO ICONA</br>\r\n\r\nPulseira Icona G, confeccionado em prata 925.</br>\r\n\r\nInspiração Coleção Icona</br>\r\nInspirada nas formas geométricas e na beleza da arquitetura contemporânea, a nova coleção Icona traz um design moderno e sofisticado. O minimalismo volta a influenciar nas escolhas do tempo atual, onde procuramos manter a essência através de construções de look que agregam valor e harmonia para o nosso dia a dia. O equilíbrio entre o minimalismo com a estrutura triangular, resultaram em uma coleção versátil, atemporal e sofisticada.', '2450,00', 50),
(315, 13, 10, 'Pulseira Prata com Ródio Negro e Safiras Negras', 'PU00016413', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\n66 mm</br>\r\nAltura: \r\n\r\naproximadamente 60 mm</br>\r\nPedra: \r\n\r\nSafira Negra</br>\r\n\r\nNúmero de pedras: \r\n\r\n122 safiras negras</br>\r\nMaterial: \r\n\r\nPrata</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO BOLD</br>\r\n\r\nPulseira, confeccionada em prata 925 com ródio negro e safiras negras.</br>\r\n\r\nInspiração Coleção Bold Collection</br>\r\nO luxuoso movimento Déco protagoniza composições modernistas que nos inspiram novamente trazendo a versão em prata 925 da coleção Bold Collection, com joias sofisticadas e impactantes. A coleção capta a essência da VIVARA combinando o célebre triângulo e trazendo a fluidez das silhuetas arredondadas das joias ao brilho único das safiras negras em contraste com a prata e o ródio negro.', '2990,00', 50),
(316, 13, 10, 'Pulseira Ouro Branco e Diamantes', 'PU00016314', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nPedra: \r\n\r\nDiamante, Diamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n24 pedras diamantes</br>\r\nCravação: \r\n\r\nGarra</br>\r\nPontuação Média: \r\n\r\n15,6 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Branco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO VIVARA</br>\r\n\r\nA Pulseira Lisa é confeccionada em ouro branco 18k e diamantes. Com design clean e elegante, a Pulseira Lisa Ouro Branco e Diamantes Vivara IV torna seus visuais mais sofisticados e dá um toque de brilho à s diferentes produções. A Pulseira Lisa Ouro Branco e Diamantes Vivara IV também pode ser combinada à s outras joias da coleção.</br>\r\n\r\nDetalhes</br>\r\n\r\nPulseira Lisa Vivara IV</br>\r\nMateriais: ouro branco 18k e diamantes</br>\r\nColeção: Vivara IV', '17990,00', 50),
(317, 13, 10, 'Pulseira Ouro Branco Ouro Amarelo e Diamantes', 'PU00016148', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nDiâmetro: \r\n\r\naproximadamente 6 cm</br>\r\nPedra: \r\n\r\nDiamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n176 Pedras</br>\r\nCravação: \r\n\r\nGarra</br>\r\nPontuação Média: \r\n\r\n70,4 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Amarelo, Ouro Branco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO VIVARA</br>\r\n\r\nPulseira Vivara, confeccionado em ouro amarelo 18k, ouro branco 18k e 71,6 pontos de diamantes.</br>\r\n\r\nInspiração Coleção Vivara</br>\r\nEm comemoração aos 55 da Vivara, nasce a coleção Vivara, uma celebração à  sua essência, sua tradição e excelência que há gerações transforma sonhos em joias. Ressignificando seus ícones em joias, reunimos nessa criação a interpretação do V de Vivara, que assina a coleção como uma forte insígnia da marca, único e marcante, descomplicado e elegante, inspirando confiança e tradição. As joias apresentam-se em formas clássicas e versáteis, com diferentes combinações de metal, acabamento e tipos de gemas. O V apresenta-se como destaque da joia, retratando um símbolo familiar e a certeza de uma experiência inesquecível.', '18990,00', 50),
(318, 13, 10, 'Pulseira Ouro Amarelo', 'PU00016466', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nInspiração Coleção Pulseira Ouro</br>\r\nA perfeição que representa um circulo inspirou a criação da coleção cheia de estilo e personalidade. As pulseiras adornam o pulso de forma maravilhosa e completa a lista do que devemos ter em qualquer tipo de ocasião, desde as mais formais até as casuais. Joias confeccionadas em ouro, perfeitas para todas as estações.', '5200,00', 50),
(319, 13, 10, 'Pulseira Ouro Amarelo Pérolas e Diamantes', 'PU00016366', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nPedra: \r\n\r\nDiamante, Pérola</br>\r\n\r\nNúmero de pedras: \r\n\r\n2 Perólas, 20 diamantes</br>\r\nCravação: \r\n\r\nColada</br>\r\nPontuação Média: \r\n\r\n10 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO VIVARA Pérolas</br>\r\n\r\nPulseira Pérola, confeccionada em ouro amarelo 18k, 2 pérolas e 10 pontos de diamantes.</br>\r\n\r\nInspiração Vivara Pérola</br>\r\nA coleção Vivara Pérola nasceu da conexão entre o sucesso da coleção identidade da marca, somada a forte tendência de metais com pérolas. Seu design triangular teve inspiração no V e é fortalecido a cada coleção compondo esta linda história de sucesso da Vivara. Neste conjunto temos o ouro amarelo, clássico da joalheria, a pérola que nos conecta com o natural e os diamantes em pavê que proporcionam mais brilho na composição. Sua estrutura versátil e leve permite compor possibilidades práticas que proporcionam um visual ultra feminino.', '14500,00', 50),
(320, 13, 10, 'Pulseira Ouro Branco e Diamantes', 'PU00016034', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nLargura: \r\n\r\n60 mm</br>\r\nAltura: \r\n\r\naproximadamente 50 mm</br>\r\nPedra: \r\n\r\nDiamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n286 diamantes</br>\r\nPontuação Média: \r\n\r\n244 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Branco</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nSim</br>\r\nCOLEÇÃO AFLUENTE</br>\r\n\r\nPulseira Afluente, confeccionada em ouro branco 18k e 244 pontos de diamantes.</br>\r\n\r\nInspiração Coleção Afluente</br>\r\nA força das águas e o trajeto dos rios revelam novos caminhos coleção. Nesta coleção ouro branco e diamantes desenham esses trajetos criados pela natureza através das águas.', '42990,00', 50),
(321, 13, 10, 'Pulseira Icona Ouro Amarelo e Diamante', 'PU00016299', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nAltura: \r\n\r\naproximadamente 6,5 mm</br>\r\nDiâmetro: \r\n\r\naproximadamente 60 mm</br>\r\nPedra: \r\n\r\nDiamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n1 pedra diamante</br>\r\nCravação: \r\n\r\nGarra</br>\r\nPontuação Média: \r\n\r\n3 pontos diamantes</br>\r\nMaterial: \r\n\r\nOuro Amarelo</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\nCOLEÇÃO ICONA</br>\r\n\r\nPulseira Icona G, confeccionado em ouro 18k com 3 pontos de diamantes.</br>\r\n\r\nInspiração Coleção Icona</br>\r\nInspirada nas formas geométricas e na beleza da arquitetura contemporânea, a nova coleção Icona traz um design moderno e sofisticado. O minimalismo volta a influenciar nas escolhas do tempo atual, onde procuramos manter a essência através de construções de look que agregam valor e harmonia para o nosso dia a dia. O equilíbrio entre o minimalismo com a estrutura triangular, resultaram em uma coleção versátil, atemporal e sofisticada.', '20990,00', 50),
(322, 13, 10, 'Pulseira Riviera Ouro Rosé e Diamantes', 'PU00015901', 'DESCRIÇÃO E COMPOSIÇÃO</br>\r\n\r\nPedra: \r\n\r\nDiamante</br>\r\n\r\nNúmero de pedras: \r\n\r\n72 diamantes</br>\r\nPontuação Média: \r\n\r\n144 pontos de diamantes</br>\r\nMaterial: \r\n\r\nOuro Rosé</br>\r\n\r\nSugestão: \r\n\r\nPara ela</br>\r\n\r\nRódio: \r\n\r\nNão</br>\r\nCOLEÇÃO ESPECIAL</br>\r\n\r\nPulseira Riviera, confeccionada em ouro rosé 18k e 144 pontos de diamantes.</br>\r\n\r\nInspiração Coleção Especial</br>\r\nA coleção Riviera é confeccionada de forma primorosa inspirada na clássica alta joalheria. Sua maleabilidade traz conforto e as pedras naturais lineares emitem luminosidade deslumbrante. Esta é a joia atemporal que permite compor com relógio, com outras pulseiras e outros acessórios de luxo. Aproveite a tendência do pulseirismo para compor perfeitamente com as clássicas Rivieras Vivara.', '19500,00', 50),
(323, 26, 9, 'Anel de sinete Alexander the Great', 'R75CMCO01S', 'Material: prata esterlina.</br>\r\nLargura da faixa 0,5 cm</br>\r\nCircunferência 58 cm</br>\r\nComprimento característico 1,6 cm</br>\r\nLargura característica 1,6 cm\r\n', '3800,00', 5),
(324, 26, 9, 'Anel de sinete Peaky com malaquita', 'R75SMGRM01', 'Aro sinete, malaquita e logo gravado. </br>\r\nMaterial: prata esterlina.</br> \r\nCor: Prateado.', '3500,00', 5),
(325, 26, 9, 'Anel Clytia com aplicação de ánix', 'R75WKCBOM0', 'Anel Clytia com aplicação de ônix</br>\r\nDetalhes em ônix, aro sinete e modelagem slip-on. Material: prata esterlina.', '3500,00', 5),
(326, 26, 9, 'Anel em prata Tom Wood', 'R74IDNA02S', 'Acabamento acetinado, acabamento polido e modelagem slip-on. </br>\r\nMaterial: prata esterlina.', '3300,00', 5),
(327, 25, 11, 'COLAR LV INITIALS', 'M80208', 'Um charm de Monogram Flower com acabamento em resina traz uma explosão de cores a este colar LV Initials. O pingente principal apresenta uma reinterpretação em camadas das LV Initials: uma cravejada com cristais e a outra sem aplicações. Esta coleção faz conjunto com brincos que também contam com incrustações elaboradas de cristais.', '4450,00', 5),
(328, 25, 11, 'COLAR LV SQUARED DOURADO', 'MP2692', 'Um acabamento texturizado e envelhecido dá um toque vintage ao colar LV Squared dourado. Esta peça faz parte da colaboração com o artista japonês Nigo, que mescla a cultura de rua japonesa e a refinada estética dândi. O pingente com a versão repaginada de Nigo das LV Initials é exibido em uma corrente confeccionada com elos delicadamente torcidos.', '4850,00', 7),
(329, 25, 11, 'COLAR COM PLACA MONOGRAM ECLIPSE', 'M63640', 'Com seu icônico canvas Monogram Eclipse aplicado diretamente no metal, este colar essencial tem um toque masculino sofisticado. Como um amuleto, sua placa se abre oferecendo um local secreto a seu usuário.', '3150,00', 3),
(330, 25, 11, 'COLAR MONOGRAMA', 'M80189', 'As linhas elegantes e as ferragens polidas deste colar Monogram conferem-lhe uma estética intemporal. Pendurado na corrente fina está um anel gravado com Monogram Flowers, o ponto focal do colar. O anel é complementado por um delicado charm com as iniciais LV e um pingente redondo gravado com o icônico motivo Monogram.', '3200,00', 6),
(331, 14, 9, 'ANEL PANTHàˆRE DE CARTIER ', 'N4765800', 'Anel Panthàre de Cartier, ouro amarelo 18K, ônix, engastado com 2 esmeraldas e 72 diamantes lapidação brilhante totalizando 0,68 ct.', '117000,00', 6),
(332, 14, 9, 'ANEL PANTHÉRE DE CARTIER GOLD AND GREEN', 'N4722500', 'Anel Panthàre de Cartier Gold and Green, ouro branco 18K, ouro amarelo, granadas tsavoritas, ônix.', '140000,00', 10),
(333, 14, 9, 'ANEL JUSTE UN CLOU', 'B4211800', 'Anel Juste un Clou, ouro amarelo 18K, engastado com 14 diamantes lapidação brilhante totalizando 0,08 ct.', '20000,00', 12),
(334, 14, 9, 'SOLITÁRIO 1895', 'N4235100', 'Anel Solitário 1895, ouro amarelo 18K, engastado com um diamante de lapidação brilhante.', '75000,00', 15),
(335, 14, 8, 'BRINCOS CLASH ', 'B8301415', 'Modelo pequeno, ouro rosa 18K. </br>Largura 6,4 mm. </br>Diâmetro interno 16,2 mm.', '23000,00', 13),
(336, 14, 8, 'BRINCOS JUSTE UN CLOU', 'B8301212', 'Ouro rosa 18K, engastados com 28 diamantes lapidação brilhante totalizando 0,17 ct.', '45000,00', 15),
(338, 14, 8, 'BRINCO PANTHÁRE CHAINS', 'N8515072', 'Ouro amarelo 18K, engastados com 34 diamantes lapidação brilhante totalizando 0,09 ct, olhos em granada tsavorita, ônix. ', '100000,00', 13),
(339, 14, 8, 'BRINCOS ETINCELLE ', 'B8301247', 'Brinco de argola Etincelle, ouro amarelo 18K, cada um deles engastado com 37 diamantes lapidação brilhante totalizando 0,33 ct. ', '5000,00', 15),
(341, 14, 8, 'BRINCOS LES OISEAUX LIBÉRÉS', 'N8503300', 'Ouro branco 18K, cada um engastado com 237 diamantes lapidação brilhante totalizando 2,03 ct.', '190000,00', 9),
(342, 14, 8, 'BRINCOS PANTHÁRE SILVER AND BLACK ', 'N8503700', 'Ouro branco 18 quilates inteiramente cravejado de diamantes, anéis em jade preta, manchas em ônix, focinho em ônix e olhos em esmeralda. ', '99000,00', 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `CODIGO` int(11) NOT NULL,
  `COD_CLIENTE` int(11) NOT NULL,
  `LOGINUSU` varchar(50) NOT NULL,
  `SENHA` varchar(12) NOT NULL,
  `USER` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`CODIGO`, `COD_CLIENTE`, `LOGINUSU`, `SENHA`, `USER`) VALUES
(10, 41, 'adm@gmail.com', '123', 'A'),
(11, 42, 'carolinegabriel@gmail.com', '123', 'C'),
(12, 43, 'keith@gmail.com', '123', 'C'),
(13, 44, 'manuela@gmail.com', '123', 'C'),
(14, 45, 'evaristo@gmail.com', '123', 'C'),
(15, 46, 'thiago@gmail.com', '123', 'C');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_varias_img`
--

CREATE TABLE `tb_varias_img` (
  `CODIGO` int(11) NOT NULL,
  `CHAVE_IMG_PROD` int(11) NOT NULL,
  `CAMINHO_IMG` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_varias_img`
--

INSERT INTO `tb_varias_img` (`CODIGO`, `CHAVE_IMG_PROD`, `CAMINHO_IMG`) VALUES
(55, 63, './img/produtos/oa1_1.jpg'),
(56, 63, './img/produtos/oa1_2.jpg'),
(64, 68, './img/produtos/oa2_1.jpg'),
(65, 68, './img/produtos/oa2_2.jpg'),
(80, 76, './img/produtos/oa3_2.jpg'),
(81, 76, './img/produtos/oa3_1.jpg'),
(82, 77, './img/produtos/oa4_1.jpg'),
(83, 77, './img/produtos/oa4_2.jpg'),
(85, 79, './img/produtos/A1CART.jpg'),
(86, 80, './img/produtos/A2CART.png'),
(87, 81, './img/produtos/A3CART.jpg'),
(88, 82, './img/produtos/A4CART.jpg'),
(89, 83, './img/produtos/A5CART.jpg'),
(90, 84, './img/produtos/A6CART.jpg'),
(91, 85, './img/produtos/oL1_1.jpg'),
(92, 85, './img/produtos/oL1_2.jpg'),
(93, 86, './img/produtos/oL2_1.jpg'),
(94, 86, './img/produtos/oL2_2.jpg'),
(95, 87, './img/produtos/oL3_1.png'),
(96, 87, './img/produtos/oL3_2.png'),
(97, 88, './img/produtos/oL4_1.jpg'),
(98, 88, './img/produtos/oL4_2.jpg'),
(99, 89, './img/produtos/onk1_1.png'),
(100, 89, './img/produtos/onk1_2.png'),
(101, 90, './img/produtos/onk2_1.png'),
(102, 90, './img/produtos/onk2_2.png'),
(103, 91, './img/produtos/onk3_1.png'),
(104, 91, './img/produtos/onk3_2.png'),
(105, 92, './img/produtos/onk4_1.png'),
(106, 92, './img/produtos/onk4_2.png'),
(107, 93, './img/produtos/oo1_1.jpeg'),
(108, 93, './img/produtos/oo1_2.jpeg'),
(109, 94, './img/produtos/oo2_1.jpeg'),
(110, 94, './img/produtos/oo2_2.jpeg'),
(111, 95, './img/produtos/oo3_1.jpeg'),
(112, 95, './img/produtos/oo3_2.jpeg'),
(113, 96, './img/produtos/oo4_1.png'),
(114, 96, './img/produtos/oo4_2.png'),
(115, 97, './img/produtos/op1_1.png'),
(116, 97, './img/produtos/op1_2.png'),
(117, 98, './img/produtos/op2_1.png'),
(118, 98, './img/produtos/op2_2.png'),
(119, 99, './img/produtos/op3_1.png'),
(120, 99, './img/produtos/op3_2.png'),
(121, 100, './img/produtos/op4_1.png'),
(122, 100, './img/produtos/op4_2.png'),
(123, 101, './img/produtos/onkg1_1.png'),
(124, 101, './img/produtos/onkg1_2.png'),
(125, 102, './img/produtos/onkg2_1.png'),
(126, 102, './img/produtos/onkg2_2.png'),
(127, 103, './img/produtos/onkg3_1.jpeg'),
(128, 103, './img/produtos/onkg3_2.jpeg'),
(129, 104, './img/produtos/onkg4_1.jpeg'),
(130, 104, './img/produtos/onkg4_2.jpeg'),
(131, 105, './img/produtos/oog1_1.jpg'),
(132, 105, './img/produtos/oog1_2.jpg'),
(133, 106, './img/produtos/oog2_1.jpg'),
(134, 106, './img/produtos/oog2_2.jpg'),
(135, 107, './img/produtos/oog3_1.png'),
(136, 107, './img/produtos/oog3_2.png'),
(137, 108, './img/produtos/oog4_1.png'),
(138, 108, './img/produtos/oog4_2.png'),
(139, 109, './img/produtos/opg1_1.jpg'),
(140, 109, './img/produtos/opg1_2.jpg'),
(141, 110, './img/produtos/opg2_1.jpg'),
(142, 110, './img/produtos/opg2_2.jpg'),
(143, 111, './img/produtos/opg3_1.png'),
(144, 111, './img/produtos/oog3_2.png'),
(145, 112, './img/produtos/opg4_1.png'),
(146, 112, './img/produtos/opg4_2.png'),
(147, 113, './img/produtos/orbg1_1.jpg'),
(148, 113, './img/produtos/orbg1_2.jpg'),
(149, 114, './img/produtos/orbg2_1.jpg'),
(150, 114, './img/produtos/orbg2_2.jpg'),
(151, 115, './img/produtos/orbg3_1.jpg'),
(152, 115, './img/produtos/orbg3_2.jpg'),
(153, 116, './img/produtos/orbg4_1.jpg'),
(154, 116, './img/produtos/orbg4_2.jpg'),
(155, 117, './img/produtos/oc1_1.jpg'),
(156, 117, './img/produtos/oc1_2.jpg'),
(166, 125, './img/produtos/oc2_1.jpg'),
(167, 125, './img/produtos/oc2_2.jpg'),
(168, 126, './img/produtos/oc3_1.jpg'),
(169, 126, './img/produtos/oc3_2.jpg'),
(170, 127, './img/produtos/oc4_1.jpg'),
(171, 127, './img/produtos/oc4_2.jpg'),
(172, 128, './img/produtos/od1_1.jpg'),
(173, 128, './img/produtos/od1_2.jpg'),
(174, 129, './img/produtos/od2_1.jpg'),
(175, 129, './img/produtos/od2_2.jpg'),
(176, 130, './img/produtos/od3_1.jpg'),
(177, 130, './img/produtos/od3_2.jpg'),
(178, 131, './img/produtos/od4_1.jpg'),
(179, 131, './img/produtos/od4_2.jpg'),
(180, 132, './img/produtos/og1_1.jpg'),
(181, 132, './img/produtos/og1_2.jpg'),
(182, 133, './img/produtos/og2_1.jpg'),
(183, 133, './img/produtos/og2_2.jpg'),
(184, 134, './img/produtos/og3_1.jpg'),
(185, 134, './img/produtos/og3_2.jpg'),
(186, 135, './img/produtos/og4_1.jpg'),
(187, 135, './img/produtos/og4_2.jpg'),
(188, 136, './img/produtos/ov1_1.jpg'),
(189, 136, './img/produtos/ov1_2.jpg'),
(190, 137, './img/produtos/ov2_1.jpg'),
(191, 137, './img/produtos/ov2_2.jpg'),
(192, 138, './img/produtos/ov3_1.jpg'),
(193, 138, './img/produtos/ov3_2.jpg'),
(194, 139, './img/produtos/ov4_1.jpg'),
(195, 139, './img/produtos/ov4_2.jpg'),
(196, 140, './img/produtos/och1_1.jpg'),
(197, 140, './img/produtos/och1_2.jpg'),
(198, 141, './img/produtos/och2_1.jpg'),
(199, 141, './img/produtos/och2_2.jpg'),
(200, 142, './img/produtos/och3_1.jpg'),
(201, 142, './img/produtos/och3_2.jpg'),
(202, 143, './img/produtos/och4_1.jpg'),
(203, 143, './img/produtos/och4_2.jpg'),
(204, 144, './img/produtos/och4_1.jpg'),
(205, 144, './img/produtos/och4_2.jpg'),
(206, 145, './img/produtos/oco1_1.jpg'),
(207, 145, './img/produtos/oco1_2.jpg'),
(208, 146, './img/produtos/oco2_1.jpg'),
(209, 146, './img/produtos/oco2_2.jpg'),
(210, 147, './img/produtos/oco3_1.jpg'),
(211, 147, './img/produtos/oco3_2.jpg'),
(212, 148, './img/produtos/oco4_1.jpg'),
(213, 148, './img/produtos/oco4_2.jpg'),
(214, 149, './img/produtos/op1_1.jpg'),
(215, 149, './img/produtos/op1_2.jpg'),
(216, 150, './img/produtos/op2_1.jpg'),
(217, 150, './img/produtos/op2_2.jpg'),
(218, 151, './img/produtos/op3_1.jpg'),
(219, 151, './img/produtos/op3_2.jpg'),
(220, 152, './img/produtos/op4_1.jpg'),
(221, 152, './img/produtos/op4_2.jpg'),
(222, 153, './img/produtos/ovi1_1.jpg'),
(223, 153, './img/produtos/ovi1_2.jpg'),
(224, 154, './img/produtos/ovi2_1.jpg'),
(225, 154, './img/produtos/ovi2_2.jpg'),
(226, 156, './img/produtos/ovi3_1.jpg'),
(227, 156, './img/produtos/ovi3_2.jpg'),
(228, 157, './img/produtos/ovi4_1.jpg'),
(229, 157, './img/produtos/ovi4_2.jpg'),
(230, 158, './img/produtos/rg1.jpg'),
(231, 159, './img/produtos/rg2.jpg'),
(232, 160, './img/produtos/rg3.jpg'),
(233, 161, './img/produtos/rg4.jpg'),
(234, 162, './img/produtos/rg5.jpg'),
(235, 163, './img/produtos/rg6.jpg'),
(236, 164, './img/produtos/rl1.jpg'),
(237, 165, './img/produtos/rl2.jpg'),
(238, 166, './img/produtos/rl3.jpg'),
(239, 167, './img/produtos/rl4.jpg'),
(240, 168, './img/produtos/rl5.jpg'),
(241, 169, './img/produtos/rl6.jpg'),
(242, 170, './img/produtos/ro1.jpg'),
(243, 171, './img/produtos/ro2.jpg'),
(244, 172, './img/produtos/ro3.jpg'),
(245, 173, './img/produtos/ro4.jpg'),
(246, 174, './img/produtos/ro5.jpg'),
(247, 175, './img/produtos/ro6.jpg'),
(248, 176, './img/produtos/rt1.jpg'),
(249, 178, './img/produtos/rt2.jpg'),
(250, 179, './img/produtos/rt3.jpg'),
(251, 180, './img/produtos/rt4.jpg'),
(252, 181, './img/produtos/rt5.jpg'),
(253, 182, './img/produtos/rt6.jpg'),
(254, 183, './img/produtos/ap1.jpg'),
(255, 184, './img/produtos/ap2.jpg'),
(256, 185, './img/produtos/ap3.jpg'),
(257, 186, './img/produtos/ap4.jpg'),
(258, 187, './img/produtos/ap5.jpg'),
(259, 188, './img/produtos/ap6.jpg'),
(260, 189, './img/produtos/ap7.jpg'),
(261, 190, './img/produtos/ap8.jpg'),
(262, 191, './img/produtos/ap9.jpg'),
(263, 192, './img/produtos/ap10.jpg'),
(264, 193, './img/produtos/av1.jpg'),
(265, 194, './img/produtos/av2.jpg'),
(266, 195, './img/produtos/av3.jpg'),
(267, 196, './img/produtos/av4.jpg'),
(268, 197, './img/produtos/av5.jpg'),
(269, 198, './img/produtos/av6.jpg'),
(270, 199, './img/produtos/av7.jpg'),
(271, 200, './img/produtos/av8.jpg'),
(272, 201, './img/produtos/av9.jpg'),
(273, 202, './img/produtos/av10.jpg'),
(274, 203, './img/produtos/bp1.jpg'),
(275, 204, './img/produtos/bp2.jpg'),
(276, 205, './img/produtos/bp3.jpg'),
(277, 206, './img/produtos/bp4.jpg'),
(278, 207, './img/produtos/bp5.jpg'),
(279, 208, './img/produtos/bp6.jpg'),
(280, 209, './img/produtos/bp8.jpg'),
(281, 210, './img/produtos/bp9.jpg'),
(282, 211, './img/produtos/bp10.jpg'),
(283, 212, './img/produtos/rC1.png'),
(284, 213, './img/produtos/rC2.png'),
(285, 214, './img/produtos/rC3.png'),
(286, 215, './img/produtos/rC4.png'),
(287, 216, './img/produtos/rD1.png'),
(288, 217, './img/produtos/rD2.png'),
(289, 218, './img/produtos/rD3.png'),
(290, 219, './img/produtos/rD4.png'),
(291, 220, './img/produtos/rL1.png'),
(292, 221, './img/produtos/rL2.png'),
(293, 222, './img/produtos/rL3.png'),
(294, 223, './img/produtos/rL4.png'),
(295, 224, './img/produtos/rP1.png'),
(296, 225, './img/produtos/rP2.png'),
(297, 226, './img/produtos/rP3.png'),
(298, 227, './img/produtos/rP4.png'),
(299, 228, './img/produtos/bv1.jpg'),
(300, 229, './img/produtos/bv2.jpg'),
(301, 230, './img/produtos/bv3.jpg'),
(302, 231, './img/produtos/bv4.jpg'),
(303, 232, './img/produtos/bv5.jpg'),
(304, 233, './img/produtos/bv6.jpg'),
(305, 234, './img/produtos/bv7.jpg'),
(306, 235, './img/produtos/bv8.jpg'),
(307, 236, './img/produtos/bv9.jpg'),
(308, 237, './img/produtos/bv10.jpg'),
(309, 238, './img/produtos/cp1.jpg'),
(310, 239, './img/produtos/cp2.jpg'),
(311, 240, './img/produtos/cp3.jpg'),
(312, 241, './img/produtos/cp4.jpg'),
(313, 242, './img/produtos/cp5.jpg'),
(314, 243, './img/produtos/cp6.jpg'),
(315, 244, './img/produtos/cp7.jpg'),
(316, 245, './img/produtos/cp8.jpg'),
(317, 246, './img/produtos/cp9.jpg'),
(318, 247, './img/produtos/cp10.jpg'),
(319, 248, './img/produtos/cv1.jpg'),
(320, 249, './img/produtos/cv2.jpg'),
(321, 250, './img/produtos/cv3.jpg'),
(322, 251, './img/produtos/cv4.jpg'),
(323, 252, './img/produtos/cv5.jpg'),
(324, 253, './img/produtos/cv6.jpg'),
(325, 254, './img/produtos/cv7.jpg'),
(327, 256, './img/produtos/cv9.jpg'),
(328, 257, './img/produtos/cv10.jpg'),
(329, 258, './img/produtos/avc1.png'),
(330, 259, './img/produtos/avc2.png'),
(331, 260, './img/produtos/avc3.png'),
(332, 261, './img/produtos/avc4.png'),
(333, 262, './img/produtos/av1.png'),
(334, 263, './img/produtos/av2.png'),
(335, 264, './img/produtos/av3.png'),
(336, 265, './img/produtos/av4.png'),
(337, 266, './img/produtos/amc1.png'),
(338, 267, './img/produtos/amc2.png'),
(339, 268, './img/produtos/amc3.png'),
(340, 269, './img/produtos/amc4.png'),
(341, 270, './img/produtos/cvm1.png'),
(342, 271, './img/produtos/cvm2.png'),
(343, 272, './img/produtos/cvm3.png'),
(344, 273, './img/produtos/cvm4.png'),
(345, 274, './img/produtos/cmcm1.png'),
(346, 275, './img/produtos/cmcm2.png'),
(347, 276, './img/produtos/cmcm3.png'),
(348, 277, './img/produtos/cmcm4.png'),
(349, 278, './img/produtos/ctm1.png'),
(350, 279, './img/produtos/ctm2.png'),
(352, 281, './img/produtos/ctm4.png'),
(354, 283, './img/produtos/pingente1.jpg'),
(355, 284, './img/produtos/pingente2.jpg'),
(356, 285, './img/produtos/pingente3.jpg'),
(357, 286, './img/produtos/pingente4.jpg'),
(358, 287, './img/produtos/pingente5.jpg'),
(359, 288, './img/produtos/pingente6.jpg'),
(360, 289, './img/produtos/pingente7.jpg'),
(361, 290, './img/produtos/pingente8.jpg'),
(362, 291, './img/produtos/pingente9.jpg'),
(363, 292, './img/produtos/pingente10.jpg'),
(364, 293, './img/produtos/pip1.jpg'),
(365, 294, './img/produtos/pip2.jpg'),
(366, 295, './img/produtos/pip3.jpg'),
(367, 296, './img/produtos/pip4.jpg'),
(368, 297, './img/produtos/pip5.jpg'),
(369, 298, './img/produtos/pip6.jpg'),
(370, 299, './img/produtos/pip7.jpg'),
(371, 300, './img/produtos/pip8.jpg'),
(372, 301, './img/produtos/pip9.jpg'),
(373, 302, './img/produtos/pip10.jpg'),
(374, 303, './img/produtos/pp1.jpg'),
(375, 304, './img/produtos/pp2.jpg'),
(376, 305, './img/produtos/pp3.jpg'),
(377, 306, './img/produtos/pp4.jpg'),
(378, 307, './img/produtos/pp5.jpg'),
(379, 308, './img/produtos/pp6.jpg'),
(380, 309, './img/produtos/pp7.jpg'),
(381, 310, './img/produtos/pp8.jpg'),
(382, 311, './img/produtos/pp9.jpg'),
(383, 312, './img/produtos/pp10.jpg'),
(384, 313, './img/produtos/pv1.jpg'),
(385, 314, './img/produtos/pv2.jpg'),
(386, 315, './img/produtos/pv3.jpg'),
(387, 316, './img/produtos/pv4.jpg'),
(388, 317, './img/produtos/pv5.jpg'),
(389, 318, './img/produtos/pv6.jpg'),
(390, 319, './img/produtos/pv7.jpg'),
(391, 320, './img/produtos/pv8.jpg'),
(392, 321, './img/produtos/pv9.jpg'),
(393, 322, './img/produtos/pv10.jpg'),
(394, 323, './img/produtos/atw1.png'),
(395, 324, './img/produtos/atw2.png'),
(396, 325, './img/produtos/atw3.png'),
(397, 326, './img/produtos/atw4.png'),
(398, 327, './img/produtos/clvm1.png'),
(399, 328, './img/produtos/clvm2.png'),
(400, 329, './img/produtos/clvm3.png'),
(401, 330, './img/produtos/clvm4.png'),
(402, 331, './img/produtos/A7CART.jpg'),
(403, 332, './img/produtos/A8CART.jpg'),
(404, 333, './img/produtos/A9CART.jpg'),
(405, 334, './img/produtos/A10CART.png'),
(406, 335, './img/produtos/B1CART.jpg'),
(407, 336, './img/produtos/B2CART.png'),
(409, 338, './img/produtos/B4CART.png'),
(410, 339, './img/produtos/B5CART.jpg'),
(412, 341, './img/produtos/B7CART.jpg'),
(413, 342, './img/produtos/B8CART.jpg');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_carrinho`
--
ALTER TABLE `tb_carrinho`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `CLIENTE_CODI` (`COD_CLIENTE`);

--
-- Índices para tabela `tb_cartao`
--
ALTER TABLE `tb_cartao`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `CLIENTE` (`COD_CLIENTE`),
  ADD KEY `CARRINHO` (`COD_CARRINHO`);

--
-- Índices para tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Índices para tabela `tb_codigo_prod`
--
ALTER TABLE `tb_codigo_prod`
  ADD PRIMARY KEY (`COD_CATEGORIA`);

--
-- Índices para tabela `tb_item_carrinho`
--
ALTER TABLE `tb_item_carrinho`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `CARRINH` (`CODIGO_CARRINHO`),
  ADD KEY `COD_ITEM` (`COD_ITEM`);

--
-- Índices para tabela `tb_marca`
--
ALTER TABLE `tb_marca`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Índices para tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`COD_PRODUTO`),
  ADD KEY `CAT_PROD` (`CATEGORIAS`),
  ADD KEY `MARCA_PRODUTO` (`MARCA`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `CLIENTE_COD` (`COD_CLIENTE`);

--
-- Índices para tabela `tb_varias_img`
--
ALTER TABLE `tb_varias_img`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `CODIGO` (`CHAVE_IMG_PROD`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_carrinho`
--
ALTER TABLE `tb_carrinho`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `tb_cartao`
--
ALTER TABLE `tb_cartao`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código cartão', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo do cliente', AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `tb_codigo_prod`
--
ALTER TABLE `tb_codigo_prod`
  MODIFY `COD_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo da categoria do produto', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tb_item_carrinho`
--
ALTER TABLE `tb_item_carrinho`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `tb_marca`
--
ALTER TABLE `tb_marca`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo da marca', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `COD_PRODUTO` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código do produto', AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tb_varias_img`
--
ALTER TABLE `tb_varias_img`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=416;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_carrinho`
--
ALTER TABLE `tb_carrinho`
  ADD CONSTRAINT `CLIENTE_CODI` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `tb_cliente` (`CODIGO`);

--
-- Limitadores para a tabela `tb_cartao`
--
ALTER TABLE `tb_cartao`
  ADD CONSTRAINT `CARRINHO` FOREIGN KEY (`COD_CARRINHO`) REFERENCES `tb_carrinho` (`CODIGO`),
  ADD CONSTRAINT `CLIENTE` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `tb_cliente` (`CODIGO`);

--
-- Limitadores para a tabela `tb_item_carrinho`
--
ALTER TABLE `tb_item_carrinho`
  ADD CONSTRAINT `CARRINH` FOREIGN KEY (`CODIGO_CARRINHO`) REFERENCES `tb_carrinho` (`CODIGO`),
  ADD CONSTRAINT `COD_ITEM` FOREIGN KEY (`COD_ITEM`) REFERENCES `tb_produto` (`COD_PRODUTO`);

--
-- Limitadores para a tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD CONSTRAINT `CAT_PROD` FOREIGN KEY (`CATEGORIAS`) REFERENCES `tb_codigo_prod` (`COD_CATEGORIA`),
  ADD CONSTRAINT `MARCA_PRODUTO` FOREIGN KEY (`MARCA`) REFERENCES `tb_marca` (`CODIGO`);

--
-- Limitadores para a tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `CLIENTE_COD` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `tb_cliente` (`CODIGO`);

--
-- Limitadores para a tabela `tb_varias_img`
--
ALTER TABLE `tb_varias_img`
  ADD CONSTRAINT `tb_varias_img_ibfk_1` FOREIGN KEY (`CHAVE_IMG_PROD`) REFERENCES `tb_produto` (`COD_PRODUTO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
