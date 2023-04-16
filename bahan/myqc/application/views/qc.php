<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="19">
    <title>Display QC</title>

    <!-- Bootstrap CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
    <!-- <script src="<?= base_url('assets/js/moment-with-locales.min.js') ?>"></script> -->
    <!-- <link rel="stylesheet" href="<?= base_url('assets/css/bootstrap.min.css') ?>" /> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <style>
        /* Slide effect for page */
        #slideshow { 
        /* margin: 1px auto;  */
        position: absolute; 
        width: 100%; 
        height: 100%; 
        padding: 5px;  
        }

        #slideshow > div { 
        position: absolute; 
        top: 3px; 
        left: 10px; 
        right: 10px; 
        bottom: 10px; 
        }
    </style>
</head>
<body>
    <?php
        //Set month name 
        $monthArray = array(
            "Jan",
            "Feb",
            "Mar",
            "Apr",
            "Mei",
            "Jun",
            "Jul",
            "Agu",
            "Sep",
            "Okt",
            "Nov",
            "Des"
        );

        //Set date range for last 6 days
        $dateYes =  explode('-',$grafik[0]['date']); 
        $dtYes =  $dateYes[2];                
        $monthYes = $monthArray[$dateYes[1]-1];      
        $yearYes = $dateYes[0];

        $dateSix = explode('-',$grafik[5]['date']);
        $dtSix = $dateSix[2];
        $monthSix = $monthArray[$dateSix[1]-1];
        $yearSix = $dateSix[0];

        //Testing actual value from database SQL Server
        $testS1 =  $shift1;
        $testS2 =  $shift2Today + $shift2Tomorrow;
        $testAktual = $testS1+$testS2;
    ?> 

    <div id="slideshow">
        <!-- Slide for actual today -->
        <div>
            <?php //print_r($testS1) ?>
            <h2 class="text-center mt-2" id="dt1"></h2>
 
            <div class="container-fluid text-center">
                <div class="row mt-3 mx-2">
                    <div class="col mr-1">
                        <!-- Set data color : Green if actual >= target ; Red if actual < target -->
                        <?php
                        if($testAktual>$target_total){
                            echo '<div class="row bg-success" style="height:320px; color:white; border-radius:18px;">';
                        } else {
                            echo '<div class="row bg-danger" style="height:320px; color:white; border-radius:18px;">';
                        }
                        ?>
                            <div class="mx-auto my-auto">
                                <h2>AKTUAL</h2>
                                <p class="display-3 font-weight-bold" style="font-size:90px"><?= number_format($testAktual); ?></p>
                            </div>      
                        </div>
                        <div class="row bg-primary mt-2" style="height:320px; color:white; border-radius:18px;">
                            <div class="mx-auto my-auto">
                                <h2>TARGET</h2>
                                <p class="display-3 font-weight-bold" style="font-size:90px"><?php echo number_format($target_total) ?></p>
                            </div>      
                        </div>
                    </div>

                    <?php
                        // Set date range for current worktime
                        date_default_timezone_set('Asia/Jakarta');

                        $hour = date('H'); 

                        $dateYesterday = date('d/m/Y', strtotime("-1 days"));
                        $dateYesterday_temp = explode('/',$dateYesterday);
                        $month = $monthArray[$dateYesterday_temp[1]-1];
                        $dateYesterday_format = $dateYesterday_temp[0].' '.$month.' '.$dateYesterday_temp[2].' (07.00)';

                        $dateToday = date('d/m/Y');
                        $dateToday_temp = explode('/',$dateToday);
                        $month = $monthArray[$dateToday_temp[1]-1];
                        $dateToday_format = $dateToday_temp[0].' '.$month.' '.$dateToday_temp[2].' (07.00)';

                        $dateTomorrow = date('d/m/Y', strtotime("+1 days"));
                        $dateTomorrow_temp = explode('/',$dateTomorrow);
                        $month = $monthArray[$dateTomorrow_temp[1]-1];
                        $dateTomorrow_format = $dateTomorrow_temp[0].' '.$month.' '.$dateTomorrow_temp[2].' (07.00)';

                        if($hour < 7){
                            $dateRange = $dateYesterday_format.' - '.$dateToday_format;
                        } else {
                            $dateRange = $dateToday_format.' - '.$dateTomorrow_format;
                        }


                        echo '
                        <div class="col-7 ml-1" style="height:650px; border-radius:18px;">';


                        //Show percentage of actual and target
                        if($testAktual>$target_total){
                            echo '<div class="row bg-success" style="height:650px; color:white; border-radius:18px;">';
                        } else {
                            echo '<div class="row bg-danger" style="height:650px; color:white; border-radius:18px;">';
                        }

                        //Count shift 2 actual percentage
                        if($target_total-$target_s1 == 0){
                            $aktual_shift2 = 0;
                        } else {
                            $aktual_shift2 = round((($testS2/($target_total-$target_s1))*100),1);
                        }

                        echo '
                                <div class="mx-auto my-auto">
                                    <p class="" style="font-size:85px ; font-weight:bold; display: inline-block">S1 ~ '.round((($testS1/$target_s1)*100),1).' </p>
                                    <h2 style="display: inline-block"> %</h2>
                                    <br>
                                    <p class="mt-2 " style="font-size:85px ; font-weight:bold; display: inline-block">S2 ~ '.$aktual_shift2.' </p>
                                    <h2 style="display: inline-block"> %</h2>
                                    <br>
                                    <p class="mt-2 " style="font-size:85px ; font-weight:bold; display: inline-block">Total ~ '.round((($testAktual/$target_total)*100),1).' </p>
                                    <h2 style="display: inline-block"> %</h2>
                                    <br>
                                    <h2 class="mt-3" id="" style="display:inline-block">'.$dateRange.'</h2>
                                </div>  
                            </div>  
                        </div>
                        ';
                    ?>
                </div>
            </div>
        </div>

        <!-- Slide for data from last 6 days -->
        <div class="container-fluid text-center">
            <?php echo '<h3 class="mt-1">' .$dtSix.' '.$monthSix.' '.$yearSix.' - '.$dtYes.' '.$monthYes.' '.$yearYes.'</h3>' ?>
            
            <div class="row mx-auto mt-3">

                <!-- First Column -->
                <div class="col">

                    <?php
                    for($i=0;$i<2;$i++){
                        //Date formatting
                        $dateFormat = explode('-',$grafik[$i]['date']);
                        $date = $dateFormat[2];
                        $month = $dateFormat[1];
                        $year = $dateFormat[0];

                        $monthName = $monthArray[$month-1];

                        //If the actual result passed the target, color = green
                        if($grafik[$i]['aktual']>=$grafik[$i]['target']){
                            echo '
                                <div class="row bg-success mb-3" style="height:300px; color:white; border-radius:15px;">      
                            ';
                        } 
                        //If the actual result is lower than the target, color = red
                        else {
                            echo '
                                <div class="row bg-danger mb-3" style="height:300px; color:white; border-radius:15px;">
                            ';
                        }

                        echo'
                        <div class="mx-auto my-auto">
                                <h2>'.$date.' '.$monthName.' '.$year.'</h2>
                                <p style="display: inline-block; font-size:100px; font-weight: bold;">'.round((($grafik[$i]['aktual']/$grafik[$i]['target'])*100),1).'</p>
                                <h2 style="display: inline-block"> %</h2>
                            </div> 
                        </div>
                        ';
                    }
                    ?>

                </div>
                <!-- Second Column -->
                <div class="col mx-3">
                    <?php

                    for($i=2;$i<4;$i++){
                        //Date formatting
                        $dateFormat = explode('-',$grafik[$i]['date']);
                        $date = $dateFormat[2];
                        $month = $dateFormat[1];
                        $year = $dateFormat[0];

                        $monthName = $monthArray[$month-1];

                        //If the actual result passed the target, color = green
                        if($grafik[$i]['aktual']>=$grafik[$i]['target']){
                            echo '
                                <div class="row bg-success mb-3" style="height:300px; color:white; border-radius:15px;">
                            ';
                        } 
                        //If the actual result is lower than the target, color = red
                        else {
                            echo '
                                <div class="row bg-danger mb-3" style="height:300px; color:white; border-radius:15px;">
                            ';
                        }

                        echo '
                            <div class="mx-auto my-auto">
                                <h2>'.$date.' '.$monthName.' '.$year.'</h2>
                                <p style="display: inline-block; font-size:100px; font-weight: bold;">'.round((($grafik[$i]['aktual']/$grafik[$i]['target'])*100),1).'</p>
                                <h2 style="display: inline-block"> %</h2>
                            </div> 
                        </div>';
                    }
                    ?>
                </div>
                <!-- Third Column -->
                <div class="col">
                    <?php

                    for($i=4;$i<6;$i++){
                        //Date formatting
                        $dateFormat = explode('-',$grafik[$i]['date']);
                        $date = $dateFormat[2];
                        $month = $dateFormat[1];
                        $year = $dateFormat[0];

                        $monthName = $monthArray[$month-1];

                        //If the actual result passed the target, color = green
                        if($grafik[$i]['aktual']>=$grafik[$i]['target']){
                            echo '
                                <div class="row bg-success mb-3" style="height:300px; color:white; border-radius:15px;">
                            ';
                        } 
                        //If the actual result is lower than the target, color = red
                        else {
                            echo '
                                <div class="row bg-danger mb-3" style="height:300px; color:white; border-radius:15px;">
                            ';
                        }
                            echo '
                                <div class="mx-auto my-auto">
                                    <h2>'.$date.' '.$monthName.' '.$year.'</h2>
                                    <p style="display: inline-block; font-size:100px; font-weight: bold;">'.round((($grafik[$i]['aktual']/$grafik[$i]['target'])*100),1).'</p>
                                    <h2 style="display: inline-block"> %</h2>
                                </div> 
                            </div>';
                    }
                    ?>
                </div>
            </div>
        </div>

    </div>
</body>
</html>

<script>
    //Slide animation
    $("#slideshow > div:gt(0)").hide();
        setInterval(function() { 
        $('#slideshow > div:first')
        .fadeOut(1000)
        .next()
        .fadeIn(1000)
        .end()
        .appendTo('#slideshow');
    }, 9000);

    //Date Today 
    //Using moment.js  
    var dt1 = moment().locale('id').format('LL');
    document.getElementById('dt1').innerHTML= dt1 ;

</script>
