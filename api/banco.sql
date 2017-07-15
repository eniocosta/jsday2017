-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.18-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela jsday.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `comentario_id` int(11) DEFAULT NULL,
  `sugestao_id` int(11) DEFAULT NULL,
  `cmt_titulo` varchar(255) DEFAULT NULL,
  `cmt_texto` text,
  `cmt_status` enum('S','N') DEFAULT 'S',
  `cmt_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela jsday.comentario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;

-- Copiando estrutura para tabela jsday.sugestao
CREATE TABLE IF NOT EXISTS `sugestao` (
  `sugestao_id` int(11) NOT NULL AUTO_INCREMENT,
  `tema_sugestao_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `sug_titulo` varchar(255) DEFAULT NULL,
  `sug_ilustracao` varchar(255) DEFAULT NULL,
  `sug_descricao` text,
  `cadastrado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `excluido` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`sugestao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela jsday.sugestao: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sugestao` DISABLE KEYS */;
INSERT INTO `sugestao` (`sugestao_id`, `tema_sugestao_id`, `usuario_id`, `sug_titulo`, `sug_ilustracao`, `sug_descricao`, `cadastrado`, `atualizado`, `excluido`) VALUES
	(1, 2, NULL, 'Nova pista de Skate', 'skate.jpg', 'Skate é um esporte radical muito praticado atualmente. Consiste em, realizar manobras deslizando sobre o solo (com ou sem obstáculos) equilibrando-se sobre o skate. O skate é uma prancha (shape) que possui dois eixos (trucks), rolamentos e quatro pequenas rodas.<br/>\r\nMais do que um esporte, o skate tornou-se um estilo de vida. Os skatistas usam roupas características, tem suas próprias gírias e costumes.<br/>\r\nOs jovens de Feira de Santana estão necessitando de uma nova e maior pista para a prática do esporte!', '2017-07-15 00:00:00', '2017-07-15 11:17:06', NULL),
	(2, 2, NULL, 'Subway no FeiraVI', NULL, 'Somos estudantes, temos pouco dinheiro e estamos com fome! Um subway ajudaria tanto na hora do almoço quanto na janta! TOP DEMAIS!', '2017-07-15 00:00:00', '2017-07-15 15:22:48', NULL),
	(3, 1, 1, 'Testando cadastro de Sugestão', 'Ilustracao.jpg', 'Pequena descricao!', '2017-07-15 15:45:41', '2017-07-15 15:45:41', NULL);
/*!40000 ALTER TABLE `sugestao` ENABLE KEYS */;

-- Copiando estrutura para tabela jsday.tema_sugestao
CREATE TABLE IF NOT EXISTS `tema_sugestao` (
  `tema_sugestao_id` int(11) NOT NULL AUTO_INCREMENT,
  `tem_nome` varchar(100) DEFAULT NULL,
  `tem_tema` varchar(100) DEFAULT NULL,
  `cadastrado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `excluido` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tema_sugestao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela jsday.tema_sugestao: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tema_sugestao` DISABLE KEYS */;
INSERT INTO `tema_sugestao` (`tema_sugestao_id`, `tem_nome`, `tem_tema`, `cadastrado`, `atualizado`, `excluido`) VALUES
	(1, 'Saúde', 'saude', '2017-07-15 10:56:21', '2017-07-15 14:46:27', NULL),
	(2, 'Lazer', 'lazer', '2017-07-15 10:56:21', '2017-07-15 14:46:28', NULL),
	(3, 'Segurança', 'seguranca', '2017-07-15 10:56:21', '2017-07-15 14:46:31', NULL),
	(4, 'Esporte', 'esporte', '2017-07-15 15:07:45', '2017-07-15 15:07:45', NULL);
/*!40000 ALTER TABLE `tema_sugestao` ENABLE KEYS */;

-- Copiando estrutura para tabela jsday.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id` int(11) DEFAULT NULL,
  `usr_nome` varchar(150) DEFAULT NULL,
  `usr_email` varchar(150) DEFAULT NULL,
  `usr_senha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela jsday.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela jsday.voto
CREATE TABLE IF NOT EXISTS `voto` (
  `voto_id` int(11) NOT NULL AUTO_INCREMENT,
  `sugestao_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `vot_opiniao` enum('L','D') NOT NULL DEFAULT 'L',
  `vot_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vot_ip` varchar(50) DEFAULT NULL,
  `cadastrado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `excluido` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`voto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela jsday.voto: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `voto` DISABLE KEYS */;
INSERT INTO `voto` (`voto_id`, `sugestao_id`, `usuario_id`, `vot_opiniao`, `vot_data`, `vot_ip`, `cadastrado`, `atualizado`, `excluido`) VALUES
	(1, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(2, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(3, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(4, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(5, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(6, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(7, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(8, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(9, 1, 1, 'D', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(10, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(11, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(12, 1, 1, 'L', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(13, 1, 1, 'D', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(14, 1, 1, 'D', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(15, 1, 1, 'D', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(16, 1, 1, 'D', '2017-07-15 14:15:13', '127.0.0.1', '2017-07-15 14:25:26', '2017-07-15 14:25:26', NULL),
	(17, 2, 1, 'L', '2017-07-15 15:15:18', '127.0.0.1', '2017-07-15 15:15:18', '2017-07-15 15:17:07', NULL),
	(18, 2, 1, 'L', '2017-07-15 15:15:36', '127.0.0.1', '2017-07-15 15:15:36', '2017-07-15 15:17:07', NULL),
	(19, 2, 1, 'L', '2017-07-15 15:16:07', '127.0.0.1', '2017-07-15 15:16:07', '2017-07-15 15:17:08', NULL),
	(20, 2, 1, 'L', '2017-07-15 15:16:27', '127.0.0.1', '2017-07-15 15:16:27', '2017-07-15 15:17:09', NULL),
	(21, 2, NULL, 'D', '2017-07-15 15:17:52', '192.168.1.145', '2017-07-15 15:17:52', '2017-07-15 15:18:13', NULL),
	(22, 2, NULL, 'D', '2017-07-15 15:18:06', '192.168.1.145', '2017-07-15 15:18:06', '2017-07-15 15:18:06', NULL),
	(23, 2, 1, 'D', '2017-07-15 15:27:54', '192.168.1.145', '2017-07-15 15:27:54', '2017-07-15 15:27:54', NULL),
	(24, 2, 1, 'D', '2017-07-15 15:27:57', '192.168.1.145', '2017-07-15 15:27:57', '2017-07-15 15:27:57', NULL);
/*!40000 ALTER TABLE `voto` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
