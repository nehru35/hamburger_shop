-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.31 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para hamburgaria_db
CREATE DATABASE IF NOT EXISTS `hamburgaria_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hamburgaria_db`;

-- Copiando estrutura para tabela hamburgaria_db.leaderboard
CREATE TABLE IF NOT EXISTS `leaderboard` (
  `winner_name` varchar(255) DEFAULT NULL,
  `loser_name` varchar(255) DEFAULT NULL,
  `moves` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela hamburgaria_db.leaderboard: ~6 rows (aproximadamente)
INSERT INTO `leaderboard` (`winner_name`, `loser_name`, `moves`) VALUES
	('Alice', 'Bob', '[e4, e5, Nf3, Nc6, Bc4, Bc5, O-O, Nf6, d3, d6, h3, Be6, Bxe6, fxe6, c3, O-O, Qb3, Qe8, Qxb7, Rb8, Qa6, Bb6, Qa4, Ng4, Bd2, Ne3, Rf2, Nxf2, Kxf2, Rxb2]\r\n'),
	('Alice', 'Jack', '[e4, e5, Nf3, Nc6, Bc4, Bc5, O-O, Nf6, d3, d6, h3, Be6, Bxe6, fxe6, c3, O-O, Qb3, Qe8, Qxb7, Rb8, Qa6, Bb6, Qa4, Ng4, Bd2, Ne3, Rf2, Nxf2, Kxf2, Rxb2]\r\n'),
	('Peter', 'Alice', '[e4, e5, Nf3, Nc6, Bc4, Bc5, O-O, Nf6, d3, d6, h3, Be6, Bxe6, fxe6, c3, O-O, Qb3, Qe8, Qxb7, Rb8, Qa6, Bb6, Qa4, Ng4, Bd2, Ne3, Rf2, Nxf2, Kxf2, Rxb2]\r\n'),
	('Roger', 'Peter', '[e4, e5, Nf3, Nc6, Bc4, Bc5, O-O, Nf6, d3, d6, h3, Be6, Bxe6, fxe6, c3, O-O, Qb3, Qe8, Qxb7, Rb8, Qa6, Bb6, Qa4, Ng4, Bd2, Ne3, Rf2, Nxf2, Kxf2, Rxb2]\r\n'),
	('Roger', 'Ester', '[e4, e5, Nf3, Nc6, Bc4, Bc5, O-O, Nf6, d3, d6, h3, Be6, Bxe6, fxe6, c3, O-O, Qb3, Qe8, Qxb7, Rb8, Qa6, Bb6, Qa4, Ng4, Bd2, Ne3, Rf2, Nxf2, Kxf2, Rxb2]\r\n'),
	('Roger', 'Olivia', '[e4, e5, Nf3, Nc6, Bc4, Bc5, O-O, Nf6, d3, d6, h3, Be6, Bxe6, fxe6, c3, O-O, Qb3, Qe8, Qxb7, Rb8, Qa6, Bb6, Qa4, Ng4, Bd2, Ne3, Rf2, Nxf2, Kxf2, Rxb2]\r\n');

-- Copiando estrutura para tabela hamburgaria_db.lista_de_opcionais
CREATE TABLE IF NOT EXISTS `lista_de_opcionais` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela hamburgaria_db.lista_de_opcionais: ~6 rows (aproximadamente)
INSERT INTO `lista_de_opcionais` (`id`, `descricao`) VALUES
	(1, 'Lettuce'),
	(2, 'Tomato'),
	(3, 'Onion (raw or caramelized)'),
	(4, 'Pickles'),
	(5, 'Cheese (American, Cheddar, Swiss, etc.)'),
	(6, 'Bacon'),
	(7, 'Avocado'),
	(8, 'Fried Egg'),
	(9, 'Mushrooms (sautéed or grilled)'),
	(10, 'Jalapeños'),
	(11, 'Ketchup'),
	(12, 'Mustard'),
	(13, 'Mayonnaise'),
	(14, 'Barbecue Sauce'),
	(15, 'Hot Sauce'),
	(16, 'Relish'),
	(17, 'Salsa'),
	(18, 'Guacamole'),
	(19, 'Aioli'),
	(20, 'Horseradish');

-- Copiando estrutura para tabela hamburgaria_db.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `nomo_cliente` varchar(100) NOT NULL,
  `carne` varchar(50) NOT NULL,
  `pao` varchar(50) NOT NULL,
  `opcionais` varchar(300) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela hamburgaria_db.pedidos: ~1 rows (aproximadamente)
INSERT INTO `pedidos` (`id`, `nomo_cliente`, `carne`, `pao`, `opcionais`, `status`) VALUES
	(25, 'Nehru', 'Ground Chicken', 'Gluten-Free Bun', '["Avocado","Ketchup","Aioli"]', 'Solicitado');

-- Copiando estrutura para tabela hamburgaria_db.status_do_pedido
CREATE TABLE IF NOT EXISTS `status_do_pedido` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela hamburgaria_db.status_do_pedido: ~2 rows (aproximadamente)
INSERT INTO `status_do_pedido` (`id`, `descricao`) VALUES
	(1, 'Ordered'),
	(2, 'In production'),
	(3, 'Finished');

-- Copiando estrutura para tabela hamburgaria_db.tipo_de_carnes
CREATE TABLE IF NOT EXISTS `tipo_de_carnes` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela hamburgaria_db.tipo_de_carnes: ~2 rows (aproximadamente)
INSERT INTO `tipo_de_carnes` (`id`, `descricao`) VALUES
	(1, 'Ground Beef'),
	(2, 'Ground Chuck'),
	(3, 'Ground Sirloin'),
	(4, 'Ground Round'),
	(5, 'Ground Turkey'),
	(6, 'Ground Chicken'),
	(7, 'Bison'),
	(8, 'Lamb'),
	(9, 'Pork'),
	(10, 'Salmon');

-- Copiando estrutura para tabela hamburgaria_db.tipo_de_paes
CREATE TABLE IF NOT EXISTS `tipo_de_paes` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela hamburgaria_db.tipo_de_paes: ~6 rows (aproximadamente)
INSERT INTO `tipo_de_paes` (`id`, `descricao`) VALUES
	(1, 'Sesame Seed Bun'),
	(2, 'Brioche Bun'),
	(3, 'Pretzel Bun'),
	(4, 'Potato Bun'),
	(5, 'Whole Wheat Bun'),
	(6, 'Gluten-Free Bun'),
	(7, 'English Muffin Bun');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
