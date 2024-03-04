<?php

namespace App\Controllers;

use App\Models\ItemModel;
use App\Models\KategoriModel;
use App\Models\PemasokModel;
use App\Models\UnitModel;
use Config\View;
use Irsyadulibad\DataTables\DataTables;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Dompdf\Dompdf;
use LDAP\Result;

class Item extends BaseController
{
    protected $itemModel;
    protected $kategori;
    protected $unit;
    protected $pemasok;
    private $rules = [
        'barcode'  => ['rules' => 'required|alpha_numeric_punct|is_unique[produk.barcode,id,{id}]','errors' => ['required' => 'Barcode Wajib Di Isi','is_unique'=>'Barcode telah terdaftar']],
        'item'     => ['rules' => 'required|alpha_numeric_punct','errors' => ['required' => 'Produk Wajib Di Isi']],
        'kategori' => ['rules' => 'required', 'errors' => ['required' => 'Kategori Wajib Di Isi']],
        'unit'     => ['rules' => 'required', 'errors' => ['required' => 'Unit Wajib Di Isi']],
        'pemasok'  => ['rules' => 'required', 'errors' => ['required' => 'Pemasok Wajib Di Isi']],
        'harga'    => ['rules' => 'required|numeric', 'errors' => ['required' => 'Harga Wajib Di Isi','numeric'=>'Harga hanya boleh berisi angka']],
        'stok'     => ['rules' => 'required|numeric', 'errors' => ['required' => 'Stok Wajib Di Isi','numeric'=>'Stok hanya boleh berisi angka']],
        'gambar'   => ['rules' => 'max_size[gambar,2048]|mime_in[gambar,image/png,image/jpg,image/jpeg]|ext_in[gambar,png,jpg,jpeg]|is_image[gambar]'],
    ];

    public function __construct()
    {
        $this->itemModel = new ItemModel();
        $this->kategori  = new KategoriModel();
        $this->unit      = new UnitModel();
        $this->pemasok   = new PemasokModel();
        helper('form');
    }

    public function index()
    {
        $data = [
            'title'    => 'Daftar Produk',
            'kategori' => $this->kategori->getKategori(),
            'unit'     => $this->unit->getUnit(),
            'pemasok'  => $this->pemasok->detailPemasok(),
        ];
        echo view('item/index', $data);
    }

    public function ajax()
    {
        if ($this->request->isAJAX()) {
            return DataTables::use('produk')
                ->select('produk.id AS iditem, barcode, NamaProduk as item, harga, stok, gambar, id_pemasok, tb_unit.id AS idunit, tb_kategori.id AS idkategori')
                ->join('tb_unit', 'tb_unit.id = id_unit')
                ->join('tb_kategori', 'tb_kategori.id = id_kategori')
                ->make();
        }
    }

    public function detail()
    {
        $barcode = $this->request->getGet('barcode', FILTER_SANITIZE_SPECIAL_CHARS);
        $data    = $this->itemModel->detailItem($barcode);
        if (!empty($data)) {
            return $this->response->setJSON($data);
        }
    }

    public function tambah()
    {
        if ($this->request->isAJAX()) {
            if (!$this->validate($this->rules)) {
                $respon = [
                    'validasi' => false,
                    'error'    => $this->validator->getErrors(),
                ];
            } else {
                // validasi form sukses
                $data = [
                    'barcode'     => strtoupper($this->request->getPost('barcode', FILTER_SANITIZE_SPECIAL_CHARS)),
                    'NamaProduk'   => ucwords($this->request->getPost('item', FILTER_SANITIZE_SPECIAL_CHARS)),
                    'id_kategori' => $this->request->getPost('kategori', FILTER_SANITIZE_NUMBER_INT),
                    'id_unit'     => $this->request->getPost('unit', FILTER_SANITIZE_NUMBER_INT),
                    'id_pemasok'  => $this->request->getPost('pemasok', FILTER_SANITIZE_NUMBER_INT),
                    'harga'       => $this->request->getPost('harga', FILTER_SANITIZE_NUMBER_INT),
                    'stok'        => $this->request->getPost('stok', FILTER_SANITIZE_NUMBER_INT),
                ];
                // jika gambar produk ditambahkan
                $upload = $this->_unggahGambarProduk();
                if (!empty($upload)) {
                    $data['gambar'] = $upload['gambar'];
                }
                $this->itemModel->save($data);
                $respon = [
                    'validasi' => true,
                    'sukses'   => true,
                    'pesan'    => 'Data berhasil ditambahkan :)',
                ];
            }

            return $this->response->setJSON($respon);
        }
    }

    public function ubah()
    {
        if ($this->request->isAJAX()) {
            if (!$this->validate($this->rules)) {
                $respon = [
                    'validasi' => false,
                    'error'    => $this->validator->getErrors(),
                ];
            } else {
                // validasi form sukses
                $data = [
                    'barcode'     => strtoupper($this->request->getPost('barcode', FILTER_SANITIZE_SPECIAL_CHARS)),
                    'NamaProduk'   => ucwords($this->request->getPost('item', FILTER_SANITIZE_SPECIAL_CHARS)),
                    'id_kategori' => $this->request->getPost('kategori', FILTER_SANITIZE_NUMBER_INT),
                    'id_unit'     => $this->request->getPost('unit', FILTER_SANITIZE_NUMBER_INT),
                    'id_pemasok'  => $this->request->getPost('pemasok', FILTER_SANITIZE_NUMBER_INT),
                    'harga'       => $this->request->getPost('harga', FILTER_SANITIZE_NUMBER_INT),
                    'stok'        => $this->request->getPost('stok', FILTER_SANITIZE_NUMBER_INT),
                    'id'          => $this->request->getPost('id', FILTER_SANITIZE_NUMBER_INT),
                ];
                // jika gambar produk diubah
                $gambarLama = $this->request->getPost('gambarLama', FILTER_SANITIZE_SPECIAL_CHARS);
                $upload     = $this->_unggahGambarProduk($gambarLama);
                if (!empty($upload)) {
                    $data['gambar'] = $upload['gambar'];
                }
                $this->itemModel->save($data);
                $respon = [
                    'validasi' => true,
                    'sukses'   => true,
                    'pesan'    => 'Data berhasil diubah :)',
                ];
            }

            return $this->response->setJSON($respon);
        }
    }

