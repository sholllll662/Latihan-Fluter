<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Grafik extends CI_Controller
{
    public function index()
    {
        //$data['title'] = 'Data Grafik';
        $this->load->model('grafikModel');
        //$this->load->view('layout/header', $data);
        //$this->load->view('layout/navbar');
        $data['grafik'] = $this->grafikModel->get_data();
        $this->load->view('grafik/grafikNew', $data);
        //$this->load->view('layout/footer');
    }

    public function delete($id)
    {
        $this->grafikModel->delete($id);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success" role="alert">
                Data Berhasil Dihapus
                </div>');
        redirect('grafik');
    }
}
