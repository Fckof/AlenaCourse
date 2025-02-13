-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 13 2022 г., 20:53
-- Версия сервера: 8.0.27
-- Версия PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `авто`
--

DELIMITER $$
--
-- Процедуры
--
DROP PROCEDURE IF EXISTS `Владельцы_без_прав`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Владельцы_без_прав` ()  SELECT `владельцы_авто`.`Фамилия`, `владельцы_авто`.`Имя`, `владельцы_авто`.`Отчество`
FROM `владельцы_авто`
WHERE `владельцы_авто`.`Номер_вод_уд` = ""$$

DROP PROCEDURE IF EXISTS `Водилы_были_в_ДТП`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Водилы_были_в_ДТП` ()  SELECT `Водители`.`Фамилия`, `Водители`.`Имя`, `Водители`.`Отчество`
FROM `Водители` INNER JOIN `ДТП` ON `Водители`.`ID_водителя` = `ДТП`.`ID_водителя`$$

DROP PROCEDURE IF EXISTS `Водители_в_ДТП_колво`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Водители_в_ДТП_колво` ()  SELECT `Водители`.`Фамилия`, `Водители`.`Имя`, `Водители`.`Отчество`, Count(`ДТП`.`ID_дтп`) AS `ДТП`
FROM `Водители` INNER JOIN `ДТП` ON `Водители`.`ID_водителя` = `ДТП`.`ID_водителя`
GROUP BY `Водители`.`Фамилия`, `Водители`.`Имя`, `Водители`.`Отчество`$$

DROP PROCEDURE IF EXISTS `Водители_со_своим_авто`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Водители_со_своим_авто` ()  SELECT `Водители`.`Фамилия`, `Водители`.`Имя`, `Водители`.`Отчество`, `Марка`.`Марка`
FROM (`Водители` INNER JOIN (`Владельцы_авто` INNER JOIN `Авто` ON `Владельцы_авто`.`ID_авто` = `Авто`.`ID_авто`) ON `Водители`.`Номер_вод_уд` = `Владельцы_авто`.`Номер_вод_уд`) INNER JOIN `Марка` ON `Авто`.`ID_марки` = `Марка`.`ID_марки`$$

DROP PROCEDURE IF EXISTS `добавить_следователя`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `добавить_следователя` (IN `имя` VARCHAR(20), IN `фамилия` VARCHAR(20), IN `отчество` VARCHAR(20))  INSERT INTO `следователи` VALUES (NULL,фамилия, имя, отчество)$$

DROP PROCEDURE IF EXISTS `ДТП_с_пострадавшими`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ДТП_с_пострадавшими` ()  SELECT `Водители`.`Фамилия`, `Водители`.`Имя`, `Водители`.`Отчество`, `Марка`.`Марка`, `ДТП`.`Место`, `ДТП`.`Пострадало, чел`, `ДТП`.`Погибло, чел`
FROM (`ДТП` INNER JOIN `Водители` ON `ДТП`.`ID_водителя` = `Водители`.`ID_водителя`) INNER JOIN (`Марка` INNER JOIN `Авто` ON `Марка`.`ID_марки` = `Авто`.`ID_марки`) ON `ДТП`.`ID_участников` = `Авто`.`ID_авто`
WHERE (((`ДТП`.`Погибло, чел`+`ДТП`.`Пострадало, чел`)<>0))
GROUP BY `Водители`.`Фамилия`, `Водители`.`Имя`, `Водители`.`Отчество`, `Марка`.`Марка`, `ДТП`.`Место`, `ДТП`.`Пострадало, чел`, `ДТП`.`Погибло, чел`$$

DROP PROCEDURE IF EXISTS `обновить_категорию`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `обновить_категорию` (IN `id_водителя` INT, IN `id_категории` INT)  UPDATE `водители` SET `водители`.`ID_категории`=id_категории WHERE `водители`.`ID_водителя`=id_водителя$$

DROP PROCEDURE IF EXISTS `обновить_цвет_авто`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `обновить_цвет_авто` (IN `id_авто` INT, IN `id_цвет` INT)  UPDATE `авто` set `авто`.`ID_цвета` = id_цвет WHERE `авто`.`ID_авто`=id_авто$$

DROP PROCEDURE IF EXISTS `Отчет_граф_категории_водителей`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Отчет_граф_категории_водителей` ()  SELECT `Категории`.`Категория`, Count(`Водители`.`ID_категории`) AS `Кол-во`
FROM `Категории` INNER JOIN `Водители` ON `Категории`.`ID_категории` = `Водители`.`ID_категории`
GROUP BY `Категории`.`Категория`$$