    public function hapus()
    {
        if ($this->request->isAJAX()) {
            $id   = $this->request->getGet('id', FILTER_SANITIZE_NUMBER_INT);
            $data = $this->itemModel->find($id);
            if (!(empty($data))) {
                if ($data->gambar != 'gambar.jpg' && file_exists(FCPATH . 'uploads/produk/' . $data->gambar)) {
                    unlink(FCPATH . 'uploads/produk/' . $data->gambar); // hapus gambar produk
                }
                $this->itemModel->delete($id); // hapus data
                $respon = [
                    'status' => true,
                    'pesan'  => 'Data berhasil dihapus :)',
                ];
            } else {
                $respon = [
                    'status' => false,
                    'pesan'  => 'Gagal menghapus data :(',
                ];
            }

            return $this->response->setJSON($respon);
        }
    }

    private function _unggahGambarProduk($gambarLama = null)
    {
        $file       = $this->request->getFile('gambar'); // ambil data file
        $namaRandom = $file->getRandomName();
        if ($file->isValid() && !$file->hasMoved()) {
            if (!empty($gambarLama) && $gambarLama != 'gambar.jpg' && file_exists(FCPATH . 'uploads/produk/' . $gambarLama)) {
                // hapus gambar lama
                unlink(FCPATH . 'uploads/produk/' . $gambarLama);
            }
            // pindahkan photo baru ke folder uploads/produk
            $file->move(FCPATH . 'uploads/produk', $namaRandom, true);

            return ['gambar' => $namaRandom]; // ambil nama photo untuk disimpan di
        }
    }

    public function barcode()
    {
        $keyword = $this->request->getGet('term', FILTER_SANITIZE_SPECIAL_CHARS);
        $data    = $this->itemModel->barcodeModel($keyword);
        $barcode = [];
        foreach ($data as $item) {
            array_push($barcode, [
                'label' => "{$item->barcode} - {$item->NamaProduk}",
                'value' => $item->barcode,
            ]);
        }

        return $this->response->setJSON($barcode);
    }

    public function cariProduk()
    {
        $keyword = $this->request->getGet('search', FILTER_SANITIZE_SPECIAL_CHARS);
        $cek     = $this->itemModel->cariProduk($keyword);
        $data    = [];
        foreach ($cek as $row) {
            $array = [
                'id'   => $row->barcode,
                'text' => "$row->barcode - $row->NamaProduk",
            ];
            array_push($data, $array);
        }

        return $this->response->setJSON([
            'results' => $data,
        ]);
    }

    public function download()
    {
        // Instansiasi Spreadsheet
        $spreadsheet = new Spreadsheet();
        // styling
        $style = [
            'font'      => ['bold' => true],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                'vertical'   => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
            ],
        ];
        $spreadsheet->getActiveSheet()->getStyle('A1:G1')->applyFromArray($style); // tambahkan style
        $spreadsheet->getActiveSheet()->getRowDimension(1)->setRowHeight(30); // setting tinggi baris
        // setting lebar kolom otomatis
        $spreadsheet->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
        $spreadsheet->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
        // set kolom head
        $spreadsheet->setActiveSheetIndex(0)
            ->setCellValue('A1', 'No')
            ->setCellValue('B1', 'Barcode')
            ->setCellValue('C1', 'Item Produk')
            ->setCellValue('D1', 'Kategori')
            ->setCellValue('E1', 'Unit')
            ->setCellValue('F1', 'Harga')
            ->setCellValue('G1', 'Stok');
        $row = 2;
        // looping data item
        foreach ($this->itemModel->detailItem() as $key => $data) {
            $spreadsheet->getActiveSheet()
                ->setCellValue('A' . $row, $key + 1)
                ->setCellValue('B' . $row, $data->barcode)
                ->setCellValue('C' . $row, $data->item)
                ->setCellValue('D' . $row, $data->kategori)
                ->setCellValue('E' . $row, $data->unit)
                ->setCellValue('F' . $row, $data->harga)
                ->setCellValue('G' . $row, $data->stok);
            $row++;
        }
        // tulis dalam format .xlsx
        $writer   = new Xlsx($spreadsheet);
        $namaFile = 'Daftar_Stok_Produk_' . date('d-m-Y');
        // Redirect hasil generate xlsx ke web browser
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename=' . $namaFile . '.xlsx');
        $writer->save('php://output');
        exit;
    }

    // public function downloadPDF()
    // {

    //     $view = view('item/laporanPDF');
    //     // instantiate and use the dompdf class
    //     $dompdf = new Dompdf();
    //     $dompdf->loadHtml($view);

    //     // (Optional) Setup the paper size and orientation
    //     $dompdf->setPaper('A4', 'potrait');

    //     // Render the HTML as PDF
    //     $dompdf->render();

    //     // Output the generated PDF to Browser
    //     $dompdf->stream("Laporan-Daftar Produk", array("Attachment" => false));
    // }
}
