<!DOCTYPE html>
<!-- 
Project Name: %DATABASE_NAME% - Metis Responsive Admin Dashboard build with Twitter Bootstrap 3.0
Version: 20140203 v1.0
Author: Francis S. Crisostomo
-->
<!--[if IE 8]><html lang="en" class="ie8 no-js"><![endif]-->
<!--[if IE 9]><html lang="en" class="ie9 no-js"><![endif]-->
<!--[if !IE]><!--><html lang="en" class="no-js"><!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>%DATABASE_NAME% | Admin Dashboard</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="%DATABASE_NAME%" />
    <meta name="author" content="Francis S. Crisostomo <francis.crisostomo@talinongpinoy.com>" />
    <meta name="MobileOptimized" content="320">
    <base href="<?php echo base_url(); ?>" />

    <link rel="stylesheet" href="assets/lib/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/lib/Font-Awesome/css/font-awesome.css" />

    <link rel="stylesheet" href="assets/lib/fullcalendar-1.6.2/fullcalendar/fullcalendar.css" />
    <link rel="stylesheet" href="assets/lib/datatables/css/DT_bootstrap.css">
    
    <link rel="stylesheet" href="assets/css/theme.css" />
    
</head><!-- END HEAD -->

<!-- BEGIN BODY -->
<body id="">

<?php if($logged_in == true) { ?>

    <div id="wrap">

        <div id="top">
            <!-- .navbar -->
            <nav class="navbar navbar-inverse navbar-static-top">
                <!-- Brand and toggle get grouped for better mobile display -->
                <header class="navbar-header">
                    <a class="navbar-brand" href="dashboard">%DATABASE_NAME%</a>
                </header>    

                <div class="topnav">

                    <div class="btn-toolbar">
                        <div class="btn-group">
                            <a data-placement="bottom" data-original-title="Show / Hide Sidebar" data-toggle="tooltip" class="btn btn-success btn-sm" id="changeSidebarPos">
                                <i class="icon-resize-horizontal"></i>
                            </a>
                        </div>
                        <div class="btn-group">
                            <a href="login/logout" data-toggle="tooltip" data-original-title="Logout" data-placement="bottom" class="btn btn-metis-1 btn-sm">
                      <i class="icon-off"></i>
                            </a>
                        </div>
                    </div>

                </div>
                <!-- /.topnav -->
            </nav>
            <!-- /.navbar -->

            <!-- header.head -->
            <header class="head">
                <div class="search-bar">
                    <a data-original-title="Show/Hide Menu" data-placement="bottom" data-tooltip="tooltip" class="accordion-toggle btn btn-primary btn-sm visible-xs" data-toggle="collapse" href="#menu" id="menu-toggle">
                        <i class="icon-sort"></i>
                    </a>

                    <form class="main-search">
                        <div class="input-group">
                            <input type="text" class="input-small form-control" placeholder="Live Search ...">
                            <span class="input-group-btn">
                                <button class="btn btn-default btn-sm" type="button"><i class="icon-search"></i></button>
                            </span>
                        </div>
                    </form>

                </div>
                <!-- ."main-bar -->
                <div class="main-bar">
                    <h3><?php if(isset($table_name)) { ?><i class="icon-tasks"></i> <?php echo $table_name; } else { ?><i class="icon-dashboard"></i> Dashboard<?php } ?></h3>
                </div>
                <!-- /.main-bar -->
            </header>
            <!-- end header.head -->

        </div>
        <!-- /#top -->

        <div id="left">
            <!-- #menu -->
            <ul id="menu" class="collapse">
                <li class="nav-header">Menu</li>
                <li class="nav-divider"></li>
                <li><a href="#"><i class="icon-dashboard"></i> Dashboard</a></li>
                %LIST_OF_TABLES%
            </ul>
            <!-- /#menu -->
        </div>
        <!-- /#left -->

        <div id="content">
            <div class="outer">
                <div class="inner">

                    <?php include("$template.php"); ?>

                </div>
                <!-- end .inner -->
            </div>
            <!-- end .outer -->
        </div>
        <!-- end #content -->            

    </div>
    <!-- /#wrap -->    

    <div id="footer">        
        <p>2014 &copy; %DATABASE_NAME%</p>
    </div>

    <!-- #helpModal -->        
    <div id="helpModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->        
    <!-- /#helpModal -->

<?php } else { ?>

    <?php include("form_login.php"); ?>

<?php } ?>

    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <!--script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/lib/jquery-2.0.3.min.js"><\/script>')</script --> 

    <script src="assets/lib/bootstrap/js/bootstrap.js"></script>

    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    
    <script src="assets/lib/fullcalendar-1.6.2/fullcalendar/fullcalendar.min.js"></script>
    <script src="assets/lib/tablesorter/js/jquery.tablesorter.min.js"></script>
    <script src="assets/lib/sparkline/jquery.sparkline.min.js"></script>
    <script src="assets/lib/flot/jquery.flot.js"></script>
    <script src="assets/lib/flot/jquery.flot.selection.js"></script>
    <script src="assets/lib/flot/jquery.flot.resize.js"></script>
    <script src="assets/lib/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    <script src="assets/lib/datatables/jquery.dataTables.js"></script>
    <script src="assets/lib/datatables/DT_bootstrap.js"></script>
    <script src="assets/lib/tablesorter/js/jquery.tablesorter.min.js"></script>
    <script src="assets/lib/touch-punch/jquery.ui.touch-punch.min.js"></script>

    <script src="assets/js/main.js"></script>

   <script>
        $(function() { metisTable(); metisSortable();});
    </script>

</body>
</html>