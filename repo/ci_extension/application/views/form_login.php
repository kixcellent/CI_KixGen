<!DOCTYPE html>
<!-- 
Project Name: Abstractdigital - Metis Responsive Admin Dashboard build with Twitter Bootstrap 3.0
Version: 20140203 v1.0
Author: Francis S. Crisostomo
-->
<!--[if IE 8]><html lang="en" class="ie8 no-js"><![endif]-->
<!--[if IE 9]><html lang="en" class="ie9 no-js"><![endif]-->
<!--[if !IE]><!--><html lang="en" class="no-js"><!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Login Page</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <meta name="author" content="Francis S. Crisostomo <francis.crisostomo@talinongpinoy.com>" />
    <meta name="MobileOptimized" content="320">
    <base href="<?php echo base_url(); ?>" />

    <link rel="stylesheet" href="assets/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/lib/magic/magic.css">
  </head>
  <body class="login">
    <div class="container">
      <div class="text-center">
        <img src="assets/img/logo.png" alt="Metis Logo">
      </div>
      <div class="tab-content">
        <div id="login" class="tab-pane active">
          <form action="login/validate" class="form-signin" method="post" enctype="multipart/form-data">
            <p class="text-muted text-center">
              Enter your username and password
            </p>
            <input type="text" name="user" placeholder="Username" class="form-control">
            <input type="password" name="pass" placeholder="Password" class="form-control">
      <?php if(isset($error)) { ?>
      <p class="text-muted text-center">
        Incorrect username or password!
      </p>
      <?php } ?>
            <button class="btn btn-lg btn-primary btn-block" type="submit"><img src="assets/img/icons/key.png" alt="Save" /> Sign in</button>
          </form>
        </div>
        <div id="forgot" class="tab-pane">
          <form action="login/validate" class="form-signin" method="post" enctype="multipart/form-data">
            <p class="text-muted text-center">Enter your valid e-mail</p>
            <input type="email" placeholder="mail@domain.com" required="required" class="form-control">
            <br>
            <button class="btn btn-lg btn-danger btn-block" type="submit">Recover Password</button>
          </form>
        </div>
        <div id="signup" class="tab-pane">
          <form action="login/validate" class="form-signin" method="post" enctype="multipart/form-data">
            <input type="text" placeholder="username" class="form-control">
            <input type="email" placeholder="mail@domain.com" class="form-control">
            <input type="password" placeholder="password" class="form-control">
            <button class="btn btn-lg btn-success btn-block" type="submit">Register</button>
          </form>
        </div>
      </div>
      <div class="text-center">
        <ul class="list-inline">
          <li> <a class="text-muted" href="#login" data-toggle="tab">Login</a>  </li>
          <li> <a class="text-muted" href="#forgot" data-toggle="tab">Forgot Password</a>  </li>
          <li> <a class="text-muted" href="#signup" data-toggle="tab">Signup</a>  </li>
        </ul>
      </div>
    </div><!-- /container -->
    <script src="assets/lib/jquery-2.0.3.min.js"></script>
    <script src="assets/lib/bootstrap/js/bootstrap.js"></script>
    <script>
      $('.list-inline li > a').click(function() {
        var activeForm = $(this).attr('href') + ' > form';
        //console.log(activeForm);
        $(activeForm).addClass('magictime swap');
        //set timer to 1 seconds, after that, unload the magic animation
        setTimeout(function() {
          $(activeForm).removeClass('magictime swap');
        }, 1000);
      });
    </script>
  </body>
</html>