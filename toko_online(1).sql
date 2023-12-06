-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 12:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `id_transaksi`, `id_produk`, `qty`) VALUES
(17, 13, 22, 1),
(18, 14, 18, 1),
(19, 15, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(100) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi`, `harga`, `foto`) VALUES
(17, 'Arturia KeyLab Essential 49 ', '- 49 keys - 8 drumpads - Analog V software included - 9 faders - 9 knobs', 3600000, 'Arturia_Keylab_E_49.jpeg'),
(18, 'Arturia KeyLab 61 Mk2', '- high end  - 61 keys - 12 pads - 9 faders - 9 knobs - software included', 9, 'arturia-keylab-61-mk2-midi-keyboard-controller.webp'),
(19, 'Graphite M25', '- 25 key - 4 pads - 8 knobs - 2 faders - software included', 1, 'Graphite_M25.jpeg'),
(20, 'Novaltion Launchpad X', '- 64 pads - 16 mode - Dynamic scale notes - software included', 3, 'Novation_Launchpad_X.jpeg'),
(21, 'Ableton Push 2', '-high end - 64 pads - 16 mode - Dynamic scale notes - software included', 12, 'Ableton_Push_2.jpeg'),
(22, 'Novation 61SL Mk3', '-high end -61 keys - 16 pads - 8 knobs - 8 faders - software included', 13, 'Novation_61SL.jpeg'),
(23, 'Alesis Vi25', '- 25 key - 12 pads - software included', 1, 'Alesis Vi25.jpeg'),
(24, 'pisau lipat BROWNING', 'pisau lipat outdoor', 45000, 'pisau lipat browning.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `produk_sampai`
--

CREATE TABLE `produk_sampai` (
  `id_produk_sampai` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `tgl_sampai` date NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk_sampai`
--

INSERT INTO `produk_sampai` (`id_produk_sampai`, `id_transaksi`, `tgl_sampai`, `denda`) VALUES
(6, 13, '2023-10-12', 0),
(7, 14, '2023-10-12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_sampai` date NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `tgl_transaksi`, `tgl_sampai`, `Status`) VALUES
(13, 8, '2023-10-12', '2023-10-17', ''),
(14, 9, '2023-10-12', '2023-10-17', ''),
(15, 4, '2023-10-17', '2023-10-22', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `level`) VALUES
(4, 'Nano', 'Zoelva', '123', 'pelanggan'),
(8, 'Nano', 'Zoelva', '123', 'petugas'),
(9, 'Zoelva', 'Nano', '123', 'pelanggan'),
(10, 'bujang', 'bujangaja', 'bujangaja', 'pelanggan'),
(11, 'bujang', 'bujang', 'bujang', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_pembelian_produk` (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `produk_sampai`
--
ALTER TABLE `produk_sampai`
  ADD PRIMARY KEY (`id_produk_sampai`),
  ADD KEY `id_pembelian_produk` (`id_transaksi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_petugas` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `produk_sampai`
--
ALTER TABLE `produk_sampai`
  MODIFY `id_produk_sampai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk_sampai`
--
ALTER TABLE `produk_sampai`
  ADD CONSTRAINT `produk_sampai_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
