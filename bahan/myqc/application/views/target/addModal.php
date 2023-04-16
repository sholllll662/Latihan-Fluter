<!-- Modal -->
<form action="<?php echo base_url() ?>Target/create" method="post">
    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Form Tambah Data</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <?php echo form_open_multipart('Target/addData') ?>
                    <div class="row mb-3">
                        <label for="target_hari" class="col-sm-3 col-form-label">Target Hari</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="target_hari" name="target_hari" autofocus placeholder="Masukkan Hari">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="target_total" class="col-sm-3 col-form-label">Target Total</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="target_total" name="target_total" placeholder="Masukkan Target Total">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label for="target_s1" class="col-sm-3 col-form-label">Target Shift 1</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="target_s1" name="target_s1" placeholder="Masukkan Target Shift 1">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add</button>
                    <?php echo form_close() ?>
                </div>
            </div>
        </div>
    </div>
</form>