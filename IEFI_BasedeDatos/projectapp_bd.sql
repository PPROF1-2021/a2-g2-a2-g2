CREATE DATABASE  IF NOT EXISTS `projectapp_bd` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projectapp_bd`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: projectapp_bd
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `calendarios`
--

DROP TABLE IF EXISTS `calendarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendarios` (
  `idCalendario` int NOT NULL AUTO_INCREMENT,
  `fecha_limite` datetime NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idCalendario`),
  UNIQUE KEY `idCalendario_UNIQUE` (`idCalendario`),
  CONSTRAINT `fecha_limite` FOREIGN KEY (`idCalendario`) REFERENCES `tareas` (`idTarea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarios`
--

LOCK TABLES `calendarios` WRITE;
/*!40000 ALTER TABLE `calendarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `idNotificaciones` int NOT NULL AUTO_INCREMENT,
  `fecha_envio` datetime NOT NULL,
  `idCalendario` int NOT NULL,
  PRIMARY KEY (`idNotificaciones`),
  UNIQUE KEY `idNotificaciones_UNIQUE` (`idNotificaciones`),
  KEY `idCalendario_idx` (`idCalendario`),
  CONSTRAINT `idCalendario` FOREIGN KEY (`idCalendario`) REFERENCES `calendarios` (`idCalendario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `idProyecto` int NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_finalizacion` datetime DEFAULT NULL,
  `status_proyecto` enum('En progreso','Finalizado','Atrasado','En pausa') NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`idProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'primerproyecto','2021-11-02 15:20:00','2021-12-01 15:20:00','En progreso','prueba');
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `idSesiones` int NOT NULL,
  `idUsuario` int NOT NULL,
  `inicio_sesion` datetime NOT NULL,
  `cierre_sesion` datetime NOT NULL,
  PRIMARY KEY (`idSesiones`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `idTarea` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_limite` datetime NOT NULL,
  `fecha_finalizacion` datetime DEFAULT NULL,
  `status_tarea` enum('En progreso','Finalizado','Atrasado','En pausa') DEFAULT NULL,
  `idUsuarios_en_proyectos` int DEFAULT NULL,
  PRIMARY KEY (`idTarea`),
  KEY `idUsuario_idx` (`idUsuarios_en_proyectos`),
  CONSTRAINT `idUsuarios_en_proyectos` FOREIGN KEY (`idUsuarios_en_proyectos`) REFERENCES `usuarios_en_proyectos` (`idUsuarios_en_proyectos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `idTipo` enum('usuario','administrador') NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuarios_UNIQUE` (`idUsuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'SOLEDAD','SOLEDAD@BD.COM','2021-11-01 23:00:00','123456789','usuario'),(3,'davidghiano','davidghiano2@gmail.com','2021-11-12 22:10:33','$2y$12$8HPNdnX5dTIivQxGsJRBcuf8zLXqRf2aEKqoIfPQNCjR0bNIGJLgC','usuario'),(6,'davidg','davidghian@gmail.com','2021-11-14 01:45:08','$2y$12$MAwqCgs58KBp1nM9.W8xRe3RUlBFqEWQX4hmI3JqzQ329vliFnv2S','usuario'),(7,'arturolopez','artudito@gmail.com','2021-11-14 01:54:13','$2y$12$jbiBnGybApEs6oWDGgCDsedZC4EcB.81LnEPUtHC/CGgo2ntbkHTS','usuario'),(8,'arturolopez','arturito@gmail.com','2021-11-14 01:55:40','$2y$12$6Gw5RuZ0zeE72jzGgvHTNO9HOqSJq.qeVpryoZeOeOmdzKV3fSpM2','usuario'),(9,'penicruz','penelope@correo.com','2021-11-14 02:29:26','$2y$12$byh33XKMI.i9dNtCxp4Cfe/kjtA0oX4rU4YOPid.N1AhcNcjsszWq','usuario');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_en_proyectos`
--

DROP TABLE IF EXISTS `usuarios_en_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_en_proyectos` (
  `idUsuarios_en_proyectos` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idProyecto` int NOT NULL,
  PRIMARY KEY (`idUsuarios_en_proyectos`),
  KEY `idUsuarios_idx` (`idUsuario`),
  KEY `idProyecto_idx` (`idProyecto`),
  CONSTRAINT `idProyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`),
  CONSTRAINT `idUsuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_en_proyectos`
--

LOCK TABLES `usuarios_en_proyectos` WRITE;
/*!40000 ALTER TABLE `usuarios_en_proyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_en_proyectos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18 21:07:34
