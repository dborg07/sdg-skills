SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sdg` DEFAULT CHARACTER SET utf8 ;
USE `sdg` ;

-- -----------------------------------------------------
-- Table `sdg`.`category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`category` (
  `CategoryID` INT(11) NOT NULL ,
  `CategoryName` VARCHAR(35) NOT NULL ,
  `IsActive` TINYINT(1) NOT NULL DEFAULT '1' ,
  `LastModifiedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `LastModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `CreatedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `CreateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`CategoryID`) ,
  UNIQUE INDEX `CategoryID` (`CategoryID` ASC) ,
  UNIQUE INDEX `CategoryName_UNIQUE` (`CategoryName` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`certification`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`certification` (
  `CertificationsID` INT(11) NOT NULL AUTO_INCREMENT ,
  `Certification` VARCHAR(255) NOT NULL ,
  `CategoryID` INT(11) NOT NULL DEFAULT '0' ,
  `IsActive` TINYINT(1) NOT NULL DEFAULT '1' ,
  `LastModifiedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `LastModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `CreatedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `CreateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`CertificationsID`) ,
  UNIQUE INDEX `Certification_UNIQUE` (`Certification` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`certificationcategory`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`certificationcategory` (
  `Certifications_CertificationsID` INT(11) NOT NULL ,
  `Category_CategoryID` INT(11) NOT NULL ,
  PRIMARY KEY (`Certifications_CertificationsID`, `Category_CategoryID`) ,
  INDEX `fk_Certifications_has_Category_Category1_idx` (`Category_CategoryID` ASC) ,
  INDEX `fk_Certifications_has_Category_Certifications_idx` (`Certifications_CertificationsID` ASC) ,
  CONSTRAINT `fk_Certifications_has_Category_Certifications`
    FOREIGN KEY (`Certifications_CertificationsID` )
    REFERENCES `sdg`.`certification` (`CertificationsID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`opportunity`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`opportunity` (
  `OpportunityID` INT(11) NOT NULL AUTO_INCREMENT ,
  `OpportunityName` VARCHAR(50) NOT NULL ,
  `OrgID` INT(11) NOT NULL ,
  `StartDate` DATE NULL DEFAULT NULL ,
  `EndDate` DATE NULL DEFAULT NULL ,
  `LastModifiedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `LastModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `CreatedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `CreateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `OpportunitySkills_OpportunitySkillID` INT(11) NOT NULL ,
  `OpportunitySkills_OpportunitySkillID1` INT(11) NOT NULL ,
  PRIMARY KEY (`OpportunityID`, `OpportunitySkills_OpportunitySkillID`, `OpportunitySkills_OpportunitySkillID1`) ,
  UNIQUE INDEX `OpportunityID` (`OpportunityID` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`skillgroup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`skillgroup` (
  `SkillGroupID` INT(11) NOT NULL AUTO_INCREMENT ,
  `SkillGroupName` VARCHAR(45) NOT NULL ,
  `IsActive` TINYINT(1) NOT NULL DEFAULT '1' ,
  `LastModifiedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `LastModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `CreatedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `CreateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`SkillGroupID`) ,
  UNIQUE INDEX `SkillGroupName_UNIQUE` (`SkillGroupName` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`skill`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`skill` (
  `SkillID` INT(11) NOT NULL AUTO_INCREMENT ,
  `SkillName` VARCHAR(50) NOT NULL ,
  `SkillGroupID` INT(11) NOT NULL DEFAULT '0' ,
  `SkillType` VARCHAR(20) NOT NULL ,
  `CategoryID` INT(11) NOT NULL DEFAULT '0' ,
  `LifecycleStage` INT(11) NULL DEFAULT NULL ,
  `DemandLevel` INT(11) NOT NULL ,
  `ProfitLevel` INT(11) NOT NULL DEFAULT '0' ,
  `IsActive` TINYINT(1) NOT NULL DEFAULT '1' ,
  `LastModifiedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `LastModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `CreatedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `CreateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`SkillID`) ,
  UNIQUE INDEX `SkillID` (`SkillID` ASC) ,
  UNIQUE INDEX `SkillName_UNIQUE` (`SkillName` ASC) ,
  INDEX `fk_Skills_SkillGroup1_idx` (`SkillGroupID` ASC) ,
  CONSTRAINT `fk_Skills_SkillGroup1`
    FOREIGN KEY (`SkillGroupID` )
    REFERENCES `sdg`.`skillgroup` (`SkillGroupID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 86
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`opportunityskill`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`opportunityskill` (
  `OpportunitySkillID` INT(11) NOT NULL AUTO_INCREMENT ,
  `OpportunityID` INT(11) NOT NULL DEFAULT '0' ,
  `OrgID` INT(11) NOT NULL DEFAULT '0' ,
  `SkillID` INT(11) NOT NULL DEFAULT '0' ,
  `IsActive` TINYINT(1) NOT NULL DEFAULT '1' ,
  `LastModifiedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `LastModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `CreatedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `CreateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `Opportunity_OpportunityID` INT(11) NOT NULL ,
  `Opportunity_OpportunitySkills_OpportunitySkillID` INT(11) NOT NULL ,
  `Opportunity_OpportunitySkills_OpportunitySkillID1` INT(11) NOT NULL ,
  PRIMARY KEY (`OpportunitySkillID`, `Opportunity_OpportunityID`, `Opportunity_OpportunitySkills_OpportunitySkillID`, `Opportunity_OpportunitySkills_OpportunitySkillID1`) ,
  UNIQUE INDEX `ClientSkillInventoryID` (`OpportunitySkillID` ASC) ,
  INDEX `fk_OpportunitySkills_Skills1_idx` (`SkillID` ASC) ,
  CONSTRAINT `fk_OpportunitySkills_Skills1`
    FOREIGN KEY (`SkillID` )
    REFERENCES `sdg`.`skill` (`SkillID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`organization`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`organization` (
  `OrgID` INT(11) NOT NULL AUTO_INCREMENT ,
  `MaxHireClientID` INT(11) NULL DEFAULT NULL ,
  `Organization` VARCHAR(50) NOT NULL ,
  `City` VARCHAR(25) NULL DEFAULT NULL ,
  `State` CHAR(2) NULL DEFAULT NULL ,
  `Zip` CHAR(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`OrgID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`person`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`person` (
  `PersonID` INT(11) NOT NULL AUTO_INCREMENT ,
  `MaxHireID` INT(11) NOT NULL ,
  `FirstName` VARCHAR(25) NULL DEFAULT NULL ,
  `LastName` VARCHAR(30) NULL DEFAULT NULL ,
  PRIMARY KEY (`PersonID`) ,
  UNIQUE INDEX `PersonID` (`PersonID` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`personcertification`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`personcertification` (
  `PersonCertificationsID` INT(11) NOT NULL AUTO_INCREMENT ,
  `CertificationID` INT(11) NOT NULL DEFAULT '0' ,
  `PersonID` INT(11) NOT NULL DEFAULT '0' ,
  `Interest` INT(11) NOT NULL DEFAULT '0' ,
  `ExpirationDate` DATE NULL DEFAULT NULL ,
  `LastModifiedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `LastModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `CreatedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `CreateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`PersonCertificationsID`) ,
  INDEX `fk_PersonCertifications_Person1_idx` (`PersonID` ASC) ,
  INDEX `fk_PersonCertifications_Certifications1_idx` (`CertificationID` ASC) ,
  CONSTRAINT `fk_PersonCertifications_Person1`
    FOREIGN KEY (`PersonID` )
    REFERENCES `sdg`.`person` (`PersonID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PersonCertifications_Certifications1`
    FOREIGN KEY (`CertificationID` )
    REFERENCES `sdg`.`certification` (`CertificationsID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sdg`.`personskillsinventory`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sdg`.`personskillsinventory` (
  `SkillInventoryID` INT(11) NOT NULL AUTO_INCREMENT ,
  `SkillID` INT(11) NOT NULL ,
  `PersonID` INT(11) NOT NULL ,
  `SkillLevel` INT(11) NOT NULL DEFAULT '0' ,
  `Interest` INT(11) NOT NULL DEFAULT '0' ,
  `IsFavorite` TINYINT(1) NOT NULL DEFAULT '0' ,
  `TraingingInterest` INT(11) NOT NULL DEFAULT '0' ,
  `IsActive` TINYINT(1) NOT NULL DEFAULT '1' ,
  `StartDate` DATE NULL DEFAULT NULL ,
  `EndDate` DATE NULL DEFAULT NULL ,
  `LastModifiedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `LastModifiedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `CreatedBy` VARCHAR(45) NOT NULL DEFAULT 'system' ,
  `CreateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`SkillInventoryID`) ,
  UNIQUE INDEX `SkillInventoryID` (`SkillInventoryID` ASC) ,
  INDEX `fk_PersonSkillsInventory_Person1_idx` (`PersonID` ASC) ,
  INDEX `fk_PersonSkillsInventory_Skills1_idx` (`SkillID` ASC) ,
  CONSTRAINT `fk_PersonSkillsInventory_Person1`
    FOREIGN KEY (`PersonID` )
    REFERENCES `sdg`.`person` (`PersonID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PersonSkillsInventory_Skills1`
    FOREIGN KEY (`SkillID` )
    REFERENCES `sdg`.`skill` (`SkillID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `sdg` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
