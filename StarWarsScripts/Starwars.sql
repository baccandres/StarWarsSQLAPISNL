CREATE DATABASE IF NOT EXISTS Starwars;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Starwars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Starwars
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Starwars` DEFAULT CHARACTER SET utf8 ;
USE `Starwars` ;

-- -----------------------------------------------------
-- Table `Starwars`.`Episode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starwars`.`Episode` (
  `idEpisode` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEpisode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starwars`.`Character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starwars`.`Character` (
  `idCharacter` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCharacter`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starwars`.`EpisodeCharacter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starwars`.`EpisodeCharacter` (
  `idEpisode` INT NOT NULL,
  `idCharacter` INT NOT NULL,
  PRIMARY KEY (`idEpisode`, `idCharacter`),
  INDEX `FK-character_idx` (`idCharacter` ASC) VISIBLE,
  CONSTRAINT `FK-character`
    FOREIGN KEY (`idCharacter`)
    REFERENCES `Starwars`.`Character` (`idCharacter`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK-episode`
    FOREIGN KEY (`idEpisode`)
    REFERENCES `Starwars`.`Episode` (`idEpisode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Starwars`.`Dialogue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starwars`.`Dialogue` (
  `idDialogue` INT NOT NULL AUTO_INCREMENT,
  `Dialogue` VARCHAR(5000) NOT NULL,
  `id_character` INT NULL,
  PRIMARY KEY (`idDialogue`),
  INDEX `FK-character_idx` (`id_character` ASC) VISIBLE,
  CONSTRAINT `FK-character_dialogue`
    FOREIGN KEY (`id_character`)
    REFERENCES `Starwars`.`Character` (`idCharacter`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
