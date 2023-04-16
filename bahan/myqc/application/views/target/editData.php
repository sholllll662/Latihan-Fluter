<div class="container-fluid">
    <h3><?php echo $title; ?></h3>

    <form action="<?php echo base_url('target/update') ?>" method="post">

        <input type="hidden" name="id_target" value="<?php echo $target['id_target']; ?>">

        <div class="row mb-3">
            <label for="target_hari" class="col-sm-3 col-form-label">Hari</label>
            <div class="col-sm-9">
                <input type="text" class="form-control target_hari" name="target_hari" required="" value="<?php echo $target['target_hari']; ?>">
            </div>
        </div>

        <div class="row mb-3">
            <label for="target_total" class="col-sm-3 col-form-label">Target Total</label>
            <div class="col-sm-9">
                <input type="text" class="form-control target_total" name="target_total" placeholder="Total Target" required="" value="<?php echo $target['target_total']; ?>">
            </div>
        </div>

        <div class="row mb-3">
            <label for="target_s1" class="col-sm-3 col-form-label">Target Shift 1</label>
            <div class="col-sm-9">
                <input type="text" class="form-control target_s1" name="target_s1" placeholder="Target Shift 1" required="" value="<?php echo $target['target_s1']; ?>">
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Update</button>
            <?php echo form_close() ?>
        </div>
    </form>
</div>