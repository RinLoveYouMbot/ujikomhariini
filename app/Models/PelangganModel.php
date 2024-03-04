<?php

namespace App\Models;

use CodeIgniter\Model;

class PelangganModel extends Model
{
    protected $table      = 'pelanggan';
    protected $primaryKey = 'PelangganID';
    // protected $useSoftDeletes = true;
    protected $allowedFields = ['NamaPelanggan', 'jenkel', 'NomorTelepon', 'Alamat'];
    protected $useTimestamps = true;

    // public function __construct()
    // {
    //     $this->db = \Config\Database::connect();
    // }

    public function detailPelanggan($id = null)
    {
        // $builder = $this->db->table($this->table);
        // $builder->select('id_customer AS id, nama_customer AS customer');
        // return $builder->get()->getResultArray();
        $builder = $this->builder($this->table)->select('PelangganID AS id, NamaPelanggan AS pelanggan, jenkel, NomorTelepon AS telp, Alamat AS alamat');
        if (empty($id)) {
            return $builder->get()->getResult();
        } else {
            return $builder->where('id', $id)->get(1)->getRow();
        }
    }

    // public function tambahCustomer($data)
    // {
    //     return $this->insert($data);
    // }

    // public function editCustomer($data)
    // {
    //     return $this->save($data);
    // }

    // public function hapusData($id)
    // {
    //     return $this->db->table($this->table)->delete($id);
    // }
}
