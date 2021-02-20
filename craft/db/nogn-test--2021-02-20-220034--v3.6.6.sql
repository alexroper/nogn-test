-- MySQL dump 10.13  Distrib 5.7.32, for osx10.12 (x86_64)
--
-- Host: localhost    Database: nogn_test
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_llugqmrcnczuumtykgxyygzrxlfrnofocwqo` (`sessionId`,`volumeId`),
  KEY `idx_rbquzobthbcebcwxsptqwkgkpbfevtsifncp` (`volumeId`),
  CONSTRAINT `fk_lakugyzxnhfyfaocyelybvodkmztjyklnagf` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zohpaaxqzfkydvvyopyeglknemlkzkiawora` (`filename`,`folderId`),
  KEY `idx_vytekuojcxmbexhtuqedxbtxwzurdhiwqhpl` (`folderId`),
  KEY `idx_hpdmuwwhnizlmbthaxupommklvitpzfyskeb` (`volumeId`),
  KEY `fk_zqtbquvymcbfwqzjdlazvymshfpekpldczff` (`uploaderId`),
  CONSTRAINT `fk_dxzqyoniwurbwnehbxjqnvxlfsyinpzdbrpg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hcznqsgechrpjcdoutmwrqriwqhplzbvncbb` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uiiqguxbmkygndewwrkocxuoykavqzrpjefc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zqtbquvymcbfwqzjdlazvymshfpekpldczff` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kuywitajkhghgsbcqonlmfnttozrprhbvtsu` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ohzntgbwtbwclqnsnjsyicxxiyxpupehdvxu` (`name`),
  KEY `idx_ndktlwfpqgnebraequapqekejcymeodynnxw` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bujhskuauecjubrroqvzivsgcmjonofdreol` (`groupId`),
  KEY `fk_obzrzboaoqgjghjckmylonmxtvoooxkjefuy` (`parentId`),
  CONSTRAINT `fk_obzrzboaoqgjghjckmylonmxtvoooxkjefuy` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rfkcxnjscxbzdhzzuyewfrwcadziwyxoeivi` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tvkchiedsyoatcwvcmgyealwvslcyxyemlvi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nroirowgjzzxeylxbpokmdpnwzbfecvfsedl` (`name`),
  KEY `idx_jnijqgugjxjrseapflpcqcyzungkrcmeboen` (`handle`),
  KEY `idx_vjhhknwsafvvpkkzfugnyqgjzmnhrgkdopug` (`structureId`),
  KEY `idx_pirzjnjewurhyxhiwvwecudxozrtpbowolop` (`fieldLayoutId`),
  KEY `idx_nromkmtpgkxrhmjkgxtwtkbjjzggsgvnzeki` (`dateDeleted`),
  CONSTRAINT `fk_isqwnjbqmnqnikmndhmsfbfdlpeywihhkeul` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wrrvvzbtxsunrshxyyadjyghfmhhzhnwjrnk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_stkqwuecsbaakjyacksumhxouwqibfhcurwz` (`groupId`,`siteId`),
  KEY `idx_jzzlyoaljabljwxwwtvdqgrgdfdlhmhqgusa` (`siteId`),
  CONSTRAINT `fk_fakextxcwkedyaloozuigccwuixqanrgwthc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kdfyfhbhoabcdrclbegcxbqnmdpsbykthelz` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_shrkwbpnluuzqmmukpnyrdhamcpckxpbensi` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_hxwcejwlvqnsarsmulolsbwbmqplkcpntaxb` (`siteId`),
  KEY `fk_mwajtgsckflhjrzrsmmoydcdfymnbcrjpbxa` (`userId`),
  CONSTRAINT `fk_djguochqrkhcvomegckdjgpdxjeyhhcdcxgk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hxwcejwlvqnsarsmulolsbwbmqplkcpntaxb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mwajtgsckflhjrzrsmmoydcdfymnbcrjpbxa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_onftpvqeuxsjecsqbvgdbflwnfadljgdzxta` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_gspbtrtsikqkghyzdxrxjlcjtleycgeilayy` (`siteId`),
  KEY `fk_yxcktcsukziztombukrrvlbmprnwfzoachkb` (`fieldId`),
  KEY `fk_byksoikzrphmytkytrmuyjxyeslqixbwxemf` (`userId`),
  CONSTRAINT `fk_byksoikzrphmytkytrmuyjxyeslqixbwxemf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_gspbtrtsikqkghyzdxrxjlcjtleycgeilayy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yxcktcsukziztombukrrvlbmprnwfzoachkb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zaknclixdxfkauoarotnddqubhxqjqswwmps` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pjtggakosztjubvsecutrcseneexupdcsqem` (`elementId`,`siteId`),
  KEY `idx_qcaauebcpcxisctqqmphjnigiyjzzsnqcejt` (`siteId`),
  KEY `idx_wlqccsmrguyqosyaqvrxcovtpnwukjturapz` (`title`),
  CONSTRAINT `fk_cbxyeiidqfafwuicqofdygshroklotucpqoa` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_piqlpixusgeodxwvhtcqqrulqxiszmmeophi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_swlqunotperfcfjdcccslqxaxepgbjtiydgy` (`userId`),
  CONSTRAINT `fk_swlqunotperfcfjdcccslqxaxepgbjtiydgy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ihbirkkylxfxqwhfecfpypwmsyuohjrzgqkh` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_pybmnckuurcenefeyzdwpynacizokkxdjhtx` (`saved`),
  KEY `fk_hjdqxhdkukcoyonwvwxkllngbsgzukqqosxy` (`creatorId`),
  KEY `fk_jrdbokwwjueguwwtbdxpgkklbujluzpodjuk` (`sourceId`),
  CONSTRAINT `fk_hjdqxhdkukcoyonwvwxkllngbsgzukqqosxy` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jrdbokwwjueguwwtbdxpgkklbujluzpodjuk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wgupxajwccckbumkdxafuqinkzexvfvsymhx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oymymyaiqljmzvuvqxeuqqukavgjskgucttv` (`dateDeleted`),
  KEY `idx_iguijejrxbykrixdlmclassiregjhdmqxewp` (`fieldLayoutId`),
  KEY `idx_hhjsieihhxahrlscjdxnrzvdnpkqhctaxrkt` (`type`),
  KEY `idx_axhvngbaxxszfbctuzgqhvsakyaerccgbuvm` (`enabled`),
  KEY `idx_ioxtwyyuvrzetkluuojnyzdtyxsbidwiaxgo` (`archived`,`dateCreated`),
  KEY `idx_cgdtqbvrkpzjllzihnmeyzzkzrwlcctslcnp` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `fk_mrjtywphbbigmojdlxpzqvzzlaenpuuzagua` (`draftId`),
  KEY `fk_pphnoiyvhtcrbkytfhktxkrvkrqzrnweajps` (`revisionId`),
  CONSTRAINT `fk_dngnuucxxzkryzfvuankmpgikujmlpneiteg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mrjtywphbbigmojdlxpzqvzzlaenpuuzagua` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pphnoiyvhtcrbkytfhktxkrvkrqzrnweajps` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hoarkmulrsckmfooakgbmcchlsfjnykvqnkj` (`elementId`,`siteId`),
  KEY `idx_vbfpklsyqsdsqiktywihlltumjkovbrenjyf` (`siteId`),
  KEY `idx_yknqrfsmxzpaarjeytmzemqmzumevkpofoic` (`slug`,`siteId`),
  KEY `idx_vcwqpzeabjrkrdqbsncucvsiohtcrrctyygg` (`enabled`),
  KEY `idx_dktdshatiexybpmwmixvbipqfhodapwnhjwg` (`uri`,`siteId`),
  CONSTRAINT `fk_iuqvzoertzwoeuennjuubyqokauzwrrdqomw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ytggaphikrpkajwpqfghvrkpnpcerjmoynnn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kzzruynazancddeisokxsnatwqiecbblyger` (`postDate`),
  KEY `idx_tmjkjtjgfkwptsnulxdgklmudlbvcduisarf` (`expiryDate`),
  KEY `idx_wpzgitgckyknccbaewlhijhbbusvmilvipko` (`authorId`),
  KEY `idx_palqaenmwxwynodkuoaaausnvdellikfwroc` (`sectionId`),
  KEY `idx_ssgehvjdxrpyvrzcqbnhlxtuiytbyjoancih` (`typeId`),
  KEY `fk_pzahbkofxqntladinwulzazrclcxdyeauxmz` (`parentId`),
  CONSTRAINT `fk_iijzrhrhpibnqafurrsfsmsmxaydizjwnrwf` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzahbkofxqntladinwulzazrclcxdyeauxmz` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xwkhctyiuezvjsbzhzwxvugfsxdpnglbldvd` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zjgtqnoihwmdglrbeedlcadiylxiqlfruoyz` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zjsenccktpblfpqkdyfsscwqrrmdmfovnybw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_azwdrnsmozbnrueboivazqogofiabcejwpbm` (`name`,`sectionId`),
  KEY `idx_wzaghuvapzbicwfgimycvdkxncenuxixemsw` (`handle`,`sectionId`),
  KEY `idx_rhqszrewgstgdnkvfytpzohivvohitunyczf` (`sectionId`),
  KEY `idx_qoizukvtuilyrlezvqmnvfjjluktczgteagb` (`fieldLayoutId`),
  KEY `idx_mgacmdxqfeodvyhhfpkqxvymwrcpqwdujcmd` (`dateDeleted`),
  CONSTRAINT `fk_rsnshridktyivznokqfaszcfivdanlncchtn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zzkarvrazdedpzaywcxjldrmjmgkeknukvaa` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tfawrifahinsvxnuqmmnsoawlusbxgygpbhv` (`name`),
  KEY `idx_sinncygjbibjlvjskoqvtutizrwhllgamqxv` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_homqsyghhtefquqcrwplhbzalotdnbmtcpew` (`layoutId`,`fieldId`),
  KEY `idx_sdomoeapplhawhhindlurnfruycarzapeukz` (`sortOrder`),
  KEY `idx_sdxcsqrcewexxrvrlnlvzpmwhhbgmufxdhyn` (`tabId`),
  KEY `idx_owtcyvjzsvwrvqttyuszaofrphonwzcyjxoi` (`fieldId`),
  CONSTRAINT `fk_bthohextoccgxlubupotgxkcsgrcbvwizxit` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kvsjskoylbnexaofluhebcsfifnaokhvwods` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lhednnfxmowelpzxzcwxxlwtjqudxmknxfwr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rdjwsclezrlvdtugszxladzcuwwuuddtfdep` (`dateDeleted`),
  KEY `idx_mgmclczqqagnsfezskmfwzssqqlmcslckhzk` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_baxvesdyqhoimqfafyitcjsftttynitakrcr` (`sortOrder`),
  KEY `idx_gbnjadygfigikiggmxcpqjratwwrcpsykeaz` (`layoutId`),
  CONSTRAINT `fk_vfvmaorcficpxmvusoplxwegzgnwmodycveo` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bbrjjdbainjpvpcmkgjbvsnlholsptaiqfay` (`handle`,`context`),
  KEY `idx_evrnsvqhikgrvjwivjyzevyklltcjtsxmxlz` (`groupId`),
  KEY `idx_heytnfefvgntgvvjsglvewaukhbgelbtashq` (`context`),
  CONSTRAINT `fk_esxjevmctdowcgotozfrgbmxxromouhpsopa` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mblqgkubwruqzpegmyxskyixedtopfmvhmta` (`name`),
  KEY `idx_jpjwrowfsshjmixukujththztyjqmhcexfcp` (`handle`),
  KEY `idx_rxoengtgmwqpbgabkcokqyathrpoejecijsd` (`fieldLayoutId`),
  CONSTRAINT `fk_mnirapriqjkbrxljuawqmtcjnbzkxkijefjz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qduwookprgjwefudhdzmckctywqrzzvllpsi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jedgzneffjapsjakzembjrunvvwquvacmsfy` (`accessToken`),
  UNIQUE KEY `idx_zjtweaopmraajyohaukeahchsbizliyxxzti` (`name`),
  KEY `fk_yzumnwomgfrdqdsyumcxcovbpvetlevwdyce` (`schemaId`),
  CONSTRAINT `fk_yzumnwomgfrdqdsyumcxcovbpvetlevwdyce` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pihlzfpmjypzysaqlogmpglemsqxkykscwjk` (`ownerId`),
  KEY `idx_jqxqsoedhilwaokjtqrapteoocqbbcoeimyq` (`fieldId`),
  KEY `idx_tcnznzsqnoyxcnonhgfzsimaxrhdyqmiepku` (`typeId`),
  KEY `idx_nhqbextipsginooqbgdjcaiqlqzbkwwsgjlq` (`sortOrder`),
  CONSTRAINT `fk_izugsbeqlnsrajmqmnlonoeroupfkphpjrfe` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kwidfkjnrmypefupvistjhywdskcbfonoqvg` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_shdpisabmcjlnknmmbvecfuqfismgghusito` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zfaclsnwuuolzelzbzbyxqzjypwneuzdxtzy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dzxfpynvmthzfwaoijgalhrwdofcbuedbgto` (`name`,`fieldId`),
  KEY `idx_avsoditowqixqpnvbutlumivooowkdecwrtr` (`handle`,`fieldId`),
  KEY `idx_hjiebhkgkelsneylgaivmgoatmutfkmnywbl` (`fieldId`),
  KEY `idx_yazkduvaiiuapwavcwowfclbqwjmcjztbmfu` (`fieldLayoutId`),
  CONSTRAINT `fk_jrtuzgsdcmsbcdupbrpmnappvnartwmvnlbj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xwzyxztzudmbjtpnrwjzynkpcyspjieyojcu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fcxumjhmhvmhkscvpqqdpauoyqclqckpdbur` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nogn_sites`
