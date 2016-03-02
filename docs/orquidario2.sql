SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `orquidario` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `orquidario` ;

-- -----------------------------------------------------
-- Table `orquidario`.`videoaulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`videoaulas` (
  `idvideoaulas` INT NOT NULL AUTO_INCREMENT,
  `nm_videoaulas` VARCHAR(45) NOT NULL,
  `videoaula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvideoaulas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`dicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`dicas` (
  `iddicas` INT NOT NULL AUTO_INCREMENT,
  `nm_dicas` VARCHAR(45) NOT NULL,
  `texto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddicas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`perfil` (
  `idperfil` INT NOT NULL AUTO_INCREMENT,
  `desc_perfil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idperfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `nm_usuarios` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `conf_username` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `nascimento` VARCHAR(45) NOT NULL,
  `catalogo_idcatalogo` INT NOT NULL,
  `perfil_idperfil` INT NOT NULL,
  PRIMARY KEY (`idusuarios`, `catalogo_idcatalogo`, `perfil_idperfil`),
  INDEX `fk_usuarios_perfil1_idx` (`perfil_idperfil` ASC),
  CONSTRAINT `fk_usuarios_perfil1`
    FOREIGN KEY (`perfil_idperfil`)
    REFERENCES `orquidario`.`perfil` (`idperfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`agenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`agenda` (
  `idagenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `nota` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idagenda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`noticias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`noticias` (
  `idnoticias` INT NOT NULL AUTO_INCREMENT,
  `nm_noticias` VARCHAR(45) NOT NULL,
  `texto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idnoticias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`catalogo` (
  `idcatalogo` INT NOT NULL AUTO_INCREMENT,
  `nm_catalogo` VARCHAR(45) NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  `usuarios_catalogo_idcatalogo` INT NOT NULL,
  `usuarios_perfil_idperfil` INT NOT NULL,
  PRIMARY KEY (`idcatalogo`, `usuarios_idusuarios`, `usuarios_catalogo_idcatalogo`, `usuarios_perfil_idperfil`),
  INDEX `fk_catalogo_usuarios1_idx` (`usuarios_idusuarios` ASC, `usuarios_catalogo_idcatalogo` ASC, `usuarios_perfil_idperfil` ASC),
  CONSTRAINT `fk_catalogo_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios` , `usuarios_catalogo_idcatalogo` , `usuarios_perfil_idperfil`)
    REFERENCES `orquidario`.`usuarios` (`idusuarios` , `catalogo_idcatalogo` , `perfil_idperfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`orquideas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`orquideas` (
  `idorquideas` INT NOT NULL AUTO_INCREMENT,
  `nome_orquidea` VARCHAR(45) NOT NULL,
  `nm_cientifico` VARCHAR(45) NOT NULL,
  `img_orquidea` TINYINT(1) NOT NULL,
  `desc_orquidea` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idorquideas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`orquideas_has_catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`orquideas_has_catalogo` (
  `orquideas_idorquideas` INT NOT NULL,
  `orquideas_familiaOquidea_idfamilia` INT NOT NULL,
  `catalogo_idcatalogo` INT NOT NULL,
  PRIMARY KEY (`orquideas_idorquideas`, `orquideas_familiaOquidea_idfamilia`, `catalogo_idcatalogo`),
  INDEX `fk_orquideas_has_catalogo_catalogo1_idx` (`catalogo_idcatalogo` ASC),
  INDEX `fk_orquideas_has_catalogo_orquideas1_idx` (`orquideas_idorquideas` ASC, `orquideas_familiaOquidea_idfamilia` ASC),
  CONSTRAINT `fk_orquideas_has_catalogo_orquideas1`
    FOREIGN KEY (`orquideas_idorquideas`)
    REFERENCES `orquidario`.`orquideas` (`idorquideas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orquideas_has_catalogo_catalogo1`
    FOREIGN KEY (`catalogo_idcatalogo`)
    REFERENCES `orquidario`.`catalogo` (`idcatalogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`usuarios_has_noticias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`usuarios_has_noticias` (
  `usuarios_idusuarios` INT NOT NULL,
  `usuarios_catalogo_idcatalogo` INT NOT NULL,
  `noticias_idnoticias` INT NOT NULL,
  PRIMARY KEY (`usuarios_idusuarios`, `usuarios_catalogo_idcatalogo`, `noticias_idnoticias`),
  INDEX `fk_usuarios_has_noticias_noticias1_idx` (`noticias_idnoticias` ASC),
  INDEX `fk_usuarios_has_noticias_usuarios1_idx` (`usuarios_idusuarios` ASC, `usuarios_catalogo_idcatalogo` ASC),
  CONSTRAINT `fk_usuarios_has_noticias_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios` , `usuarios_catalogo_idcatalogo`)
    REFERENCES `orquidario`.`usuarios` (`idusuarios` , `catalogo_idcatalogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_noticias_noticias1`
    FOREIGN KEY (`noticias_idnoticias`)
    REFERENCES `orquidario`.`noticias` (`idnoticias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`dicas_has_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`dicas_has_usuarios` (
  `dicas_iddicas` INT NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  `usuarios_catalogo_idcatalogo` INT NOT NULL,
  `usuarios_perfil_idperfil` INT NOT NULL,
  PRIMARY KEY (`dicas_iddicas`, `usuarios_idusuarios`, `usuarios_catalogo_idcatalogo`, `usuarios_perfil_idperfil`),
  INDEX `fk_dicas_has_usuarios_usuarios1_idx` (`usuarios_idusuarios` ASC, `usuarios_catalogo_idcatalogo` ASC, `usuarios_perfil_idperfil` ASC),
  INDEX `fk_dicas_has_usuarios_dicas1_idx` (`dicas_iddicas` ASC),
  CONSTRAINT `fk_dicas_has_usuarios_dicas1`
    FOREIGN KEY (`dicas_iddicas`)
    REFERENCES `orquidario`.`dicas` (`iddicas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dicas_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios` , `usuarios_catalogo_idcatalogo` , `usuarios_perfil_idperfil`)
    REFERENCES `orquidario`.`usuarios` (`idusuarios` , `catalogo_idcatalogo` , `perfil_idperfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`videoaulas_has_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`videoaulas_has_usuarios` (
  `videoaulas_idvideoaulas` INT NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  `usuarios_catalogo_idcatalogo` INT NOT NULL,
  `usuarios_perfil_idperfil` INT NOT NULL,
  PRIMARY KEY (`videoaulas_idvideoaulas`, `usuarios_idusuarios`, `usuarios_catalogo_idcatalogo`, `usuarios_perfil_idperfil`),
  INDEX `fk_videoaulas_has_usuarios_usuarios1_idx` (`usuarios_idusuarios` ASC, `usuarios_catalogo_idcatalogo` ASC, `usuarios_perfil_idperfil` ASC),
  INDEX `fk_videoaulas_has_usuarios_videoaulas1_idx` (`videoaulas_idvideoaulas` ASC),
  CONSTRAINT `fk_videoaulas_has_usuarios_videoaulas1`
    FOREIGN KEY (`videoaulas_idvideoaulas`)
    REFERENCES `orquidario`.`videoaulas` (`idvideoaulas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videoaulas_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios` , `usuarios_catalogo_idcatalogo` , `usuarios_perfil_idperfil`)
    REFERENCES `orquidario`.`usuarios` (`idusuarios` , `catalogo_idcatalogo` , `perfil_idperfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orquidario`.`agenda_has_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orquidario`.`agenda_has_usuarios` (
  `agenda_idagenda` INT NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  `usuarios_catalogo_idcatalogo` INT NOT NULL,
  `usuarios_perfil_idperfil` INT NOT NULL,
  PRIMARY KEY (`agenda_idagenda`, `usuarios_idusuarios`, `usuarios_catalogo_idcatalogo`, `usuarios_perfil_idperfil`),
  INDEX `fk_agenda_has_usuarios_usuarios1_idx` (`usuarios_idusuarios` ASC, `usuarios_catalogo_idcatalogo` ASC, `usuarios_perfil_idperfil` ASC),
  INDEX `fk_agenda_has_usuarios_agenda1_idx` (`agenda_idagenda` ASC),
  CONSTRAINT `fk_agenda_has_usuarios_agenda1`
    FOREIGN KEY (`agenda_idagenda`)
    REFERENCES `orquidario`.`agenda` (`idagenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenda_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios` , `usuarios_catalogo_idcatalogo` , `usuarios_perfil_idperfil`)
    REFERENCES `orquidario`.`usuarios` (`idusuarios` , `catalogo_idcatalogo` , `perfil_idperfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
