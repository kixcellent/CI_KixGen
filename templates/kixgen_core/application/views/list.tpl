<!--Begin Datatables-->
<div class="row">
  <div class="col-lg-12">
        <div class="box inverse">
            <header>
                <div class="icons"><i class="icon-move"></i></div>
                <h5>List of <?php echo $table_name; ?></h5>
                <div class="toolbar">
                    <ul class="nav pull-right">
                        <li><a href="%NAME_TABLE%/create/">New record</a></li>
                        <li>
                            <a class="accordion-toggle minimize-box" data-toggle="collapse" href="#div-1">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- /.toolbar -->
            </header>
            <div id="div-1" class="body">

                <?php if(!empty( $%NAME_TABLE%_data )) { ?>
                <form action="%NAME_TABLE%/delete" method="post" id="listing_form">
                    <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                            <tr>
                                <th width="20"> </th>
                                %TABLE_HEADER%
                                <th width="100">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                    	<?php foreach($%NAME_TABLE%_data as $row) : ?>
                            <tr class="">
                                <td><input type="checkbox" class="checkbox" name="delete_ids[]" value="<?php echo $row['%FIELD_ID%']; ?>" /></td>
                                %TABLE_CONTENTS%
                                <td width="100">
                                    <a href="%NAME_TABLE%/show/<?php echo $row['%FIELD_ID%']; ?>"><img src="assets/img/view.png" alt="Show record" /></a>
                                    <a href="%NAME_TABLE%/edit/<?php echo $row['%FIELD_ID%']; ?>"><img src="assets/img/edit.png" alt="Edit record" /></a>
                                    <a href="javascript:chk('%NAME_TABLE%/delete/<?php echo $row['%FIELD_ID%']; ?>')"><img src="assets/img/delete.png" alt="Delete record" /></a>
                                </td>
                		    </tr>
                    	<?php endforeach; ?>
                	   </tbody>
                    </table>
                    <div class="actions-bar wat-cf">
                        <div class="actions">
                            <button class="btn btn-danger btn-sm btn-grad" type="submit">
                                <img src="assets/img/icons/cross.png" alt="Delete"> Delete selected
                            </button>
                        </div>
                        <!-- div class="pagination">
                            <?php echo $pager; ?>
                        </div -->
                    </div>
                </form>
                <?php } else { ?>
                    No records found.
                <?php } ?>

            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->