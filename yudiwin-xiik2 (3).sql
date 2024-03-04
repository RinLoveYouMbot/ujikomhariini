-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Mar 2024 pada 00.52
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yudiwin-xiik2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `DetailID` int(11) UNSIGNED NOT NULL,
  `id_penjualan` int(11) UNSIGNED NOT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `harga_item` int(11) UNSIGNED NOT NULL,
  `JumlahProduk` int(11) UNSIGNED NOT NULL,
  `diskon_item` int(11) UNSIGNED NOT NULL,
  `subtotal` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`DetailID`, `id_penjualan`, `id_item`, `harga_item`, `JumlahProduk`, `diskon_item`, `subtotal`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 20, 2500, 2, 0, 5000, '::1', '2024-03-03 15:29:37', '2024-03-03 15:29:37', '0000-00-00 00:00:00'),
(2, 2, 20, 2500, 1, 0, 2500, '::1', '2024-03-03 15:30:43', '2024-03-03 15:30:43', '0000-00-00 00:00:00'),
(3, 5, 20, 2500, 1, 0, 2500, '::1', '2024-03-03 16:07:24', '2024-03-03 16:07:24', '0000-00-00 00:00:00'),
(4, 6, 20, 2500, 2, 0, 5000, '::1', '2024-03-03 16:10:24', '2024-03-03 16:10:24', '0000-00-00 00:00:00'),
(5, 7, 20, 2500, 2, 0, 5000, '::1', '2024-03-03 16:11:14', '2024-03-03 16:11:14', '0000-00-00 00:00:00'),
(6, 10, 20, 2500, 2, 0, 5000, '::1', '2024-03-03 16:25:20', '2024-03-03 16:25:20', '0000-00-00 00:00:00'),
(7, 11, 21, 1000, 2, 0, 2000, '::1', '2024-03-03 17:04:52', '2024-03-03 17:04:52', '0000-00-00 00:00:00'),
(9, 13, 20, 2500, 2, 0, 5000, '::1', '2024-03-03 19:07:01', '2024-03-03 19:07:01', '0000-00-00 00:00:00'),
(10, 43, 20, 2500, 1, 0, 2500, '::1', '2024-03-03 20:03:09', '2024-03-03 20:03:09', '0000-00-00 00:00:00'),
(11, 44, 20, 2500, 2, 0, 5000, '::1', '2024-03-03 20:14:57', '2024-03-03 20:14:57', '0000-00-00 00:00:00'),
(12, 45, 22, 20000, 1, 0, 20000, '::1', '2024-03-04 06:39:40', '2024-03-04 06:39:40', '0000-00-00 00:00:00'),
(13, 46, 22, 20000, 12, 0, 240000, '::1', '2024-03-04 06:51:16', '2024-03-04 06:51:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `PelangganID` int(11) UNSIGNED NOT NULL,
  `NamaPelanggan` varchar(100) NOT NULL,
  `jenkel` varchar(1) NOT NULL,
  `NomorTelepon` varchar(15) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`PelangganID`, `NamaPelanggan`, `jenkel`, `NomorTelepon`, `Alamat`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Umum', '', '', '', '2024-03-03 12:34:58', '2024-03-03 12:35:07', '0000-00-00 00:00:00'),
(2, 'Herman', 'L', '085864389254', 'Jalan Sukaakur', '2024-03-03 12:36:15', '2024-03-04 06:50:47', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `PenjualanID` int(11) UNSIGNED NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `PelangganID` int(11) UNSIGNED NOT NULL,
  `TotalHarga` decimal(10,2) UNSIGNED NOT NULL,
  `diskon` int(11) UNSIGNED NOT NULL,
  `total_akhir` int(11) UNSIGNED NOT NULL,
  `tunai` int(11) UNSIGNED NOT NULL,
  `kembalian` int(11) UNSIGNED NOT NULL,
  `catatan` text NOT NULL,
  `TanggalPenjualan` date NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`PenjualanID`, `invoice`, `PelangganID`, `TotalHarga`, `diskon`, `total_akhir`, `tunai`, `kembalian`, `catatan`, `TanggalPenjualan`, `id_user`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'INV2403030001', 1, '5000.00', 0, 5000, 6000, 1000, '', '2024-03-03', 2, '::1', '2024-03-03 15:29:36', '2024-03-03 15:29:36', '0000-00-00 00:00:00'),
(2, 'INV2403030002', 1, '2500.00', 0, 2500, 5000, 2500, '', '2024-03-03', 2, '::1', '2024-03-03 15:30:43', '2024-03-03 15:30:43', '0000-00-00 00:00:00'),
(5, 'INV2403030003', 1, '2500.00', 0, 2500, 5000, 2500, '', '2024-03-03', 18, '::1', '2024-03-03 16:07:24', '2024-03-03 16:07:24', '0000-00-00 00:00:00'),
(6, 'INV2403030004', 1, '5000.00', 0, 5000, 20000, 15000, '', '2024-03-03', 18, '::1', '2024-03-03 16:10:24', '2024-03-03 16:10:24', '0000-00-00 00:00:00'),
(7, 'INV2403030005', 1, '5000.00', 0, 5000, 5000, 0, '', '2024-03-03', 18, '::1', '2024-03-03 16:11:14', '2024-03-03 16:11:14', '0000-00-00 00:00:00'),
(10, 'INV2403030006', 1, '5000.00', 0, 5000, 6000, 1000, '', '2024-03-03', 18, '::1', '2024-03-03 16:25:20', '2024-03-03 16:25:20', '0000-00-00 00:00:00'),
(11, 'INV2403030007', 2, '2000.00', 0, 2000, 5000, 3000, '', '2024-03-03', 18, '::1', '2024-03-03 17:04:52', '2024-03-03 17:04:52', '0000-00-00 00:00:00'),
(13, 'INV2403030008', 1, '5000.00', 0, 5000, 5000, 0, '', '2024-03-03', 2, '::1', '2024-03-03 19:07:01', '2024-03-03 19:07:01', '0000-00-00 00:00:00'),
(43, 'INV2403030009', 1, '2500.00', 0, 2500, 5000, 2500, '', '2024-03-03', 2, '::1', '2024-03-03 20:03:09', '2024-03-03 20:03:09', '0000-00-00 00:00:00'),
(44, 'INV2403030010', 1, '5000.00', 0, 5000, 5000, 0, '', '2024-03-03', 2, '::1', '2024-03-03 20:14:57', '2024-03-03 20:14:57', '0000-00-00 00:00:00'),
(45, 'INV2403040001', 1, '20000.00', 0, 20000, 20000, 0, 'lunas', '2024-03-04', 18, '::1', '2024-03-04 06:39:40', '2024-03-04 06:39:40', '0000-00-00 00:00:00'),
(46, 'INV2403040002', 2, '240000.00', 0, 240000, 300000, 60000, '', '2024-03-04', 2, '::1', '2024-03-04 06:51:16', '2024-03-04 06:51:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) UNSIGNED NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `NamaProduk` varchar(255) NOT NULL,
  `id_kategori` int(11) UNSIGNED NOT NULL,
  `id_unit` int(11) UNSIGNED NOT NULL,
  `id_pemasok` int(11) UNSIGNED NOT NULL,
  `harga` int(11) UNSIGNED NOT NULL,
  `stok` int(11) UNSIGNED NOT NULL,
  `gambar` varchar(100) NOT NULL DEFAULT 'gambar.jpg',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `barcode`, `NamaProduk`, `id_kategori`, `id_unit`, `id_pemasok`, `harga`, `stok`, `gambar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(20, 'A001', 'Chitato', 1, 1, 1, 2500, 18, '1709450540_713e554b1571ad0820b5.jpg', '2024-03-03 14:22:20', '2024-03-03 20:14:57', '0000-00-00 00:00:00'),
(21, 'A002', 'Teh Gelas', 2, 1, 1, 1000, 98, 'gambar.jpg', '2024-03-03 17:03:19', '2024-03-03 17:04:52', '0000-00-00 00:00:00'),
(22, 'A003', 'Magnum Filter', 3, 5, 1, 20000, 88, '1709509065_b6ec04b4694653522aae.jpg', '2024-03-04 06:37:45', '2024-03-04 06:51:16', '0000-00-00 00:00:00'),
(23, 'A004', 'Sinar Dunia', 4, 2, 3, 30000, 30, '1709509596_c2f13908c3398daaaa15.jpg', '2024-03-04 06:46:36', '2024-03-04 06:46:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bulan_tahun`
--

CREATE TABLE `tb_bulan_tahun` (
  `id` int(11) UNSIGNED NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `tahun` year(4) NOT NULL,
  `bln_thn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tb_bulan_tahun`
--

INSERT INTO `tb_bulan_tahun` (`id`, `bulan`, `tahun`, `bln_thn`) VALUES
(1, 'Jan', 2020, '01-2020'),
(2, 'Feb', 2020, '02-2020'),
(3, 'Mar', 2020, '03-2020'),
(4, 'Apr', 2020, '04-2020'),
(5, 'Mei', 2020, '05-2020'),
(6, 'Jun', 2020, '06-2020'),
(7, 'Jul', 2020, '07-2020'),
(8, 'Agu', 2020, '08-2020'),
(9, 'Sep', 2020, '09-2020'),
(10, 'Okt', 2020, '10-2020'),
(11, 'Nov', 2020, '11-2020'),
(12, 'Des', 2020, '12-2020'),
(13, 'Jan', 2021, '01-2021'),
(14, 'Feb', 2021, '02-2021'),
(15, 'Mar', 2021, '03-2021'),
(16, 'Apr', 2021, '04-2021'),
(17, 'Mei', 2021, '05-2021'),
(18, 'Jun', 2021, '06-2021'),
(19, 'Jul', 2021, '07-2021'),
(20, 'Agu', 2021, '08-2021'),
(21, 'Sep', 2021, '09-2021'),
(22, 'Okt', 2021, '10-2021'),
(23, 'Nov', 2021, '11-2021'),
(24, 'Des', 2021, '12-2021'),
(25, 'Jan', 2022, '01-2022'),
(26, 'Feb', 2022, '02-2022'),
(27, 'Mar', 2022, '03-2022'),
(28, 'Apr', 2022, '04-2022'),
(29, 'Mei', 2022, '05-2022'),
(30, 'Jun', 2022, '06-2022'),
(31, 'Jul', 2022, '07-2022'),
(32, 'Agu', 2022, '08-2022'),
(33, 'Sep', 2022, '09-2022'),
(34, 'Okt', 2022, '10-2022'),
(35, 'Nov', 2022, '11-2022'),
(36, 'Des', 2022, '12-2022'),
(37, 'Jan', 2023, '01-2023'),
(38, 'Feb', 2023, '02-2023'),
(39, 'Mar', 2023, '03-2023'),
(40, 'Apr', 2023, '04-2023'),
(41, 'Mei', 2023, '05-2023'),
(42, 'Jun', 2023, '06-2023'),
(43, 'Jul', 2023, '07-2023'),
(44, 'Agu', 2023, '08-2023'),
(45, 'Sep', 2023, '09-2023'),
(46, 'Okt', 2023, '10-2023'),
(47, 'Nov', 2023, '11-2023'),
(48, 'Des', 2023, '12-2023'),
(49, 'Jan', 2024, '01-2024'),
(50, 'Feb', 2024, '02-2024'),
(51, 'Mar', 2024, '03-2024'),
(52, 'Apr', 2024, '04-2024'),
(53, 'Mei', 2024, '05-2024'),
(54, 'Jun', 2024, '06-2024'),
(55, 'Jul', 2024, '07-2024'),
(56, 'Agu', 2024, '08-2024'),
(57, 'Sep', 2024, '09-2024'),
(58, 'Okt', 2024, '10-2024'),
(59, 'Nov', 2024, '11-2024'),
(60, 'Des', 2024, '12-2024'),
(61, 'Jan', 2025, '01-2025'),
(62, 'Feb', 2025, '02-2025'),
(63, 'Mar', 2025, '03-2025'),
(64, 'Apr', 2025, '04-2025'),
(65, 'Mei', 2025, '05-2025'),
(66, 'Jun', 2025, '06-2025'),
(67, 'Jul', 2025, '07-2025'),
(68, 'Agu', 2025, '08-2025'),
(69, 'Sep', 2025, '09-2025'),
(70, 'Okt', 2025, '10-2025'),
(71, 'Nov', 2025, '11-2025'),
(72, 'Des', 2025, '12-2025'),
(73, 'Jan', 2026, '01-2026'),
(74, 'Feb', 2026, '02-2026'),
(75, 'Mar', 2026, '03-2026'),
(76, 'Apr', 2026, '04-2026'),
(77, 'Mei', 2026, '05-2026'),
(78, 'Jun', 2026, '06-2026'),
(79, 'Jul', 2026, '07-2026'),
(80, 'Agu', 2026, '08-2026'),
(81, 'Sep', 2026, '09-2026'),
(82, 'Okt', 2026, '10-2026'),
(83, 'Nov', 2026, '11-2026'),
(84, 'Des', 2026, '12-2026'),
(85, 'Jan', 2027, '01-2027'),
(86, 'Feb', 2027, '02-2027'),
(87, 'Mar', 2027, '03-2027'),
(88, 'Apr', 2027, '04-2027'),
(89, 'Mei', 2027, '05-2027'),
(90, 'Jun', 2027, '06-2027'),
(91, 'Jul', 2027, '07-2027'),
(92, 'Agu', 2027, '08-2027'),
(93, 'Sep', 2027, '09-2027'),
(94, 'Okt', 2027, '10-2027'),
(95, 'Nov', 2027, '11-2027'),
(96, 'Des', 2027, '12-2027'),
(97, 'Jan', 2028, '01-2028'),
(98, 'Feb', 2028, '02-2028'),
(99, 'Mar', 2028, '03-2028'),
(100, 'Apr', 2028, '04-2028'),
(101, 'Mei', 2028, '05-2028'),
(102, 'Jun', 2028, '06-2028'),
(103, 'Jul', 2028, '07-2028'),
(104, 'Agu', 2028, '08-2028'),
(105, 'Sep', 2028, '09-2028'),
(106, 'Okt', 2028, '10-2028'),
(107, 'Nov', 2028, '11-2028'),
(108, 'Des', 2028, '12-2028'),
(109, 'Jan', 2029, '01-2029'),
(110, 'Feb', 2029, '02-2029'),
(111, 'Mar', 2029, '03-2029'),
(112, 'Apr', 2029, '04-2029'),
(113, 'Mei', 2029, '05-2029'),
(114, 'Jun', 2029, '06-2029'),
(115, 'Jul', 2029, '07-2029'),
(116, 'Agu', 2029, '08-2029'),
(117, 'Sep', 2029, '09-2029'),
(118, 'Okt', 2029, '10-2029'),
(119, 'Nov', 2029, '11-2029'),
(120, 'Des', 2029, '12-2029'),
(121, 'Jan', 2030, '01-2030'),
(122, 'Feb', 2030, '02-2030'),
(123, 'Mar', 2030, '03-2030'),
(124, 'Apr', 2030, '04-2030'),
(125, 'Mei', 2030, '05-2030'),
(126, 'Jun', 2030, '06-2030'),
(127, 'Jul', 2030, '07-2030'),
(128, 'Agu', 2030, '08-2030'),
(129, 'Sep', 2030, '09-2030'),
(130, 'Okt', 2030, '10-2030'),
(131, 'Nov', 2030, '11-2030'),
(132, 'Des', 2030, '12-2030');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id`, `nama_kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Makanan', '2024-03-03 14:01:25', '2024-03-03 14:01:25', '0000-00-00 00:00:00'),
(2, 'Minuman', '2024-03-03 14:01:30', '2024-03-03 14:01:30', '0000-00-00 00:00:00'),
(3, 'Rokok', '2024-03-04 06:36:21', '2024-03-04 06:36:27', '0000-00-00 00:00:00'),
(4, 'Buku', '2024-03-04 06:44:59', '2024-03-04 06:44:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemasok`
--

CREATE TABLE `tb_pemasok` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_pemasok` varchar(100) NOT NULL,
  `telp_pemasok` varchar(20) NOT NULL,
  `alamat_pemasok` varchar(100) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tb_pemasok`
--

INSERT INTO `tb_pemasok` (`id`, `nama_pemasok`, `telp_pemasok`, `alamat_pemasok`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PT. Kobong Acong', '012345', 'Jalan Cisitu Lama Nomor 52', 'Langganan', '2024-03-03 12:45:56', '2024-03-03 12:45:56', '0000-00-00 00:00:00'),
(3, 'PT Jaya Mandiri', '021235321', 'Cicaheum', '-', '2024-03-04 06:41:51', '2024-03-04 06:42:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengaturan`
--

CREATE TABLE `tb_pengaturan` (
  `nama_toko` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pengaturan`
--

INSERT INTO `tb_pengaturan` (`nama_toko`, `no_telp`, `alamat`, `id`) VALUES
('SHOPEE', '0858643892541', 'Jl.Cisitu Baru No.52 Dago Bandung', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_roles`
--

CREATE TABLE `tb_roles` (
  `id` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tb_roles`
--

INSERT INTO `tb_roles` (`id`, `keterangan`) VALUES
(1, 'Administrator'),
(2, 'Petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_stok` int(11) UNSIGNED NOT NULL,
  `tipe` enum('masuk','keluar') DEFAULT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `id_pemasok` int(11) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tb_stok`
--

INSERT INTO `tb_stok` (`id_stok`, `tipe`, `id_item`, `id_pemasok`, `jumlah`, `keterangan`, `id_user`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'keluar', 20, 1, 7, 'Kadaluarsa', 2, '::1', '2024-03-03 15:31:26', '2024-03-03 15:31:26', '0000-00-00 00:00:00'),
(14, 'masuk', 20, 1, 10, 'pengganti kadaluarsa', 2, '::1', '2024-03-03 15:31:57', '2024-03-03 15:31:57', '0000-00-00 00:00:00'),
(15, 'keluar', 22, 1, 19, 'bungus rusak', 2, '::1', '2024-03-04 06:48:40', '2024-03-04 06:48:40', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_unit`
--

CREATE TABLE `tb_unit` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_unit` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tb_unit`
--

INSERT INTO `tb_unit` (`id`, `nama_unit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PCS', '2024-03-03 14:18:22', '2024-03-03 14:19:26', '0000-00-00 00:00:00'),
(2, 'PAK', '2024-03-03 14:19:18', '2024-03-03 14:19:18', '0000-00-00 00:00:00'),
(3, 'DUS', '2024-03-03 14:19:33', '2024-03-03 14:19:33', '0000-00-00 00:00:00'),
(5, 'BKS', '2024-03-04 06:36:07', '2024-03-04 06:36:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `id_role` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar.jpg',
  `status` int(1) NOT NULL DEFAULT 0,
  `token` varchar(255) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`id`, `email`, `username`, `password`, `nama`, `alamat`, `id_role`, `avatar`, `status`, `token`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'yudikusnaedi1933@gmail.com', 'administrator', '$2y$10$.E7GGtQJv954F0O7OuNIFOg10alHh7cBij5MouV.gKaViKljWAbzS', 'Yudi Kusnaedi', 'Jl.Cijotang\r\n', 1, '1709445207_1c9184359fb9dc78dd3d.jpg', 1, 'bdbc976f1212965d03dcce1fecbcc811d3c817b7efd1aa61c090b5d7913b895f', '0.0.0.0', '2024-03-01 18:29:41', '2024-03-03 23:10:18', NULL),
(18, 'petugas@gmail.com', 'petugas', '$2y$10$Vn2TDbC9b9kS.9FWRTt2m.U8uaNg.uKa8TZyMGkP8HW5owTn.6/4C', 'Petugas', 'Garut', 2, '1709445423_12ff2a933aec5b8576b9.jpg', 0, 'f026571fd3eed5b8e3661a0c7b55523fbf490ea7323faca111aa311a19736d85', '::1', '2024-02-25 10:03:41', '2024-03-04 06:47:39', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`DetailID`),
  ADD KEY `tb_transaksi_id_item_foreign` (`id_item`),
  ADD KEY `id_penjualan_id_item` (`id_penjualan`,`id_item`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`PelangganID`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`PenjualanID`),
  ADD KEY `tb_penjualan_id_user_foreign` (`id_user`),
  ADD KEY `id_pelanggan_id_user` (`PelangganID`,`id_user`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `tb_item_id_unit_foreign` (`id_unit`),
  ADD KEY `id_kategori_id_unit` (`id_kategori`,`id_unit`),
  ADD KEY `id_pemasok` (`id_pemasok`);

--
-- Indeks untuk tabel `tb_bulan_tahun`
--
ALTER TABLE `tb_bulan_tahun`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pengaturan`
--
ALTER TABLE `tb_pengaturan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `tb_stok_id_pemasok_foreign` (`id_pemasok`),
  ADD KEY `tb_stok_id_user_foreign` (`id_user`),
  ADD KEY `id_item_id_pemasok_id_user` (`id_item`,`id_pemasok`,`id_user`);

--
-- Indeks untuk tabel `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_username` (`email`,`username`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `DetailID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `PelangganID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `PenjualanID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_bulan_tahun`
--
ALTER TABLE `tb_bulan_tahun`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_stok` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tb_unit`
--
ALTER TABLE `tb_unit`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD CONSTRAINT `tb_transaksi_id_item_foreign` FOREIGN KEY (`id_item`) REFERENCES `produk` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_id_penjualan_foreign` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`PenjualanID`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `tb_penjualan_id_pelanggan_foreign` FOREIGN KEY (`PelangganID`) REFERENCES `pelanggan` (`PelangganID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penjualan_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `tb_item_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_item_id_pemasok_foreign` FOREIGN KEY (`id_pemasok`) REFERENCES `tb_pemasok` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_item_id_unit_foreign` FOREIGN KEY (`id_unit`) REFERENCES `tb_unit` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD CONSTRAINT `tb_stok_id_item_foreign` FOREIGN KEY (`id_item`) REFERENCES `produk` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stok_id_pemasok_foreign` FOREIGN KEY (`id_pemasok`) REFERENCES `tb_pemasok` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stok_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `tb_users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `tb_roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
