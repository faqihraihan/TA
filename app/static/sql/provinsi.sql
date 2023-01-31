-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Apr 2022 pada 17.00
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinsi`
--

CREATE TABLE `provinsi` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `provinsi`
--

INSERT INTO `provinsi` (`id`, `nama`, `waktu`) VALUES
(11, 'Aceh', '2022-04-03 15:10:35'),
(12, 'Sumatera Utara', '2022-04-03 15:10:35'),
(13, 'Sumatera Barat', '2022-04-03 15:10:35'),
(14, 'Riau', '2022-04-03 15:10:35'),
(15, 'Jambi', '2022-04-03 15:10:35'),
(16, 'Sumatera Selatan', '2022-04-03 15:10:35'),
(17, 'Bengkulu', '2022-04-03 15:10:35'),
(18, 'Lampung', '2022-04-03 15:10:35'),
(19, 'Kep. Bangka Belitung', '2022-04-03 15:10:35'),
(21, 'Kep. Riau', '2022-04-03 15:10:35'),
(31, 'DKI Jakarta', '2022-04-03 15:10:35'),
(32, 'Jawa Barat', '2022-04-03 15:10:35'),
(33, 'Jawa Tengah', '2022-04-03 15:10:35'),
(34, 'DI Yogyakarta', '2022-04-03 15:10:35'),
(35, 'Jawa Timur', '2022-04-03 15:10:35'),
(36, 'Banten', '2022-04-03 15:10:35'),
(51, 'Bali', '2022-04-03 15:10:35'),
(52, 'Nusa Tenggara Barat', '2022-04-03 15:10:35'),
(53, 'Nusa Tenggara Timur', '2022-04-03 15:10:35'),
(61, 'Kalimantan Barat', '2022-04-03 15:10:35'),
(62, 'Kalimantan Tengah', '2022-04-03 15:10:35'),
(63, 'Kalimantan Selatan', '2022-04-03 15:10:35'),
(64, 'Kalimantan Timur', '2022-04-03 15:10:35'),
(65, 'Kalimantan Utara', '2022-04-03 15:10:35'),
(71, 'Sulawesi Utara', '2022-04-03 15:10:35'),
(72, 'Sulawesi Tengah', '2022-04-03 15:10:35'),
(73, 'Sulawesi Selatan', '2022-04-03 15:10:35'),
(74, 'Sulawesi Tenggara', '2022-04-03 15:10:35'),
(75, 'Gorontalo', '2022-04-03 15:10:35'),
(76, 'Sulawesi Barat', '2022-04-03 15:10:35'),
(81, 'Maluku', '2022-04-03 15:10:35'),
(82, 'Maluku Utara', '2022-04-03 15:10:35'),
(91, 'Papua', '2022-04-03 15:10:35'),
(92, 'Papua Barat', '2022-04-03 15:10:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
