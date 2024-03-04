<?php

namespace App\Models;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\Model;

class ItemModel extends Model
{
    protected $table      = 'produk';
    protected $primaryKey = 'id';
    protected $returnType = 'object';
    // protected $useSoftDeletes = true;
    protected $allowedFields = ['barcode', 'NamaProduk', 'id_kategori', 'id_unit', 'id_pemasok', 'harga', 'stok', 'gambar'];
    protected $useTimestamps = true;



    public function detailItem($id = null)
    {
        $builder = $this->builder($this->table)->select('produk.id AS iditem, barcode, NamaProduk AS item, harga, stok, gambar, id_pemasok, nama_unit AS unit, nama_kategori AS kategori, nama_pemasok AS pemasok')
            ->join('tb_unit', 'tb_unit.id = id_unit')
            ->join('tb_kategori', 'tb_kategori.id = id_kategori')
            ->join('tb_pemasok', 'tb_pemasok.id = id_pemasok');
        if (empty($id)) {
            return $builder->get()->getResult(); // tampilkan semua data
        } else {
            // tampilkan data sesuai id/barcode
            return $builder->where('produk.id', $id)->orWhere('barcode', $id)->get(1)->getRow();
        }
    }

    public function barcodeModel($keyword)
    {
        return $this->builder($this->table)->select('barcode, NamaProduk')
            ->like('barcode', $keyword)
            ->orLike('NamaProduk', $keyword)
            ->get()->getResult();
    }

    public function cariProduk($keyword)
    {
        $builder = $this->builder($this->table);
        $query = $builder->select('barcode, NamaProduk');
        if (empty($keyword)) {
            $data = $query->get(10)->getResult();
        } else {
            $data = $query->like('barcode', $keyword)->orLike('NamaProduk', $keyword)->get()->getResult();
        }
        return $data;
    }
}
