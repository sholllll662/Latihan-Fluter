<?php defined('BASEPATH') or exit('No direct script access allowed');

class GrafikModel extends CI_Model
{
    function __construct(){
        parent::__construct();
        $this->db2 =  $this->load->database('otherdb', TRUE);
    }

    public function get_data()
    {
        $db2 = $this->load->database('otherdb', TRUE);
        $query = $this->db2->query('SELECT * FROM grafik order by date DESC');
        return $query->result_array();
    }
    public function delete($id)
    {
        $db2 = $this->load->database('otherdb', TRUE);
        $this->db2->where('id', $id);
        $this->db2->delete('grafik');
    }
}
