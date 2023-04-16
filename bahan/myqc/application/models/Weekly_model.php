<?php
class Weekly_model extends CI_Model
{
    public $db2;

    function __construct(){
        parent::__construct();
        $this->db2 =  $this->load->database('otherdb', TRUE);
    }

    public function selectGrafik(){

        $db2 = $this->load->database('otherdb', TRUE);

        $query = $this->db2->query("SELECT * FROM grafik ORDER BY date DESC LIMIT 6");

        return $query->result_array();
    }

    
}
