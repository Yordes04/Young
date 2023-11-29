-- MySQL Script generated by MySQL Workbench
-- Fri May  5 16:43:38 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema matchezmoi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema matchezmoi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `matchezmoi` DEFAULT CHARACTER SET latin1 ;
USE `matchezmoi` ;

-- -----------------------------------------------------
-- Table `matchezmoi`.`courriel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`courriel` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `expediteur` VARCHAR(64) NOT NULL,
    `destinateur` VARCHAR(64) NOT NULL,
    `sujet` VARCHAR(64) NOT NULL,
    `contenu` VARCHAR(512) NOT NULL,
    `date` DATE NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `matchezmoi`.`orientation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`orientation` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `UK_r5xurv8v3d7u70d4qb0op3e1f` (`nom` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

INSERT INTO `matchezmoi`.`orientation` (`nom`)
VALUES ('heterosexuel'), ('homosexuel'), ('bisexuel');


-- -----------------------------------------------------
-- Table `matchezmoi`.`passion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`passion` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

INSERT INTO `matchezmoi`.`passion` (`nom`)
VALUES ('sport'), ('cinema'), ('musique'), ('mode'), ('combat'), ('dance'), ('literature');


-- -----------------------------------------------------
-- Table `matchezmoi`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`region` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(64) NOT NULL,
    `code` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `UK_kntnlvx8xwbfrg1flw2mnwa9v` (`code` ASC) VISIBLE,
    UNIQUE INDEX `UK_6dh2pxnpaff6pgyotfm2j8wyu` (`nom` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

INSERT INTO `matchezmoi`.`region` (`nom`, `code`)
VALUES
    ('Alberta', 'AB'),
    ('British Columbia', 'BC'),
    ('Manitoba', 'MB'),
    ('New Brunswick', 'NB'),
    ('Newfoundland and Labrador', 'NL'),
    ('Northwest Territories', 'NT'),
    ('Nova Scotia', 'NS'),
    ('Nunavut', 'NU'),
    ('Ontario', 'ON'),
    ('Prince Edward Island', 'PE'),
    ('Quebec', 'QC'),
    ('Saskatchewan', 'SK'),
    ('Yukon', 'YT');

-- -----------------------------------------------------
-- Table `matchezmoi`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`role` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `UK_6u1k6pqq7suwepwcfskympy3s` (`nom` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

INSERT INTO `matchezmoi`.`role` (`nom`)
VALUES ('regulier'), ('premium'), ('admin');


-- -----------------------------------------------------
-- Table `matchezmoi`.`sexe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`sexe` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `UK_hosfua1cbbgu5oq6i38omksi6` (`nom` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

INSERT INTO `matchezmoi`.`sexe` (`nom`)
VALUES ('homme'), ('femme'), ('autre');


-- -----------------------------------------------------
-- Table `matchezmoi`.`utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`utilisateur` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(64) NOT NULL,
    `prenom` VARCHAR(64) NOT NULL,
    `mot_passe` VARCHAR(64) NOT NULL,
    `nom_utilisateur` VARCHAR(64) NOT NULL,
    `orientation_id` INT(11) NOT NULL,
    `role_id` INT(11) NOT NULL,
    `sexe_id` INT(11) NOT NULL,
    `region_id` INT(11) NOT NULL,
    `age` VARCHAR(64) NOT NULL,
    `email` VARCHAR(128) NOT NULL,
    `description` VARCHAR(512) NOT NULL,
    `photo` VARCHAR(255) NULL DEFAULT NULL,
    `active` BIT(1) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `UK_rma38wvnqfaf66vvmi57c71lo` (`email` ASC) VISIBLE,
    INDEX `FKarmy4jnqg1k48ueuwgwd66xcj` (`orientation_id` ASC) VISIBLE,
    INDEX `FKh0x1u0qcvk024ohd416arkunl` (`region_id` ASC) VISIBLE,
    INDEX `FKaqe8xtajee4k0wlqrvh2pso4l` (`role_id` ASC) VISIBLE,
    INDEX `FK8ynn57yeyv8mdm5saxyg2xidn` (`sexe_id` ASC) VISIBLE,
    CONSTRAINT `FK8ynn57yeyv8mdm5saxyg2xidn`
    FOREIGN KEY (`sexe_id`)
    REFERENCES `matchezmoi`.`sexe` (`id`),
    CONSTRAINT `FKaqe8xtajee4k0wlqrvh2pso4l`
    FOREIGN KEY (`role_id`)
    REFERENCES `matchezmoi`.`role` (`id`),
    CONSTRAINT `FKarmy4jnqg1k48ueuwgwd66xcj`
    FOREIGN KEY (`orientation_id`)
    REFERENCES `matchezmoi`.`orientation` (`id`),
    CONSTRAINT `FKh0x1u0qcvk024ohd416arkunl`
    FOREIGN KEY (`region_id`)
    REFERENCES `matchezmoi`.`region` (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

INSERT INTO `matchezmoi`.`utilisateur`
(`nom`, `prenom`, `mot_passe`, `nom_utilisateur`, `orientation_id`, `role_id`, `sexe_id`, `region_id`, `age`, `email`, `description`, `photo`, `active`)
VALUES
    ('Fring', 'Gus', 'password', 'gusfring', 2, 3, 1, 1, '35', 'gusfring@gmail.com', 'Lorem ipsum dolor sit amet', 'gus.png', 1),
    ('Doe', 'John', 'password', 'johndoe', 1, 1, 1, 1, '28', 'johndoe@gmail.com', 'Lorem ipsum dolor sit amet', 'jeandupont.jpg', 1),
    ('Doe', 'Jane', 'password', 'janedoe', 3, 1, 2, 1, '31', 'janedoe@gmail.com', 'Lorem ipsum dolor sit amet', 'juliagomez.jpg', 1),
    ('Smith', 'Joe', 'password', 'joesmith', 1, 1, 1, 1, '26', 'joesmith@gmail.com', 'Lorem ipsum dolor sit amet', 'Pierre.png', 1),
    ('Wu', 'Tina', 'password', 'tinawu', 3, 1, 2, 1, '29', 'tinawu@gmail.com', 'Lorem ipsum dolor sit amet', 'sofiatorres.jpg', 1),
    ('Griffin', 'Peter', 'password', 'minlee', 1, 1, 1, 1, '23', 'minlee@gmail.com', 'Lorem ipsum dolor sit amet', 'Peter.png', 1);


-- -----------------------------------------------------
-- Table `matchezmoi`.`utilisateur_favoris`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`utilisateur_favoris` (
    `utilisateur_id` INT(11) NOT NULL,
    `favoris_id` INT(11) NOT NULL,
    INDEX `FK5griq3wvft0mu6u7qjmj37j0` (`favoris_id` ASC) VISIBLE,
    INDEX `FKpsqao2x43qymajd1rfv03lw5b` (`utilisateur_id` ASC) VISIBLE,
    CONSTRAINT `FK5griq3wvft0mu6u7qjmj37j0`
    FOREIGN KEY (`favoris_id`)
    REFERENCES `matchezmoi`.`utilisateur` (`id`),
    CONSTRAINT `FKpsqao2x43qymajd1rfv03lw5b`
    FOREIGN KEY (`utilisateur_id`)
    REFERENCES `matchezmoi`.`utilisateur` (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `matchezmoi`.`utilisateur_match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`utilisateur_match` (
    `utilisateur_id` INT(11) NOT NULL,
    `match_id` INT(11) NOT NULL,
    INDEX `FK12m4t3bjdnmlw91n5jarhetkt` (`match_id` ASC) VISIBLE,
    INDEX `FK6snl28wxac8b229sc9x04hsh` (`utilisateur_id` ASC) VISIBLE,
    CONSTRAINT `FK12m4t3bjdnmlw91n5jarhetkt`
    FOREIGN KEY (`match_id`)
    REFERENCES `matchezmoi`.`utilisateur` (`id`),
    CONSTRAINT `FK6snl28wxac8b229sc9x04hsh`
    FOREIGN KEY (`utilisateur_id`)
    REFERENCES `matchezmoi`.`utilisateur` (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `matchezmoi`.`utilisateur_passion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `matchezmoi`.`utilisateur_passion` (
    `utilisateur_id` INT(11) NOT NULL,
    `passion_id` INT(11) NOT NULL,
    PRIMARY KEY (`utilisateur_id`, `passion_id`),
    INDEX `FKp9qfpunitss1pixmv07f7u93i` (`passion_id` ASC) VISIBLE,
    CONSTRAINT `FK7cgafvnver1llya8yrxqva7y`
    FOREIGN KEY (`utilisateur_id`)
    REFERENCES `matchezmoi`.`utilisateur` (`id`),
    CONSTRAINT `FKp9qfpunitss1pixmv07f7u93i`
    FOREIGN KEY (`passion_id`)
    REFERENCES `matchezmoi`.`passion` (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
