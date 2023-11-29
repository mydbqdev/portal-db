CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(350) NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `end_date` varchar(50) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  `description` varchar(600) NOT NULL,
  `image_copy` blob,
  `image_name` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `branch_info` (
  `branch_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `branch_started_on` date DEFAULT NULL,
  `total_employees` int DEFAULT NULL,
  `primary_ph_num` varchar(15) DEFAULT NULL,
  `secondary_ph_num` varchar(15) DEFAULT NULL,
  `currency` varchar(25) DEFAULT NULL,
  `notice_period` int DEFAULT NULL,
  `docs` varchar(1000) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country_ph_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `calendar` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_date` varchar(150) DEFAULT NULL,
  `c_day` varchar(100) DEFAULT NULL,
  `c_festival` varchar(200) DEFAULT NULL,
  `c_holiday` varchar(20) DEFAULT NULL,
  `c_restricted_holiday` varchar(20) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `c_date_UNIQUE` (`c_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `countries` (
  `id` int DEFAULT NULL,
  `country_name` varchar(20) NOT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `currency_name` varchar(100) DEFAULT NULL,
  `country_ph_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(1, 'India', 'Indian', 'India Rupees – INR', '+91');
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(2, 'China', 'Chinese', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(3, 'United States', 'American', 'United States Dollars – USD', '+1');
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(4, 'Russia', 'Russian', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(5, 'Japan', 'Japanies', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(6, 'Germany', 'German', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(7, 'UK', 'British', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(8, 'France', 'French', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(9, 'Italy', 'Italian', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(10, 'Canada', 'Canadian', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(11, 'Saudi Arabia', 'Saudi Arabians', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(12, 'Malaysia', 'Malaysians', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(13, 'Australia', 'Australian', 'Australia Dollars – AUD', '	+61');
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(14, 'UAE', 'Emirati', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(15, 'Singapore', 'Singaporean', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(16, 'New Zealand', 'New Zealander', NULL, NULL);
INSERT INTO countries (id, country_name, nationality, currency_name, country_ph_code) VALUES(17, 'Kuwait', 'Kuwaiti', NULL, NULL);


CREATE TABLE `states` (
  `state_name` varchar(50) NOT NULL,
  `country_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`state_name`),
  KEY `country_name` (`country_name`),
  CONSTRAINT `states_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `countries` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO states (state_name, country_name) VALUES('Australian Capital Territory ', 'Australia');
INSERT INTO states (state_name, country_name) VALUES('New South Wales ', 'Australia');
INSERT INTO states (state_name, country_name) VALUES('Northern Territory ', 'Australia');
INSERT INTO states (state_name, country_name) VALUES('Queensland ', 'Australia');
INSERT INTO states (state_name, country_name) VALUES('South Australia ', 'Australia');
INSERT INTO states (state_name, country_name) VALUES('Tasmania ', 'Australia');
INSERT INTO states (state_name, country_name) VALUES('Victoria ', 'Australia');
INSERT INTO states (state_name, country_name) VALUES('Western Australia ', 'Australia');
INSERT INTO states (state_name, country_name) VALUES('Alberta ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('British Columbia ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Manitoba ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('New Brunswick', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Newfoundland and Labrador ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Northwest Territories ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Nova Scotia ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Nunavut ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Ontario ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Prince Edward Island ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Quebec ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Saskatchewan ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Yukon ', 'Canada');
INSERT INTO states (state_name, country_name) VALUES('Anhui', 'China');
INSERT INTO states (state_name, country_name) VALUES('Beijing', 'China');
INSERT INTO states (state_name, country_name) VALUES('Chongqing ', 'China');
INSERT INTO states (state_name, country_name) VALUES('Fujian', 'China');
INSERT INTO states (state_name, country_name) VALUES('Gansu', 'China');
INSERT INTO states (state_name, country_name) VALUES('Guangdong', 'China');
INSERT INTO states (state_name, country_name) VALUES('Guangxi Zhuang', 'China');
INSERT INTO states (state_name, country_name) VALUES('Guizhou', 'China');
INSERT INTO states (state_name, country_name) VALUES('Hainan', 'China');
INSERT INTO states (state_name, country_name) VALUES('Hebei', 'China');
INSERT INTO states (state_name, country_name) VALUES('Heilongjiang', 'China');
INSERT INTO states (state_name, country_name) VALUES('Henan', 'China');
INSERT INTO states (state_name, country_name) VALUES('Hong Kong SAR', 'China');
INSERT INTO states (state_name, country_name) VALUES('Hubei', 'China');
INSERT INTO states (state_name, country_name) VALUES('Hunan', 'China');
INSERT INTO states (state_name, country_name) VALUES('Inner Mongolia', 'China');
INSERT INTO states (state_name, country_name) VALUES('Jiangsu', 'China');
INSERT INTO states (state_name, country_name) VALUES('Jiangxi', 'China');
INSERT INTO states (state_name, country_name) VALUES('Jilin', 'China');
INSERT INTO states (state_name, country_name) VALUES('Liaoning', 'China');
INSERT INTO states (state_name, country_name) VALUES('Macau SAR', 'China');
INSERT INTO states (state_name, country_name) VALUES('Ningxia Huizu', 'China');
INSERT INTO states (state_name, country_name) VALUES('Qinghai', 'China');
INSERT INTO states (state_name, country_name) VALUES('Shaanxi', 'China');
INSERT INTO states (state_name, country_name) VALUES('Shandong', 'China');
INSERT INTO states (state_name, country_name) VALUES('Shanghai ', 'China');
INSERT INTO states (state_name, country_name) VALUES('Shanxi', 'China');
INSERT INTO states (state_name, country_name) VALUES('Sichuan', 'China');
INSERT INTO states (state_name, country_name) VALUES('Taiwan ', 'China');
INSERT INTO states (state_name, country_name) VALUES('Tianjin', 'China');
INSERT INTO states (state_name, country_name) VALUES('Xinjiang', 'China');
INSERT INTO states (state_name, country_name) VALUES('Xizang', 'China');
INSERT INTO states (state_name, country_name) VALUES('Yunnan', 'China');
INSERT INTO states (state_name, country_name) VALUES('Zhejiang', 'China');
INSERT INTO states (state_name, country_name) VALUES('Ain ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Aisne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Allier ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Alpes-de-Haute-Provence ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Alpes-Maritimes ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Alsace ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Ardèche ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Ardennes ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Ariège ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Aube ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Aude ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Auvergne-Rhône-Alpes ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Aveyron ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Bas-Rhin ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Bouches-du-Rhône ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Bourgogne-Franche-Comté ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Bretagne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Calvados ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Cantal ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Centre-Val de Loire ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Charente ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Charente-Maritime ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Cher ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Clipperton ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Corrèze ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Corse ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Corse-du-Sud ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Côte-d''Or ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Côtes-d''Armor ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Creuse ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Deux-Sèvres ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Dordogne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Doubs ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Drôme ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Essonne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Eure ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Eure-et-Loir ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Finistère ', 'France');
INSERT INTO states (state_name, country_name) VALUES('French Guiana ', 'France');
INSERT INTO states (state_name, country_name) VALUES('French Polynesia ', 'France');
INSERT INTO states (state_name, country_name) VALUES('French Southern and Antarctic Lands ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Gard ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Gers ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Gironde ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Grand-Est ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Guadeloupe ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Haut-Rhin ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Haute-Corse ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Haute-Garonne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Haute-Loire ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Haute-Marne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Haute-Saône ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Haute-Savoie ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Haute-Vienne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Hautes-Alpes ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Hautes-Pyrénées ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Hauts-de-France ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Hauts-de-Seine ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Hérault ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Île-de-France ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Ille-et-Vilaine ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Indre ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Indre-et-Loire ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Isère ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Jura ', 'France');
INSERT INTO states (state_name, country_name) VALUES('La Réunion ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Landes ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Loir-et-Cher ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Loire ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Loire-Atlantique ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Loiret ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Lot ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Lot-et-Garonne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Lozère ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Maine-et-Loire ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Manche ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Marne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Martinique ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Mayenne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Mayotte ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Métropole de Lyon ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Meurthe-et-Moselle ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Meuse ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Morbihan ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Moselle ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Nièvre ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Nord ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Normandie ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Nouvelle-Aquitaine ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Occitanie ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Oise ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Orne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Paris ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Pas-de-Calais ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Pays-de-la-Loire ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Provence-Alpes-Côte-d’Azur ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Puy-de-Dôme ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Pyrénées-Atlantiques ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Pyrénées-Orientales ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Rhône ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Saint Pierre and Miquelon ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Saint-Barthélemy ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Saint-Martin ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Saône-et-Loire ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Sarthe ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Savoie ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Seine-et-Marne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Seine-Maritime ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Seine-Saint-Denis ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Somme ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Tarn ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Tarn-et-Garonne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Territoire de Belfort ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Val-d''Oise ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Val-de-Marne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Var ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Vaucluse ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Vendée ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Vienne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Vosges ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Wallis and Futuna ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Yonne ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Yvelines ', 'France');
INSERT INTO states (state_name, country_name) VALUES('Baden-Württemberg ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Bavaria ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Berlin ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Brandenburg ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Bremen ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Hamburg ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Hesse ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Lower Saxony ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Mecklenburg-Vorpommern ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('North Rhine-Westphalia ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Rhineland-Palatinate ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Saarland ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Saxony ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Saxony-Anhalt ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Schleswig-Holstein ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Thuringia ', 'Germany');
INSERT INTO states (state_name, country_name) VALUES('Andaman and Nicobar Islands', 'India');
INSERT INTO states (state_name, country_name) VALUES('Andhra Pradesh', 'India');
INSERT INTO states (state_name, country_name) VALUES('Arunachal Pradesh', 'India');
INSERT INTO states (state_name, country_name) VALUES('Assam', 'India');
INSERT INTO states (state_name, country_name) VALUES('Bihar', 'India');
INSERT INTO states (state_name, country_name) VALUES('Chandigarh', 'India');
INSERT INTO states (state_name, country_name) VALUES('Chhattisgarh', 'India');
INSERT INTO states (state_name, country_name) VALUES('Dadra and Nagar Haveli and Daman and Diu ', 'India');
INSERT INTO states (state_name, country_name) VALUES('Delhi', 'India');
INSERT INTO states (state_name, country_name) VALUES('Goa', 'India');
INSERT INTO states (state_name, country_name) VALUES('Gujarat', 'India');
INSERT INTO states (state_name, country_name) VALUES('Haryana', 'India');
INSERT INTO states (state_name, country_name) VALUES('Himachal Pradesh', 'India');
INSERT INTO states (state_name, country_name) VALUES('Jammu and Kashmir', 'India');
INSERT INTO states (state_name, country_name) VALUES('Jharkhand', 'India');
INSERT INTO states (state_name, country_name) VALUES('Karnataka', 'India');
INSERT INTO states (state_name, country_name) VALUES('Kerala', 'India');
INSERT INTO states (state_name, country_name) VALUES('Ladakh', 'India');
INSERT INTO states (state_name, country_name) VALUES('Lakshadweep', 'India');
INSERT INTO states (state_name, country_name) VALUES('Madhya Pradesh', 'India');
INSERT INTO states (state_name, country_name) VALUES('Maharastra', 'India');
INSERT INTO states (state_name, country_name) VALUES('Manipur', 'India');
INSERT INTO states (state_name, country_name) VALUES('Meghalaya', 'India');
INSERT INTO states (state_name, country_name) VALUES('Mizoram', 'India');
INSERT INTO states (state_name, country_name) VALUES('Nagaland', 'India');
INSERT INTO states (state_name, country_name) VALUES('Odisha', 'India');
INSERT INTO states (state_name, country_name) VALUES('Puducherry', 'India');
INSERT INTO states (state_name, country_name) VALUES('Punjab', 'India');
INSERT INTO states (state_name, country_name) VALUES('Rajasthan', 'India');
INSERT INTO states (state_name, country_name) VALUES('Sikkim', 'India');
INSERT INTO states (state_name, country_name) VALUES('TamilNadu', 'India');
INSERT INTO states (state_name, country_name) VALUES('Telangana', 'India');
INSERT INTO states (state_name, country_name) VALUES('Tripura', 'India');
INSERT INTO states (state_name, country_name) VALUES('Uttarakhand ', 'India');
INSERT INTO states (state_name, country_name) VALUES('Uttarpradesh', 'India');
INSERT INTO states (state_name, country_name) VALUES('West Bengal', 'India');
INSERT INTO states (state_name, country_name) VALUES('Abruzzo ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Agrigento ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Alessandria ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Ancona ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Aosta Valley ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Apulia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Ascoli Piceno ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Asti ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Avellino ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Barletta-Andria-Trani ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Basilicata ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Belluno ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Benevento ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Bergamo ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Biella ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Brescia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Brindisi ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Calabria ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Caltanissetta ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Campania ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Campobasso ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Caserta ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Catanzaro ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Chieti ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Como ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Cosenza ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Cremona ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Crotone ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Cuneo ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Emilia-Romagna ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Enna ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Fermo ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Ferrara ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Foggia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Forlì-Cesena ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Friuli–Venezia Giulia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Frosinone ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Gorizia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Grosseto ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Imperia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Isernia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('L''Aquila ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('La Spezia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Latina ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Lazio ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Lecce ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Lecco ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Liguria ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Livorno ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Lodi ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Lombardy ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Lucca ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Macerata ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Mantua ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Marche ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Massa and Carrara ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Matera ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Medio Campidano ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Modena ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Molise ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Monza and Brianza ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Novara ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Nuoro ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Oristano ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Padua ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Palermo ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Parma ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Pavia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Perugia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Pesaro and Urbino ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Pescara ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Piacenza ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Piedmont ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Pisa ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Pistoia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Pordenone ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Potenza ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Prato ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Ragusa ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Ravenna ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Reggio Emilia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Rieti ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Rimini ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Rovigo ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Salerno ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Sardinia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Sassari ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Savona ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Sicily ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Siena ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Siracusa ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Sondrio ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('South Sardinia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Taranto ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Teramo ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Terni ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Trapani ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Trentino-South Tyrol ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Treviso ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Trieste ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Tuscany ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Udine ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Umbria ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Varese ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Veneto ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Verbano-Cusio-Ossola ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Vercelli ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Verona ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Vibo Valentia ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Vicenza ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Viterbo ', 'Italy');
INSERT INTO states (state_name, country_name) VALUES('Aichi Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Akita Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Aomori Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Chiba Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Ehime Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Fukui Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Fukuoka Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Fukushima Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Gifu Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Gunma Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Hiroshima Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Hokkaidō Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Hyōgo Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Ibaraki Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Ishikawa Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Iwate Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Kagawa Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Kagoshima Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Kanagawa Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Kōchi Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Kumamoto Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Kyōto Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Mie Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Miyagi Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Miyazaki Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Nagano Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Nagasaki Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Nara Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Niigata Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Ōita Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Okayama Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Okinawa Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Ōsaka Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Saga Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Saitama Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Shiga Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Shimane Prefecture ', 'japan');
INSERT INTO states (state_name, country_name) VALUES('Shizuoka Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Tochigi Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Tokushima Prefecture ', 'japan');
INSERT INTO states (state_name, country_name) VALUES('Tokyo ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Tottori Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Toyama Prefecture ', 'japan');
INSERT INTO states (state_name, country_name) VALUES('Wakayama Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Yamagata Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Yamaguchi Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Yamanashi Prefecture ', 'Japan');
INSERT INTO states (state_name, country_name) VALUES('Al Ahmadi ', 'Kuwait');
INSERT INTO states (state_name, country_name) VALUES('Al Farwaniyah ', 'Kuwait');
INSERT INTO states (state_name, country_name) VALUES('Al Jahra ', 'Kuwait');
INSERT INTO states (state_name, country_name) VALUES('Capital ', 'Kuwait');
INSERT INTO states (state_name, country_name) VALUES('Hawalli ', 'Kuwait');
INSERT INTO states (state_name, country_name) VALUES('Mubarak Al-Kabeer ', 'Kuwait');
INSERT INTO states (state_name, country_name) VALUES('Johor ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Kedah ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Kelantan ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Kuala Lumpur ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Labuan ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Malacca ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Negeri Sembilan ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Pahang ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Penang ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Perak ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Perlis ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Putrajaya ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Sabah ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Sarawak ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Selangor ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Terengganu ', 'Malaysia');
INSERT INTO states (state_name, country_name) VALUES('Auckland Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Bay of Plenty Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Canterbury Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Chatham Islands ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Gisborne District ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Hawke''s Bay Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Manawatu-Wanganui Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Marlborough Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Nelson Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Northland Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Otago Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Southland Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Taranaki Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Tasman District ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Waikato Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Wellington Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('West Coast Region ', 'New zealand');
INSERT INTO states (state_name, country_name) VALUES('Altai Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Altai Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Amur Oblast', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Arkhangelsk', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Astrakhan Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Belgorod Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Bryansk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Chechen Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Chelyabinsk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Chukotka Autonomous Okrug ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Chuvash Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Irkutsk ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Ivanovo Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Jewish Autonomous Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kabardino-Balkar Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kaliningrad ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kaluga Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kamchatka Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Karachay-Cherkess Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kemerovo Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Khabarovsk Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Khanty-Mansi Autonomous Okrug ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kirov Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Komi Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kostroma Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Krasnodar Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Krasnoyarsk Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kurgan Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Kursk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Leningrad Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Lipetsk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Magadan Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Mari El Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Moscow ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Moscow Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Murmansk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Nenets Autonomous Okrug ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Nizhny Novgorod Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Novgorod Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Novosibirsk ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Omsk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Orenburg Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Oryol Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Penza Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Perm Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Primorsky Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Pskov Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Adygea ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Bashkortostan ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Buryatia ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Dagestan ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Ingushetia ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Kalmykia ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Karelia ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Khakassia ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Mordovia ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of North Ossetia-Alania ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Republic of Tatarstan ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Rostov Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Ryazan Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Saint Petersburg ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Sakha Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Sakhalin ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Samara Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Saratov Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Sevastopol ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Smolensk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Stavropol Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Sverdlovsk ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Tambov Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Tomsk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Tula Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Tuva Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Tver Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Tyumen Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Udmurt Republic ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Ulyanovsk Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Vladimir Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Volgograd Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Vologda Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Voronezh Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Yamalo-Nenets Autonomous Okrug ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Yaroslavl Oblast ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Zabaykalsky Krai ', 'Russia');
INSERT INTO states (state_name, country_name) VALUES('Al Bahah ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Al Jawf ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Al Madinah ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Al-Qassim ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Asir ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Eastern Province ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Ha''il ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Jizan ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Makkah ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Najran ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Northern Borders ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Riyadh ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Tabuk ', 'Saudi Arabia');
INSERT INTO states (state_name, country_name) VALUES('Central Singapore Community Development Council ', 'Singapore');
INSERT INTO states (state_name, country_name) VALUES('North East Community Development Council ', 'Singapore');
INSERT INTO states (state_name, country_name) VALUES('North West Community Development Council ', 'Singapore');
INSERT INTO states (state_name, country_name) VALUES('South East Community Development Council ', 'Singapore');
INSERT INTO states (state_name, country_name) VALUES('South West Community Development Council ', 'Singapore');
INSERT INTO states (state_name, country_name) VALUES('Abu Dhabi Emirate AZ', 'UAE');
INSERT INTO states (state_name, country_name) VALUES('Ajman Emirate ', 'UAE');
INSERT INTO states (state_name, country_name) VALUES('Dubai ', 'UAE');
INSERT INTO states (state_name, country_name) VALUES('Fujairah ', 'UAE');
INSERT INTO states (state_name, country_name) VALUES('Ras al-Khaimah ', 'UAE');
INSERT INTO states (state_name, country_name) VALUES('Sharjah Emirate ', 'UAE');
INSERT INTO states (state_name, country_name) VALUES('Umm al-Quwain ', 'UAE');
INSERT INTO states (state_name, country_name) VALUES('Aberdeen', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Aberdeenshire', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Aberdeenshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Angus ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Antrim ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Antrim and Newtownabbey ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Ards ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Ards and North Down ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Argyll and Bute ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Armagh City and District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Armagh, Banbridge and Craigavon ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Ascension Island ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Ballymena Borough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Ballymoney ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Banbridge ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Barnsley ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Bath and North East Somerset ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Bedford ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Belfast district ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Birmingham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Blackburn with Darwen ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Blackpool ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Blaenau Gwent County Borough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Bolton ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Bournemouth ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Bracknell Forest ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Bradford ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Bridgend County Borough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Brighton and Hove ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Buckinghamshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Bury ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Caerphilly County Borough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Calderdale ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Cambridgeshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Carmarthenshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Carrickfergus Borough Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Castlereagh ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Causeway Coast and Glens ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Central Bedfordshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Ceredigion ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Cheshire East ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Cheshire West and Chester ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City and County of Cardiff ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City and County of Swansea ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Bristol ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Derby ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Kingston upon Hull ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Leicester ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of London ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Nottingham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Peterborough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Plymouth ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Portsmouth ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Southampton ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Stoke-on-Trent ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Sunderland ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Westminster ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of Wolverhampton ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('City of York ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Clackmannanshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Coleraine Borough Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Conwy County Borough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Cookstown District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Cornwall ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('County Durham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Coventry ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Craigavon Borough Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Cumbria ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Darlington ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Denbighshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Derbyshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Derry City and Strabane ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Derry City Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Devon ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Doncaster ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Dorset ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Down District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Dudley ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Dumfries and Galloway ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Dundee ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Dungannon and South Tyrone Borough Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('East Ayrshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('East Dunbartonshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('East Lothian ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('East Renfrewshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('East Riding of Yorkshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('East Sussex ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Edinburgh ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('England ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Essex ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Falkirk ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Fermanagh and Omagh ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Fermanagh District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Fife ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Flintshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Gateshead ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Glasgow ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Gloucestershire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Gwynedd ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Halton ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Hampshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Hartlepool ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Herefordshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Hertfordshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Highland ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Inverclyde ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Isle of Wight ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Isles of Scilly ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Kent ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Kirklees ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Knowsley ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Lancashire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Larne Borough Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Leeds ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Leicestershire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Limavady Borough Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Lincolnshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Lisburn and Castlereagh ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Lisburn City Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Liverpool ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Barking and Dagenham BDG', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Barnet ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Bexley ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Brent ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Bromley ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Camden ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Croydon ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Ealing ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Enfield ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Hackney ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Hammersmith and Fulham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Haringey ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Harrow ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Havering ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Hillingdon ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Hounslow ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Islington ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Lambeth ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Lewisham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Merton ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Newham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Redbridge ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Richmond upon Thames ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Southwark ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Sutton ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Tower Hamlets ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Waltham Forest ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('London Borough of Wandsworth ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Magherafelt District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Manchester ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Medway ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Merthyr Tydfil County Borough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Metropolitan Borough of Wigan ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Mid and East Antrim ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Mid Ulster ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Middlesbrough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Midlothian ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Milton Keynes ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Monmouthshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Moray ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Moyle District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Neath Port Talbot County Borough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Newcastle upon Tyne ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Newport ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Newry and Mourne District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Newry, Mourne and Down ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Newtownabbey Borough Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Norfolk ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('North Ayrshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('North Down Borough Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('North East Lincolnshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('North Lanarkshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('North Lincolnshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('North Somerset ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('North Tyneside ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('North Yorkshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Northamptonshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Northern Ireland ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Northumberland ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Nottinghamshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Oldham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Omagh District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Orkney Islands ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Outer Hebrides ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Oxfordshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Pembrokeshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Perth and Kinross ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Poole ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Powys ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Reading ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Redcar and Cleveland ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Renfrewshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Rhondda Cynon Taf ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Rochdale ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Rotherham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Royal Borough of Greenwich ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Royal Borough of Kensington and Chelsea ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Royal Borough of Kingston upon Thames ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Rutland ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Saint Helena ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Salford ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Sandwell ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Scotland ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Scottish Borders ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Sefton ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Sheffield ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Shetland Islands ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Shropshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Slough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Solihull ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Somerset ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('South Ayrshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('South Gloucestershire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('South Lanarkshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('South Tyneside ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Southend-on-Sea ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('St Helens ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Staffordshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Stirling ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Stockport ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Stockton-on-Tees ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Strabane District Council ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Suffolk ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Surrey ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Swindon ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Tameside ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Telford and Wrekin ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Thurrock ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Torbay ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Torfaen ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Trafford ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('United Kingdom ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Vale of Glamorgan ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Wakefield ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Wales ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Walsall ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Warrington ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Warwickshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('West Berkshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('West Dunbartonshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('West Lothian ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('West Sussex ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Wiltshire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Windsor and Maidenhead ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Wirral ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Wokingham ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Worcestershire ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Wrexham County Borough ', 'UK');
INSERT INTO states (state_name, country_name) VALUES('Alabama', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Alaska', 'United States');
INSERT INTO states (state_name, country_name) VALUES('American Samoa', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Arizona', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Arkansas', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Baker Island', 'United States');
INSERT INTO states (state_name, country_name) VALUES('California', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Colorado', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Connecticut', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Delaware', 'United States');
INSERT INTO states (state_name, country_name) VALUES('District of Columbia', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Florida', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Georgia', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Guam', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Hawaii', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Howland Island', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Idaho', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Illinois', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Indiana', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Iowa', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Jarvis Island', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Johnston Atoll', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Kansas', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Kentucky', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Kingman Reef', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Louisiana', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Maine', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Maryland', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Massachusetts', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Michigan', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Midway Atoll', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Minnesota', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Mississippi', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Missouri', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Montana', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Navassa Island', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Nebraska', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Nevada', 'United States');
INSERT INTO states (state_name, country_name) VALUES('New Hampshire', 'United States');
INSERT INTO states (state_name, country_name) VALUES('New Jersey', 'United States');
INSERT INTO states (state_name, country_name) VALUES('New Mexico', 'United States');
INSERT INTO states (state_name, country_name) VALUES('New York', 'United States');
INSERT INTO states (state_name, country_name) VALUES('North Carolina', 'United States');
INSERT INTO states (state_name, country_name) VALUES('North Dakota ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Northern Mariana Islands ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Ohio', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Oklahoma', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Oregon ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Palmyra Atoll ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Pennsylvania ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Puerto Rico ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Rhode Island ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('South Carolina ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('South Dakota ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Tennessee ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Texas ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('United States Minor Outlying Islands ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('United States Virgin Islands ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Utah ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Vermont ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Virginia ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Wake Island ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Washington ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('West Virginia ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Wisconsin ', 'United States');
INSERT INTO states (state_name, country_name) VALUES('Wyoming ', 'United States');


CREATE TABLE `technologies` (
  `id` int NOT NULL,
  `technologies` varchar(45) DEFAULT NULL,
  `years` int DEFAULT NULL,
  `months` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO technologies (id, technologies, years, months, status) VALUES(1, 'Java', 0, 0, 'In-process');
INSERT INTO technologies (id, technologies, years, months, status) VALUES(2, 'Angular', 1, 1, 'Selected');
INSERT INTO technologies (id, technologies, years, months, status) VALUES(3, 'Python', 2, 2, 'Joined');
INSERT INTO technologies (id, technologies, years, months, status) VALUES(4, 'DevOps', 3, 3, 'Under Interview ');
INSERT INTO technologies (id, technologies, years, months, status) VALUES(5, 'Manual Testing', 4, 4, 'Not yet started');
INSERT INTO technologies (id, technologies, years, months, status) VALUES(6, 'Automation Testing', 5, 5, 'Not-Joined');
INSERT INTO technologies (id, technologies, years, months, status) VALUES(7, 'React', 6, 6, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(8, 'AWS', 7, 7, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(9, 'DBMS', 8, 8, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(10, 'Data Structures', 9, 9, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(11, 'Web Technologies', 10, 10, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(12, 'C,C++ ', 11, 11, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(13, 'Data Mining', 12, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(14, 'Azure', 13, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(15, 'Salesforce', 14, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(16, 'Selenium', 15, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(17, 'Postman', 16, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(18, 'Spring Framework', 17, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(19, 'MySql', 18, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(20, 'Sql', 19, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(21, 'Angular Js', 20, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(22, NULL, 21, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(23, NULL, 22, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(24, NULL, 23, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(25, NULL, 24, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(26, NULL, 25, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(27, NULL, 26, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(28, NULL, 27, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(29, NULL, 28, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(30, NULL, 29, NULL, NULL);
INSERT INTO technologies (id, technologies, years, months, status) VALUES(31, NULL, 30, NULL, NULL);


CREATE TABLE `upload_all_files` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `upload_file` varchar(100) DEFAULT NULL,
  `file_status` varchar(100) DEFAULT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `sub_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `error_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `email_format_config` (
  `screen_name` varchar(100) NOT NULL,
  `mail_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `content_text` text NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_format_config_UN` (`screen_name`,`mail_type`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('i_on_board', 'credential_details', 'DBQ Portal Login Details', '<!DOCTYPE html><html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},</br><br>
Please use below data to login into the portal,</br>
URL: {site_url}</br>
User Name: {user_name} </br>
Password: {pwd}</br></br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 1);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('forgot_password', 'sending_OTP', 'OTP To Change Password', '<!DOCTYPE html>
 <html>
 <head>
 <style>
 html {
     min-height: 100%;
 }
 body {
     background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
 }
 </style>
 </head>
 <body>
 <div >
 <p>Dear {emp_name_code},</br><br>
 Please use below passcode to change password.<br>
 security code: {security_code}</br></br></br>
 </br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
 </p>
 <p>Note: This is Auto generated mail don''t reply for this mail.</p>
 </div>
 </body> </html>', 2);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('change_password', 'change_password_reminder_mail', 'Change Password reminder', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},</br><br>
Please change DBQ Portal password. For every 45 days Password should be changed.<br><br>"
Path: Login DBQ Portal --> Account Settings --> Change password<br><br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 3);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('reporting_manager', 'rm_change_request', 'RM Change Request', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear Reporting Manager,<br><br>
Reporting Manager change request has been submitted by {emp_name_code}.</br> 
Please Approve/Reject using below path.<br><br>"
Path: Login DBQ Portal --> LMS --> RM Approvals.<br><br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 4);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('rm_approvals', 'rm_change_request_approved', 'Reporting Manager change Request Approved', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br><br>Your RM request has been approved by {rm_name_code}.<br><br>
Path: Login DBQ Portal --> Employment --> Reporting manager.<br><br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 5);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('rm_approvals', 'rm_change_request_approved_fully', 'Reporting Manager change Request Approved', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br><br>Your RM request has been fully approved.<br><br>
Path: Login DBQ Portal --> Employment --> Reporting manager.<br><br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 6);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('rm_approvals', 'rm_change_request_rejected', 'Reporting Manager change Request Rejected', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br><br>
Your RM request has been rejected by {rm_name_code}.<br><br>
Path: Login DBQ Portal --> Employment --> Reporting manager.<br><br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 7);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('rm_approvals', 'leave_request_approved', 'Leave Request Approved', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br><br>
{full_content}.<br><br>
Path: Login DBQ Portal --> LMS.<br><br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 8);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('rm_approvals', 'leave_request_rejected', 'Leave Request Rejected', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br><br>
{full_content}.<br><br>
Path: Login DBQ Portal --> LMS.<br><br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 9);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('id_card_request', 'id_card_request', 'ID Card Request', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear HR Manager/Admin,<br><br>The ID card request has been submitted by {emp_name_code}.<br> 
Request Type: {type}<br> 
Please Approve or Reject.<br><br> 
Path: Login DBQ Portal --> Employment --> Admin Approvals .<br><br> 
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 10);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('admin_approvals', 'id_card_request_approved', 'ID Card Request Approved', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
Your ID card request has been Approved. Please collect from HR Admin.<br><br> 
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 11);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('admin_approvals', 'id_card_request_rejected', 'ID Card Request Rejected', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
Your ID card request has been Rejected.<br><br> 
Reason: {reason}.<br><br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 12);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('my_performance_management', 'performance_comment_submitted_to_rm', 'Performance comments has been submitted', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {rm_name_code},<br> <br> 
The performance comments have been submitted by {emp_name_code}.</br>
Please review and provide your comments.</br></br>
Path: Login to DBQ Portal --> Employment --> Performance Management.</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 13);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('my_performance_management', 'performance_comment_submitted_by_rm', 'Performance comments submitted by Reporting Manager', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {reviewer_name_code},<br> <br> 
The performance comments have been submitted by the Reporting Manager for employee {emp_name_code}  and it is ready for review.</br></br>Path: Login to DBQ Portal --> Employment --> Performance Management.</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 14);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('my_performance_management', 'performance_comment_recalled', 'Performance comments Recalled', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
Your performance comments have been recalled by your Reporting Manager {rm_name_code}.
If any changes needed, please do modification & submit again.</br></br>
Path: Login to DBQ Portal --> Employment --> Performance Management.</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 15);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('lms', 'leave_request', 'Leave Request', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {rm_name_code},<br> <br> 
{full_content}</br></br>
Reason : {reason}</br> </br>
Path: Login to DBQ Portal --> LMS --> RM approvals.</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 16);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('lms', 'leave_request_approved', 'Leave Request Approved', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {hr_name_code},<br> <br> 
{full_content}</br></br>
Path: Login to DBQ Portal --> LMS</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 17);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('lms', 'leave_request_rejected', 'Leave Request Rejected', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
{full_content}</br></br>
Path: Login to DBQ Portal --> LMS</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 18);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('DBQ_recruiter', 'DBQ_recruiter', 'DBQ Recruiter', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear Employee,<br> <br>We have opening for below positions. Please refer your contacts for required positions. For more details, please check with your HR/Admin.</br></br>
{full_content}</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 19);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('project_assignation', 'project_assignation', 'My Project Assignation', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
{project_name} has been assigned to you. Please verify it and change your RM to receptive resource.</br></br>
Path:</br>
Login to DBQ Portal --> Employment --> My Project Assignation (To check the project details) </br>
Login to DBQ Portal --> Employment --> My Reporting Manager ( To change the RM) </br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 20);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('compensation', 'compensation', 'Compensation', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
Your annual compensation has been done. Please verify in the below location.</br></br>
Path: Login to DBQ Portal --> Employment --> My Compensation.</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 21);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('timesheet', 'timesheet_request', 'Timesheet Request', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {rm_name_code},<br> <br> 
{full_content}</br></br>
Path: Login to DBQ Portal --> Time Sheet --> Employee Time sheet </br></br>Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 22);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('timesheet', 'timesheet_request_rejected', 'Timesheet Rejected', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
{full_content}</br></br>
Path: Login to DBQ Portal --> Time Sheet --> Time sheet dashboard. </br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br></p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 23);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('timesheet', 'timesheet_request_recalled', 'Timesheet Recalled', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
{full_content}</br></br>
Path: Login to DBQ Portal --> Time Sheet --> Time sheet dashboard. </br></br>Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 24);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('ems', 'ems_submitted', 'Separation submitted by {emp_name_code}', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear  HR Manager/ Reporting Manager, </br></br>
{full_content} </br><br> 
Path: Login to DBQ Portal --> EMS --> Approvals </br> </br> </br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 25);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('ems', 'ems_withdrawal', 'Separation  withdrawal', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear  {emp_name_code}, </br></br>
Congratulations!!! </br>
Your Resignation withdrawal is successfully completed and continue happy working DBQ technologies. </br><br>
Path: Login to DBQ Portal --> EMS --> Separation</br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 26);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('ems', 'ems_approved', 'Separation Approved', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear  {emp_name_code}, </br></br>
{full_content} </br><br>
Path: Login to DBQ Portal --> EMS --> Separation</br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 27);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('ems', 'ems_rejected', 'Separation Rejected', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear  {emp_name_code}, </br></br>
{full_content} </br><br>
Path: Login to DBQ Portal --> EMS --> Separation</br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 28);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('ems', 'ems_credential', 'DBQ EMS Credentials', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear  {emp_name_code}, </br></br>
Please take your related documents by login into below portal. </br>
URL:{url} </br>
UserName: {user_nm} </br>
Password: {pwd} </br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 29);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('scheduler', 'birthday', 'HAPPY BIRTHDAY WISHES', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear  {emp_name_code}, </br></br>
On behalf of <b>DBQ TECHNOLOGIES PVT. LTD</b>, We would like to wish you a very <b style="color:blue;">HAPPY BIRTHDAY !</b> 
and sending you our best wishes for much happiness in your life.<br> 
May the year ahead be filled with success, growth, and fulfilment in both your personal and professional life </br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 30);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('scheduler', 'anniversary', 'Celebrating your Job anniversary!', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear  {emp_name_code}, </br></br>
Congratulation! You have been with us at DBQ Technologies Pvt. Ltd. for {year_content} .
You have made a great contribution to our department''s success during your time with us. We appreciate your unwavering commitment and hard work on the same.<br>
We wish you enjoy this anniversary and also the years to come. </br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 31);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('f_f_settlement', 'f_f_settlement', 'Full and Final Settlement', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear Ex-Employee,</br></br> 

Your full and final settlement has been completed from DBQ Technologies Pvt Ltd & the settlement amount will be credited end of month. Please login to Ex-employee portal {url} for related documents  </br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 32);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('finance_time', 'form16', 'Form16', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear Employee,</br></br> 
Your Form 16 has been uploaded for the Financial year - {year}. If you are facing any issues, please reach out your HR.<br><br>
Path: Login DBQ Portal --> Personal --> Form16.</br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 33);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('finance_time', 'payslip', 'Salary Slip of {1} for {2}', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {3},</br></br> 
Please find attached <B>Salary Slip of {1} for {2} </B>.<BR/>
<B> Password will be your PAN Number</B> <BR/> 
If you have any question ,do not hesitate to contact HR Support<B>(hrsupport@mydbq.com)</B>.<BR/> 
Path: Login to DBQ Portal --> Personal --> My PaySlip <BR/><BR/>
Regards<BR/>HR SUPPORT<BR/>DBQ TECHNOLOGIES PVT. LTD.<BR/>Email: hrsupport@mydbq.com<BR/>364, Ground floor, 6th main, 6th sector, HSR Layout, Bengaluru, Karnataka 560102<BR/><BR/><BR/>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 34);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('finance_time', 'payslip_without_pwd', 'Salary Slip {1} for {2}', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {3},</br></br> 
The <B>Salary Slip {1} for {2} </B> has been generated. You can download it using below application path.  <BR/>
If you have any question ,do not hesitate to contact HR Support<B>(hrsupport@mydbq.com)</B>.<BR/> 
Path: Login to DBQ Portal --> Personal --> My PaySlip <BR/><BR/>
Regards<BR/>HR SUPPORT<BR/>DBQ TECHNOLOGIES PVT. LTD.<BR/>Email: hrsupport@mydbq.com<BR/>364, Ground floor, 6th main, 6th sector, HSR Layout, Bengaluru, Karnataka 560102<BR/><BR/><BR/>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 35);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('Bank_add_update', 'EHS', 'Bank information add / update by employee', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear,<br> <br>Bank information  has been added / updated by {nm}.</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 36);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('Bank_details_approval', 'approval_mail', 'Bank information Approval', '<!DOCTYPE html>
 <html>
 <head>
 <style>
 html {
     min-height: 100%;
 }
 body {
     background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
 }
 </style>
 </head>
 <body>
 <div >
 <p>Dear {emp_name},<br> <br>The bank details has been approved by {hr_name}.</br></br>
 </br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
 </p>
 <p>Note: This is Auto generated mail don''t reply for this mail.</p>
 </div>
 </body> </html>', 37);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('timesheet', 'timesheet_lop', 'Time sheet Auto Submitted as LOP', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},<br> <br> 
     You didn''t submitted your time sheet on {date} ,so it''s auto submitted as Loss Of Pay .</br></br>
Thanks, </br> Admin Department, </br>DBQ Technologies.</br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 38);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('timesheet', 'timesheet_wm', 'Time sheet not submitted', '<!DOCTYPE html>
<html>
<head>
<style>
html {
    min-height: 100%;
}
body {
    background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name_code},</br></br> 
    You didn''t submit your time sheet on {dates} dates.
    If you are unable to submitted the Time sheet, it will be auto submitted as LOP on the above dates .<br><br>
Path: Login to DBQ Portal --> Time Sheet --> Employee Time sheet.</br></br>
Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 39);
INSERT INTO email_format_config (screen_name, mail_type, subject, content_text, id) VALUES('Timesheet', 'recall_LOP', 'LOP Time Sheet Recalled', '<!DOCTYPE html>
<html>
<head>
<style>
html {
     min-height: 100%;
}
body {
     background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));
}
</style>
</head>
<body>
<div >
<p>Dear {emp_name},<br> <br>The Loss of pay timesheet has been recalled by your" RM". Please fill and submit timesheet.</br></br>
</br> Thanks, </br> Admin Department, </br> DBQ Technologies.</br></br>
</p>
<p>Note: This is Auto generated mail don''t reply for this mail.</p>
</div>
</body> </html>', 40);


UPDATE countries set currency_name='Canada Dollars – CAD',country_ph_code='+1' where country_name='Canada';
UPDATE countries set currency_name='China Yuan Renminbi – CNY',country_ph_code='+86' where country_name='China';
UPDATE countries set currency_name='France Francs – FRF',country_ph_code='+33' where country_name='France';
UPDATE countries set currency_name='Germany Deutsche Marks – DEM',country_ph_code='+49' where country_name='Germany';
UPDATE countries set currency_name='Italy Lire – ITL',country_ph_code='+39' where country_name='Italy';

UPDATE countries set currency_name='Japan Yen – JPY',country_ph_code='+81' where country_name='Japan';
UPDATE countries set currency_name='Kuwait Dinars – KWD',country_ph_code='+60' where country_name='Kuwait';
UPDATE countries set currency_name='Malaysia Ringgits – MYR',country_ph_code='+60' where country_name='Malaysia';

UPDATE countries set currency_name='New Zealand Dollars – NZD',country_ph_code='+64' where country_name='New Zealand';
UPDATE countries set currency_name='Russia Rubles – RUB',country_ph_code='+7' where country_name='Russia';
UPDATE countries set currency_name='Saudi Arabis-RIAL',country_ph_code='+966' where country_name='Saudi Arabia';

UPDATE countries set currency_name='Singapore Dollars – SGD',country_ph_code='+65' where country_name='Singapore';
UPDATE countries set currency_name='United Arab Emirates Dirhams – AED',country_ph_code='+971' where country_name='UAE';
UPDATE countries set currency_name='United Kingdom Pounds – GBP',country_ph_code='+44' where country_name='UK';