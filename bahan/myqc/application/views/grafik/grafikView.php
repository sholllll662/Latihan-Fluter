<div class="container">
    <div class="row">
        <div class="col">
            <h1 class="my-3">Data Grafik</h1>

            <div class="add">
                <!-- <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">
                    Add
                </button> -->
            </div>
            <?php echo $this->session->flashdata('pesan'); ?>
            <table class="table table table-bordered border-primary table-success table-striped">
                <thead>
                    <tr>
                        <th scope="col">Aktual</th>
                        <th scope="col">Target Total</th>
                        <th scope="col">Date</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($grafik as $g) : ?>
                        <tr>
                            <td><?= $g['aktual']; ?></td>
                            <td><?= $g['target']; ?></td>
                            <td><?= $g['date']; ?></td>
                            <td>
                                <a href="<?php echo base_url() ?>Grafik/delete/<?php echo $g['id'] ?>" class="btn btn-danger btn-sm btn-edit" onclick="return confirm('Apakah Anda yakin?');">Delete</a>

                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>