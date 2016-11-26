-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema softfly
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema softfly
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `softfly` DEFAULT CHARACTER SET latin1 ;
USE `softfly` ;

-- -----------------------------------------------------
-- Table `softfly`.`estado_avion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`estado_avion` ;

CREATE TABLE IF NOT EXISTS `softfly`.`estado_avion` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) CHARACTER SET 'latin1' NOT NULL,
  `justificacion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`configuracion_vuelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`configuracion_vuelo` ;

CREATE TABLE IF NOT EXISTS `softfly`.`configuracion_vuelo` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(13) CHARACTER SET 'latin1' NOT NULL,
  `numero_pilotos` INT(2) NOT NULL,
  `numero_copilotos` INT(2) NOT NULL,
  `numero_azafatas` INT(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`tipo_avion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`tipo_avion` ;

CREATE TABLE IF NOT EXISTS `softfly`.`tipo_avion` (
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  `gasto_gasolina` FLOAT NOT NULL,
  `velocidad` FLOAT NOT NULL,
  `sillas_primera_clase` INT(3) NOT NULL,
  `sillas_clase_turista` INT(3) NOT NULL,
  `capacidad_tanque` FLOAT NOT NULL,
  `nombre` VARCHAR(15) CHARACTER SET 'latin1' NOT NULL,
  `configuracion_vuelo_id` INT(2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tipo_avion_configuracion_vuelo1_idx` (`configuracion_vuelo_id` ASC),
  CONSTRAINT `fk_tipo_avion_configuracion_vuelo1`
    FOREIGN KEY (`configuracion_vuelo_id`)
    REFERENCES `softfly`.`configuracion_vuelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`avion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`avion` ;

CREATE TABLE IF NOT EXISTS `softfly`.`avion` (
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  `estado` INT(2) NOT NULL,
  `tipo_avion_id` INT(4) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `estado` (`estado` ASC),
  INDEX `fk_avion_tipo_avion1_idx` (`tipo_avion_id` ASC),
  CONSTRAINT `estado_avion_to_avion`
    FOREIGN KEY (`estado`)
    REFERENCES `softfly`.`estado_avion` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_avion_tipo_avion1`
    FOREIGN KEY (`tipo_avion_id`)
    REFERENCES `softfly`.`tipo_avion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`cargo_empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`cargo_empleado` ;

CREATE TABLE IF NOT EXISTS `softfly`.`cargo_empleado` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) CHARACTER SET 'latin1' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`categoria_aeropuerto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`categoria_aeropuerto` ;

CREATE TABLE IF NOT EXISTS `softfly`.`categoria_aeropuerto` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `softfly`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`pais` ;

CREATE TABLE IF NOT EXISTS `softfly`.`pais` (
  `id` INT(3) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `softfly`.`ciudad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`ciudad` ;

CREATE TABLE IF NOT EXISTS `softfly`.`ciudad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `pais` INT(3) NULL,
  PRIMARY KEY (`id`),
  INDEX `pais` (`pais` ASC),
  CONSTRAINT `pais_to_ciudad`
    FOREIGN KEY (`pais`)
    REFERENCES `softfly`.`pais` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`aeropuerto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`aeropuerto` ;

CREATE TABLE IF NOT EXISTS `softfly`.`aeropuerto` (
  `codigo` INT(7) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) CHARACTER SET 'latin1' NOT NULL,
  `impuesto_aeroportuario` DOUBLE NOT NULL,
  `costo_plataforma` DOUBLE NOT NULL,
  `categoria` INT(2) NULL,
  `ciudad` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `ciudad_to_aropuerto_idx` (`ciudad` ASC),
  CONSTRAINT `categoria_to_aeropuerto`
    FOREIGN KEY (`categoria`)
    REFERENCES `softfly`.`categoria_aeropuerto` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ciudad_to_aropuerto`
    FOREIGN KEY (`ciudad`)
    REFERENCES `softfly`.`ciudad` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`empleado` ;

CREATE TABLE IF NOT EXISTS `softfly`.`empleado` (
  `identificacion` INT(12) NOT NULL,
  `nombre` VARCHAR(50) CHARACTER SET 'latin1' NOT NULL,
  `cargo` INT(2) NOT NULL,
  `email` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`identificacion`),
  INDEX `cargo` (`cargo` ASC),
  CONSTRAINT `cargo_empleado_to_empleado`
    FOREIGN KEY (`cargo`)
    REFERENCES `softfly`.`cargo_empleado` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`ruta` ;

CREATE TABLE IF NOT EXISTS `softfly`.`ruta` (
  `id` INT(12) NOT NULL AUTO_INCREMENT,
  `aeropuerto_origen` INT(7) NOT NULL,
  `aeropuerto_destino` INT(7) NOT NULL,
  `distancia` FLOAT NULL,
  `tiempo_promedio` TIME NULL,
  PRIMARY KEY (`id`),
  INDEX `ciudad_origen` (`aeropuerto_origen` ASC),
  INDEX `ciudad_destino` (`aeropuerto_destino` ASC),
  CONSTRAINT `ciudad_origen_to_ruta`
    FOREIGN KEY (`aeropuerto_origen`)
    REFERENCES `softfly`.`aeropuerto` (`codigo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ciudad_destino_to_ruta`
    FOREIGN KEY (`aeropuerto_destino`)
    REFERENCES `softfly`.`aeropuerto` (`codigo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`estado_vuelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`estado_vuelo` ;

CREATE TABLE IF NOT EXISTS `softfly`.`estado_vuelo` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) CHARACTER SET 'latin1' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`vuelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`vuelo` ;

CREATE TABLE IF NOT EXISTS `softfly`.`vuelo` (
  `id` INT(12) NOT NULL AUTO_INCREMENT,
  `avion` INT(4) NULL DEFAULT NULL,
  `ruta` INT(12) NULL DEFAULT NULL,
  `fecha_salida` DATE NULL DEFAULT NULL,
  `peso_equipaje` FLOAT NULL DEFAULT NULL,
  `peso_carga` FLOAT NULL DEFAULT NULL,
  `pasajeros_embarcados` INT(3) NULL DEFAULT NULL,
  `hora_llegada` TIME NULL DEFAULT NULL,
  `estado` INT(2) NOT NULL,
  `incidentes` VARCHAR(250) CHARACTER SET 'latin1' NULL DEFAULT NULL,
  `costo_total` DOUBLE NOT NULL,
  `hora_salida` TIME NOT NULL,
  `fecha_llegada` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `avion` (`avion` ASC),
  INDEX `ruta` (`ruta` ASC),
  INDEX `estado` (`estado` ASC),
  CONSTRAINT `ruta_to_vuelo`
    FOREIGN KEY (`ruta`)
    REFERENCES `softfly`.`ruta` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `estado_vuelo_to_vuelo`
    FOREIGN KEY (`estado`)
    REFERENCES `softfly`.`estado_vuelo` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `avion_to_vuelo`
    FOREIGN KEY (`avion`)
    REFERENCES `softfly`.`avion` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`escala`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`escala` ;

CREATE TABLE IF NOT EXISTS `softfly`.`escala` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `id_vuelo` INT(12) NOT NULL,
  `id_vuelo_escala` INT(12) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_vuelo` (`id_vuelo` ASC),
  INDEX `id_vuelo_escala` (`id_vuelo_escala` ASC),
  CONSTRAINT `vuelo_to_escala`
    FOREIGN KEY (`id_vuelo`)
    REFERENCES `softfly`.`vuelo` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `vuelo_to_escala2`
    FOREIGN KEY (`id_vuelo_escala`)
    REFERENCES `softfly`.`vuelo` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


-- -----------------------------------------------------
-- Table `softfly`.`empleado_vuelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `softfly`.`empleado_vuelo` ;

CREATE TABLE IF NOT EXISTS `softfly`.`empleado_vuelo` (
  `vuelo_id` INT(12) NOT NULL,
  `empleado_identificacion` INT(12) NOT NULL,
  PRIMARY KEY (`vuelo_id`, `empleado_identificacion`),
  INDEX `fk_vuelo_has_empleado_empleado1_idx` (`empleado_identificacion` ASC),
  INDEX `fk_vuelo_has_empleado_vuelo1_idx` (`vuelo_id` ASC),
  CONSTRAINT `fk_vuelo_has_empleado_vuelo1`
    FOREIGN KEY (`vuelo_id`)
    REFERENCES `softfly`.`vuelo` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_vuelo_has_empleado_empleado1`
    FOREIGN KEY (`empleado_identificacion`)
    REFERENCES `softfly`.`empleado` (`identificacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `softfly`.`estado_avion`
-- -----------------------------------------------------
START TRANSACTION;
USE `softfly`;
INSERT INTO `softfly`.`estado_avion` (`id`, `nombre`, `justificacion`) VALUES (0, 'Disponible', 'El avion esta listo para operar');
INSERT INTO `softfly`.`estado_avion` (`id`, `nombre`, `justificacion`) VALUES (1, 'Inutilizable', 'El avion presenta alguna falla que impide su normal funcionamiento');

COMMIT;


-- -----------------------------------------------------
-- Data for table `softfly`.`configuracion_vuelo`
-- -----------------------------------------------------
START TRANSACTION;
USE `softfly`;
INSERT INTO `softfly`.`configuracion_vuelo` (`id`, `nombre`, `numero_pilotos`, `numero_copilotos`, `numero_azafatas`) VALUES (3, 'Naicional', 1, 1, 3);
INSERT INTO `softfly`.`configuracion_vuelo` (`id`, `nombre`, `numero_pilotos`, `numero_copilotos`, `numero_azafatas`) VALUES (5, 'Internacional', 2, 3, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `softfly`.`cargo_empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `softfly`;
INSERT INTO `softfly`.`cargo_empleado` (`id`, `nombre`) VALUES (0, 'Piloto');
INSERT INTO `softfly`.`cargo_empleado` (`id`, `nombre`) VALUES (1, 'Copiloto');
INSERT INTO `softfly`.`cargo_empleado` (`id`, `nombre`) VALUES (2, 'Azafata');

COMMIT;


-- -----------------------------------------------------
-- Data for table `softfly`.`categoria_aeropuerto`
-- -----------------------------------------------------
START TRANSACTION;
USE `softfly`;
INSERT INTO `softfly`.`categoria_aeropuerto` (`id`, `nombre`) VALUES (10, 'Nacional');
INSERT INTO `softfly`.`categoria_aeropuerto` (`id`, `nombre`) VALUES (5, 'Internacional');
INSERT INTO `softfly`.`categoria_aeropuerto` (`id`, `nombre`) VALUES (26, 'Local');

COMMIT;


-- -----------------------------------------------------
-- Data for table `softfly`.`estado_vuelo`
-- -----------------------------------------------------
START TRANSACTION;
USE `softfly`;
INSERT INTO `softfly`.`estado_vuelo` (`id`, `nombre`) VALUES (0, 'Programado');
INSERT INTO `softfly`.`estado_vuelo` (`id`, `nombre`) VALUES (1, 'En vuelo');
INSERT INTO `softfly`.`estado_vuelo` (`id`, `nombre`) VALUES (2, 'Arribo');
INSERT INTO `softfly`.`estado_vuelo` (`id`, `nombre`) VALUES (3, 'Cancelado');

COMMIT;

