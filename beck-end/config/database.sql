-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hamburgaria_db
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lista_de_opcionais`
--

DROP TABLE IF EXISTS `lista_de_opcionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_de_opcionais` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_de_opcionais`
--

LOCK TABLES `lista_de_opcionais` WRITE;
/*!40000 ALTER TABLE `lista_de_opcionais` DISABLE KEYS */;
INSERT INTO `lista_de_opcionais` VALUES (1,'Bacon'),(2,'Cheddar'),(3,'Salame'),(4,'Tomate'),(5,'Cebola roxa'),(6,'Pepino');
/*!40000 ALTER TABLE `lista_de_opcionais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `nomo_cliente` varchar(100) NOT NULL,
  `carne` varchar(50) NOT NULL,
  `pao` varchar(50) NOT NULL,
  `opcionais` varchar(300) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (15,'Ana','Picanha','Pão australiano','[\"Bacon\",\"Tomate\"]','Em produção'),(16,'Ana Baptista','Fraldinha','Ciabatta','[\"Bacon\",\"Tomate\"]','Solicitado');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_do_pedido`
--

DROP TABLE IF EXISTS `status_do_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_do_pedido` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_do_pedido`
--

LOCK TABLES `status_do_pedido` WRITE;
/*!40000 ALTER TABLE `status_do_pedido` DISABLE KEYS */;
INSERT INTO `status_do_pedido` VALUES (1,'Solicitado'),(2,'Em produção'),(3,'Finalizado');
/*!40000 ALTER TABLE `status_do_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_carnes`
--

DROP TABLE IF EXISTS `tipo_de_carnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_carnes` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_carnes`
--

LOCK TABLES `tipo_de_carnes` WRITE;
/*!40000 ALTER TABLE `tipo_de_carnes` DISABLE KEYS */;
INSERT INTO `tipo_de_carnes` VALUES (1,'Peito bovino'),(2,'Picanha'),(3,'Fraldinha');
/*!40000 ALTER TABLE `tipo_de_carnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_paes`
--

DROP TABLE IF EXISTS `tipo_de_paes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_paes` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_paes`
--

LOCK TABLES `tipo_de_paes` WRITE;
/*!40000 ALTER TABLE `tipo_de_paes` DISABLE KEYS */;
INSERT INTO `tipo_de_paes` VALUES (1,'Pão de hambúrguer americano'),(2,'Pão italiano'),(3,'Brioche'),(4,'Pão australiano'),(5,'Pão de azeite'),(6,'Pão de cebola'),(7,'Ciabatta');
/*!40000 ALTER TABLE `tipo_de_paes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hamburgaria_db'
--

--
-- Dumping routines for database 'hamburgaria_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-01  5:46:21
