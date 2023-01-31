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
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` int(11) NOT NULL,
  `id_kab` int(11) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `id_kab`, `nama`, `waktu`) VALUES
(731701, 7317, 'Basse Sangtempe', '2022-04-03 15:10:35'),
(731702, 7317, 'Larompong', '2022-04-03 15:10:35'),
(731703, 7317, 'Suli', '2022-04-03 15:10:35'),
(731704, 7317, 'Bajo', '2022-04-03 15:10:35'),
(731705, 7317, 'Bua Ponrang', '2022-04-03 15:10:35'),
(731706, 7317, 'Walenrang', '2022-04-03 15:10:35'),
(731707, 7317, 'Belopa', '2022-04-03 15:10:35'),
(731708, 7317, 'Bua', '2022-04-03 15:10:35'),
(731709, 7317, 'Lamasi', '2022-04-03 15:10:35'),
(731710, 7317, 'Larompong Selatan', '2022-04-03 15:10:35'),
(731711, 7317, 'Ponrang', '2022-04-03 15:10:35'),
(731712, 7317, 'Latimojong', '2022-04-03 15:10:35'),
(731713, 7317, 'Kamanre', '2022-04-03 15:10:35'),
(731714, 7317, 'Belopa Utara', '2022-04-03 15:10:35'),
(731715, 7317, 'Walenrang Barat', '2022-04-03 15:10:35'),
(731716, 7317, 'Walenrang Utara', '2022-04-03 15:10:35'),
(731717, 7317, 'Walenrang Timur', '2022-04-03 15:10:35'),
(731718, 7317, 'Lamasi Timur', '2022-04-03 15:10:35'),
(731719, 7317, 'Suli Barat', '2022-04-03 15:10:35'),
(731720, 7317, 'Bajo Barat', '2022-04-03 15:10:35'),
(731721, 7317, 'Ponrang Selatan', '2022-04-03 15:10:35'),
(731722, 7317, 'Basse Sangtempe Utara', '2022-04-03 15:10:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kab` (`id_kab`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=731723;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_1` FOREIGN KEY (`id_kab`) REFERENCES `kabupaten` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
