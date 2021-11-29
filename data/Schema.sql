-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Starwars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Starwars
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Starwars`;
CREATE SCHEMA IF NOT EXISTS `Starwars` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Starwars` ;

-- -----------------------------------------------------
-- Table `Starwars`.`Character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starwars`.`Character` (
  `idCharacter` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCharacter`))
ENGINE = InnoDB
AUTO_INCREMENT = 99
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Starwars`.`Episode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starwars`.`Episode` (
  `idEpisode` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEpisode`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Starwars`.`Dialogue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Starwars`.`Dialogue` (
  `idDialogue` INT NOT NULL AUTO_INCREMENT,
  `Dialogue` VARCHAR(5000) NOT NULL,
  `Character_idCharacter` INT NOT NULL,
  `Episode_idEpisode` INT NOT NULL,
  PRIMARY KEY (`idDialogue`),
  INDEX `fk_Dialogue_Episode1_idx` (`Episode_idEpisode` ASC) VISIBLE,
  INDEX `fk_Dialogue_Character1_idx` (`Character_idCharacter` ASC) VISIBLE,
  CONSTRAINT `fk_Dialogue_Episode1`
    FOREIGN KEY (`Episode_idEpisode`)
    REFERENCES `Starwars`.`Episode` (`idEpisode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dialogue_Character1`
    FOREIGN KEY (`Character_idCharacter`)
    REFERENCES `Starwars`.`Character` (`idCharacter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;