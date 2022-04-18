-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 18 2022 г., 18:03
-- Версия сервера: 8.0.27
-- Версия PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dtp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `смена_цвета_машины`
--

DROP TABLE IF EXISTS `смена_цвета_машины`;
CREATE TABLE IF NOT EXISTS `смена_цвета_машины` (
  `id_авто` int NOT NULL,
  `Дата_до` datetime NOT NULL,
  `Дата_после` datetime NOT NULL,
  `Старое_значение` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `Новое_значение` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `смена_цвета_машины`
--

INSERT INTO `смена_цвета_машины` (`id_авто`, `Дата_до`, `Дата_после`, `Старое_значение`, `Новое_значение`) VALUES
(2, '1995-08-11 00:00:00', '2022-04-18 20:54:33', 'Красный', 'Синий'),
(2, '2022-04-18 20:54:33', '2022-04-18 21:00:28', 'Синий', 'Оливковый');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
