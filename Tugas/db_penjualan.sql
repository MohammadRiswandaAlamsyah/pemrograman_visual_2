-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2024 at 08:44 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barcode` int(20) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint(20) DEFAULT NULL,
  `harga_beli` bigint(20) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `kategori_id` int(8) DEFAULT NULL,
  `satuan_id` int(8) DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `barcode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `supplier_id`, `user_id`) VALUES
(10026601, 1234567890, 'Godiva Bread', 10000, 8500, 50, 10024401, 10025502, 10021102, 10020022),
(10026602, 2147483647, 'Oronamin C', 8000, 7000, 50, 10024402, 10025503, 10021103, 10020011),
(10026603, 1209348745, 'Lawson T-Shirt', 25000, 24000, 15, 10024403, 10025505, 10021104, 10020044),
(10026604, 2147483647, 'Energizer Battery Charger', 275000, 265000, 5, 10024404, 10025505, 10021101, 10020033),
(10026605, 1234098765, 'DX Changer', 250000, 240000, 10, 10024405, 10025505, 10021105, 10020001);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `no_telp` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `nik`, `name`, `address`, `no_telp`, `email`) VALUES
(10022201, 2147483647, 'Houtaro Ichinose', 'Guntung Paikat', '85309127645', 'steamhopper@gmail.com'),
(10022202, 2147483647, 'Supana Kurogane', 'Guntung Paikat', '82209871234', 'madwheel@gmail.com'),
(10022203, 2147483647, 'Rinne Kudo', 'Guntung Paikat', '82209127676', 'sununicon@gmail.com'),
(10022204, 2147483647, 'Minato', 'Galuh Marindu', '81209348787', 'steamliner@gmail.com'),
(10022205, 2147483647, 'Houou Kaguya', 'Galuh Marindu', '85309125454', 'legendary@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(10024401, 'Makanan'),
(10024402, 'Minuman'),
(10024403, 'Pakaian'),
(10024404, 'Elektronik'),
(10024405, 'Mainan');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `tanggal`, `deskripsi`, `supplier_id`, `user_id`) VALUES
(10029901, 2100001, 425000, 500000, '2024-01-01', 'Telah dibeli dari supplier dengan id = 10021101', 10021101, 10020001),
(10029902, 2100002, 350000, 400000, '2024-01-05', 'Telah dibeli dari supplier dengan id = 10021102', 10021102, 10020022),
(10029903, 2100003, 360000, 400000, '2024-01-10', 'Telah dibeli dari supplier dengan id = 10021103', 10021103, 10020011),
(10029904, 2100004, 1325000, 1400000, '2024-01-25', 'Telah dibeli dari supplier dengan id = 10021104', 10021104, 10020033),
(10029905, 2100005, 2400000, 2400000, '2024-01-30', 'Telah dibeli dari supplier dengan id = 10021105', 10021105, 10020044);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id` int(8) NOT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `pembelian_id` int(8) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id`, `barang_id`, `pembelian_id`, `harga`, `qty`, `subtotal`) VALUES
(10028801, 10026601, 10029901, 8500, 50, 425000),
(10028802, 10026602, 10029902, 7000, 50, 350000),
(10028803, 10026603, 10029903, 24000, 15, 360000),
(10028804, 10026604, 10029904, 265000, 5, 1325000),
(10028805, 10026605, 10029905, 240000, 10, 2400000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `customer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `bayar`, `kembali`, `tanggal`, `customer_id`, `user_id`) VALUES
(10027701, 2109001, 20000, 20000, 0, '2024-05-01', 10022201, 10020001),
(10027702, 2109002, 16000, 20000, 4000, '2024-05-15', 10022202, 10020022),
(10027703, 2109003, 25000, 30000, 5000, '2024-05-10', 10022203, 10020011),
(10027704, 2109004, 275000, 280000, 5000, '2024-05-15', 10022204, 10020033),
(10027705, 2109005, 250000, 250000, 0, '2024-05-10', 10022205, 10020044);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id` int(8) NOT NULL,
  `barang_id` int(8) DEFAULT NULL,
  `penjualan_id` int(8) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id`, `barang_id`, `penjualan_id`, `harga`, `qty`, `subtotal`) VALUES
(10027601, 10026601, 10027701, 10000, 2, 20000),
(10027602, 10026602, 10027702, 8000, 2, 16000),
(10027603, 10026603, 10027703, 25000, 1, 25000),
(10027604, 10026604, 10027704, 275000, 1, 275000),
(10027605, 10026605, 10027705, 250000, 1, 250000);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `deskripsi`) VALUES
(10025501, 'Dus', 'Dikemas dalam satu paket yang lebih besar.'),
(10025502, 'Bungkus', 'Dijual dalam kemasan kecil.'),
(10025503, 'Botol', 'Dijual dalam kemasan kecil.'),
(10025504, 'Kilogram', 'Dikirim berdasarkan beratnya.'),
(10025505, 'Unit', 'Dihitung dalam satuan unit.');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `no_telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `nama_bank` varchar(150) DEFAULT NULL,
  `nama_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `no_telp`, `email`, `address`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(10021101, 2147483647, 'Genba Bureki', '81209346745', 'yellowexcavator@gmail.com', 'Mangkubumi', 'PT. Tire', 'BNI', 'Genba Bureki', '1783057040495285835'),
(10021102, 2147483647, 'Taiya Hando', '81265348787', 'redtire@gmail.com', 'Ahmad Yani', 'PT. Tire', 'BCA', 'Taiya Hando', '1783057040495281209'),
(10021103, 2147483647, 'Ishiro Meita', '80976345412', 'bluespeedometer@gmail.com', 'Ahmad Yani', 'PT. Tire', 'BCA', 'Ishiro Meita', '1783057040495280909'),
(10021104, 2147483647, 'Mira Shifuto', '99876765251', 'pinkgear@gmail.com', 'Ahmad Yani', 'PT. Tire', 'BCA', 'Mira Shifuto', '1783057040495285455'),
(10021105, 2147483647, 'Jou Akuse', '90909098787', 'blackaccel@gmail.com', 'Kaca Piring', 'PT. Cops', 'BRI', 'Jou Akuse', '1783057040495280901');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `username` char(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tipe` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `no_telp` char(20) DEFAULT NULL,
  `is_active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `tipe`, `email`, `address`, `no_telp`, `is_active`) VALUES
(10020001, 2147483647, 'Victor', 'Victor Tassel', '01Green01Book', 'Owner', 'thornyroses@gmail.com', 'Guntung Payung', '81234567890', 'Y'),
(10020011, 2147483647, 'Touma', 'Touma Kamiyama', '01BurningSword', 'Kasir', 'reddragon@gmail.com', 'Guntung Paikat', '91209348756', 'Y'),
(10020022, 2147483647, 'Rintaro', 'Rintaro Shindo', 'Cold0202Water', 'Kasir', 'bluelion@gmail.com', 'Guntung Paikat', '80987654321', 'Y'),
(10020033, 2147483647, 'Kento', 'Kento Fukamiya', 'ShinyLightning03', 'Kasir', 'yellowcarpet@gmail.com', 'Galuh Marindu', '84576238712', 'Y'),
(10020044, 2147483647, 'Mei', 'Mei Sudo', '04Blue04Book', 'Kasir', 'scripteditor@gmail.com', 'Galuh Marindu', '80912873465', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kategori` (`kategori_id`),
  ADD KEY `fk_satuan` (`satuan_id`),
  ADD KEY `fk_supplier` (`supplier_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_supplier_pb` (`supplier_id`),
  ADD KEY `fk_user_pb` (`user_id`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_barang_pb` (`barang_id`),
  ADD KEY `fk_pembelian` (`pembelian_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer` (`customer_id`),
  ADD KEY `fk_user_pj` (`user_id`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_barang_pj` (`barang_id`),
  ADD KEY `fk_penjualan` (`penjualan_id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100266056;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10022206;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10024406;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10029906;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10028806;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10027706;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10027606;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10025506;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10021106;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10020045;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `fk_satuan` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`),
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `fk_supplier_pb` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `fk_user_pb` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD CONSTRAINT `fk_barang_pb` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `fk_pembelian` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `fk_user_pj` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `fk_barang_pj` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `fk_penjualan` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
