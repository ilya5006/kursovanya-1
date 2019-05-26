-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 26 2019 г., 21:30
-- Версия сервера: 8.0.12
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kursovanya-1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cloth`
--

CREATE TABLE `cloth` (
  `article` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `color` varchar(25) NOT NULL,
  `picture` text NOT NULL,
  `image` text NOT NULL,
  `composition` varchar(30) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cloth`
--

INSERT INTO `cloth` (`article`, `name`, `color`, `picture`, `image`, `composition`, `width`, `length`, `price`) VALUES
('tkan_1', 'Хорошая ткань', 'Чёрный', 'URL', 'https://www.decor-doma.ru/wa-data/public/shop/products/58/40/14058/images/11470/11470.970.jpg', 'Водородные смеси', 123, 321, 10000000),
('tkan_2', 'Ещё одна ткань', 'Красный', 'URL', 'https://moychay.ru/system/product_fotos/images/000/400/132/original/_MG_1078_%D0%BA%D0%BE%D0%BF%D0%B8%D1%8F.jpg?1492860734', 'Хорошо', 424, 1234, 435);

-- --------------------------------------------------------

--
-- Структура таблицы `cloth_product`
--

CREATE TABLE `cloth_product` (
  `article_cloth` varchar(25) NOT NULL,
  `article_product` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cloth_product`
--

INSERT INTO `cloth_product` (`article_cloth`, `article_product`) VALUES
('tkan_1', '1'),
('tkan_2', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `furniture`
--

CREATE TABLE `furniture` (
  `article` varchar(25) NOT NULL,
  `name` varchar(30) NOT NULL,
  `type` varchar(25) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `image` text NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `furniture`
--

INSERT INTO `furniture` (`article`, `name`, `type`, `width`, `length`, `weight`, `image`, `price`) VALUES
('4', 'Шуруп', 'ШурупЫ', 1234, 413, 124123, 'https://st0.isolux.ru/media/catalog/product/cache/1/image/602f0fa2c1f0d1ba5e241f914e856ff9/_/x/_xtn_1_1.jpg?kar=1&kf=1&kt=1&co=1&rgb%5B0%5D=255&rgb%5B1%5D=255&rgb%5B2%5D=255&ang=ang&qua=90', 14213);

-- --------------------------------------------------------

--
-- Структура таблицы `furniture_product`
--

CREATE TABLE `furniture_product` (
  `article_furniture` varchar(25) NOT NULL,
  `article_product` varchar(25) NOT NULL,
  `placement` varchar(25) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `rotate` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `furniture_product`
--

INSERT INTO `furniture_product` (`article_furniture`, `article_product`, `placement`, `width`, `length`, `rotate`, `count`) VALUES
('4', '1', 'ул. Строителей, д.Саша', 424, 23213, 24, 12521);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `number` int(11) NOT NULL,
  `date` date NOT NULL,
  `stage` varchar(25) NOT NULL,
  `customer` varchar(25) NOT NULL,
  `manager` varchar(25) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`number`, `date`, `stage`, `customer`, `manager`, `price`) VALUES
(4242, '2019-05-09', 'Подготавливается', 'zakazchik', 'manager', 15151);

-- --------------------------------------------------------

--
-- Структура таблицы `orders_product`
--

CREATE TABLE `orders_product` (
  `article` varchar(25) NOT NULL,
  `number_order` int(11) NOT NULL,
  `counts_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders_product`
--

INSERT INTO `orders_product` (`article`, `number_order`, `counts_product`) VALUES
('1', 4242, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `article` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `image` text,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`article`, `name`, `width`, `length`, `image`, `comment`) VALUES
('1', 'Диван', 424, 52154, 'https://cdn.mebelvia.ru/upload/resize_cache/iblock/9eb/750_563_1/divan_vernon_1.jpg?1516957203140118', 'Хороший диван, очень большой, прям очень\r\nЯ бы сказал, что это лучший диван, который существует на этом свете.');

-- --------------------------------------------------------

--
-- Структура таблицы `storage_cloth`
--

CREATE TABLE `storage_cloth` (
  `roll` int(11) NOT NULL,
  `article_cloth` varchar(25) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `storage_cloth`
--

INSERT INTO `storage_cloth` (`roll`, `article_cloth`, `width`, `length`) VALUES
(1, 'tkan_1', 44, 22),
(3, 'tkan_2', 4324, 6353);

-- --------------------------------------------------------

--
-- Структура таблицы `storage_furniture`
--

CREATE TABLE `storage_furniture` (
  `party` int(11) NOT NULL,
  `article_furniture` varchar(25) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `storage_furniture`
--

INSERT INTO `storage_furniture` (`party`, `article_furniture`, `count`) VALUES
(1, '4', 50);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `login` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL,
  `name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`login`, `password`, `role`, `name`) VALUES