DROP PROCEDURE IF EXISTS `Отчет_сколько_пострадало_в_ДТП_за_опр_год`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Отчет_сколько_пострадало_в_ДТП_за_опр_год` ()  SELECT Year(`Дата`) AS `Год`, count(`Пострадало, чел`) as "пострадало" , COUNT(`Погибло, чел`) as "погибло"  FROM `дтп`  GROUP BY `Год` ORDER by `Год`$$

DROP PROCEDURE IF EXISTS `Отчет_учет_авто_за_опр_год`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Отчет_учет_авто_за_опр_год` ()  SELECT Year(`Авто`.`Дата_постановки_на_учет`) AS `Год`, Count(`Авто`.`ID_авто`) AS `Кол-во авто`
FROM `Авто`
GROUP BY Year(`Авто`.`Дата_постановки_на_учет`)$$

DROP PROCEDURE IF EXISTS `Сколько_авто_участ_в_ДТП`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Сколько_авто_участ_в_ДТП` ()  SELECT `Марка`.`Марка`, Count(`ДТП`.`ID_дтп`) AS `ДТП`
FROM (`Марка` INNER JOIN `Авто` ON `Марка`.`ID_марки` = `Авто`.`ID_марки`) INNER JOIN `ДТП` ON `Авто`.`ID_авто` = `ДТП`.`ID_участников`
GROUP BY `Марка`.`Марка`$$

DROP PROCEDURE IF EXISTS `Сколько_ДТП_в_тверской_области`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Сколько_ДТП_в_тверской_области` ()  SELECT `ДТП`.`Место`, Count(`ДТП`.`ID_дтп`) AS `ДТП`
FROM `ДТП`
GROUP BY `ДТП`.`Место`
HAVING (((InStr(`Место`,"Тверская область"))>0))$$

DROP PROCEDURE IF EXISTS `Сколько_ДТП_рассмотрел_следователь`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Сколько_ДТП_рассмотрел_следователь` ()  SELECT `Следователи`.`Фамилия`, `Следователи`.`Имя`, `Следователи`.`Отчество`, Count(`ДТП`.`ID_дтп`) AS `ДТП`
FROM `Следователи` INNER JOIN `ДТП` ON `Следователи`.`ID_следователя` = `ДТП`.`ID_лиц_проводившего_расслед`
GROUP BY `Следователи`.`Фамилия`, `Следователи`.`Имя`, `Следователи`.`Отчество`$$

DROP PROCEDURE IF EXISTS `Стаж_водителей`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Стаж_водителей` ()  SELECT `Водители`.`Фамилия`, `Водители`.`Имя`, `Водители`.`Отчество`, `Водители`.`Дата_выдачи_уд`, Year(Now())-Year(`Водители`.`Дата_выдачи_уд`) AS `Лет`
FROM `Водители`
GROUP BY `Водители`.`Фамилия`, `Водители`.`Имя`, `Водители`.`Отчество`, `Водители`.`Дата_выдачи_уд`$$

DROP PROCEDURE IF EXISTS `удалить_следователя`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `удалить_следователя` (IN `id` INT)  MODIFIES SQL DATA
DELETE FROM `следователи` WHERE `ID_следователя`=id$$

