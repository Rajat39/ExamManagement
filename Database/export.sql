/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.0.27-community-nt : Database - classes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`classes` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `classes`;

/*Table structure for table `addprofessor` */

DROP TABLE IF EXISTS `addprofessor`;

CREATE TABLE `addprofessor` (
  `addProfessorId` int(11) NOT NULL,
  `AddProfessorName` varchar(255) default NULL,
  `AddProfessorDateOfBirth` varchar(255) default NULL,
  `AddProfessorGender` varchar(255) default NULL,
  `AddProfessorPosition` varchar(255) default NULL,
  `AddProfessorEmail` varchar(255) default NULL,
  `AddProfessorPhone` varchar(255) default NULL,
  `AddProfessorPassword` varchar(255) default NULL,
  `branchId` int(11) default NULL,
  PRIMARY KEY  (`addProfessorId`),
  KEY `FKC570F6EEC9CEDCD` (`branchId`),
  CONSTRAINT `FKC570F6EEC9CEDCD` FOREIGN KEY (`branchId`) REFERENCES `branchvo` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addprofessor` */

/*Table structure for table `branchvo` */

DROP TABLE IF EXISTS `branchvo`;

CREATE TABLE `branchvo` (
  `branchId` int(11) NOT NULL,
  `branchName` varchar(255) default NULL,
  `branchDes` varchar(255) default NULL,
  `branchCode` bigint(20) default NULL,
  PRIMARY KEY  (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `branchvo` */

/*Table structure for table `classblockvo` */

DROP TABLE IF EXISTS `classblockvo`;

CREATE TABLE `classblockvo` (
  `classBlockId` int(11) NOT NULL,
  `classBlockTitle` varchar(255) default NULL,
  `classBlockSize` varchar(255) default NULL,
  `classBlockDescription` varchar(255) default NULL,
  `classId` int(11) default NULL,
  `examId` int(11) default NULL,
  PRIMARY KEY  (`classBlockId`),
  KEY `FKAA40B8E453B588F` (`classId`),
  KEY `FKAA40B8E8E822587` (`examId`),
  CONSTRAINT `FKAA40B8E8E822587` FOREIGN KEY (`examId`) REFERENCES `examvo` (`examId`),
  CONSTRAINT `FKAA40B8E453B588F` FOREIGN KEY (`classId`) REFERENCES `classvo` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `classblockvo` */

/*Table structure for table `classvo` */

DROP TABLE IF EXISTS `classvo`;

CREATE TABLE `classvo` (
  `classId` int(11) NOT NULL,
  `classNumber` int(11) default NULL,
  `classDes` varchar(255) default NULL,
  `classCapacity` int(11) default NULL,
  `classFloor` int(11) default NULL,
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `classvo` */

/*Table structure for table `examvo` */

DROP TABLE IF EXISTS `examvo`;

CREATE TABLE `examvo` (
  `examId` int(11) NOT NULL,
  `examTitle` varchar(255) default NULL,
  `examDescription` varchar(255) default NULL,
  `examDate` varchar(255) default NULL,
  `examTimeSlot` varchar(255) default NULL,
  `branchId` int(11) default NULL,
  `semId` int(11) default NULL,
  PRIMARY KEY  (`examId`),
  KEY `FK7C872338C9CEDCD` (`branchId`),
  KEY `FK7C872338DEC6FF1C` (`semId`),
  CONSTRAINT `FK7C872338DEC6FF1C` FOREIGN KEY (`semId`) REFERENCES `semestervo` (`semId`),
  CONSTRAINT `FK7C872338C9CEDCD` FOREIGN KEY (`branchId`) REFERENCES `branchvo` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `examvo` */

/*Table structure for table `facultyvo` */

DROP TABLE IF EXISTS `facultyvo`;

CREATE TABLE `facultyvo` (
  `facultyId` int(11) NOT NULL,
  `addProfessorId` int(11) default NULL,
  `examId` int(11) default NULL,
  `classBlockId` int(11) default NULL,
  PRIMARY KEY  (`facultyId`),
  KEY `FK29E0BBFD66F64293` (`classBlockId`),
  KEY `FK29E0BBFDCEEAE85` (`addProfessorId`),
  KEY `FK29E0BBFD8E822587` (`examId`),
  CONSTRAINT `FK29E0BBFD8E822587` FOREIGN KEY (`examId`) REFERENCES `examvo` (`examId`),
  CONSTRAINT `FK29E0BBFD66F64293` FOREIGN KEY (`classBlockId`) REFERENCES `classblockvo` (`classBlockId`),
  CONSTRAINT `FK29E0BBFDCEEAE85` FOREIGN KEY (`addProfessorId`) REFERENCES `addprofessor` (`addProfessorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facultyvo` */

/*Table structure for table `loginvo` */

DROP TABLE IF EXISTS `loginvo`;

CREATE TABLE `loginvo` (
  `loginId` int(11) NOT NULL,
  `userName` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `userType` varchar(255) default NULL,
  PRIMARY KEY  (`loginId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loginvo` */

insert  into `loginvo`(`loginId`,`userName`,`password`,`userType`) values (1,'123','123','Director');

/*Table structure for table `postvo` */

DROP TABLE IF EXISTS `postvo`;

CREATE TABLE `postvo` (
  `postId` int(11) NOT NULL,
  `postName` varchar(255) default NULL,
  `postDescription` varchar(255) default NULL,
  PRIMARY KEY  (`postId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `postvo` */

/*Table structure for table `schedulevo` */

DROP TABLE IF EXISTS `schedulevo`;

CREATE TABLE `schedulevo` (
  `scheduleId` int(11) NOT NULL,
  `descreiption` varchar(255) default NULL,
  `addProfessorId` int(11) default NULL,
  `examId` int(11) default NULL,
  PRIMARY KEY  (`scheduleId`),
  KEY `FK4DDE2FB0CEEAE85` (`addProfessorId`),
  KEY `FK4DDE2FB08E822587` (`examId`),
  CONSTRAINT `FK4DDE2FB08E822587` FOREIGN KEY (`examId`) REFERENCES `examvo` (`examId`),
  CONSTRAINT `FK4DDE2FB0CEEAE85` FOREIGN KEY (`addProfessorId`) REFERENCES `addprofessor` (`addProfessorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schedulevo` */

/*Table structure for table `semestervo` */

DROP TABLE IF EXISTS `semestervo`;

CREATE TABLE `semestervo` (
  `semId` int(11) NOT NULL,
  `semName` varchar(255) default NULL,
  `semDes` varchar(255) default NULL,
  `branchId` int(11) default NULL,
  PRIMARY KEY  (`semId`),
  KEY `FK97548A11C9CEDCD` (`branchId`),
  CONSTRAINT `FK97548A11C9CEDCD` FOREIGN KEY (`branchId`) REFERENCES `branchvo` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `semestervo` */

/*Table structure for table `staffvo` */

DROP TABLE IF EXISTS `staffvo`;

CREATE TABLE `staffvo` (
  `staffId` int(11) NOT NULL,
  `StaffName` varchar(255) default NULL,
  `StaffDateOfBirth` varchar(255) default NULL,
  `StaffGender` varchar(255) default NULL,
  `StaffPosition` varchar(255) default NULL,
  `StaffEmail` varchar(255) default NULL,
  `StaffPhone` varchar(255) default NULL,
  `StaffPassword` varchar(255) default NULL,
  `branchId` int(11) default NULL,
  PRIMARY KEY  (`staffId`),
  KEY `FKF21E2D79C9CEDCD` (`branchId`),
  CONSTRAINT `FKF21E2D79C9CEDCD` FOREIGN KEY (`branchId`) REFERENCES `branchvo` (`branchId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `staffvo` */

/*Table structure for table `uservo` */

DROP TABLE IF EXISTS `uservo`;

CREATE TABLE `uservo` (
  `userId` int(11) NOT NULL,
  `userFname` varchar(255) default NULL,
  `userLname` varchar(255) default NULL,
  `userEmail` varchar(255) default NULL,
  `userPswd` varchar(255) default NULL,
  `userDepartment` varchar(255) default NULL,
  `userDob` varchar(255) default NULL,
  `userPosition` varchar(255) default NULL,
  `userPhone` bigint(20) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `uservo` */

insert  into `uservo`(`userId`,`userFname`,`userLname`,`userEmail`,`userPswd`,`userDepartment`,`userDob`,`userPosition`,`userPhone`) values (1,'rajat','gupta','123','123',NULL,'1995-12-05','Director',9909961400);

/*Table structure for table `wagesvo` */

DROP TABLE IF EXISTS `wagesvo`;

CREATE TABLE `wagesvo` (
  `wagesId` int(11) NOT NULL,
  `wagesAmount` varchar(255) default NULL,
  `postId` int(11) default NULL,
  PRIMARY KEY  (`wagesId`),
  KEY `FKA59F5024B31FAE09` (`postId`),
  CONSTRAINT `FKA59F5024B31FAE09` FOREIGN KEY (`postId`) REFERENCES `postvo` (`postId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wagesvo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
