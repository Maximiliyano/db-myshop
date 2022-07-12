-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Лип 12 2022 р., 16:51
-- Версія сервера: 8.0.24
-- Версія PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `myshop`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(33) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Description` varchar(64) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal');

-- --------------------------------------------------------

--
-- Структура таблиці `products`
--

CREATE TABLE `products` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(33) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `SupplierId` int NOT NULL,
  `CategoryID` int NOT NULL,
  `Price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `SupplierId`, `CategoryID`, `Price`) VALUES
(1, 'Chais', 1, 1, 18),
(2, 'Chang', 1, 1, 19),
(3, 'Aniseed Syrup', 1, 2, 10),
(4, 'Chef Anton\'s Cajun Seasoning', 2, 2, 22),
(5, 'Chef Anton\'s Gumbo Mix', 2, 2, 21.35),
(6, 'Green tea', 6, 1, 10);

-- --------------------------------------------------------

--
-- Структура таблиці `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(64) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `City` varchar(33) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `Country` varchar(33) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `SupplierName`, `City`, `Country`) VALUES
(1, 'Exotic Liquid', 'London', 'UK'),
(2, 'New Orleans Cajun Delights', 'New Orleans', 'USA'),
(3, 'Grandma Kelly\'s Homestead', 'Ann Arbor', 'USA'),
(4, 'Tokyo Traders', 'Tokyo', 'Japan'),
(5, 'Cooperative de Quesos \'Las Cabras\'', 'Oviedo', 'Spain'),
(6, 'Norske Meierier', 'Lviv', 'Ukraine');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Індекси таблиці `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Індекси таблиці `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
