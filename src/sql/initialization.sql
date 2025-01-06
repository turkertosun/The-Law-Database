-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: project_db
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `case_judge`
--

DROP TABLE IF EXISTS `case_judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_judge` (
  `caseID` int(11) NOT NULL,
  `judgeID` int(11) NOT NULL,
  PRIMARY KEY (`caseID`,`judgeID`),
  KEY `judgeID` (`judgeID`),
  CONSTRAINT `case_judge_ibfk_1` FOREIGN KEY (`caseID`) REFERENCES `cases` (`caseID`),
  CONSTRAINT `case_judge_ibfk_2` FOREIGN KEY (`judgeID`) REFERENCES `judge` (`judgeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_judge`
--

LOCK TABLES `case_judge` WRITE;
/*!40000 ALTER TABLE `case_judge` DISABLE KEYS */;
INSERT INTO `case_judge` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
/*!40000 ALTER TABLE `case_judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_type`
--

DROP TABLE IF EXISTS `case_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_type` (
  `caseTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `caseTypeName` varchar(100) NOT NULL,
  `legalAreaID` int(11) NOT NULL,
  PRIMARY KEY (`caseTypeID`),
  KEY `legalAreaID` (`legalAreaID`),
  CONSTRAINT `case_type_ibfk_1` FOREIGN KEY (`legalAreaID`) REFERENCES `legal_area` (`legalAreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_type`
--

LOCK TABLES `case_type` WRITE;
/*!40000 ALTER TABLE `case_type` DISABLE KEYS */;
INSERT INTO `case_type` VALUES (1,'Property',1),(2,'Contract',1),(3,'Consumer Protection',1),(4,'Family',1),(5,'Environmental',1),(6,'Fraud',1),(7,'Conversation',1),(8,'Theft',2),(9,'White Collar',2),(10,'Cybertime',2),(11,'Traffic Violation',2),(12,'Violent Crime',2),(13,'Drug Offense',2),(14,'Property Crime',2),(15,'Civil Rights Violation',2),(16,'Protective Crime',2),(17,'Firearms Violation',2),(18,'Disorderly Conduct',2),(19,'Contract',3),(20,'Financial Regulation',3),(21,'Employment',3),(22,'Intellectual Property',3),(23,'Governance',3),(24,'Pollution Control',4),(25,'Negligence',4),(26,'Conservation',4),(27,'Public Nuisance',4),(28,'Custody',5),(29,'Alimony',5),(30,'Contract',5),(31,'Property',5),(32,'Privacy Violation',6),(33,'Cybercrime',6),(34,'Libel',6),(35,'Intellectual Property',6),(36,'Compliance',6),(37,'Infringement',7),(38,'Privacy Violation',8);
/*!40000 ALTER TABLE `case_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `caseID` int(11) NOT NULL AUTO_INCREMENT,
  `caseName` varchar(100) NOT NULL,
  `caseDescription` text,
  `caseDate` date NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `caseTypeID` int(11) NOT NULL,
  PRIMARY KEY (`caseID`),
  KEY `userID` (`userID`),
  KEY `caseTypeID` (`caseTypeID`),
  CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  CONSTRAINT `cases_ibfk_2` FOREIGN KEY (`caseTypeID`) REFERENCES `case_type` (`caseTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,'Property Line Dispute','Two neighbors are in conflict over a fence encroachment. Lisa claims John’s fence extends two feet onto her property, as confirmed by a survey. John insists old records validate his construction. The court will determine if John must remove the fence or compensate Lisa.\n\n','2024-11-01',1,1),(2,'Breach of Lease Agreement','Michael sublet his apartment without landlord approval, citing financial distress. The landlord claims the lease prohibits subletting, and subtenants caused damages. The court must decide if the breach warrants eviction or compensation.','2022-02-03',2,2),(3,'Defective Product Lawsuit','Jennifer’s microwave caught fire despite following instructions. The manufacturer denies responsibility, blaming misuse. The court will evaluate liability using evidence, including similar complaints from other customers.','2013-03-02',3,3),(4,'Divorce Settlement Dispute','Sarah and David dispute ownership of their restaurant in their divorce. Sarah highlights her operational role, while David cites prior profitability. The court will review records to determine a fair asset division.','2018-03-06',1,4),(5,'Noise Pollution Claim','Residents sue a factory for constant noise disrupting their lives. The factory defends its compliance with noise laws and local economic contributions. The court will balance economic and residential concerns.','2019-04-07',2,5),(6,'Tenant Eviction Appeal','A tenant challenges an eviction notice, claiming retaliation for maintenance complaints. The landlord alleges lease violations, including unpaid rent. Evidence will clarify if the eviction was fair or unwarranted.','2020-04-01',2,1),(7,'Real Estate Fraud','Buyers sue a realtor for selling properties with falsified ownership documents. Plaintiffs demand refunds and damages for financial loss. The court will investigate the legitimacy of the sale.','2013-04-01',1,6),(8,'Utility Billing Overcharge','A homeowner claims their utility bills doubled despite steady usage. Audits support the claim, but the company denies responsibility. The court must decide if the homeowner deserves refunds or further investigation.','2021-03-06',2,2),(9,'Wildlife Protection Dispute\n','Activists sue developers for building near a wildlife reserve, threatening endangered species. Developers argue compliance with permits. The court will balance ecological protection against economic benefits.','2022-04-09',3,7),(10,'Contract Breach for Renovation Delays','A homeowner sues a contractor for failing to complete renovations on time. The contractor cites supply chain issues, but the plaintiff demands compensation. The court will assess the validity of the delays and damages.','2023-04-01',3,2),(11,'Armed Robbery Conviction','A suspect is charged with robbing a gas station at gunpoint. Security footage supports the accusation, but the defendant claims mistaken identity. The court must evaluate evidence and testimony to reach a verdict.','2017-04-05',3,8),(12,'Fraudulent Financial Transactions','A former bank manager is accused of embezzling funds through fake accounts. Audits revealed discrepancies of over $1 million. The court must establish the defendant’s role in the fraud.','2020-04-09',2,9),(13,'Cybersecurity Breach Prosecution','A hacker is charged with stealing hospital data and selling it on the dark web. The defense denies involvement, citing lack of direct evidence. The case will test the limits of digital forensic investigations.','2012-04-08',2,10),(14,'Reckless Driving Incident','A driver faces charges for speeding through a residential area, endangering pedestrians. The defendant argues they were rushing due to a medical emergency. The court will determine liability and appropriate penalties.','2009-04-05',1,11),(15,'Assault and Battery Charge','A suspect is accused of assaulting another individual during a bar fight. Witnesses offer conflicting accounts of who initiated the altercation. The court must clarify events before issuing a ruling.','2020-04-06',3,12),(16,'Drug Possession Allegation','A defendant is charged with possessing illegal substances found during a traffic stop. The defense argues the search was unlawful. The court will determine the admissibility of evidence.','2020-07-03',3,13),(17,'Burglary Conviction','A suspect is caught breaking into a jewelry store after hours. Surveillance footage shows the individual on the premises, but no stolen items were recovered. The court must decide the intent behind the break-in.','2018-04-02',3,14),(18,'Cyber Fraud Investigation','A suspect is accused of defrauding seniors through an email phishing scheme. Investigators trace stolen funds to offshore accounts linked to the defendant. The court will examine the extent of their involvement.\n\n','2010-05-05',2,9),(19,'Hate Crime Allegation','A defendant is accused of vandalizing a mosque, motivated by racial prejudice. Witnesses reported the suspect near the scene. The court will address the defendant’s actions and underlying intent.\n\n','2023-01-04',1,15),(20,'Kidnapping and Extortion Case','A group is charged with abducting a local businessman and demanding ransom. Authorities intercepted communications linking the suspects to the crime. The court must evaluate the evidence to determine guilt.','2024-01-01',1,12),(21,'Domestic Abuse Allegation','A victim files for a restraining order against their spouse, citing physical and emotional abuse. Evidence includes threatening messages and documented injuries. The defendant denies the claims, arguing they are exaggerated. The court must assess the evidence and determine if a protective order is warranted.','2024-04-06',2,16),(22,'Illegal Weapon Possession','A suspect is found with an unregistered firearm during a routine traffic stop. The defense argues the weapon was inherited and mistakenly brought along. The court will decide if intent or oversight plays a role in the violation.','2020-04-05',1,17),(23,'Vandalism of Public Property','A teenager is accused of spray-painting graffiti on a city monument. CCTV footage places the suspect at the scene, but they claim it was an artistic expression. The court must decide if the act constitutes vandalism or protected speech.\n\n','2017-04-05',3,14),(24,'Arson Charge','A homeowner is charged with setting fire to their property to claim insurance money. Fire investigators found evidence of accelerants at the scene. The defense argues the fire was accidental, and the court must resolve the dispute.','2013-04-04',3,12),(25,'Public Disturbance Incident','A defendant is arrested for disrupting a public rally by shouting profanities and refusing to leave. They argue it was a peaceful protest, protected by free speech. The court will determine if their actions crossed legal boundaries.\n\n','2014-05-02',2,18),(26,'Mergers and Acquisitions Dispute','Two companies dispute the terms of a merger, with one alleging hidden liabilities were not disclosed. Financial audits and contractual documents are presented in court. The decision will impact how mergers are negotiated in the future.','2018-04-05',3,19),(27,'Insider Trading Allegation','A corporate executive is accused of using confidential company information to trade stocks. Evidence includes emails suggesting pre-knowledge of a major acquisition. The court must decide if the trades violated securities laws.\n\n','2019-05-04',3,20),(28,'Employee Rights Violation','A former employee sues their company for wrongful termination, citing discriminatory practices. The employer argues the termination was due to poor performance. The court will examine evidence to determine if discrimination played a role.','2016-04-02',1,21),(29,'Trademark Infringement Lawsuit','A startup is accused of using a logo similar to a well-established brand, confusing customers. The startup denies copying, claiming the resemblance is coincidental. The court will assess the impact of the alleged infringement on the brand.','2015-02-06',2,22),(30,'Shareholder Dispute','Minority shareholders file a lawsuit, claiming the company’s board of directors unfairly diluted their shares. They allege the board acted without proper consultation. The court will evaluate the board’s decisions and compliance with corporate governance rules.','2017-01-01',1,23),(31,'Industrial Waste Disposal Case','A factory is sued for illegally dumping waste into a nearby river, causing harm to aquatic life. Environmental groups present water quality tests as evidence. The factory denies wrongdoing, citing compliance with existing permits.','2018-04-01',1,24),(32,'Air Quality Regulation Violation','A power plant is accused of exceeding emissions limits, causing air quality issues for nearby residents. The company argues its equipment meets standards. The court will review environmental reports to decide if violations occurred.','2018-05-02',2,24),(33,'Forest Fire Compensation Claim','Landowners sue a utility company for failing to maintain power lines, leading to a wildfire. The company argues natural factors caused the fire. The court must determine liability and damages.','2019-04-06',3,25),(34,'Protected Land Violation','A developer is accused of building on protected land, threatening local wildlife. Permits are contested as being improperly granted. The court will decide if the project must halt or adjust its scope.\n\n','2018-01-07',3,26),(35,'Noise Regulation Lawsuit','Residents near an airport file a lawsuit over excessive noise during nighttime hours. The airport claims operational needs justify its schedule. The court will evaluate if noise reduction measures are feasible.','2012-05-06',3,27),(36,'Child Custody Dispute','Two parents are disputing custody of their child, with one claiming the other is unfit due to financial instability. Both sides present character witnesses and financial records. The court will prioritize the child’s best interests in its decision.','2017-04-06',2,28),(37,'Spousal Support Modification','A spouse requests a reduction in alimony payments, citing job loss and reduced income. The other party argues the request is an attempt to evade financial obligations. The court will evaluate financial changes to decide on modifications.','2019-05-02',3,29),(38,'Prenuptial Agreement Dispute','A spouse challenges the validity of a prenuptial agreement, claiming it was signed under duress. The other party argues the terms were clear and mutually agreed upon. The court must determine if the agreement is enforceable.','2020-05-02',1,30),(39,'Adoption Dispute','Biological parents challenge the adoption of their child, claiming they were misled into signing consent forms. The adoptive parents argue the process was legal and transparent. The court will decide custody based on evidence.','2021-04-01',3,28),(40,'Domestic Partnership Dissolution','A couple is disputing the division of jointly purchased property after ending their domestic partnership. One party claims they contributed more financially. The court will determine a fair resolution.','2022-05-02',2,31),(41,'Unauthorized Data Sharing Lawsuit','An app is sued for selling user data without explicit consent. Plaintiffs argue this breaches privacy laws. The company denies wrongdoing, claiming users agreed to the terms.','2015-05-01',3,32),(42,'Ransomware Attack Prosecution','A suspect is charged with encrypting company files and demanding ransom. Evidence links the suspect’s computer to the attack. The court will evaluate the cybercrime charges.','2018-05-01',2,33),(43,'Social Media Defamation Case','A public figure sues a social media user for spreading false and damaging allegations. The defense claims it was an opinion. The court will decide if the statements qualify as defamation.','2019-04-01',3,34),(44,'Software Piracy Lawsuit','A company accuses a developer of distributing unauthorized copies of its software. The defendant argues it was freeware. The court will assess copyright evidence.','2020-05-01',1,35),(45,'Data Breach Notification Case','A company is sued for failing to notify customers of a data breach promptly. Plaintiffs argue the delay caused financial harm. The court will examine the company’s obligations under privacy laws.','2023-05-09',3,36),(46,'Cross-Border Trademark Conflict','A multinational company files a lawsuit against a foreign competitor for using a logo nearly identical to its trademarked brand. The company claims the logo causes confusion in international markets, damaging its reputation and sales.\nThe competitor denies infringement, arguing the logo was independently designed and not targeted at overlapping customer bases. The court will review design similarities, branding strategies, and market impact. This case may set precedents for global intellectual property disputes.','2024-01-09',3,37),(47,'Unlawful Employee Monitoring Case','An employee sues their company for installing surveillance software on their personal laptop without permission. The company claims the monitoring was necessary to ensure data security during remote work.\nThe employee argues the company violated their privacy by accessing personal files unrelated to work. The court will assess the scope of employer monitoring rights and the employee\'s reasonable expectation of privacy.','2021-04-06',3,38),(48,'Environmental Impact of Pipeline Construction','A group of environmental activists files an injunction to halt pipeline construction through a protected wetland. They argue the project threatens the ecosystem and violates environmental protection laws.\nThe energy company defends the pipeline, claiming it complies with all regulatory requirements and brings economic benefits. The court must balance environmental preservation against infrastructure development needs.','2024-06-09',2,26),(49,'Patent Infringement Case','An inventor accuses a tech company of using their patented design for a smartphone feature without authorization. The company argues the design is generic and does not meet the criteria for infringement.\nThe court will review the patent’s validity and whether the company’s feature overlaps significantly with the protected design. The case could influence future interpretations of patent boundaries.','2020-06-02',1,37),(50,'Fraudulent Cryptocurrency Scheme','A group is charged with operating a fraudulent cryptocurrency investment scheme, promising high returns to investors but siphoning funds into personal accounts. Prosecutors allege the group misrepresented the currency’s value and hid financial losses.\nThe defendants claim they acted in good faith and blame market volatility for the failed investments. The court will examine financial records and communication to determine if fraud occurred.','2023-04-01',2,9);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `court`
--

DROP TABLE IF EXISTS `court`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `court` (
  `courtID` int(11) NOT NULL AUTO_INCREMENT,
  `courtName` varchar(100) NOT NULL,
  `isAvaliable` tinyint(1) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`courtID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `court`
--

LOCK TABLES `court` WRITE;
/*!40000 ALTER TABLE `court` DISABLE KEYS */;
INSERT INTO `court` VALUES (1,'Houston State Court',1,'Texas','Southwest'),(2,'Dallas Federal Court',1,'Texas','Central'),(3,'Austin State Court',0,'Texas','South'),(4,'Illinois Supreme Court',0,'Illinois','Central'),(5,'Missouri Court of Appeals',1,'Missouri','Central'),(6,'Iowa District Court',0,'Iowa','Central'),(7,'Nebraska Supreme Court',1,'Nebraska','Central'),(8,'Kansas Supreme Court',1,'Kansas','Central'),(9,'Texas Court of Criminal Appeals',1,'Texas','Southwest'),(10,'New Mexico Supreme Court',0,'New Mexico','Southwest'),(11,'Florida Supreme Court',1,'Florida','South'),(12,'Georgia Court of Appeals',1,'Georgia','South'),(13,'Alabama Supreme Court',0,'Alabama','South'),(14,'South Carolina Supreme Court',1,'South Carolina','South'),(15,'Tennessee Court of Criminal Appeals',0,'Tennessee','South'),(16,'New York Court of Appeals',0,'New York','Northeast'),(17,'Massachusetts Supreme Judicial Court',1,'Massachusetts','Northeast'),(18,'Connecticut Supreme Court',1,'Connecticut','Northeast'),(19,'Pennsylvania Superior Court',0,'Pennsylvania','Northeast'),(20,'Washington Supreme Court',1,NULL,NULL);
/*!40000 ALTER TABLE `court` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federal_court`
--

DROP TABLE IF EXISTS `federal_court`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federal_court` (
  `federalCourtId` int(11) NOT NULL,
  PRIMARY KEY (`federalCourtId`),
  CONSTRAINT `federal_court_ibfk_1` FOREIGN KEY (`federalCourtId`) REFERENCES `court` (`courtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federal_court`
--

LOCK TABLES `federal_court` WRITE;
/*!40000 ALTER TABLE `federal_court` DISABLE KEYS */;
INSERT INTO `federal_court` VALUES (2);
/*!40000 ALTER TABLE `federal_court` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `judge`
--

DROP TABLE IF EXISTS `judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judge` (
  `judgeID` int(11) NOT NULL AUTO_INCREMENT,
  `judgeName` varchar(100) NOT NULL,
  PRIMARY KEY (`judgeID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `judge`
--

LOCK TABLES `judge` WRITE;
/*!40000 ALTER TABLE `judge` DISABLE KEYS */;
INSERT INTO `judge` VALUES (1,'Judge John G. Roberts, Jr.'),(2,'Judge Clarence Thomas'),(3,'Judge Samuel A. Alito, Jr.'),(4,'Judge Sonia Sotomayor'),(5,'Judge Elena Kagan'),(6,'Judge Neil M. Gorsuch'),(7,'Judge Brett M. Kavanaugh'),(8,'Judge Amy Coney Barrett '),(9,'Judge Ketanji Brown Jackson'),(10,'Judge Merrick B. Garland '),(11,'Judge Sri Srinivasan'),(12,'Judge David S. Tatel'),(13,'Judge Patricia A. Millett '),(14,'Judge Cornelia T.L. Pillard '),(15,'Judge Robert L. Wilkins'),(16,'Judge Gregory G. Katsas'),(17,'Judge Neomi Rao'),(18,'Judge Ketanji Brown Jackson'),(19,'Judge J. Michelle Childs '),(20,'Judge James E. Boasberg'),(21,'Judge Colleen Kollar-Kotelly'),(22,'Judge Emmet G. Sullivan'),(23,'Judge Beryl A. Howell'),(24,'Judge Rudolph Contreras'),(25,'Judge Amit P. Mehta'),(26,'Judge Tanya S. Chutkan'),(27,'Judge Dabney L. Friedrich '),(28,'Judge Timothy J. Kelly '),(29,'Judge Carl J. Nichols'),(30,'Judge Trevor N. McFadden'),(31,'Judge Ana C. Reyes'),(32,'Judge Florence Y. Pan'),(33,'Judge Royce C. Lamberth'),(34,'Judge Ellen S. Huvelle'),(35,'Judge Richard J. Leon '),(36,'Judge James E. Boasberg'),(37,'Judge Christopher R. Cooper '),(38,'Judge Randolph D. Moss'),(39,'Judge Dabney L. Friedrich'),(40,'Judge Timothy J. Kelly'),(41,'Judge Carl J. Nichols'),(42,'Judge Trevor N. McFadden'),(43,'Judge Florence Y. Pan'),(44,'Judge Ana C. Reyes'),(45,'Judge Royce C. Lamberth'),(46,'Judge Ellen S. Huvelle'),(47,'Judge Richard J. Leon'),(48,'Judge James E. Boasberg'),(49,'Judge Christopher R. Cooper'),(50,'Judge Randolph D. Moss');
/*!40000 ALTER TABLE `judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_area`
--

DROP TABLE IF EXISTS `legal_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legal_area` (
  `legalAreaID` int(11) NOT NULL AUTO_INCREMENT,
  `legalAreaName` varchar(100) NOT NULL,
  PRIMARY KEY (`legalAreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_area`
--

LOCK TABLES `legal_area` WRITE;
/*!40000 ALTER TABLE `legal_area` DISABLE KEYS */;
INSERT INTO `legal_area` VALUES (1,'Ciwil Law'),(2,'Criminal Law'),(3,'Corporate Law'),(4,'Enviromental Law'),(5,'Family Law'),(6,'Cyber Law'),(7,'Intellectual Property Law'),(8,'Employment Law');
/*!40000 ALTER TABLE `legal_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_court`
--

DROP TABLE IF EXISTS `state_court`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_court` (
  `stateCourtId` int(11) NOT NULL,
  PRIMARY KEY (`stateCourtId`),
  CONSTRAINT `state_court_ibfk_1` FOREIGN KEY (`stateCourtId`) REFERENCES `court` (`courtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_court`
--

LOCK TABLES `state_court` WRITE;
/*!40000 ALTER TABLE `state_court` DISABLE KEYS */;
INSERT INTO `state_court` VALUES (1),(3);
/*!40000 ALTER TABLE `state_court` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `userRole` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','Lawyer'),(2,'Jane Smith','Judge'),(3,'Onur Sevil','Admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01  2:54:28
