   <div class="container">
       <div class="row">
           <div class="col">
               <h1 class="mt-2">Target Harian</h1>
               <div class="add">
                   <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">
                       Add
                   </button>
               </div>

               <?php echo $this->session->flashdata('pesan'); ?>

               <table class="table table table-bordered border-primary table-success table-striped">
                   <thead>
                       <tr>
                           <th scope="col">Target Hari</th>
                           <th scope="col">Target Total</th>
                           <th scope="col">Target Shift 1</th>
                           <th scope="col">Target Shift 2</th>
                           <th scope="col">Created At</th>
                           <th scope="col">Updated At</th>
                           <th scope="col">Edit</th>
                           <th scope="col">Delete</th>
                       </tr>
                   </thead>
                   <tbody>
                       <?php foreach ($target as $k) : ?>
                           <tr>
                               <?php $shift2 = $k['target_total'] - $k['target_s1'] ?>
                               <td><?= $k['target_hari']; ?></td>
                               <td><?= $k['target_total']; ?></td>

                               <td><?= $k['target_s1']; ?></td>
                               <td><?= $shift2 ?></td>
                               <td><?= $k['created_at']; ?></td>
                               <td><?= $k['updated_at']; ?></td>
                               <td>
                                   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal<?php echo $k['id_target']; ?>">
                                       Edit
                                   </button>

                                   <!-- edit modal -->

                                   <form method="post" action="<?php echo base_url() ?>target/update/<?php echo $k['id_target']; ?>">
                                       <input type="hidden" name="id_target" value="<?php echo $k['id_target'] ?>">
                                       <div class="modal fade" id="editModal<?php echo $k['id_target']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                           <div class="modal-dialog" role="document">
                                               <div class="modal-content">
                                                   <div class="modal-header">
                                                       <h5 class="modal-title" id="exampleModalLabel">Edit Target</h5>
                                                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                   </div>
                                                   <div class="modal-body">
                                                       <div class="row mb-3">
                                                           <label for="target_hari" class="col-sm-3 col-form-label">Hari</label>
                                                           <div class="col-sm-8">
                                                               <input type="text" class="form-control" name="target_hari" required="" value="<?php echo $k['target_hari'] ?>" readonly>
                                                           </div>
                                                       </div>

                                                       <div class="row mb-3">
                                                           <label for="target_total" class="col-sm-3 col-form-label">Target Total</label>
                                                           <div class="col-sm-8">
                                                               <input type="text" class="form-control" name="target_total" required="" value="<?php echo $k['target_total'] ?>">
                                                           </div>
                                                       </div>

                                                       <div class="row mb-3">
                                                           <label for="target_s1" class="col-sm-3 col-form-label">Target Shift 1</label>
                                                           <div class="col-sm-8">
                                                               <input type="text" class="form-control" name="target_s1" required="" value="<?php echo $k['target_s1'] ?>">
                                                           </div>
                                                       </div>

                                                   </div>
                                                   <div class="modal-footer">
                                                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                       <button type="submit" class="btn btn-primary">Update</button>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                   </form>
                               </td>
                               <td>
                                   <a href="<?php echo base_url() ?>Target/delete/<?php echo $k['id_target'] ?>" class="btn btn-danger btn-sm btn-edit" onclick="return confirm('Apakah Anda yakin?');">Delete</a>
                               </td>
                           </tr>
                       <?php endforeach; ?>
                   </tbody>
               </table>
           </div>
       </div>
   </div>