<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Target extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('targetModel');
        $this->load->model('daily_model');
    }

    public function index()
    {
        $data['title'] = 'Target Harian';
        $data['target'] = $this->targetModel->get_data();
        $this->load->view('layout/header', $data);
        $this->load->view('layout/navbar');
        $this->load->view('target/targetView', $data);
        $this->load->view('target/addModal');
        $this->load->view('layout/footer');
    }

    public function addData()
    {
        $data['target'] = $this->targetModel->get_data();
        $this->load->view('layout/header');
        $this->load->view('layout/navbar');
        $this->load->view('target/addModal', $data);
        $this->load->view('layout/footer');
    }

    public function create()
    {
        $this->targetModel->create();
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">
                Data Baru Berhasil Ditambahkan
                </div>');
        redirect('/');
    }

    public function editData($id)
    {
        $data['title'] = 'Edit Data';
        $data['target'] = $this->targetModel->get_id_target($id);
        $this->load->view('layout/header', $data);
        $this->load->view('layout/navbar');
        $this->load->view('layout/footer');
    }

    public function update($id)
    {
        $this->targetModel->update($id);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">
                Data Berhasil Diupdate
                </div>');
        redirect('/');
    }

    public function delete($id)
    {
        $this->targetModel->delete($id);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">
                Data Berhasil Dihapus
                </div>');
        redirect('/');
    }
}
