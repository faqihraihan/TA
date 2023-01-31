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
-- Struktur dari tabel `gapoktan`
--

CREATE TABLE `gapoktan` (
  `id` bigint(20) NOT NULL,
  `id_desa` bigint(20) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `ketua` varchar(200) DEFAULT NULL,
  `telp` varchar(200) DEFAULT NULL,
  `no_sk` varchar(200) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gapoktan`
--

INSERT INTO `gapoktan` (`id`, `id_desa`, `nama`, `ketua`, `telp`, `no_sk`, `waktu`) VALUES
(731705100101, 7317051001, 'Hikmah Bersama', 'Hakim Tanca, SE', '', '', '2022-04-06 16:59:59'),
(731705200202, 7317052002, 'Tanjong', 'Rahman', '', '', '2022-04-06 16:59:59'),
(731705200303, 7317052003, 'Pasampang', 'Pahri', '', '', '2022-04-06 16:59:59'),
(731705200404, 7317052004, 'Tampumia', 'Syamsu Alam, ST', '', '', '2022-04-06 16:59:59'),
(731705200505, 7317052005, 'Padang tuju mandiri', 'Nasrullah', '', '', '2022-04-06 16:59:59'),
(731705200606, 7317052006, 'Buah Maraja', 'Takbir, S.An', '', '', '2022-04-06 16:59:59'),
(731705200707, 7317052007, 'Malenggang samaturu', 'Rahman Arif', '', '', '2022-04-06 16:59:59'),
(731705200808, 7317052008, 'Balutan Jaya', 'Rusli', '', '', '2022-04-06 16:59:59'),
(731705200909, 7317052009, 'Padang Ma\'bud', 'Drs Ukkas, M.Si', '', '', '2022-04-06 16:59:59'),
(731705201010, 7317052010, 'Salu Induk', 'Yaya, A.Sn', '', '', '2022-04-06 16:59:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `gapoktan`
--
ALTER TABLE `gapoktan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_desa` (`id_desa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `gapoktan`
--
ALTER TABLE `gapoktan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=731705201011;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gapoktan`
--
ALTER TABLE `gapoktan`
  ADD CONSTRAINT `gapoktan_ibfk_1` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
