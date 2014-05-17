<!--Begin Datatables-->
<div class="row">
  <div class="col-lg-12">
        <div class="box inverse">
            <header>
                <div class="icons"><i class="icon-move"></i></div>
                <h5>Details of <?php echo $table_name; ?>, record #<?php echo $id; ?></h5>
                <div class="toolbar">
                    <ul class="nav pull-right">
                        <li><a href="%NAME_TABLE%">Listing</a></li>
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

                <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                    <thead>
                        <tr>
                            <th width="20%"></th>
                            <th></th>
                        </tr>
                	</thead>
				    %RECORD_FIELDS%
				</table>
                <div class="actions-bar wat-cf">
                    <div class="actions">
                        <a class="button" href="%NAME_TABLE%/edit/<?php echo $id; ?>">
                            <img src="assets/img/icons/application_edit.png" alt="Edit record"> Edit record
                        </a>
                    </div>
                </div>
                
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->