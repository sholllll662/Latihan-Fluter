<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Grafik</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <!-- My CSS -->

    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/style.css">

    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#"><img class="logoNSI" src="<?php echo base_url() ?>assets/img/logo_nsi.jpg" alt="NSI"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link navbar" href="/myqc/target">Target</a>
                    <a class="nav-link navbar" href="/myqc/grafik">Data</a>
                    <a class="nav-link navbar" href="/myqc/QcController">Display</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
                <h1 class="my-3">Data Grafik</h1>

                <div class="add">
                    <!-- <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">
                        Add
                    </button> -->
                </div>
                <table id="tabel-grafik" class="table table table-bordered border-primary table-success table-striped">
                    <thead>
                        <tr>
			    <th>Date</th>
                            <th>Aktual</th>
                            <th>Target Total</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($grafik as $g) : ?>
                            <tr>
				<td><?= $g['date']; ?></td>
                                <td><?= $g['aktual']; ?></td>
                                <td><?= $g['target']; ?></td>                                
                                <td>
                                    <a href="<?php echo base_url() ?>Grafik/delete/<?php echo $g['id'] ?>" class="btn btn-danger btn-sm btn-edit" onclick="return confirm('Apakah Anda yakin?');">Delete</a>

                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
    </div>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.4/b-2.2.2/b-colvis-2.2.2/b-html5-2.2.2/b-print-2.2.2/r-2.2.9/sl-1.3.4/datatables.min.css"/>
 
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.4/b-2.2.2/b-colvis-2.2.2/b-html5-2.2.2/b-print-2.2.2/r-2.2.9/sl-1.3.4/datatables.min.js"></script>


    <script type="text/javascript">
     $(function () {
        $("#tabel-grafik").DataTable({
	columnDefs: [{orderable: false, targets:3}], order: [[0, 'desc']],
        "responsive": true, "lengthChange": false, "autoWidth": false, 
        "buttons": [
            {
                extend: "copy",
                exportOptions: {
                    columns: [ 0, 1, 2 ]
                }
            }, 
            {
                extend: "csv",
                exportOptions: {
                    columns: [ 0, 1, 2 ]
                }
            }, 
            {
                extend: "excel",
                exportOptions: {
                    columns: [ 0, 1, 2 ]
                }
            }, 
            {
                extend: "pdf",
                exportOptions: {
                    columns: [ 0, 1, 2 ]
                }
            }, 
            {
                extend: "print",
                exportOptions: {
                    columns: [ 0, 1, 2 ]
                }
            }
            ]
        }).buttons().container().appendTo('#tabel-grafik_wrapper .col-md-6:eq(0)');
	
    });
    </script>
</body>
</html>
