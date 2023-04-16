<?php
class Daily_model extends CI_Model
{
    function __construct(){
        parent::__construct();
        $this->db2 =  $this->load->database('otherdb', TRUE);
    }

    //Select data target
    public function selectTarget(){
        $db2 = $this->load->database('otherdb', TRUE);

        date_default_timezone_set('Asia/Jakarta');

        //Before 07.00, use the target from yesterday
        $hour = date('H');
        if($hour < 7){
            $day = date('D', strtotime('yesterday'));
        } else {
            $day = date('D');
        }

        //Determine the day for target
        if($day == 'Sat'){
            $sql = "SELECT * FROM target WHERE target_hari='Sabtu'";
        } else if($day == 'Sun'){
            $sql = "SELECT * FROM target WHERE target_hari='Minggu'";
        } else {
            $sql = "SELECT * FROM target WHERE target_hari='Weekday'";
        }

        $query = $this->db2->query($sql);

        //$data =$query->getResultArray();

        return $query->result_array();
    }
    
    
    //Select data for shift 1 (07.00-18.59)
    public function selectShift1(){
        global $db;

        date_default_timezone_set('Asia/Jakarta');

        $hourNow = date('H');

        if($hourNow<7){
            $dateNow = date('Y-m-d', strtotime('yesterday')); 
        } else {
            $dateNow = date('Y-m-d'); 
        }

        //$dateNow = date('Y-m-d');

        $query = $this->db->query("SELECT SUM(Quantity) as res from OIGN as a, IGN1 as b where a.DocEntry = b.DocEntry and b.BaseType = 202 and b.WhsCode = 'WHFGL' and a.DocDate = '$dateNow' and a.DocTime >= '700' and a.DocTime <= '1859' ");

        return $query->result_array();
    }

    //Select data for shift 2 (19.00 - 23.59)
    public function selectShift2Today(){
        date_default_timezone_set('Asia/Jakarta');  
        $hourNow = date('H');

        if($hourNow<7){
            $dateNow = date('Y-m-d', strtotime('yesterday')); 
        } else {
            $dateNow = date('Y-m-d'); 
        }
        
        $sql = "SELECT SUM(Quantity) as res from OIGN as a, IGN1 as b where a.DocEntry = b.DocEntry and b.BaseType = 202 and b.WhsCode = 'WHFGL' and a.DocDate = '$dateNow' and a.DocTime >= '1901' and a.DocTime <= '2359' ";            

        $query = $this->db->query($sql);

        return $query->result_array();
    }

    //Select data for shift 2 (00.00 - 06.59)
    public function selectShift2Tomorrow(){
        date_default_timezone_set('Asia/Jakarta');  
        $hourNow = date('H');

        if($hourNow<7){
            $dateTomorrow = date('Y-m-d');
        } else {
            $dateTomorrow = date('Y-m-d', strtotime('tomorrow'));
        }
        
        $sql = "select SUM(Quantity) as res from OIGN as a, IGN1 as b where a.DocEntry = b.DocEntry and b.BaseType = 202 and b.WhsCode = 'WHFGL' and a.DocDate = '$dateTomorrow' and a.DocTime >= '0' and a.DocTime <= '659' ";            

        $query = $this->db->query($sql);

        return $query->result_array();
    }

    //Insert target to database
    public function insertTarget(){
        $db2 = $this->load->database('otherdb', TRUE);
        date_default_timezone_set('Asia/Jakarta');
 
        $day = date('D', strtotime('yesterday'));

        //Determine the day for target
        if($day == 'Sat'){
            $sql = "SELECT * FROM target WHERE target_hari='Sabtu'";
        } else if($day == 'Sun'){
            $sql = "SELECT * FROM target WHERE target_hari='Minggu'";
        } else {
            $sql = "SELECT * FROM target WHERE target_hari='Weekday'";
        }

        $query = $this->db2->query($sql);

        return $query->result_array();
    }

    //Insert actual shift 1 data from yesterday
    public function insertShift1(){
        date_default_timezone_set('Asia/Jakarta');
        $dateNow = date('Y-m-d', strtotime('yesterday'));

        $sql = "SELECT SUM(Quantity) as res from OIGN as a, IGN1 as b where a.DocEntry = b.DocEntry and b.BaseType = 202 and b.WhsCode = 'WHFGL' and a.DocDate = '$dateNow' and a.DocTime >= '700' and a.DocTime <= '1859' ";

        $query = $this->db->query($sql);

        return $query->result_array();      
    }

    //Insert actual shift 2 (19.00 - 23.59) from yesterday
    public function insertShift2Today(){
        date_default_timezone_set('Asia/Jakarta');  
        $hourNow = date('H');

        if($hourNow<7){
            $dateNow = date('Y-m-d', strtotime('-2 days')); 
        } else {
            $dateNow = date('Y-m-d', strtotime('yesterday')); 
        }
        
        $sql = "SELECT SUM(Quantity) as res from OIGN as a, IGN1 as b where a.DocEntry = b.DocEntry and b.BaseType = 202 and b.WhsCode = 'WHFGL' and a.DocDate = '$dateNow' and a.DocTime >= '1901' and a.DocTime <= '2359' ";            

        $query = $this->db->query($sql);

        $dataTest = $query->result_array();

        return $dataTest;
    }

    //Insert actual shift 2 (00.00 - 06.59) from today
    public function insertShift2Tomorrow(){
        date_default_timezone_set('Asia/Jakarta');  
        $hourNow = date('H');

        if($hourNow<7){
            $dateTomorrow = date('Y-m-d', strtotime('yesterday'));
        } else {
            $dateTomorrow = date('Y-m-d');
        }
        
        $sql = "select SUM(Quantity) as res from OIGN as a, IGN1 as b where a.DocEntry = b.DocEntry and b.BaseType = 202 and b.WhsCode = 'WHFGL' and a.DocDate = '$dateTomorrow' and a.DocTime >= '0' and a.DocTime <= '659' ";            

        $query = $this->db->query($sql);

        return $query->result_array();
    }
}