('director', '123', 'Директор', 'Директор'),
('kladman', '123', 'Кладовщик', 'кладмен'),
('manager', '123', 'Менеджер', 'Манагер'),
('zakazchik', '123', 'Заказчик', 'заказчек');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cloth`
--
ALTER TABLE `cloth`
  ADD PRIMARY KEY (`article`);

--
-- Индексы таблицы `cloth_product`
--
ALTER TABLE `cloth_product`
  ADD PRIMARY KEY (`article_cloth`,`article_product`),
  ADD KEY `article_cloth` (`article_cloth`),
  ADD KEY `article_product` (`article_product`);

--
-- Индексы таблицы `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`article`);

--
-- Индексы таблицы `furniture_product`
--
ALTER TABLE `furniture_product`
  ADD PRIMARY KEY (`article_furniture`,`article_product`),
  ADD KEY `article_furniture` (`article_furniture`),
  ADD KEY `article_product` (`article_product`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`number`,`date`),
  ADD KEY `manager` (`manager`),
  ADD KEY `customer` (`customer`);

--
-- Индексы таблицы `orders_product`
--
ALTER TABLE `orders_product`
  ADD PRIMARY KEY (`article`,`number_order`),
  ADD KEY `article` (`article`),
  ADD KEY `number_order` (`number_order`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`article`);

--
-- Индексы таблицы `storage_cloth`
--
ALTER TABLE `storage_cloth`
  ADD PRIMARY KEY (`roll`,`article_cloth`),
  ADD KEY `article_cloth` (`article_cloth`);

--
-- Индексы таблицы `storage_furniture`
--
ALTER TABLE `storage_furniture`
  ADD PRIMARY KEY (`party`,`article_furniture`),
  ADD KEY `article_furniture` (`article_furniture`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`login`,`password`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cloth_product`
--
ALTER TABLE `cloth_product`
  ADD CONSTRAINT `cloth_product_ibfk_1` FOREIGN KEY (`article_cloth`) REFERENCES `cloth` (`article`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cloth_product_ibfk_2` FOREIGN KEY (`article_product`) REFERENCES `products` (`article`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `furniture_product`
--
ALTER TABLE `furniture_product`
  ADD CONSTRAINT `furniture_product_ibfk_1` FOREIGN KEY (`article_furniture`) REFERENCES `furniture` (`article`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `furniture_product_ibfk_2` FOREIGN KEY (`article_product`) REFERENCES `products` (`article`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `user` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `user` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders_product`
--
ALTER TABLE `orders_product`
  ADD CONSTRAINT `orders_product_ibfk_1` FOREIGN KEY (`number_order`) REFERENCES `orders` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_product_ibfk_2` FOREIGN KEY (`article`) REFERENCES `products` (`article`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `storage_cloth`
--
ALTER TABLE `storage_cloth`
  ADD CONSTRAINT `storage_cloth_ibfk_1` FOREIGN KEY (`article_cloth`) REFERENCES `cloth` (`article`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `storage_furniture`
--
ALTER TABLE `storage_furniture`
  ADD CONSTRAINT `storage_furniture_ibfk_1` FOREIGN KEY (`article_furniture`) REFERENCES `furniture` (`article`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
