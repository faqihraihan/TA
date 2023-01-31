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
-- Struktur dari tabel `desa`
--

CREATE TABLE `desa` (
  `id` bigint(20) NOT NULL,
  `id_kec` int(11) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `desa`
--

INSERT INTO `desa` (`id`, `id_kec`, `nama`, `waktu`) VALUES
(7317051001, 731705, 'Noling', '2022-04-03 15:10:35'),
(7317052002, 731705, 'Tanjong', '2022-04-03 15:10:35'),
(7317052003, 731705, 'Buntu Batu', '2022-04-03 15:10:35'),
(7317052004, 731705, 'Tampumia', '2022-04-03 15:10:35'),
(7317052005, 731705, 'Padang Tuju', '2022-04-03 15:10:35'),
(7317052006, 731705, 'Padang Kamburi', '2022-04-03 15:10:35'),
(7317052007, 731705, 'Malenggang', '2022-04-03 15:10:35'),
(7317052008, 731705, 'Balutan', '2022-04-03 15:10:35'),
(7317052009, 731705, 'Padang Ma\'bud', '2022-04-03 15:10:35'),
(7317052010, 731705, 'Saluinduk', '2022-04-03 15:10:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kec` (`id_kec`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `desa`
--
ALTER TABLE `desa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7317052011;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `desa`
--
ALTER TABLE `desa`
  ADD CONSTRAINT `desa_ibfk_1` FOREIGN KEY (`id_kec`) REFERENCES `kecamatan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