DROP PROCEDURE IF EXISTS `Учет_авто_до_2000г`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Учет_авто_до_2000г` ()  SELECT `Марка`.`Марка`, `Цвет авто`.`Цвет`, `Авто`.`Дата_постановки_на_учет`
FROM (`Авто` INNER JOIN `Марка` ON `Авто`.`ID_марки` = `Марка`.`ID_марки`) INNER JOIN `Цвет авто` ON `Авто`.`ID_цвета` = `Цвет авто`.`ID_цвета`
WHERE (((`Авто`.`Дата_постановки_на_учет`)<"2000-1-1"))$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `марка`
--

DROP TABLE IF EXISTS `марка`;
CREATE TABLE IF NOT EXISTS `марка` (
  `ID_марки` tinyint NOT NULL AUTO_INCREMENT,
  `Марка` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`ID_марки`),
  KEY `ID_марки` (`ID_марки`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `марка`
--

INSERT INTO `марка` (`ID_марки`, `Марка`) VALUES
(1, 'Chevrolet'),
(2, 'Chery'),
(3, 'Geely'),
(4, 'Ford'),
(5, 'Volvo'),
(6, 'Honda'),
(7, 'BMW'),
(8, 'Audi'),
(9, 'Mercedes-Benz');

-- --------------------------------------------------------

--
-- Структура таблицы `дтп`
--

DROP TABLE IF EXISTS `дтп`;
CREATE TABLE IF NOT EXISTS `дтп` (
  `ID_дтп` tinyint NOT NULL AUTO_INCREMENT,
  `Дата` date NOT NULL,
  `Место` varchar(57) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ID_водителя` tinyint NOT NULL,
  `ID_участников` tinyint NOT NULL,
  `Пострадало, чел` tinyint NOT NULL,
  `Погибло, чел` tinyint NOT NULL,
  `Описание` varchar(109) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ID_лиц_проводившего_расслед` tinyint NOT NULL,
  PRIMARY KEY (`ID_дтп`),
  KEY `ID_водителя` (`ID_водителя`,`ID_участников`,`ID_лиц_проводившего_расслед`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `дтп`
--

INSERT INTO `дтп` (`ID_дтп`, `Дата`, `Место`, `ID_водителя`, `ID_участников`, `Пострадало, чел`, `Погибло, чел`, `Описание`, `ID_лиц_проводившего_расслед`) VALUES
(1, '2021-08-06', 'Тверская область, город Щёлково, спуск Домодедовская, 47', 3, 3, 5, 2, 'Водитель Audi выехал на встречную полосу и протаранил несколько автомобилей', 1),
(2, '2021-09-24', 'Оренбургская область, город Лотошино, пер. Ломоносова, 25', 5, 5, 3, 0, 'Водитель BMW совершил несколько опасных обгонов и в итоге задел грузовик', 2),
(3, '2019-05-15', 'Курская область, город Кашира, въезд Ленина, 44', 20, 12, 1, 3, 'Автомобиль на скорости 200 кмч сбил пешеходов на красный свет светофора после чего врезался в столб', 3),
(4, '2021-08-09', 'Тверская область, город Раменское, ул. Ломоносова, 12', 18, 7, 1, 0, 'У машины отказали тормоза в следствие чего автомобиль не мог совершить остановку и въехал в другой автомобиль', 4),
(5, '2020-01-18', 'Тверская область, город Кашира, пр. Ломоносова, 93', 19, 11, 0, 0, 'Автомобиль выезжая с парковки задел движущийся автомобиль', 5),
(6, '2022-03-27', 'Нижегородская область, город Наро-Фоминск, пр. Чехова, 30', 9, 9, 2, 0, 'Водитель не смог удержать управление на скользкой дороге и врезался в отбойник', 3),
(7, '2022-02-03', 'Челябинская область, город Воскресенск, пл. Ленина, 13', 20, 14, 0, 0, 'У автомобиля загорелся двигатель после того как в него врезался Мерседес', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `категории`
--

DROP TABLE IF EXISTS `категории`;
CREATE TABLE IF NOT EXISTS `категории` (
  `ID_категории` tinyint NOT NULL AUTO_INCREMENT,
  `Категория` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID_категории`),
  KEY `ID_категории` (`ID_категории`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `категории`
--

INSERT INTO `категории` (`ID_категории`, `Категория`) VALUES
(1, 'B'),
(2, 'B1'),
(3, 'BE'),
(4, 'C'),
(5, 'C1');

-- --------------------------------------------------------

--
-- Структура таблицы `авто`
--

DROP TABLE IF EXISTS `авто`;
CREATE TABLE IF NOT EXISTS `авто` (
  `ID_авто` tinyint NOT NULL AUTO_INCREMENT,
  `ID_марки` tinyint DEFAULT NULL,
  `ID_цвета` tinyint DEFAULT NULL,
  `Номер_гос_рег` varchar(8) DEFAULT NULL,
  `Номер_двигателя` varchar(5) DEFAULT NULL,
  `Номер_кузова` mediumint DEFAULT NULL,
  `Номер_шасси` mediumint DEFAULT NULL,
  `Номер_тех_талона` varchar(11) DEFAULT NULL,
  `Дата_выдачи_тех_талона` date DEFAULT NULL,
  `Дата_постановки_на_учет` date DEFAULT NULL,
  PRIMARY KEY (`ID_авто`),
  KEY `ID_авто` (`ID_авто`,`ID_марки`,`ID_цвета`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `авто`
--

INSERT INTO `авто` (`ID_авто`, `ID_марки`, `ID_цвета`, `Номер_гос_рег`, `Номер_двигателя`, `Номер_кузова`, `Номер_шасси`, `Номер_тех_талона`, `Дата_выдачи_тех_талона`, `Дата_постановки_на_учет`) VALUES
(1, 4, 1, 'Р301КА67', 'BZ7LB', 565039, 582421, '2736 690603', '2016-01-16', '1997-04-23'),
(2, 4, 3, 'М534ОЕ57', 'VE7SN', 33928, 274029, '6574 800145', '2013-03-18', '1995-08-11'),
(3, 8, 2, 'Р951НО91', 'YM7SD', 62869, 466450, '6163 222746', '2015-08-04', '2008-05-03'),
(4, 6, 4, 'У664КР67', 'RT2VE', 695358, 802748, '4632 128761', '2018-09-13', '2021-03-01'),
(5, 7, 6, 'Х926СО46', 'HK7MX', 397476, 423441, '8239 529686', '2019-04-03', '1987-03-28'),
(6, 5, 4, 'О756ЕС31', 'ZE8VE', 171378, 443079, '8907 555117', '2019-08-24', '2020-03-28'),
(7, 1, 1, 'Е595ТР08', 'DB4PK', 397482, 848183, '4674 690548', '2008-06-05', '2013-08-08'),
(8, 5, 3, 'М741РК12', 'DW2EU', 223864, 493948, '4930 368784', '2018-06-01', '2010-05-11'),
(9, 2, 1, 'К285ХН01', 'ZG3DG', 107152, 431744, '3366 698457', '2019-09-25', '2010-01-07'),
(10, 3, 2, 'Х154ТТ88', 'YP0UX', 28611, 758801, '4446 547085', '2017-04-26', '2016-05-12'),
(11, 9, 6, 'Р209СХ25', 'XL7VW', 29485, 732135, '2134 897984', '2017-09-21', '2018-09-12'),
(12, 9, 4, 'У166ХК14', 'UT1KP', 271545, 243724, '8457 849409', '2019-04-22', '2016-03-13'),
(13, 1, 1, 'Т717УЕ42', 'XM1LE', 563914, 124493, '3898 476554', '2019-08-28', '2012-09-08'),
(14, 2, 5, 'Н906МУ24', 'XJ2PJ', 744401, 578507, '9697 836900', '2017-05-23', '2017-03-22'),
(15, 1, 4, 'А103МВ62', 'TV5AL', 66554, 495285, '9950 661705', '2013-07-26', '2006-05-12');

--
-- Триггеры `авто`
--
DROP TRIGGER IF EXISTS `обновить_цвет_авто`;
DELIMITER $$
CREATE TRIGGER `обновить_цвет_авто` BEFORE UPDATE ON `авто` FOR EACH ROW IF new.`ID_цвета` < (SELECT MIN(`ID_цвета`) FROM `цвет авто`) OR new.`ID_цвета` > (SELECT MAX(`ID_цвета`) FROM `цвет авто`)
THEN 
	set new.`ID_цвета` = old.`ID_цвета`;
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `владельцы_авто`
--

DROP TABLE IF EXISTS `владельцы_авто`;
CREATE TABLE IF NOT EXISTS `владельцы_авто` (
  `ID_владельца` int NOT NULL AUTO_INCREMENT,
  `ID_авто` int NOT NULL,
  `Фамилия` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Имя` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Отчество` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Номер_вод_уд` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Дата_регистрации_транспорта` date NOT NULL,
  PRIMARY KEY (`ID_владельца`),
  KEY `ID_авто` (`ID_авто`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `владельцы_авто`
--

INSERT INTO `владельцы_авто` (`ID_владельца`, `ID_авто`, `Фамилия`, `Имя`, `Отчество`, `Номер_вод_уд`, `Дата_регистрации_транспорта`) VALUES
(1, 1, 'Бирюков', 'Даниил', 'Артёмович', '491374146643', '1997-04-23'),
(2, 2, 'Смирнова', 'Александра', 'Александровна', '753654383887', '1995-08-11'),
(3, 3, 'Орехов', 'Даниил', 'Егорович', '453574456545', '2008-05-03'),
(4, 4, 'Литвинов', 'Дмитрий', 'Львович', '543427574275', '2021-03-01'),
(5, 5, 'Рыбаков', 'Арсений', 'Захарович', '274527583275', '1987-03-28'),
(6, 6, 'Карпова', 'Аиша', 'Александровна', '458787454524', '2020-03-28'),
(7, 7, 'Калмыкова', 'Полина', 'Марковна', '464137953465', '2013-08-08'),
(8, 8, 'Шевцов', 'Иван', 'Олегович', '134679528461', '2010-05-11'),
(9, 9, 'Губанова', 'Полина', 'Ивановна', '794364464919', '2010-01-07'),
(10, 10, 'Гуляева', 'Ева', 'Егоровна', '357685474768', '2014-06-23'),
(11, 11, 'Громов', 'Иван', 'Львович', '', '2012-12-22'),
(12, 12, 'Федотова', 'Анна', 'Леоновна', '', '2012-12-22'),
(13, 13, 'Безруков', 'Тимофей', 'Артёмович', '', '2018-10-15'),
(14, 14, 'Воробьев', 'Родион', 'Степанович', '', '2013-04-28'),
(15, 15, 'Маслов', 'Александр', 'Фёдорович', '', '1999-10-25');

-- --------------------------------------------------------

--
-- Структура таблицы `водители`
--

DROP TABLE IF EXISTS `водители`;
CREATE TABLE IF NOT EXISTS `водители` (
  `ID_водителя` tinyint NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(10) DEFAULT NULL,
  `Имя` varchar(10) DEFAULT NULL,
  `Отчество` varchar(13) DEFAULT NULL,
  `Адрес` varchar(63) DEFAULT NULL,
  `Номер_вод_уд` bigint DEFAULT NULL,
  `Дата_выдачи_уд` date DEFAULT NULL,
  `ID_категории` tinyint DEFAULT NULL,
  `Дата_регистрации` date DEFAULT NULL,
  PRIMARY KEY (`ID_водителя`),
  KEY `ID_водителя` (`ID_водителя`,`ID_категории`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `водители`
--

INSERT INTO `водители` (`ID_водителя`, `Фамилия`, `Имя`, `Отчество`, `Адрес`, `Номер_вод_уд`, `Дата_выдачи_уд`, `ID_категории`, `Дата_регистрации`) VALUES
(1, 'Бирюков', 'Даниил', 'Артёмович', 'Калининградская область, город Щёлково, пл. Космонавтов, 85', 491374146643, '1996-06-26', 5, '1997-04-23'),
(2, 'Смирнова', 'Александра', 'Александровна', 'Курская область, город Можайск, въезд Будапештсткая, 93', 753654383887, '1986-05-12', 1, '1995-08-11'),
(3, 'Орехов', 'Даниил', 'Егорович', 'Архангельская область, город Одинцово, бульвар Бухарестская, 23', 453574456545, '2005-07-08', 4, '2008-05-03'),
(4, 'Литвинов', 'Дмитрий', 'Львович', 'Московская область, город Коломна, пр. Ломоносова, 97', 543427574275, '2020-09-19', 4, '2021-03-01'),
(5, 'Рыбаков', 'Арсений', 'Захарович', 'Брянская область, город Шаховская, бульвар Бухарестская, 25', 274527583275, '2021-10-16', 1, '1987-03-28'),
(6, 'Карпова', 'Аиша', 'Александровна', 'Курская область, город Талдом, шоссе Домодедовская, 92', 458787454524, '2019-09-08', 1, '2020-03-28'),
(7, 'Калмыкова', 'Полина', 'Марковна', 'Омская область, город Наро-Фоминск, въезд Балканская, 59', 464137953465, '1999-07-06', 1, '2013-08-08'),
(8, 'Шевцов', 'Иван', 'Олегович', 'Саратовская область, город Озёры, пер. Ленина, 46', 134679528461, '2005-01-30', 3, '2010-05-11'),
(9, 'Губанова', 'Полина', 'Ивановна', 'Тюменская область, город Волоколамск, пл. Гоголя, 04', 794364464919, '2009-12-31', 1, '2010-01-07'),
(10, 'Гуляева', 'Ева', 'Егоровна', 'Московская область, город Павловский Посад, бульвар Косиора, 77', 357685474768, '2013-06-09', 3, '2014-06-23'),
(16, 'Сотникова', 'Вероника', 'Матвеевна', 'Самарская область, город Истра, бульвар Косиора, 38', 564536456885, '2021-05-18', 1, '2012-12-22'),
(17, 'Калашников', 'Михаил', 'Александрович', 'Амурская область, город Клин, въезд Чехова, 98', 557465675645, '2022-02-15', 2, '2012-12-22'),
(18, 'Черкасова', 'Валерия', 'Ярославовна', 'Кемеровская область, город Зарайск, спуск Космонавтов, 60', 390789384603, '2021-12-01', 2, '2018-10-15'),
(19, 'Маркова', 'Стефания', 'Михайловна', 'Московская область, город Наро-Фоминск, наб. Гоголя, 92', 894564586327, '2000-04-27', 1, '2013-04-28'),
(20, 'Авдеева', 'Милана', 'Всеволодовна', 'Тульская область, город Егорьевск, пер. Ломоносова, 96', 634564567634, '1991-08-21', 4, '1999-10-25');

--
-- Триггеры `водители`
--
DROP TRIGGER IF EXISTS `обновить_категорию`;
DELIMITER $$
CREATE TRIGGER `обновить_категорию` BEFORE UPDATE ON `водители` FOR EACH ROW IF new.`ID_категории` < (SELECT MIN(`ID_категории`) FROM `категории`) OR new.`ID_категории` > (SELECT MAX(`ID_категории`) FROM `категории`)
THEN 
	set new.`ID_категории` = old.`ID_категории`;
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `следователи`
--

DROP TABLE IF EXISTS `следователи`;
CREATE TABLE IF NOT EXISTS `следователи` (
  `ID_следователя` tinyint NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(11) DEFAULT NULL,
  `Имя` varchar(9) DEFAULT NULL,
  `Отчество` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_следователя`),
  KEY `ID_следователя` (`ID_следователя`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `следователи`
--

INSERT INTO `следователи` (`ID_следователя`, `Фамилия`, `Имя`, `Отчество`) VALUES
(1, 'Баранов', 'Иван', 'Кириллович'),
(2, 'Гаврилова', 'Анастасия', 'Алексеевна'),
(3, 'Кожевникова', 'Ева', 'Юрьевна'),
(4, 'Бычков', 'Михаил', 'Данилович'),
(5, 'Коршунова', 'Анна', 'Артемовна'),
(13, 'Какой', 'Топар', 'Чел');

-- --------------------------------------------------------

--
-- Структура таблицы `цвет авто`
--

DROP TABLE IF EXISTS `цвет авто`;
CREATE TABLE IF NOT EXISTS `цвет авто` (
  `ID_цвета` tinyint NOT NULL AUTO_INCREMENT,
  `Цвет` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID_цвета`),
  KEY `ID_цвета` (`ID_цвета`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `цвет авто`
--

INSERT INTO `цвет авто` (`ID_цвета`, `Цвет`) VALUES
(1, 'Чёрный'),
(2, 'Белый'),
(3, 'Синий'),
(4, 'Красный'),
(5, 'Оливковый'),
(6, 'Оранжевый');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
