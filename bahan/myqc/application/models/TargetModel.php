<?php defined('BASEPATH') or exit('No direct script access allowed');

class Targetmodel extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        $this->db2 =  $this->load->database('otherdb', TRUE);
    }
    protected $useTimestamps = true;
    public function get_data()
    {
        $db2 = $this->load->database('otherdb', TRUE);
        $query = $this->db2->query('SELECT * FROM target');
        return $query->result_array();
    }

    public function create()
    {
        $db2 = $this->load->database('otherdb', TRUE);
        date_default_timezone_set('Asia/Jakarta');
        $data = [
            'target_hari' => $this->input->post('target_hari'),
            'target_total' => $this->input->post('target_total'),
            'target_s1' => $this->input->post('target_s1'),
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ];
        $this->db2->INSERT('target', $data);
    }

    public function delete($id)
    {
        $db2 = $this->load->database('otherdb', TRUE);
        $this->db2->where('id_target', $id);
        $this->db2->delete('target');
    }

    public function get_id_target($id)
    {
        $db2 = $this->load->database('otherdb', TRUE);
        return $this->db2->get_where('target', ['id_target' => $id])->row_array();
    }

    public function update()
    {
        date_default_timezone_set('Asia/Jakarta');
        $db2 = $this->load->database('otherdb', TRUE);
        $data = [
            'target_hari' => $this->input->post('target_hari'),
            'target_total' => $this->input->post('target_total'),
            'target_s1' => $this->input->post('target_s1'),
            'updated_at'         => date('Y-m-d H:i:s')
        ];
        $this->db2->where('id_target', $this->input->post('id_target'));
        $this->db2->update('target', $data);
    }
}
