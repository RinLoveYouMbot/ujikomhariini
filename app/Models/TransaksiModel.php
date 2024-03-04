<?php

namespace App\Models;

use CodeIgniter\Model;


class TransaksiModel extends Model
{
    protected $table      = 'detailpenjualan';
    protected $primaryKey = 'DetailID';

    protected $allowedFields = [
        'id_penjualan',
        'id_item',
        'harga_item',
        'JumlahProduk',
        'diskon_item',
        'subtotal',
        'ip_address'
    ];

    protected $useTimestamps = true;

    public function detailTransaksi($id = null)
    {


        if ($id) {
            return $this->builder($this->table)
                ->select('harga_item AS harga, JumlahProduk AS jumlah, diskon_item, subtotal,p.PenjualanID AS id, p.invoice, p.TotalHarga, p.diskon, p.total_akhir, p.tunai, p.kembalian, p.catatan, p.created_at AS tanggal, i.NamaProduk AS item, pb.NamaPelanggan AS pelanggan, u.nama AS kasir')
                ->join('penjualan p', 'p.PenjualanID = id_penjualan')
                ->join('produk i', 'i.id = id_item')
                ->join('pelanggan pb', 'pb.PelangganID = p.PelangganID')
                ->join('tb_users u', 'u.id = id_user')
                ->where('id_penjualan', $id, true)
                ->get()->getResultArray();
        }
    }
}
