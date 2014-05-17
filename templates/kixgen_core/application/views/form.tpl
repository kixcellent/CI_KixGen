<div class="box inverse">
    <header>
        <div class="icons"><i class="icon-th-large"></i></div>
        <h5><?php if($action_mode == 'create') { ?>
                Add New <?php echo $table_name ?>
            <?php } else { ?>
                Edit Record: #<?php echo $record_id; ?>
            <?php } ?>
        </h5>

        <div class="toolbar">
            <ul class="nav pull-right">
                <li><a href="%NAME_TABLE%">Listing</a></li>
                <?php if($action_mode == 'edit') { ?>
                    <li><a href="%NAME_TABLE%/create/">New record</a></li>
                <?php } ?>
                <li>
                    <a class="accordion-toggle minimize-box" data-toggle="collapse" href="#div-1">
                        <i class="icon-chevron-up"></i>
                    </a>
                </li>
            </ul>
        </div>
        <!-- /.toolbar -->
    </header>

    <div id="div-1" class="accordion-body collapse in body">

        <?php if(isset($errors)) { ?>
            <div class="alert alert-danger alert-dismissable"><?php echo $errors; ?></div>
        <?php } ?>

        <!-- FORM -->
        <form class="form-horizontal" method='post' action='%NAME_TABLE%/<?php echo $action_mode; ?>/<?php if(isset($record_id)) { echo $record_id; } ?>' enctype="multipart/form-data" role="form">

            %FORM_FIELDS%

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">Submit Button</button>
                    <button type="reset" class="btn btn-danger">Reset Button</button>
                </div>
            </div>
            <!-- /.form-group -->
        </form>
        
    </div>
    <!-- /#div-1 -->
</div>
<!-- /.box inverse -->