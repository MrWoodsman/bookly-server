-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2024 at 09:33 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system_rezerwacji`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `godizny_pracy`
--

CREATE TABLE `godizny_pracy` (
  `setup_id` int(11) NOT NULL,
  `nazwa` text NOT NULL,
  `dane` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`dane`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL,
  `imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `telefon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pracownicy`
--

INSERT INTO `pracownicy` (`id`, `imie`, `nazwisko`, `telefon`) VALUES
(1, 'Mikołaj', 'Ćwikła', '123123123'),
(2, 'Agata', 'Ćwikła', '321321321');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `id_rezerwacji` int(11) NOT NULL,
  `pracownik` int(11) NOT NULL,
  `usługa` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `usługi`
--

CREATE TABLE `usługi` (
  `id_uslugi` int(11) NOT NULL,
  `nazwa` text NOT NULL,
  `opis` text NOT NULL,
  `cena` double(10,2) NOT NULL,
  `cena_plus` tinyint(1) NOT NULL,
  `czas` int(11) NOT NULL COMMENT 'podawany w minutach',
  `tagi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usługi`
--

INSERT INTO `usługi` (`id_uslugi`, `nazwa`, `opis`, `cena`, `cena_plus`, `czas`, `tagi`) VALUES
(1, 'Strzyżenie męskie', 'Strzyżenie dopasowane do kształtu twarzy i wybranej fryzury', 55.00, 0, 55, 'Strzyżenie, męskie'),
(2, 'Combo borda + włosy', 'Profesjonalne strzyżenie brody + włosów dopasowane do twarzy', 110.00, 0, 90, 'broda, włosy, meskie'),
(3, 'Modelowanie włosów', '', 80.00, 1, 40, ''),
(4, 'Układanie włosów', 'Profesjonalne układanie włosów według potrzeb klienta', 25.00, 1, 25, 'włosy, układanie');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `godizny_pracy`
--
ALTER TABLE `godizny_pracy`
  ADD PRIMARY KEY (`setup_id`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`id_rezerwacji`);

--
-- Indeksy dla tabeli `usługi`
--
ALTER TABLE `usługi`
  ADD PRIMARY KEY (`id_uslugi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `godizny_pracy`
--
ALTER TABLE `godizny_pracy`
  MODIFY `setup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `id_rezerwacji` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usługi`
--
ALTER TABLE `usługi`
  MODIFY `id_uslugi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
