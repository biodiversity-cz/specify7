--
-- Create model Collectionobjecttype
--
CREATE TABLE `collectionobjecttype` (`CollectionObjectTypeID` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `Name` varchar(255) NOT NULL, `Version` integer NULL, `TimestampCreated` datetime(6) NOT NULL, `TimestampModified` datetime(6) NULL, `Text1` longtext NULL, `Text2` longtext NULL, `Text3` longtext NULL, `CollectionID` integer NOT NULL, `CreatedByAgentID` integer NULL, `ModifiedByAgentID` integer NULL, `TaxonTreeDefID` integer NOT NULL);
--
-- Create model Collectionobjectgrouptype
--
CREATE TABLE `collectionobjectgrouptype` (`COGTypeID` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `Name` varchar(255) NOT NULL, `Type` varchar(255) NOT NULL, `Version` integer NULL, `TimestampCreated` datetime(6) NOT NULL, `TimestampModified` datetime(6) NULL, `CollectionID` integer NOT NULL, `CreatedByAgentID` integer NULL, `ModifiedByAgentID` integer NULL);
--
-- Add field collectionobjecttype to collectionobject
--
ALTER TABLE `collectionobject` ADD COLUMN `CollectionObjectTypeID` integer NULL , ADD CONSTRAINT `collectionobject_CollectionObjectType_ec36212d_fk_collectio` FOREIGN KEY (`CollectionObjectTypeID`) REFERENCES `collectionobjecttype`(`CollectionObjectTypeID`);
--
-- Add field collectionobjecttype to collection
--
ALTER TABLE `collection` ADD COLUMN `CollectionObjectTypeID` integer NULL , ADD CONSTRAINT `collection_CollectionObjectType_f109e178_fk_collectio` FOREIGN KEY (`CollectionObjectTypeID`) REFERENCES `collectionobjecttype`(`CollectionObjectTypeID`);
--
-- Create model Collectionobjectgroup
--
CREATE TABLE `collectionobjectgroup` (`collectionobjectgroupid` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `Name` varchar(255) NULL, `Description` longtext NULL, `IGSN` varchar(255) NULL, `GUID` varchar(255) NULL, `Integer1` integer NULL, `Integer2` integer NULL, `Integer3` integer NULL, `Decimal1` numeric(22, 10) NULL, `Decimal2` numeric(22, 10) NULL, `Decimal3` numeric(22, 10) NULL, `Text1` longtext NULL, `Text2` longtext NULL, `Text3` longtext NULL, `YesNo1` bool NULL, `YesNo2` bool NULL, `YesNo3` bool NULL, `Version` integer NULL, `TimestampCreated` datetime(6) NOT NULL, `TimestampModified` datetime(6) NULL, `CollectionID` integer NOT NULL, `COGTypeID` integer NOT NULL, `CreatedByAgentID` integer NULL, `ModifiedByAgentID` integer NULL);
--
-- Create model Collectionobjectgroupjoin
--
CREATE TABLE `collectionobjectgroupjoin` (`collectionobjectgroupjoinid` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `IsPrimary` bool NULL, `IsSubstrate` bool NULL, `Precedence` smallint NULL, `Version` integer NULL, `TimestampCreated` datetime(6) NOT NULL, `TimestampModified` datetime(6) NULL, `Text1` longtext NULL, `Text2` longtext NULL, `Text3` longtext NULL, `Integer1` integer NULL, `Integer2` integer NULL, `Integer3` integer NULL, `YesNo1` bool NULL, `YesNo2` bool NULL, `YesNo3` bool NULL, `ParentCOGID` integer NOT NULL, `ChildCOGID` integer NULL UNIQUE, `ChildCOID` integer NULL UNIQUE);
--
-- Add field discipline to geographytreedef
--
ALTER TABLE `geographytreedef` ADD COLUMN `DisciplineID` integer NULL , ADD CONSTRAINT `geographytreedef_DisciplineID_c467eb48_fk_disciplin` FOREIGN KEY (`DisciplineID`) REFERENCES `discipline`(`usergroupscopeid`);
--
-- Add field discipline to geologictimeperiodtreedef
--
ALTER TABLE `geologictimeperiodtreedef` ADD COLUMN `DisciplineID` integer NULL , ADD CONSTRAINT `geologictimeperiodtr_DisciplineID_ca9bc84e_fk_disciplin` FOREIGN KEY (`DisciplineID`) REFERENCES `discipline`(`usergroupscopeid`);
--
-- Add field discipline to lithostrattreedef
--
ALTER TABLE `lithostrattreedef` ADD COLUMN `DisciplineID` integer NULL , ADD CONSTRAINT `lithostrattreedef_DisciplineID_ffdef5c5_fk_disciplin` FOREIGN KEY (`DisciplineID`) REFERENCES `discipline`(`usergroupscopeid`);
--
-- Add field institution to storagetreedef
--
ALTER TABLE `storagetreedef` ADD COLUMN `InstitutionID` integer NULL , ADD CONSTRAINT `storagetreedef_InstitutionID_ccb33c4c_fk_instituti` FOREIGN KEY (`InstitutionID`) REFERENCES `institution`(`usergroupscopeid`);
--
-- Add field discipline to taxontreedef
--
ALTER TABLE `taxontreedef` ADD COLUMN `DisciplineID` integer NULL , ADD CONSTRAINT `taxontreedef_DisciplineID_f67c028e_fk_disciplin` FOREIGN KEY (`DisciplineID`) REFERENCES `discipline`(`usergroupscopeid`);
--
-- Alter field taxontreedef on discipline
--
ALTER TABLE `discipline` DROP FOREIGN KEY `FK157B9B70EFA9D5F8`;
CREATE INDEX `discipline_TaxonTreeDefID_689649ad` ON `discipline` (`TaxonTreeDefID`);
ALTER TABLE `discipline` ADD CONSTRAINT `discipline_TaxonTreeDefID_689649ad_fk_taxontree` FOREIGN KEY (`TaxonTreeDefID`) REFERENCES `taxontreedef` (`taxontreedefid`);
--
-- MIGRATION NOW PERFORMS OPERATION THAT CANNOT BE WRITTEN AS SQL:
-- Raw Python operation
--
ALTER TABLE `collectionobjecttype` ADD CONSTRAINT `collectionobjecttype_CollectionID_8b72e1d9_fk_collectio` FOREIGN KEY (`CollectionID`) REFERENCES `collection` (`usergroupscopeid`);
ALTER TABLE `collectionobjecttype` ADD CONSTRAINT `collectionobjecttype_CreatedByAgentID_fd1615eb_fk_agent_agentid` FOREIGN KEY (`CreatedByAgentID`) REFERENCES `agent` (`agentid`);
ALTER TABLE `collectionobjecttype` ADD CONSTRAINT `collectionobjecttype_ModifiedByAgentID_859ea111_fk_agent_agentid` FOREIGN KEY (`ModifiedByAgentID`) REFERENCES `agent` (`agentid`);
ALTER TABLE `collectionobjecttype` ADD CONSTRAINT `collectionobjecttype_TaxonTreeDefID_c91b4cce_fk_taxontree` FOREIGN KEY (`TaxonTreeDefID`) REFERENCES `taxontreedef` (`taxontreedefid`);
ALTER TABLE `collectionobjectgrouptype` ADD CONSTRAINT `collectionobjectgrou_CollectionID_10280c4e_fk_collectio` FOREIGN KEY (`CollectionID`) REFERENCES `collection` (`usergroupscopeid`);
ALTER TABLE `collectionobjectgrouptype` ADD CONSTRAINT `collectionobjectgrou_CreatedByAgentID_3cd7d979_fk_agent_age` FOREIGN KEY (`CreatedByAgentID`) REFERENCES `agent` (`agentid`);
ALTER TABLE `collectionobjectgrouptype` ADD CONSTRAINT `collectionobjectgrou_ModifiedByAgentID_bf1afa1b_fk_agent_age` FOREIGN KEY (`ModifiedByAgentID`) REFERENCES `agent` (`agentid`);
ALTER TABLE `collectionobjectgroup` ADD CONSTRAINT `collectionobjectgrou_CollectionID_205bd6ad_fk_collectio` FOREIGN KEY (`CollectionID`) REFERENCES `collection` (`usergroupscopeid`);
ALTER TABLE `collectionobjectgroup` ADD CONSTRAINT `collectionobjectgrou_COGTypeID_63c53767_fk_collectio` FOREIGN KEY (`COGTypeID`) REFERENCES `collectionobjectgrouptype` (`COGTypeID`);
ALTER TABLE `collectionobjectgroup` ADD CONSTRAINT `collectionobjectgroup_CreatedByAgentID_ea3694b4_fk_agent_agentid` FOREIGN KEY (`CreatedByAgentID`) REFERENCES `agent` (`agentid`);
ALTER TABLE `collectionobjectgroup` ADD CONSTRAINT `collectionobjectgrou_ModifiedByAgentID_3252d64e_fk_agent_age` FOREIGN KEY (`ModifiedByAgentID`) REFERENCES `agent` (`agentid`);
ALTER TABLE `collectionobjectgroupjoin` ADD CONSTRAINT `collectionobjectgrou_ParentCOGID_5cd68082_fk_collectio` FOREIGN KEY (`ParentCOGID`) REFERENCES `collectionobjectgroup` (`collectionobjectgroupid`);
ALTER TABLE `collectionobjectgroupjoin` ADD CONSTRAINT `collectionobjectgrou_ChildCOGID_61365f53_fk_collectio` FOREIGN KEY (`ChildCOGID`) REFERENCES `collectionobjectgroup` (`collectionobjectgroupid`);
ALTER TABLE `collectionobjectgroupjoin` ADD CONSTRAINT `collectionobjectgrou_ChildCOID_7fee35cc_fk_collectio` FOREIGN KEY (`ChildCOID`) REFERENCES `collectionobject` (`collectionobjectid`);
