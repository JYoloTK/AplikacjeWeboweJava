-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rpg
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rpg` ;

-- -----------------------------------------------------
-- Schema rpg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rpg` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci ;
USE `rpg` ;

-- -----------------------------------------------------
-- Table `rpg`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`user` ;

CREATE TABLE IF NOT EXISTS `rpg`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `haslo` VARCHAR(45) NOT NULL,
  `rola` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`swiat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`swiat` ;

CREATE TABLE IF NOT EXISTS `rpg`.`swiat` (
  `idswiat` INT NOT NULL AUTO_INCREMENT,
  `nazwaswiat` VARCHAR(45) NOT NULL,
  `setting` VARCHAR(45) NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idswiat`),
  INDEX `fk_swiat_user1_idx` (`iduser` ASC),
  CONSTRAINT `fk_swiat_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `rpg`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`lokacja`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`lokacja` ;

CREATE TABLE IF NOT EXISTS `rpg`.`lokacja` (
  `idlokacja` INT NOT NULL AUTO_INCREMENT,
  `nazwalokacja` VARCHAR(45) NOT NULL,
  `wielkosc` VARCHAR(45) NOT NULL,
  `biom` VARCHAR(45) NULL,
  `idswiat` INT NOT NULL,
  PRIMARY KEY (`idlokacja`),
  INDEX `fk_lokacja_swiat1_idx` (`idswiat` ASC),
  CONSTRAINT `fk_lokacja_swiat1`
    FOREIGN KEY (`idswiat`)
    REFERENCES `rpg`.`swiat` (`idswiat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`postac`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`postac` ;

CREATE TABLE IF NOT EXISTS `rpg`.`postac` (
  `idpostac` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `rasa` VARCHAR(45) NOT NULL,
  `klasa` VARCHAR(45) NOT NULL,
  `level` VARCHAR(45) NOT NULL,
  `wiek` VARCHAR(45) NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idpostac`),
  INDEX `fk_postac_user1_idx` (`iduser` ASC),
  CONSTRAINT `fk_postac_user1`
    FOREIGN KEY (`iduser`)
    REFERENCES `rpg`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`npc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`npc` ;

CREATE TABLE IF NOT EXISTS `rpg`.`npc` (
  `idnpc` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `rasa` VARCHAR(45) NOT NULL,
  `idlokacja` INT NOT NULL,
  PRIMARY KEY (`idnpc`),
  INDEX `fk_npc_lokacja1_idx` (`idlokacja` ASC),
  CONSTRAINT `fk_npc_lokacja1`
    FOREIGN KEY (`idlokacja`)
    REFERENCES `rpg`.`lokacja` (`idlokacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpg`.`potwor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rpg`.`potwor` ;

CREATE TABLE IF NOT EXISTS `rpg`.`potwor` (
  `idpotwor` INT NOT NULL AUTO_INCREMENT,
  `rasa` VARCHAR(45) NOT NULL,
  `cr` INT NOT NULL,
  `ac` INT NOT NULL,
  `hp` INT NOT NULL,
  `speed` INT NOT NULL,
  `idlokacja` INT NOT NULL,
  PRIMARY KEY (`idpotwor`),
  INDEX `fk_potwor_lokacja1_idx` (`idlokacja` ASC),
  CONSTRAINT `fk_potwor_lokacja1`
    FOREIGN KEY (`idlokacja`)
    REFERENCES `rpg`.`lokacja` (`idlokacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
