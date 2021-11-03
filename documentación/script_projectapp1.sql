-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Projectapp_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Projectapp_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Projectapp_bd` DEFAULT CHARACTER SET utf8 ;
USE `Projectapp_bd` ;

-- -----------------------------------------------------
-- Table `Projectapp_bd`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp_bd`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `fecha_registro` DATETIME NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `idTipo` ENUM('usuario', 'administrador') NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuarios_UNIQUE` (`idUsuario` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp_bd`.`Sesiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp_bd`.`Sesiones` (
  `idSesiones` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `inicio_sesion` DATETIME NOT NULL,
  `cierre_sesion` DATETIME NOT NULL,
  PRIMARY KEY (`idSesiones`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Projectapp_bd`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp_bd`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp_bd`.`Proyectos` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_finalizacion` DATETIME NULL,
  `status_proyecto` ENUM('En progreso', 'Finalizado', 'Atrasado', 'En pausa') NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp_bd`.`Usuarios_en_proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp_bd`.`Usuarios_en_proyectos` (
  `idUsuarios_en_proyectos` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `idProyecto` INT NOT NULL,
  PRIMARY KEY (`idUsuarios_en_proyectos`),
  INDEX `idUsuarios_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `idProyecto_idx` (`idProyecto` ASC) VISIBLE,
  CONSTRAINT `idUsuarios`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Projectapp_bd`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProyecto`
    FOREIGN KEY (`idProyecto`)
    REFERENCES `Projectapp_bd`.`Proyectos` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp_bd`.`Tareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp_bd`.`Tareas` (
  `idTarea` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_limite` DATETIME NOT NULL,
  `fecha_finalizacion` DATETIME NULL,
  `status_tarea` ENUM('En progreso', 'Finalizado', 'Atrasado', 'En pausa') NULL,
  `idUsuarios_en_proyectos` INT NULL,
  PRIMARY KEY (`idTarea`),
  INDEX `idUsuario_idx` (`idUsuarios_en_proyectos` ASC) VISIBLE,
  CONSTRAINT `idUsuarios_en_proyectos`
    FOREIGN KEY (`idUsuarios_en_proyectos`)
    REFERENCES `Projectapp_bd`.`Usuarios_en_proyectos` (`idUsuarios_en_proyectos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp_bd`.`Calendarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp_bd`.`Calendarios` (
  `idCalendario` INT NOT NULL AUTO_INCREMENT,
  `fecha_limite` DATETIME NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`idCalendario`),
  UNIQUE INDEX `idCalendario_UNIQUE` (`idCalendario` ASC) VISIBLE,
  CONSTRAINT `fecha_limite`
    FOREIGN KEY (`idCalendario`)
    REFERENCES `Projectapp_bd`.`Tareas` (`idTarea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp_bd`.`Notificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp_bd`.`Notificaciones` (
  `idNotificaciones` INT NOT NULL AUTO_INCREMENT,
  `fecha_envio` DATETIME NOT NULL,
  `idCalendario` INT NOT NULL,
  PRIMARY KEY (`idNotificaciones`),
  UNIQUE INDEX `idNotificaciones_UNIQUE` (`idNotificaciones` ASC) VISIBLE,
  INDEX `idCalendario_idx` (`idCalendario` ASC) VISIBLE,
  CONSTRAINT `idCalendario`
    FOREIGN KEY (`idCalendario`)
    REFERENCES `Projectapp_bd`.`Calendarios` (`idCalendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Projectapp_bd`.`Usuarios` (`idUsuario`,`nombre`,`email`,`fecha_registro`,`contrasena`, `idTipo` )
VALUES ('2','David', 'david@BD.COM', '2021-11-02 23:00:00', '123456789', 'usuario'),
('3','Virginia', 'virginia@BD.COM', '2021-11-02 01:00:00', '123456789', 'usuario'),
('4','Gabriela', 'gabriela@BD.COM', '2021-11-01 13:00:00', '123456789', 'usuario'),
('5','Juan', 'juan@BD.COM', '2021-11-02 15:20:00', '123456', 'usuario')

