-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2024 at 07:43 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konsultanci`
--

CREATE TABLE `konsultanci` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Imie` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Zdjecie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `konsultanci`
--

INSERT INTO `konsultanci` (`Id`, `Imie`, `Nazwisko`, `Zdjecie`) VALUES
(1, 'Kamil', 'Król', 'konsultant1.jpg'),
(2, 'Darek', 'Lokalniak', 'konsultant2.jpg'),
(5, 'Andrzej', 'Stefaniuk', 'z55.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `operacje`
--

CREATE TABLE `operacje` (
  `Id_klienta` int(11) UNSIGNED NOT NULL,
  `Od_kogo` varchar(30) NOT NULL,
  `Kwota` int(11) NOT NULL,
  `Saldo` int(11) NOT NULL,
  `Komentarz` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operacje`
--

INSERT INTO `operacje` (`Id_klienta`, `Od_kogo`, `Kwota`, `Saldo`, `Komentarz`) VALUES
(1, '0', 11, 211, '0'),
(2, 'Od kogos', 120, 120, 'XD'),
(1, 'Krzychu', 22, 233, 'Zdrówko'),
(2, 'klient', 23, 143, 'A mam'),
(2, 'klient', 23, 166, 'A mam'),
(1, 'student', 3, 236, 'Lody'),
(2, 'student', 100, 336, 'Dzięki'),
(2, 'student', 4, 240, 'Sprawdzam'),
(1, 'klient', 4, 340, 'Sprawdz'),
(1, 'student', 100, 440, 'Od tego 2'),
(1, 'student', 60, 500, 'Nie ma'),
(2, 'student', 100, 600, 'Masz'),
(2, 'student', 40, 540, 'Test'),
(1, 'student', 300, 200, 'Za piwo'),
(2, 'student', 300, 900, 'Za piwo'),
(1, 'student', 100, 300, 'Tak'),
(2, 'klient', 50, 950, 'No'),
(2, 'klient', -300, 650, 'Oddaje'),
(1, 'klient', 300, 800, 'Oddaje'),
(2, 'klient', 50, 700, 'XD'),
(2, 'klient', -300, 400, 'Masz'),
(1, 'klient', 300, 1100, 'Masz'),
(2, '1', -10, 390, 'Test'),
(1, '', 10, 1110, 'Test'),
(1, '2', -500, 610, 'Oddaje'),
(2, '2', 500, 1450, 'Oddaje'),
(1, 'student', -10, 600, 'AL'),
(2, 'student', 10, 1460, 'AL'),
(1, 'student', -50, 550, 'Test'),
(2, 'student', 50, 1510, 'Test'),
(1, 'student', -1, 549, 'a'),
(2, 'student', 1, 1511, 'a'),
(1, 'student', -1, 548, 'a'),
(2, 'student', 1, 1512, 'a'),
(1, 'student', -12, 536, ''),
(1, 'student', -15, 521, 'Test'),
(2, 'student', 15, 1527, 'Test');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recenzje`
--

CREATE TABLE `recenzje` (
  `Id` int(10) UNSIGNED NOT NULL,
  `IdUzytkownika` int(10) UNSIGNED DEFAULT NULL,
  `Nick` varchar(50) NOT NULL,
  `Ocena` int(11) NOT NULL,
  `Tresc` varchar(500) NOT NULL,
  `Data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recenzje`
--

INSERT INTO `recenzje` (`Id`, `IdUzytkownika`, `Nick`, `Ocena`, `Tresc`, `Data`) VALUES
(5, 1, 'student', 5, 'Fajny', '0000-00-00'),
(6, 1, 'student', 1, 'Fajny chłop', '0000-00-00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ulubieni`
--

CREATE TABLE `ulubieni` (
  `Id` int(10) UNSIGNED NOT NULL,
  `IdKonsultanta` int(11) NOT NULL,
  `IdUzytkownika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `Id` int(10) UNSIGNED NOT NULL,
  `Login` varchar(50) NOT NULL,
  `Haslo` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`Id`, `Login`, `Haslo`, `Email`) VALUES
(1, 'student', 'cd73502828457d15655bbd7a63fb0bc8', 'student'),
(2, 'klient', 'de3f7eb864993cb4b3a3187f3847810b', 'KLIENCIK@POOO');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `konsultanci`
--
ALTER TABLE `konsultanci`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `operacje`
--
ALTER TABLE `operacje`
  ADD KEY `Id_klienta` (`Id_klienta`);

--
-- Indeksy dla tabeli `recenzje`
--
ALTER TABLE `recenzje`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdUzytkownika` (`IdUzytkownika`);

--
-- Indeksy dla tabeli `ulubieni`
--
ALTER TABLE `ulubieni`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `konsultanci`
--
ALTER TABLE `konsultanci`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recenzje`
--
ALTER TABLE `recenzje`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ulubieni`
--
ALTER TABLE `ulubieni`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `operacje`
--
ALTER TABLE `operacje`
  ADD CONSTRAINT `operacje_ibfk_1` FOREIGN KEY (`Id_klienta`) REFERENCES `uzytkownicy` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recenzje`
--
ALTER TABLE `recenzje`
  ADD CONSTRAINT `recenzje_ibfk_1` FOREIGN KEY (`IdUzytkownika`) REFERENCES `uzytkownicy` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