--

DROP TABLE IF EXISTS `nogn_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nogn_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sectionIds` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_spqaokcfasojhyhfgrkgsarxodmdxszohuvd` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_mtmsmihucpovmprwpfiawwvtptxwpalaiqen` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_fgbflfpmqlmmgarnfpdixphdhidwrzrynybq` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xxftxqzvrlvrmmzcjnsgripoxpuxqikosyah` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_zeoeqfxiqhbdtyfsomxkoxfgzeoqavviynla` (`sourceId`),
  KEY `idx_tzfffqjyhestjycwgqohzedqamwmooledhrv` (`targetId`),
  KEY `idx_ibrmvgldinbpzrjoopptaavzrgnnqxlrgcmw` (`sourceSiteId`),
  CONSTRAINT `fk_fzjrterkdhkywprourlneagjjpvslkaisvrz` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kkvwgqetkiheadfgylszmxlioajjyeirjtwj` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_whpolmitnijzldqtkpyfulfwfpavmnkshmtx` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yeedazjllsvhjucyzcftqtmmysinmcsnjqbv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ukhowpifgpyxaenmsmtnhumxlanwjxupuxgz` (`sourceId`,`num`),
  KEY `fk_gmobmvacamowllludkxzfsrlcxxaeahgdhkn` (`creatorId`),
  CONSTRAINT `fk_gmobmvacamowllludkxzfsrlcxxaeahgdhkn` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ioltipbgkiqwvrqszrtdenrinydbrevwgita` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_pfqzjovyrbahmatzkgbvaygnrpmoypqcisiv` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ifbzqgzrupxyuonucmluhcdlbihusschdilz` (`handle`),
  KEY `idx_rnpftvbjrcrablfdyyfkpznqlfmzyzlpkavy` (`name`),
  KEY `idx_lfqrxahmhnqndqreflnbqddrpysnbovpzrjw` (`structureId`),
  KEY `idx_mmbtkwugrifiusjpwfliynhjvkmjbilcixfz` (`dateDeleted`),
  CONSTRAINT `fk_rusrxvrsfmbqozszmfauckmmdhudfkyiehid` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yjzagevmtvrfgmbrswirxwhvmkfvvdikbdtk` (`sectionId`,`siteId`),
  KEY `idx_tvhnxgxdnnoovfhhirktctpmdwmbqrgisway` (`siteId`),
  CONSTRAINT `fk_ddohxicbmclopgzeqnvfvxbnlgkibzcyzuxs` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iskfnnesglsixqmztmcziwscdpguryxkzhgn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kszjfriqsfjjumfzvvjfjkosytjaapitcssa` (`uid`),
  KEY `idx_onaxccmenmrxalajjkmncfxutsctggzbcphy` (`token`),
  KEY `idx_qkywuvjahdnbpskqqxnedkgvgcjksngifxml` (`dateUpdated`),
  KEY `idx_dxovckjktunpffygkjwhqmrdpexerspsxahd` (`userId`),
  CONSTRAINT `fk_yqfiwkqirqzicvjvveegxgxlkexsmnakezcj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rbkqwxyqmcscmnfssgfqxzzsumwkgzljpvmh` (`userId`,`message`),
  CONSTRAINT `fk_vnykyjmdluucjlxvzeuhrxbpndtnhrfjgfrh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yopbwmhehevhayfiryufvnnljpgvgswoeuxt` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ymvjnkbfvaqtdjjoktjsaixdycuoofrgxvrj` (`dateDeleted`),
  KEY `idx_ixwiazdepnpnaxbwtuqypykeeqvdsyzvupap` (`handle`),
  KEY `idx_rstlfiuxcxboynqfgsbftwnlcqrljsvemxmt` (`sortOrder`),
  KEY `fk_zjxlbwnteujrwshcuiotetqlkuolepnfywvr` (`groupId`),
  CONSTRAINT `fk_zjxlbwnteujrwshcuiotetqlkuolepnfywvr` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_evtuzxwphzyatxdlzrqejbfevswnckyywnss` (`structureId`,`elementId`),
  KEY `idx_yvojuiynyiquulyealhunhgazsssqdwzvchd` (`root`),
  KEY `idx_hhwkajldvfqfngvlcpnyngdcbyzuddnrqigj` (`lft`),
  KEY `idx_svitcrmacwgslfbyodwmixldqdcgpquaphrh` (`rgt`),
  KEY `idx_ggdwlktofbtopqdithtcncrcnbgrjoujtyxs` (`level`),
  KEY `idx_qbjnvbvmmijziocxuucdcwfhyiidcxophcvm` (`elementId`),
  CONSTRAINT `fk_hiyoumcvqqraisnxyysdhteolxtyogjopwje` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wmudwloyhtdpnkpqinyeihhoevjjafhtqhla` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hkrpohdqtvrfytinethctmmdejhlakkzsvcb` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dotdixvoukqqhscaqvzdinuvzrxbmoxmtxex` (`key`,`language`),
  KEY `idx_pskytnaexmujfhiwoorlvkihkrlynspfbokg` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yjufyhvvtmwmnyhweufrghylwytjozmgssaf` (`name`),
  KEY `idx_ykwjpknxiwdbkxcgrhkfxdzqsqyeddppvxox` (`handle`),
  KEY `idx_zkjvukipndivadszwknmhtpjtstvfhivmwbl` (`dateDeleted`),
  KEY `fk_nhzrvrwmjbnkfkagzjlkxtsflnnqpqllhycy` (`fieldLayoutId`),
  CONSTRAINT `fk_nhzrvrwmjbnkfkagzjlkxtsflnnqpqllhycy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cpmsdnyfutlooxibkniqdvtcsfjfhckioghu` (`groupId`),
  CONSTRAINT `fk_cmtmmodejoatfvewlqocdrisdxzvzhclygnc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yyplqfksxrxvwtdolczyabvbcijnyfkqcesz` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jduuqdvfeoyscdycysjnkkpubfoqzprrlrul` (`cacheId`),
  KEY `idx_ahcypoxtjmiqthhrujpehalqajaxtelsfazk` (`elementId`),
  CONSTRAINT `fk_djvjdadrxjxbhtwjacdaijfhdmcekeituquq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rguqerroqvufeedlbzjsbvszdhdrlhogmtgb` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_yztxlulygaroyaywodexyqrvfwtkjydtligr` (`cacheId`),
  KEY `idx_kuptsnyohhcmccuwxtzbcnoftcwmvsfsbgry` (`type`),
  CONSTRAINT `fk_tkhnearhrennhoqlxrbsxutjeremuknmbhof` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qlzgjbxsxyzqctlysyucecezzjheppgwrckq` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_ifakoshftonduylmuexpowkvdwhvtoxspyyv` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_vuaaqghxhhyutmaorjbeyutrcbcwluvjfult` (`siteId`),
  CONSTRAINT `fk_aerpldhcdtghsinxjxtjhpanrokkhnbhvnjt` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_emdkarkwdbdwbjslypgcvslivesyslxgcnjn` (`token`),
  KEY `idx_yskhqbnpgllrrxqsqfsrhdtogtxsgtavufrf` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lnhlpubdxzqdybneqsldxjqcuwjntigqkmcc` (`handle`),
  KEY `idx_ectppdfcqyqpfxevygxrpedbhtnuktpseykx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cklymynesjcwkqpdewoctkoxitnylhvjdced` (`groupId`,`userId`),
  KEY `idx_mndxfwttctfsnkmdjlqqjletnohezbxzgwce` (`userId`),
  CONSTRAINT `fk_jnmrzddagwunbegnreazjgilcpfhfsovwzns` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vsbvfmmjwxxpqnlnwjjyiljbtrgululbulnj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wxwfzwyzueyzpezjrsgairdbhzcblwjfgodb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_izkjixezrqlxjbjbehugxgcbxseczyujaxbu` (`permissionId`,`groupId`),
  KEY `idx_jdulywxjvvagiaxiweetorlophafolgmrvuy` (`groupId`),
  CONSTRAINT `fk_habmmpnbqunfeqjkaglruvgkfwlemetdamst` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lnbzfjddtmygitfqubmygwwcmbwfmkrvtbis` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wxoomgwavzmknrgmavjfouodpokuowsybwof` (`permissionId`,`userId`),
  KEY `idx_afaytzuntfyujgpxxnjaqfphnwrskiwbclqk` (`userId`),
  CONSTRAINT `fk_mkckvapeuvnkziuvssawxtjrpcukcyaieguw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vzsbumycmyofzqwrgxrfxzxxwchhzvxqqgek` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_edpiftuxqhjxglfupoisbmlqbavsulzgecph` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mvvwbfacmhtibrpmvjlaehdcgrvzhrpffzcw` (`uid`),
  KEY `idx_yzdqedlkqsqfynpafcyoosmzfliejnvnuvce` (`verificationCode`),
  KEY `idx_llwhylrfttdzkwroprqkbzqkgbpgppkjisct` (`email`),
  KEY `idx_lywilxkxvnjjwdjpxwvyhufsnnhvjzexgrqn` (`username`),
  KEY `fk_unjzqsntsrtojsottuapxgxgijaoqkuskdsh` (`photoId`),
  CONSTRAINT `fk_unjzqsntsrtojsottuapxgxgijaoqkuskdsh` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wqvzxtyjailtitjjryeymvltqzxuoajanklw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jhdhuaafugdmolyuhubnkaywptkabvgcvfny` (`name`,`parentId`,`volumeId`),
  KEY `idx_ejxotsixlcwiilasjyvaviobemjeeionihkw` (`parentId`),
  KEY `idx_mnxhsjpvivbpmakmrjphomftnufllaosvbdn` (`volumeId`),
  CONSTRAINT `fk_aexsmwxpzggjfvscfwqnvkwlzcpwalghgcju` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mhdpjlhkyxjafgsufsiqjjcakmzjdkhjotti` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qvaizrkxifyyawfsohiygjwklyhrxgymuppf` (`name`),
  KEY `idx_wrxktxvngewttfurlcettxibrdmgfugfxkqy` (`handle`),
  KEY `idx_azuvsxcxjmcxkdiewtvpoicaycunhkhnycof` (`fieldLayoutId`),
  KEY `idx_rorsirqfahrqoekozvzgcjrfaqwwavdqfnzs` (`dateDeleted`),
  CONSTRAINT `fk_uaiidqzzjdmxbdaqyqoocuevcqczxuimfozy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ftdzvbsqyrcogymspdchwydevnhcmocjzsmw` (`userId`),
  CONSTRAINT `fk_zpcfxenbqyymxpmwlkggtvnyaimzookvgkfx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'nogn_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-20 14:00:35
-- MySQL dump 10.13  Distrib 5.7.32, for osx10.12 (x86_64)
--
-- Host: localhost    Database: nogn_test
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'firstName','2021-02-20 21:20:00',0,1),(1,1,'lastName','2021-02-20 21:20:00',0,1),(1,1,'lastPasswordChangeDate','2021-02-20 21:20:44',0,1),(1,1,'password','2021-02-20 21:20:44',0,1),(1,1,'username','2021-02-20 21:20:00',0,1),(7,1,'title','2021-02-20 02:44:44',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-02-19 09:16:04','2021-02-20 21:20:41','8536f28b-1cdd-47a6-a97f-80b0f56b4bff'),(2,2,1,'Test','2021-02-19 09:39:15','2021-02-19 10:50:05','0381cda2-8faa-43e5-aefb-10dd4c1f5884'),(3,3,1,'Test','2021-02-19 09:39:15','2021-02-19 09:39:15','086419b1-2b05-46e3-8539-e0dcb09b9d6a'),(4,4,1,'Test','2021-02-19 10:09:02','2021-02-19 10:09:02','9b979917-ffea-4496-b5da-eceb2769a234'),(6,6,1,'Test','2021-02-19 10:50:05','2021-02-19 10:50:05','e8c6b6d3-1872-4c13-b468-4307432e0feb'),(7,7,1,'Testing!!!','2021-02-19 10:50:53','2021-02-20 02:44:44','b9576c9c-13e9-4234-8abb-8126e5107819');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (2,2,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-02-19 09:16:04','2021-02-20 21:20:41',NULL,'693ac2ec-0995-4df5-9ce5-700b1a16f31e'),(2,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-02-19 09:39:15','2021-02-19 10:50:05',NULL,'ec1c5727-b749-4795-9281-1bebd7b22904'),(3,NULL,1,1,'craft\\elements\\Entry',1,0,'2021-02-19 09:39:15','2021-02-19 09:39:15',NULL,'fba582c9-69ae-4712-b564-0df9d3f22e24'),(4,NULL,2,1,'craft\\elements\\Entry',1,0,'2021-02-19 10:09:02','2021-02-19 10:09:02',NULL,'adf2cc14-809f-434e-b053-c3da41aa69fd'),(6,NULL,3,1,'craft\\elements\\Entry',1,0,'2021-02-19 10:50:05','2021-02-19 10:50:05',NULL,'4e7d4f1f-c6f5-4ae4-903c-c06707cdbb95'),(7,2,NULL,1,'craft\\elements\\Entry',1,0,'2021-02-19 10:50:53','2021-02-20 02:44:44',NULL,'50b3e65a-1835-4a1a-95e3-61aa5c91cb5a');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-02-19 09:16:04','2021-02-19 09:16:04','b6cb36f7-4829-453a-bdcf-917264452bd2'),(2,2,1,'test','test',1,'2021-02-19 09:39:15','2021-02-19 09:39:15','92c72b64-50da-4954-8d7b-c026a57aa676'),(3,3,1,'test','test',1,'2021-02-19 09:39:15','2021-02-19 09:39:15','5e96a6c7-de30-4cb9-81e1-3a74fd7b41a0'),(4,4,1,'test','test',1,'2021-02-19 10:09:02','2021-02-19 10:09:02','4cebc0c1-3a68-465a-8e5a-b0bc918ae6c3'),(6,6,1,'test','test',1,'2021-02-19 10:50:05','2021-02-19 10:50:05','373e8e4a-c632-4588-ba8c-28ab6cd7aedc'),(7,7,1,'test','test',1,'2021-02-19 10:50:53','2021-02-19 10:50:53','6ca06c3b-d556-41dc-b083-dd0f2598e6f1');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2021-02-19 09:39:00',NULL,NULL,'2021-02-19 09:39:15','2021-02-19 09:39:15','3598c6bf-bf73-4117-8d83-9cf5bf916d23'),(3,1,NULL,1,NULL,'2021-02-19 09:39:00',NULL,NULL,'2021-02-19 09:39:15','2021-02-19 09:39:15','397778ae-e397-4adc-a836-58b43cf6728e'),(4,1,NULL,1,NULL,'2021-02-19 09:39:00',NULL,NULL,'2021-02-19 10:09:02','2021-02-19 10:09:02','d8d2b820-e5b5-4622-899d-b50e9fcf0ad4'),(6,1,NULL,1,NULL,'2021-02-19 09:39:00',NULL,NULL,'2021-02-19 10:50:05','2021-02-19 10:50:05','5f696955-c1c0-4a8c-b962-ad7a10ab058c'),(7,1,NULL,1,NULL,'2021-02-19 09:39:00',NULL,NULL,'2021-02-19 10:50:53','2021-02-19 10:50:53','4f5cf6c6-4a92-4f88-80cf-73abb4abeefe');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Test','test',1,'site',NULL,'{section.name|raw}',1,'2021-02-19 09:39:15','2021-02-19 10:09:02',NULL,'7d8444cb-bf49-4041-8e9a-650f0b91cfe6');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-02-19 09:16:04','2021-02-19 09:16:04',NULL,'5fa7b3df-d859-4a32-aec9-3ff72b776743');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2021-02-19 09:39:15','2021-02-19 09:39:15',NULL,'e88585f9-9e5f-4c62-8914-3d188048d5dd');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (2,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-02-19 10:09:02','2021-02-19 10:09:02','70330d08-a056-4568-bc76-158704e8a091');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"sections.b6b1d16b-8194-4a21-b2a4-14866cfad059:read\",\"entrytypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6:read\"]',1,'2021-02-19 09:39:55','2021-02-19 09:41:15','39e3c46b-5362-4239-9098-318ab43b61c2');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,NULL,1,'2021-02-19 09:39:55','2021-02-19 09:39:55','29c13505-3343-40fe-93cf-03286bf19719');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'3.6.6','3.6.4',0,'rrcgedtpdtto','yrfqqqficdaz','2021-02-19 09:16:04','2021-02-19 10:50:05','2c477def-9dde-412c-8843-c9896b33e18b');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','fbc899c2-ea41-4dcc-a5c1-641fc5629747'),(2,'craft','m150403_183908_migrations_table_changes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','aeabef56-683a-453f-b39a-e6cac4c9f467'),(3,'craft','m150403_184247_plugins_table_changes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e88bb3d8-a528-413a-8991-cd0020e2a33a'),(4,'craft','m150403_184533_field_version','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','1f282b19-fbe6-4923-9dd4-769775f987d4'),(5,'craft','m150403_184729_type_columns','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e4903028-d4fb-45a0-a6be-8da76a138bc4'),(6,'craft','m150403_185142_volumes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','7d4dac50-1ae5-45dd-9dbf-fc6b1d2b6864'),(7,'craft','m150428_231346_userpreferences','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ea087843-b1ba-4be7-ad09-5524c58f8215'),(8,'craft','m150519_150900_fieldversion_conversion','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','8894d3a0-bc73-472c-a07e-df82f7f11600'),(9,'craft','m150617_213829_update_email_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','87c54bc9-e161-457c-ae67-56ad8382653e'),(10,'craft','m150721_124739_templatecachequeries','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9b017cc8-652d-41ba-8292-8ab896ce1ccb'),(11,'craft','m150724_140822_adjust_quality_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e76e1a95-9f27-4bfc-80bc-5877b68c5325'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e9a63679-7507-4968-9316-8f0b3f88d7f9'),(13,'craft','m151002_095935_volume_cache_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','45c1b8e0-c1f6-4b38-b85a-69a465e7a63d'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','6864f642-0ff5-41b9-ae76-c4aa2b102891'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','7d68bee1-d337-49a0-9749-4d156c0d2e8d'),(16,'craft','m151209_000000_move_logo','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','8705a855-12c1-4a46-bc96-ded466aff46c'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','3f3eeaa5-2d5f-4ed9-80f4-ed2082c964f9'),(18,'craft','m151215_000000_rename_asset_permissions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','f6e265f3-3f6e-4137-b4bc-d50f2fc0e656'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','631ecd60-5092-4a67-b1ff-8e5d184e80b2'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9b3074bd-237d-4a59-992d-995e50a8c679'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','14e6cc1b-e142-4583-8da8-af7b189d14e6'),(22,'craft','m160727_194637_column_cleanup','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ad195796-6ab2-47b0-837b-1b54b27202b3'),(23,'craft','m160804_110002_userphotos_to_assets','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','758f0b6a-c171-428b-b1fb-83908803b1f8'),(24,'craft','m160807_144858_sites','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','643b78b7-ead5-40a3-9f5b-c5c729c0c716'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','b1091ca2-ae9d-4b3a-93e0-18e60ee36489'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','317d3e09-0de2-4e0a-853a-1c7abc092c8a'),(27,'craft','m160912_230520_require_entry_type_id','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','39d48445-dff7-4ec5-8145-eb92987e485d'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e8c1770b-82f0-42c7-851d-c01571b0cfa5'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','8a3e4d30-e510-4db6-a3ef-32db8d0fb5c4'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','38101776-6475-435b-9ab1-91d742d567fe'),(31,'craft','m160925_113941_route_uri_parts','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','956dc285-2f46-4abe-860f-998cff4eb7a8'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','7fa0fa44-98e5-40ca-a126-547509ea054b'),(33,'craft','m161007_130653_update_email_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','658035fe-553f-41e7-a91d-df126b398a6e'),(34,'craft','m161013_175052_newParentId','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','46d9b762-8dce-48f6-8210-4db256718f57'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e879fbb5-c965-463c-a7a9-e4fdfc1b2de7'),(36,'craft','m161021_182140_rename_get_help_widget','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','341bbd77-24c6-4985-99b7-6e1437b295a2'),(37,'craft','m161025_000000_fix_char_columns','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','355cd2ca-c614-4f0f-a8c8-407677e17859'),(38,'craft','m161029_124145_email_message_languages','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','348ad541-33aa-4fa9-a318-2d130f50b10d'),(39,'craft','m161108_000000_new_version_format','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','350830a2-7454-468b-bd75-c293d7e19b26'),(40,'craft','m161109_000000_index_shuffle','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','85d5bbab-25d7-4559-acbf-7ed84d589bb8'),(41,'craft','m161122_185500_no_craft_app','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ae8be7fc-ac3e-4c5c-aa14-492386029439'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','4e128912-b0f4-4cfc-b3b4-c398ae974d02'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','1070dd0e-01cc-4634-ab8d-90a79a55c08e'),(44,'craft','m170114_161144_udates_permission','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','357976b7-af64-4403-85dd-d295c11a6774'),(45,'craft','m170120_000000_schema_cleanup','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','02eff52c-1f84-4850-a66d-3a608e2afee6'),(46,'craft','m170126_000000_assets_focal_point','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','d3f04ebf-fcf6-4bf7-9bd0-8bac656c4dbe'),(47,'craft','m170206_142126_system_name','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','3a3bf6fc-bdd8-4288-a7f2-f90a9044a6ee'),(48,'craft','m170217_044740_category_branch_limits','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','652bdb74-6dc4-41aa-a1f8-1b514942d086'),(49,'craft','m170217_120224_asset_indexing_columns','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','a6dac667-3c40-44b5-aca4-38f6460d2e96'),(50,'craft','m170223_224012_plain_text_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','8bfc858c-cbd8-4201-9e9b-d98fc23e5b37'),(51,'craft','m170227_120814_focal_point_percentage','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','7cf6397d-3f88-4ba9-8d37-e54fb10e2de3'),(52,'craft','m170228_171113_system_messages','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','552a99a8-9370-405a-93e7-cb1e67c1b4c1'),(53,'craft','m170303_140500_asset_field_source_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','119d5932-09f0-4269-9b7a-aaabec4f2886'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','d2e14580-2386-463a-a935-70e36103acc3'),(55,'craft','m170523_190652_element_field_layout_ids','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','cb27869c-4ba9-40af-8960-ebd6b2ef23ec'),(56,'craft','m170621_195237_format_plugin_handles','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','cb14686f-9508-49c0-90c8-4ab064ba9e9b'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','177fee8e-3333-4171-af4e-6a800532a624'),(58,'craft','m170630_161028_deprecation_changes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','8aaf1e3d-2f4a-4227-a2da-c3e2ab720364'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','a244a3de-4018-4b4f-8068-de229acf8654'),(60,'craft','m170704_134916_sites_tables','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e1744469-d458-4ecf-b0d4-79a59aacb24c'),(61,'craft','m170706_183216_rename_sequences','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','a299dd89-042f-44c6-ad79-0bddd17eb816'),(62,'craft','m170707_094758_delete_compiled_traits','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ac70b15f-feb2-456e-8a13-f9e2e87a35f4'),(63,'craft','m170731_190138_drop_asset_packagist','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','fc9adf1e-1bf8-498d-94ec-3a923c613fe0'),(64,'craft','m170810_201318_create_queue_table','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','38883865-324d-4089-9a41-cf5fc8ca2819'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','f9c7f27c-0485-4673-95d3-8ea57e986e48'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','fa7542ee-ae48-4073-bbfd-ef6a2365fd66'),(67,'craft','m171011_214115_site_groups','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','75eff457-0b1c-4227-a2f5-6a9830288aec'),(68,'craft','m171012_151440_primary_site','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','030a493d-8312-4586-a90e-8e8f8e28ce51'),(69,'craft','m171013_142500_transform_interlace','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','7801dd0d-1b47-4dda-a405-fe345382e870'),(70,'craft','m171016_092553_drop_position_select','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','66a387f5-afc8-472a-94ef-a77bfbe8ad10'),(71,'craft','m171016_221244_less_strict_translation_method','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','00e276ac-e6e6-4d5a-ae02-551d3abb7138'),(72,'craft','m171107_000000_assign_group_permissions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','152989a1-8929-4138-845e-d1631c0c782e'),(73,'craft','m171117_000001_templatecache_index_tune','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','cb4f704b-960f-472c-bf4c-20e5b9d8120e'),(74,'craft','m171126_105927_disabled_plugins','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','f9976150-6570-4cbc-869f-83f5bdd02956'),(75,'craft','m171130_214407_craftidtokens_table','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','6ade8979-5d23-4f76-83df-af2fc294b89e'),(76,'craft','m171202_004225_update_email_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','439c4a3f-2f02-407e-aa01-371945befd48'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','b061afe6-dbd0-47ec-9649-401510c1431c'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','c7b55192-d3eb-48f0-a844-d9a82a9f0725'),(79,'craft','m171218_143135_longtext_query_column','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9a2d0999-4059-4636-83a7-6b3b6406cb7a'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','efa1482c-7228-46af-a140-bd1df39e644f'),(81,'craft','m180113_153740_drop_users_archived_column','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','4c7faa74-ca9e-4325-8ac1-125e12ee1b0c'),(82,'craft','m180122_213433_propagate_entries_setting','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','bb5fd880-f4fb-4357-b313-cae1e5541063'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','08ab3636-95c6-4995-ac3d-b0f93fb6c060'),(84,'craft','m180128_235202_set_tag_slugs','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','6be6b9cd-8496-486a-95d9-9b03fed61d2f'),(85,'craft','m180202_185551_fix_focal_points','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','cc853b08-5dbb-4c79-a7b5-a155fd53280c'),(86,'craft','m180217_172123_tiny_ints','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','564d9eff-fc54-4001-9761-8728afb3400e'),(87,'craft','m180321_233505_small_ints','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','4db6553b-f084-4c60-8916-8037a1068de1'),(88,'craft','m180404_182320_edition_changes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','1a731369-5da9-46ed-b6ac-1f6438594dd9'),(89,'craft','m180411_102218_fix_db_routes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','01c8788a-e441-447e-9217-7721bf5d034f'),(90,'craft','m180416_205628_resourcepaths_table','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e30f30f8-457d-4e5d-af71-ea908ac77b01'),(91,'craft','m180418_205713_widget_cleanup','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','68461ecb-7a8e-4717-9330-476eae6ff8e0'),(92,'craft','m180425_203349_searchable_fields','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','624a02b7-86e8-47ce-a5cf-f14e7bd5bc6f'),(93,'craft','m180516_153000_uids_in_field_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ef4f4615-89e2-4e0d-acf1-9617339308bb'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','6ae975d3-1c4d-4dbe-88d2-2f021378e154'),(95,'craft','m180518_173000_permissions_to_uid','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','cacf44c4-05dc-4468-834e-18f2c7f5611c'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','da20b10c-0a4a-4450-9bb7-ef3311059245'),(97,'craft','m180521_172900_project_config_table','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','5ae8ac83-5f66-41b7-89b1-5137c3c6d8c1'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','f1d66767-d106-4560-8ed5-2f97a9d8556a'),(99,'craft','m180731_162030_soft_delete_sites','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','aea31bd7-20b7-4229-b0b2-b431c4bba613'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','4890eb03-308c-4fd4-9e06-003c088724f4'),(101,'craft','m180810_214439_soft_delete_elements','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','5aa7ce07-3301-4439-bf85-a69d10d91653'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','a5ba868a-4e3c-42d4-a614-46fe8a70f6e9'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','72286721-bbef-4e2a-a8f8-95a5527d8b01'),(104,'craft','m180904_112109_permission_changes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','6657c1d3-632e-4879-b613-58b0dbd5ffe9'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ee647262-d326-4818-aec8-cc6c57662980'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','d24e24a8-9172-4799-8212-cf0e3fd0a94f'),(107,'craft','m181016_183648_set_default_user_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ea3f4448-09ae-43c5-a078-52b5a2bb8c06'),(108,'craft','m181017_225222_system_config_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','78ef7286-4d0c-4c19-90fd-94671e21316c'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','0fac1582-3f0a-4ffa-bf0d-c01c79baefce'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','59f7b11b-8be0-4e95-b414-8135d65eff44'),(111,'craft','m181112_203955_sequences_table','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','17101662-fa41-4266-bb5a-f8a5eb1ade17'),(112,'craft','m181121_001712_cleanup_field_configs','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','3960049c-0cc5-49b1-928b-7914485a64e5'),(113,'craft','m181128_193942_fix_project_config','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','361bac0a-d8e1-41ac-b21c-276da8d1e51e'),(114,'craft','m181130_143040_fix_schema_version','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','b5bc734b-58bc-42fc-b8ad-8ecd444f9ee0'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','04360d9b-584e-4720-afda-74cf19abe512'),(116,'craft','m181217_153000_fix_structure_uids','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','34af488f-89a3-442f-b0a6-3198903e7394'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','1da89727-6bcc-48b5-b8eb-d37bd2eeef68'),(118,'craft','m190108_110000_cleanup_project_config','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','6311903e-79ab-4b5b-b1bf-00e29c73e5f7'),(119,'craft','m190108_113000_asset_field_setting_change','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','1d59842c-dbe7-4e7d-b905-6b71506656e0'),(120,'craft','m190109_172845_fix_colspan','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ed7d63f7-7862-47fd-bb16-49c0db199721'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','dc56ce7d-85fc-449d-84c7-cdc96bbff0db'),(122,'craft','m190110_214819_soft_delete_volumes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','202d6651-5ab1-4f7e-9e04-5cd2b7e869be'),(123,'craft','m190112_124737_fix_user_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','7a31e50d-b4d3-44da-9744-4255366e6031'),(124,'craft','m190112_131225_fix_field_layouts','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','8559cce7-eeb8-42e5-8b54-7fa8dd094ae3'),(125,'craft','m190112_201010_more_soft_deletes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','7e712619-3deb-4a74-881b-6e747c077745'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','c2e86a1a-e271-4db0-849a-e05b9fa883a0'),(127,'craft','m190121_120000_rich_text_config_setting','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','7e44f556-be93-42e9-9ec3-8dc66fa6da5f'),(128,'craft','m190125_191628_fix_email_transport_password','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','a3badd74-7368-4c7e-8cbb-cff3fd890d75'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','2dcddbd9-ba49-476f-b4ea-85e868192a67'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','a6ee36e5-4c2f-4bd5-85bd-9014173b839b'),(131,'craft','m190218_143000_element_index_settings_uid','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','75e2ac01-0dfd-4d39-95a8-0d52f4d5d8d4'),(132,'craft','m190312_152740_element_revisions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ba39a465-172b-48fe-95a3-3f74055e5168'),(133,'craft','m190327_235137_propagation_method','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','c00cf6cf-c8ed-4873-8cbd-0700db96a878'),(134,'craft','m190401_223843_drop_old_indexes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','5df98b54-c97f-40c3-9bca-b121e863b592'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','2bd74754-36e7-4dbe-a459-25c98265c682'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','387e0fa5-a7c5-476f-9eed-de516a334a6d'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','d458aaba-86c8-4825-a6a7-9db8e6106fd4'),(138,'craft','m190504_150349_preview_targets','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ab8948c0-48d3-4862-b4bf-5d93e9c793e8'),(139,'craft','m190516_184711_job_progress_label','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','f68d3fa4-d32b-4632-8a1e-bbefdb793eb8'),(140,'craft','m190523_190303_optional_revision_creators','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','dc7c04e0-781f-4126-bef8-49aadb2bad6c'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','849dc041-c0cf-4d9b-b21e-4b784318fd90'),(142,'craft','m190605_223807_unsaved_drafts','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','8bb353df-bc2f-4413-aef7-03f9d989f3cb'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','0da13c2e-aa20-40b6-ae72-57116f28412a'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','491ec21c-3119-447d-a73e-46de9fa34c55'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','cdba3e2a-2011-4f3c-84ad-eb2639a53f10'),(146,'craft','m190624_234204_matrix_propagation_method','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','a27bb5a4-8383-4cdb-a3e1-d6d306976615'),(147,'craft','m190711_153020_drop_snapshots','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e402303c-052f-42ea-b1da-211237c58f00'),(148,'craft','m190712_195914_no_draft_revisions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','3c99f93d-0c95-45b4-bba1-bafc8340509b'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','d37266ae-a957-4fbf-bf70-4519f428b4ee'),(150,'craft','m190820_003519_flush_compiled_templates','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','25d64d39-4a9a-472c-9ba5-addf860f6fd4'),(151,'craft','m190823_020339_optional_draft_creators','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','96678937-ae02-4155-bed1-93129c8177ce'),(152,'craft','m190913_152146_update_preview_targets','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','bf1c9058-3969-4b44-97dc-4dae375a065b'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9631efe2-318f-4f09-b98b-f4d675f70c72'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','fbc3c3c6-9307-4f32-b265-15f500960a20'),(155,'craft','m191206_001148_change_tracking','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ef2ff7e9-e73d-4f8e-bd93-663ec1805021'),(156,'craft','m191216_191635_asset_upload_tracking','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','b4da18ba-3ddb-4f95-822c-01f0806e31c2'),(157,'craft','m191222_002848_peer_asset_permissions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','d825da26-57a0-4994-be1e-c1f73ba20251'),(158,'craft','m200127_172522_queue_channels','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','c66e0b58-630d-47e5-af3e-203f0955363c'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9d9a8c7f-ae70-4986-ac09-dd63359c2899'),(160,'craft','m200213_172522_new_elements_index','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','54f2d7c7-1844-401b-b5a3-d65ba1559a67'),(161,'craft','m200228_195211_long_deprecation_messages','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','6bbbe677-0ff5-4a3b-bf9a-34aa25bb821d'),(162,'craft','m200306_054652_disabled_sites','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9eb9d276-0986-42ad-b230-dc7f828a22cf'),(163,'craft','m200522_191453_clear_template_caches','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','4478dd15-d107-47f5-8324-593401aed7b4'),(164,'craft','m200606_231117_migration_tracks','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9c21cf9f-8dd1-4bef-a405-a40dabe28b55'),(165,'craft','m200619_215137_title_translation_method','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9bf0c729-8db1-486a-a712-425ba7c896ad'),(166,'craft','m200620_005028_user_group_descriptions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','9088f324-3ba0-4923-be13-58f813bd2808'),(167,'craft','m200620_230205_field_layout_changes','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','0a7886e9-c7f5-4584-8370-fd68eaa4ba15'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','ed56ae53-6c72-491d-8e60-c453bdd38581'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e0d35fbd-638e-42e3-9fe6-b9ae42ce124b'),(170,'craft','m200630_183000_drop_configmap','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','586f4a59-dadb-4c7d-91c9-c28a74d9b40c'),(171,'craft','m200715_113400_transform_index_error_flag','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','fedc655e-ed88-45d4-b0f7-05054b77e3b4'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','e41648ef-da96-4c0c-a8bd-3864e069ad9e'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','59e40a20-0889-41f5-976a-0ec2400a814b'),(174,'craft','m200720_175543_drop_unique_constraints','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','54e6feb0-093e-4731-b227-953a81b9379a'),(175,'craft','m200825_051217_project_config_version','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','829b83df-a9ef-4872-80e8-a6c848e29392'),(176,'craft','m201116_190500_asset_title_translation_method','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','0a547e7a-b634-49c3-b0e4-08d78dd8b558'),(177,'craft','m201124_003555_plugin_trials','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','6803a1a2-3010-4076-968b-7128a9b934a8'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','dc848572-84bd-410d-bbfd-f2a9b6b66bd2'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','b1fde81c-acad-48d9-b80a-b92d493d73e3'),(180,'craft','m210214_202731_track_saved_drafts','2021-02-19 09:16:06','2021-02-19 09:16:06','2021-02-19 09:16:06','c6989fa4-8a3f-4206-9e1d-dc04cb233ad1'),(181,'plugin:craft-gridsome','Install','2021-02-19 09:45:29','2021-02-19 09:45:29','2021-02-19 09:45:29','fe9c3d19-9477-4aed-bd4e-1947cee32033');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `nogn_sites`
--

LOCK TABLES `nogn_sites` WRITE;
/*!40000 ALTER TABLE `nogn_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `nogn_sites` VALUES (1,'Local','http://localhost:8080/','[\"1\"]','2021-02-19 09:49:46','2021-02-19 09:49:46','428f21ab-34e8-4fe7-a7b2-c583c2687f73');
/*!40000 ALTER TABLE `nogn_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'craft-gridsome','0.1.3','0.1.0','invalid',NULL,'2021-02-19 09:45:29','2021-02-19 09:45:29','2021-02-20 20:48:22','bc922b79-4a26-408a-ba5d-f2b00964c419');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1613731805'),('email.fromEmail','\"alex.roper@gmail.com\"'),('email.fromName','\"Nogn Test\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.autocapitalize','true'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.autocomplete','false'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.autocorrect','true'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.class','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.disabled','false'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.id','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.instructions','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.label','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.max','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.min','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.name','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.orientation','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.placeholder','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.readonly','false'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.requirable','false'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.size','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.step','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.tip','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.title','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.warning','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.elements.0.width','100'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.name','\"Content\"'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.fieldLayouts.e88585f9-9e5f-4c62-8914-3d188048d5dd.tabs.0.sortOrder','1'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.handle','\"test\"'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.hasTitleField','true'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.name','\"Test\"'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.section','\"b6b1d16b-8194-4a21-b2a4-14866cfad059\"'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.sortOrder','1'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.titleFormat','\"{section.name|raw}\"'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.titleTranslationKeyFormat','null'),('entryTypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6.titleTranslationMethod','\"site\"'),('fieldGroups.5fa7b3df-d859-4a32-aec9-3ff72b776743.name','\"Common\"'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.39e3c46b-5362-4239-9098-318ab43b61c2.isPublic','true'),('graphql.schemas.39e3c46b-5362-4239-9098-318ab43b61c2.name','\"Public Schema\"'),('graphql.schemas.39e3c46b-5362-4239-9098-318ab43b61c2.scope.0','\"sections.b6b1d16b-8194-4a21-b2a4-14866cfad059:read\"'),('graphql.schemas.39e3c46b-5362-4239-9098-318ab43b61c2.scope.1','\"entrytypes.7d8444cb-bf49-4041-8e9a-650f0b91cfe6:read\"'),('plugins.craft-gridsome.edition','\"standard\"'),('plugins.craft-gridsome.enabled','true'),('plugins.craft-gridsome.licenseKey','\"GLYOVLRLLCZE75D3Q3G1KLID\"'),('plugins.craft-gridsome.schemaVersion','\"0.1.0\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.enableVersioning','true'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.handle','\"test\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.name','\"Test\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.previewTargets.0.__assoc__.0.1','\"Craft Preview\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.previewTargets.0.__assoc__.1.1','\"{slug}\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.previewTargets.0.__assoc__.2.1','\"\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.propagationMethod','\"all\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.siteSettings.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.enabledByDefault','true'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.siteSettings.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.hasUrls','true'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.siteSettings.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.template','\"test\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.siteSettings.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.uriFormat','\"test\"'),('sections.b6b1d16b-8194-4a21-b2a4-14866cfad059.type','\"single\"'),('siteGroups.fc5f04e1-8014-4db6-bb2a-ab755a764a02.name','\"Nogn Test\"'),('sites.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.handle','\"default\"'),('sites.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.hasUrls','true'),('sites.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.language','\"en-US\"'),('sites.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.name','\"Nogn Test\"'),('sites.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.primary','true'),('sites.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.siteGroup','\"fc5f04e1-8014-4db6-bb2a-ab755a764a02\"'),('sites.b6d3c5eb-8232-4b9b-a44a-198c6d49d013.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Nogn Test\"'),('system.schemaVersion','\"3.6.4\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `resourcepaths` VALUES ('150bc008','@craft/web/assets/craftsupport/dist'),('1d0d77c5','@craft/web/assets/login/dist'),('23d3f74b','@lib/axios'),('2904b702','@lib/jquery-ui'),('2a073d34','@craft/web/assets/clearcaches/dist'),('2a1efd4c','@craft/web/assets/feed/dist'),('31635aa1','@craft/web/assets/editsection/dist'),('37ba06b3','@craft/web/assets/plugins/dist'),('485ad8f4','@craft/web/assets/edituser/dist'),('535ddb87','@craft/web/assets/dashboard/dist'),('59b2702f','@lib/element-resize-detector'),('67ad2ca7','@lib/velocity'),('73fb1987','@craft/web/assets/editentry/dist'),('7622dbda','@bower/jquery/dist'),('7b8a834f','@lib/jquery.payment'),('85de3230','@craft/web/assets/updater/dist'),('8c1d746f','@craft/web/assets/recententries/dist'),('9b65d626','@lib/timepicker'),('a1a2dfed','@craft/web/assets/pluginstore/dist'),('a49a8e53','@lib/xregexp'),('a5a5b446','@craft/web/assets/installer/dist'),('a8d9ef90','@craft/web/assets/cp/dist'),('aef6cad9','@lib/selectize'),('b2a73601','@craft/web/assets/updateswidget/dist'),('c790d08a','@lib/garnishjs'),('d230ec3f','@craft/web/assets/graphiql/dist'),('d2d604b4','@lib/fabric'),('db3d358c','@craft/web/assets/admintable/dist'),('e260e6a3','@lib/fileupload'),('e38543e','@lib/vue'),('eec3d9b4','@lib/iframe-resizer'),('f0440110','@craft/web/assets/userpermissions/dist'),('f22bd75a','@craft/web/assets/utilities/dist'),('f42dc70c','@lib/d3'),('fa88e75d','@lib/picturefill'),('fd2cdb9f','@lib/jquery-touch-events');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' alex roper gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' test '),(2,'title',0,1,' test '),(7,'slug',0,1,' test '),(7,'title',0,1,' testing ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Test','test','single',1,'all','[{\"label\":\"Craft Preview\",\"urlFormat\":\"{slug}\",\"refresh\":\"\"}]','2021-02-19 09:39:14','2021-02-19 10:50:05',NULL,'b6b1d16b-8194-4a21-b2a4-14866cfad059');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'test','test',1,'2021-02-19 09:39:14','2021-02-19 09:39:14','134d4e34-2c92-4494-941c-18620c3beb88');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Nogn Test','2021-02-19 09:16:04','2021-02-19 09:16:04',NULL,'fc5f04e1-8014-4db6-bb2a-ab755a764a02');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,1,'Nogn Test','default','en-US',1,'$PRIMARY_SITE_URL',1,'2021-02-19 09:16:04','2021-02-19 09:16:04',NULL,'b6d3c5eb-8232-4b9b-a44a-198c6d49d013');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (5,'c2zAen5BCEUcehvK5TOs_cgJ72Df_Zfn','[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":2,\"siteId\":1,\"draftId\":2,\"revisionId\":null}]',NULL,NULL,'2021-02-21 02:00:28','2021-02-20 02:00:28','2021-02-20 02:00:28','980eba4d-47c4-4708-b5ae-62a39557cfdf'),(6,'qO-PtBTLVRLEaGnavlziT6XZgehcV18E','[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":2,\"siteId\":1,\"draftId\":2,\"revisionId\":null}]',NULL,NULL,'2021-02-21 02:42:15','2021-02-20 02:42:15','2021-02-20 02:42:15','547365cd-702c-4879-94ce-28123b26ab15'),(7,'697eYwGlCBjYk2hpcK42w4breBnuC6Kw','[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":2,\"siteId\":1,\"draftId\":2,\"revisionId\":null}]',NULL,NULL,'2021-02-21 02:46:46','2021-02-20 02:46:46','2021-02-20 02:46:46','38b89945-8f54-49ca-936e-e42f97721f36'),(8,'Rh2uhaA-4K-k-VbHO7XUUIoPqL3FKcLo','[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":2,\"siteId\":1,\"draftId\":2,\"revisionId\":null}]',NULL,NULL,'2021-02-21 21:15:05','2021-02-20 21:15:05','2021-02-20 21:15:05','5156b0ed-17bb-4d36-b5af-26f56cd5b392');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'admin',NULL,'','','alex.roper@gmail.com','$2y$13$dNIV9RJ0cSKbZic7MDjEaeRccJfcQLLdJa5H7d84IrALZLILxC/Ny',1,0,0,0,'2021-02-20 21:21:18',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-02-20 21:20:43','2021-02-19 09:16:06','2021-02-20 21:21:18','e6531829-8a4f-433d-8706-29559747ebdb');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-02-19 09:38:30','2021-02-19 09:38:30','6b64c37a-3482-4ba8-bd4d-7f2850d0a44c'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-02-19 09:38:30','2021-02-19 09:38:30','4845064a-3a47-4556-afb6-07b60e086f06'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-02-19 09:38:30','2021-02-19 09:38:30','e61cd305-1fdb-4e0b-82e0-4b6a1b9680e1'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-02-19 09:38:30','2021-02-19 09:38:30','b2c6d75e-0648-4984-b086-27d6ccb1c8e5');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'nogn_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-20 14:00:35
