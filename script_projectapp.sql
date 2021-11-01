-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Projectapp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Projectapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Projectapp` DEFAULT CHARACTER SET utf8 ;
USE `Projectapp` ;

-- -----------------------------------------------------
-- Table `Projectapp`.`Tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp`.`Tipo_usuario` (
  `idTipo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo`),
  UNIQUE INDEX `email_UNIQUE` (`idTipo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `fecha_registro` DATETIME NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `idTipo` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuarios_UNIQUE` (`idUsuario` ASC) VISIBLE,
  INDEX `idTipo_idx` (`idTipo` ASC) VISIBLE,
  CONSTRAINT `idTipo`
    FOREIGN KEY (`idTipo`)
    REFERENCES `Projectapp`.`Tipo_usuario` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp`.`Sesiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp`.`Sesiones` (
  `idSesiones` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  `inicio_sesion` DATETIME NOT NULL,
  `cierre_sesion` DATETIME NOT NULL,
  PRIMARY KEY (`idSesiones`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Projectapp`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp`.`Proyectos` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_finalizacion` DATETIME NULL,
  `status_proyecto` ENUM('En progreso', 'Finalizado', 'Atrasado', 'En pausa') NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idProyecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp`.`Usuarios_en_proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp`.`Usuarios_en_proyectos` (
  `idUsuarios_en_proyectos` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `idProyecto` INT NOT NULL,
  PRIMARY KEY (`idUsuarios_en_proyectos`),
  INDEX `idUsuarios_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `idProyecto_idx` (`idProyecto` ASC) VISIBLE,
  CONSTRAINT `idUsuarios`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Projectapp`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProyecto`
    FOREIGN KEY (`idProyecto`)
    REFERENCES `Projectapp`.`Proyectos` (`idProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp`.`Tareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp`.`Tareas` (
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
    REFERENCES `Projectapp`.`Usuarios_en_proyectos` (`idUsuarios_en_proyectos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp`.`Calendarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp`.`Calendarios` (
  `idCalendario` INT NOT NULL AUTO_INCREMENT,
  `fecha_limite` DATETIME NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`idCalendario`),
  UNIQUE INDEX `idCalendario_UNIQUE` (`idCalendario` ASC) VISIBLE,
  CONSTRAINT `fecha_limite`
    FOREIGN KEY (`idCalendario`)
    REFERENCES `Projectapp`.`Tareas` (`idTarea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projectapp`.`Notificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Projectapp`.`Notificaciones` (
  `idNotificaciones` INT NOT NULL AUTO_INCREMENT,
  `fecha_envio` DATETIME NOT NULL,
  `idCalendario` INT NOT NULL,
  PRIMARY KEY (`idNotificaciones`),
  UNIQUE INDEX `idNotificaciones_UNIQUE` (`idNotificaciones` ASC) VISIBLE,
  INDEX `idCalendario_idx` (`idCalendario` ASC) VISIBLE,
  CONSTRAINT `idCalendario`
    FOREIGN KEY (`idCalendario`)
    REFERENCES `Projectapp`.`Calendarios` (`idCalendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
