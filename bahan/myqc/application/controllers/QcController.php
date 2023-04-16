<?php 
class QcController extends CI_Controller
{
    function __construct(){
        parent::__construct();
        $this->load->model('daily_model');
        $this->load->database();
        $this->load->model('weekly_model');
        $this->db2=$this->load->database('otherdb', TRUE);
    }

    public function index(){
        
        $db2 = $this->load->database('otherdb',TRUE);

        $target = $this->daily_model->selectTarget();
        $s1 = $this->daily_model->selectShift1();
        $s2Today = $this->daily_model->selectShift2Today();
        $s2Tomorrow = $this->daily_model->selectShift2Tomorrow();

        $weeklyData = $db2->query("SELECT * FROM grafik ORDER BY id DESC LIMIT 6")->result_array();

        $data['target_total'] = $target[0]['target_total'];
        $data['target_s1'] = $target[0]['target_s1'];
        $data['shift1'] = $s1[0]['res'];
        $data['shift2Today'] = $s2Today[0]['res'];
        $data['shift2Tomorrow'] = $s2Tomorrow[0]['res'];

        $data['grafik'] = $weeklyData;

        $this->load->view('qc',$data);
    }

    public function addData(){
        $db2 = $this->load->database('otherdb',TRUE);

        date_default_timezone_set('Asia/Jakarta');

        //Get target
        $target = $this->daily_model->insertTarget();
        $target_total = $target[0]['target_total'];

        //Get data for shift 1
        $shift1 = $this->daily_model->insertShift1();
        $s1 = $shift1[0]['res'];

        //Getdata for shift 2
        $shift2Today = $this->daily_model->insertShift2Today();
        $shift2Tomorrow = $this->daily_model->insertShift2Tomorrow();
        $s2Today = $shift2Today[0]['res'];
        $s2Tomorrow = $shift2Tomorrow[0]['res'];

        $data = array(
            'aktual' => $s1 + $s2Today + $s2Tomorrow,
            'target' => $target_total,
            'date' => date('Y-m-d', strtotime('yesterday'))
        );

        $db2->insert('grafik', $data);
    }
    


}