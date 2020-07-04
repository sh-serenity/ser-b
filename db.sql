-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: bydlo
-- ------------------------------------------------------
-- Server version	5.7.26-1+b1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_bin NOT NULL,
  `postid` int(64) NOT NULL,
  `owner` int(64) NOT NULL,
  `comtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (11,'<p>Ты обещал поправки добавить.</p>\n',39,21,'2020-03-30 14:19:33');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashes`
--

DROP TABLE IF EXISTS `hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashes` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `hash` varchar(256) COLLATE utf8_bin NOT NULL,
  `email` varchar(256) COLLATE utf8_bin NOT NULL,
  `password` varchar(1024) COLLATE utf8_bin NOT NULL,
  `fname` varchar(127) COLLATE utf8_bin NOT NULL,
  `sname` varchar(127) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashes`
--

LOCK TABLES `hashes` WRITE;
/*!40000 ALTER TABLE `hashes` DISABLE KEYS */;
INSERT INTO `hashes` VALUES (3,'qrpcdQ8lsygxfPB7-qxeRFtYrQNm-nX3JZianKJ9WveMoVpadJ3Rqt8U6iE_vnMSx0SeQybYwu1R9mAzDrLrXg==','int@tinedel','c65d534786406137a74a0baba5396618','Alexandr','Bobrov'),(9,'x2NhGJGwvyw4UR5cJX6z9UsH8pd5yWVDBwtfSOvqsPV6H4NUO_M0jTkEs3jBqpzNGurX9tG6Dsc_L8ND6cSKJQ==','rsinitsyn@gmail.com','e5e492e373436604c65796b1e4a1e6aa','Rustem','Sinitsyn'),(10,'yon8A7ByHTaKPTmw9iHqJAAbCYbadbEYL3fv0HF2tC-16cgCzjo8qDASJVXzIaFvAXK2HE9luNA3QciWNT9tcQ==','rsinitsyn@gmail.com','e5e492e373436604c65796b1e4a1e6aa','Rustem','Sinitsyn'),(11,'1hrTKw7Oaqem5xA-jpn4w-CPx8FbesD-W8oEC2ti-hYyIHsxA7JPUBRIg8zPJJJXgYbvnExb5o2_E5hwt99maQ==','rsinitsyn@gmail.com','e5e492e373436604c65796b1e4a1e6aa','Rustem','Sinitsyn'),(12,'f2GPaJjrbDpEa8JXGjYO1HmspWjvTlyCg4bWxzzgH54UV-AYemAR7p1mLhCy0bZLyyBGU6iIjKlrgmVZYAfUFg==','rsinitsyn@gmail.com','e5e492e373436604c65796b1e4a1e6aa','Rustem','Sinitsyn'),(23,'vLM8PzQT5B7FBVN8065Hh1B09w5Yp9ae1PzGqRdijo2EcIwVEIoGQL4IlkJmxpOx-kPM6mKIIxDd1z2bSkQvvQ==','rsinitsyn@gmail.com','e5e492e373436604c65796b1e4a1e6aa','Rustem','Sinitsyn'),(34,'dRCPmJWmS3WliCdAe7AXesmgfYpIAS7-728gnvc31ey3UvyaDa3pQ60yYCXuCkFrsWxxDXZY9HTTFwdnvEX3-Q==','arturpir.90@mail.ru','c576a67a12f7854e0da23681f4fb12b6','Денис','Лат');
/*!40000 ALTER TABLE `hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `invite` varchar(1024) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lposts`
--

DROP TABLE IF EXISTS `lposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lposts` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `owner` int(64) NOT NULL,
  `rcp` int(64) NOT NULL,
  `post` text COLLATE utf8_bin NOT NULL,
  `posttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lposts`
--

LOCK TABLES `lposts` WRITE;
/*!40000 ALTER TABLE `lposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `lposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `owner` int(64) NOT NULL,
  `subj` varchar(512) COLLATE utf8_bin NOT NULL,
  `post` text COLLATE utf8_bin NOT NULL,
  `posttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (36,18,'','<p>Ну собственно говоря, кто как убивает время, у кого какие хобби. У меня был период застоя, на пару тройку лет так что в новый 20 год я вошел с твердым намерением наверстать упущенное.</p>\n\n<p>Я вяло начал учить эти докеры кубернейтсы, облака, потом немного разогнался, благо ресурсы были. Потом решил ненмного повеселится и с месяцов потратил на веселое развлечение ловление сегфолтов под голым си. :)))))</p>\n\n<p>Потом все же одумался, и решил хоть какую-то веб-апликуху написать. Ковырялся, несколько недель, в результате которых си, сиплюсы, пхп, питон, руби, нодеджс, были посланны в сторону, а выйграл golang. Ну, непривычно немного, штука не без недостатков, но они преимущества перевешивают. Вот собсно и первое подобие апликухи.</p>\n','2020-03-29 14:31:11'),(37,19,'','<p>Кому что, я коньяк пью, и в контру играю. :)))))))))</p>\n','2020-03-29 17:37:38'),(40,18,'','<p>Сети, фаерволы, нетфильтры, и прочая лабыда для любого сунувшвшего сюда нос.</p>\n\n<p>По академической схеме, я щас должен вас грузить мощным потоком грузилова, вроде модели OSI, и прочей лабуды, но я не буду этого делать. Сколько не извьясняйся хитрыми словами, все равно до мозга не дойдет. Обычному начинаещему обывателю достаточно знать, что какое Ethernet, и TCP/IP.</p>\n\n<p>Начнем с Ethernet. Все что вы, как начинающий админ должный должны знать об эзеренет что он работат на двух првых уровнях модели OSI. А попросту говоря, первый уровень, это веревка, которая соединяет тачку с другой тачкой, свичом, роутерем, с любой железякой. Это может быть витая пара, оптоволокно, в случаен с вайфаем вообще радиоволны. А второй уровень реальзиован уже на уровне железяк, которые пришедшие эзернет пакеты обрабатывают. Меня попросили не углублятся дальше, скажу только что адрес вынглядит вот так примерно 00:1D:60:2E:ED:A5, то бишь 6 чисел в от 0 – до 255 в шестнадцатиричноной системе написания, разделенными двоеточеиями. Называется mac адресом.</p>\n\n<p>На уровне линукса разруливается так, ядро в завсисмости от настроек выбирает в какую дырку, и какому адресу его слать в зависимости от таблицы маршрутизации arp. На примитивном уровне увидел mac, на который нажно послеть пакет с соответсвующим IP адресом – высал. Опять же таки, это самый простой случай.</p>\n\n<p>Следующим уровнем, я уж и не знаю, и не помню, к какому протоколу из уровней модели OSI он причяслется, идет протокол IP. Казалось бы, зачем плодить сущности, че нам одно адреса мало? Да енапхаем в него в цифер побольше, на весь мир хватит. Но во-первых кроме эзернетаЮ существуют и другие протоколы, на нем свет клином не сошелся, существуют и другие.</p>\n\n<p>Опять же таки, ради упрощения мы щас не будем затрагивать Ipv6, новый протокол, щас пока еще вполне жив IPv4, ничто не вечено в этой жизни но пока жив. Для IPv6 принципе теже, но цыири побольше.</p>\n\n<pre><code>   \\\n</code></pre>\n\n<p>Итак, стандарный IP адрес и маршрутизация для него происходит учитыйвая его собстевенный адрес и маску подсети. Если вы когда-нибудь настраивали сеть в школе, или рубились с кем-то в игрушки, то наверняка слышали что-то вроде 192.168.0.0/24 Или чего-нибудь еще с десятки начинающщегося.</p>\n\n<p>Вот, стандартнгая сеть 192.0.0.0/24 Что значит 24? Это значит что за адреси сети в этой сетке будет отвечать 24 первых бита, а оставшиеся 8 за номер контретного устройста в ней. Вот так</p>\n\n<p>192.168.0.0\n11000000.10101000.00000000.00000000</p>\n\n<p>255.255.255.0 = 24\n11111111.11111111.11111111.00000000</p>\n\n<p>Соответственно, 8 свободных битов под для устройства в сети – это 256 адресов, заковыка в том, что первый адрес будет обозначать саму четь, то бишь 192.0.0.0\nвторой как правило берут как номер шлюза (если не приходится взять что-то другое, или у вас фантазии много) И кстати, будете покупать роутер в хату, никогда не прибивайте никогда сетке этот адрес. Хотя бы 192.168.1.0/24.</p>\n\n<p>Если в поняли принцип, то поймете, что в сети /23 айпишек будет в два раза больше, то бишь 512, а в 23, в два раза меньше – 128. Имные дяди умеют считать это все в уме, а деже те кто обленился вроде меня пользуются вот такими средствами. <a href=\"https://www.opennet.ru/ipcalc.shtml\" rel=\"nofollow\">https://www.opennet.ru/ipcalc.shtml</a>.</p>\n\n<p>Так, зачем нам это все надо. Сети использьются маршрутизации, иначе бы не ваш девайс не был бы способен увидеть девайс на другом стороне планеты, ни он вас. В сети назначается дефолтны щлюз, через которые все пакеты отправлются через ваш вашу эзернут карту, роутер, роутеру у вашего провайдера, который отправляент его в длительное путешествие по проторенным маршрутам, ближайшим путем к адресу, к кторому он обращен. Про Ethernet там дальше когда он вышел из нашей сети к провайдру можно забыть. Но не пока он еще у нас. :)</p>\n\n<p>Если вы краем глаза что-то слышали про ТСP/IP. mо возможно слышали, что там так же живет UDP. А вообще не только оно, там еще сидит служебный протокол ICMP. Тут я должен добавить, что самому IP глубоко фиолетово, если это входит в его стандартный набор протоколов, он просто доставит его по адресу, а tcp, udp ли это - ему плевать.</p>\n\n<p>Так я перечитал, и понял что тут нужно заметить что я ничего про эти протоколы не рассказал. Так вот TCP устанавливает усойчевое соединие, клиент сначала стучится, потом сервер отвечает ему, клиент подтвержадает что он тут, все соединини установлнно. Так же принято считать обмен TCP пакетами похоже на беседу двух вежливых людей – один спросил, друго тут же ответиЛ. И тоже выдал ответ итд.</p>\n\n<p>UDP просто льет пакеты в одно ведро, из-за этого бывает проблемы с днс портом, на него ломятся если хотят задавить, и еще ftp страдат из-за этого. Лично у мня проблем с NFS, который тоже работает по UDP н было, но по прсказням знакомых – это случайно вышло. :)</p>\n\n<p>Так ну и ICMP. Чисто служебный протокол который передает чуть чуть информации по поводу того что вообще происходит в сети. Скаже всеми любимы ping – это ICMP. Так что если вы че-то пингаете, а оно молчит – не значит что там ниче нет, если хотите поточнее проверить, берите nmap.</p>\n\n<p>Так же каждому пакету присваиваются куча данных, которые можно и менять в айпитейблс. Например TTL, время жизни пакета. Учитывае что в апитейблс после n-ого числа переходов, он может и обнулится, то с ним и играются.</p>\n\n<p>Так же айпитейблз можено использовать для шейпинга траффика. К примеру вам для соединенние с бд нужно пошире канал, при желании решается. И много другого прочего вроде проверок на спуффинг (замена адреса) и прочих прибабасов.</p>\n\n<p>Так, меня попросили написать малнькую замтку про ipables, а меня понесло. Так вот, предположим что у нас есть офис, предположим что мы девелопнейнт айти компания, и нам все нужно, чтобы комар носа не подточил. Так как контора мы небольшая, то у нас 1 директор, который вообще ничего не знает ни о чем, кроме того чтоо ему нужна кнопка “сделать все зашибись, один разработчик, один сисадмин, один дизайнер, и секратрь/бухгалтер/офис менеджер с 44 зубыой улыбкой, и платиновыми волосами. :))))))))) В конторе рассположен один служебный сервак, доступ к которому должен быть доступен извнеи разрабу, и сисадмину, и дизайнеру, но для разных целей. Секретарь все время в офисе во время рабочего дня сисадмину и кодеру иногда приходится работать по ночам,а вот дизайнеру иногда необходимо ездить и показывать дизайн. Дирктор пусть только пинки дает, и требует результатов и отчетов.</p>\n\n<p>Итак, предположим что у нас один внешний адрес. 66.66.66.66/25 айпи адрес шлуюза для нашей тачки у провайдера будет 66.66.66.1? днс будет свой. Внутрення сеть у нас 192.168.13.0/24 192.168.0.1 тачка на которой в один интерефейс воткнут мир, а а вторым интерфесом смотреит во внутреннюю сеть.</p>\n\n<p>Итак, приступим.</p>\n\n<p>Мир – eth0, eth1 – в нашу сеть смотри.</p>\n\n<p>iptables – F # стираем все правила</p>\n\n<p>Настраиваем NAT.</p>\n\n<p>iptables -A FORWARD -i eth0 -o eth1 -s 192.168.13.0/24 -j ACCEPT</p>\n\n<p>iptables -A FORWARD -i eth1 -o eth0 -d 192.168.13.0/24 -j ACCEPT</p>\n\n<p>iptables -P FORWARD DROP</p>\n\n<p>iptables -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j SNAT --to-source 66.66.66.66</p>\n\n<p>Разрешаем все соединения изнутри.</p>\n\n<p>iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT</p>\n\n<p>Перенаправляем все соединения с вебом на прокси сервис, сначала смотрим логи, потом смотрим кто как бесдельничает. :) И думаем как с этим боротся.</p>\n\n<p>iptables -A PREROUTING -d! 192.168.0.0/24 -i eth0 -p tcp -m multiport --dports 80,443 -j REDIRECT --to-ports 3128</p>\n\n<p>Открываем для сисадмина доступ снаружи к ssh</p>\n\n<p>iptables -A INPUT -s 12.12.12.0/23 -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT</p>\n\n<p>iptables -A INPUT -s 192.168.13.0/24 -p tcp --dport 22 -j ACCEPT</p>\n\n<p>iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT</p>\n\n<p>Для кодера mysql и git респозиторий.</p>\n\n<p>iptables -A PREROUTING -i eth0 -s 14.14.14.0/25 -p tcp -m tcp --dport 3306 -j DNAT --to-destination 192.168.13.200</p>\n\n<p>iptables -A PREROUTING -i eth0 -s 14.14.14.0/25 -p tcp -m tcp --dport 9418 -j DNAT --to-destination 192.168.13.200</p>\n\n<p>И для дизайнера к файлопомойке.</p>\n\n<p>iptables -A PREROUTING -i eth0 -p tcp -m tcp --dport 20 -j DNAT --to-destination 192.168.13.200</p>\n\n<p>iptables -A PREROUTING -i eth0 -p tcp -m tcp --dport 21 -j DNAT --to-destination 192.168.13.200</p>\n\n<p>Безопасность, Разврешаем все внутри, разрешаем соединине изнутри снаружи, которые поддерживаем, все остальное рвем.</p>\n\n<p>iptables -A INPUT -i lo -j ACCEPT</p>\n\n<p>iptables -A INPUT -i eth0 -s 192.168.0.0/24 -j ACCEPT</p>\n\n<p>iptables -A INPUT -i eth1 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT</p>\n\n<p>iptables -P INPUT DROP</p>\n','2020-03-30 18:22:51');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionid` varchar(1024) COLLATE utf8_bin NOT NULL,
  `userid` int(64) NOT NULL,
  `fname` varchar(128) COLLATE utf8_bin NOT NULL,
  `sname` varchar(128) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `fname` varchar(127) COLLATE utf8_bin NOT NULL,
  `sname` varchar(127) COLLATE utf8_bin NOT NULL,
  `about` text COLLATE utf8_bin,
  `userpic` varchar(255) COLLATE utf8_bin DEFAULT 'blank.png',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rootid` int(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (13,'int@tinedel.kiev.ua','6044ca2d5e22e9d084545f5d37f06106','Alexey','Sinitsyn','Я админко.','blank.png','2020-03-25 22:37:32',0),(18,'int@shushik.net','776ee886e4c54b3aa30fc08afef7ce3f','Alex','Meatbeg','Я тут админко, кодер, студент и учитель одновременно. Пишу это от нефиг делать, и для того чтобы получить левел ап. Сейчас в мои интересы входит ANSI c, golang, mysql, точнее его мастшбаирование, docker, k8s, jenkins, надо вкупе ansible добавить, шелл скриптинг, можт еще чуток питон, не особо интересует, но надо подучить, ява скрипт, nosql базы данных. А еще я безумно обожаю собирать из голых исходников мелкие линуксы. :)))))) Из не около компьютерных штучек меня интересет ролевое движение, фентези, научная фантастика и псевдо-научная фантастика. Смешные фильмы, вкусно приготовить и пожрать, чай и еще можно после всего это перекурить. (траву не предлагать, только табак). Музыку люблию начиная от метала продолжая панком, кончая фолком разнообразным.','blank.png','2020-03-27 09:53:49',0),(19,'minegsoap@gmail.com','9c69eac5ddf485bbfea4852df1ce725e','Вова','Мыловаров','бла','blank.png','2020-03-29 16:23:55',0),(20,'sergey.light@gmail.com','0986307a13a0ab0846826ad4bad22a7c','Serhii','Light','бла','blank.png','2020-03-29 19:54:08',0),(21,'alex.spichka@shushik.net','eb98f11e90f75601968a51e5207fdd0d','Могйчий','Спичкин',NULL,'blank.png','2020-03-30 14:09:16',0),(22,'rbs@shushik.net','e5e492e373436604c65796b1e4a1e6aa','Rustem','Sinitsyn','Получилось.','blank.png','2020-03-30 14:53:01',0);
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

-- Dump completed on 2020-07-04  0:03:18
