<!DOCTYPE html>
<html>
<head>
    <title><?php echo $site_title; ?> </title>
    <meta charset="utf8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/static/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/bootstrap-responsive.css" rel="stylesheet">
    <link href="/static/bootstrap.css" rel="stylesheet">
    <link href="/static/NEC.css" rel="stylesheet">

    <style type="text/css">
        body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */

        }

        .preview {
            float: left;
            margin-right: 20px;
        }

        .preview .thumb {
            border: 0 none;
            margin-top: 5px;
            width: 252px;
        }

        .outofstock {
            background-color: red;
            pointer-events: none;
            cursor: default;
        }

        a.outofstock {
            color: white;
        }

        /* Custom container */
        .container-narrow {
            margin: 0 auto;
            max-width: 900px;
            border-style: solid;
            border-color: transparent;
            background-color: #D8D8D8;
            z-index: 9;
            height: 100%;
            -moz-border-radius: 15px;
            border-radius: 15px;

        }

        .container-narrow > hr {
            margin: 30px 0;
        }

        .sidebar-nav {
            padding: 20px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }


    </style>

</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">

            <a class="brand pull-left" href="/"><em><b><?php echo $site_title; ?></b></em></a>
            <?php
                    if (!isset($_COOKIE["username"])){
                      echo '<a class="brand-right" href="/login"><em>Login</em></a>';
            } else {
            echo '<a class="brand-right" href="/myorder"><em>My Order</em></a>';
            echo '<a class="brand-right"> | </em></a>';
            echo '<a class="brand-right" href="/?logout=logout"><em>Welcome, '.$_COOKIE["username"].'</em></a>';
            echo ' ';
            };
            ?>
            <div class="nav-collapse collapse">

            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>  <!-- end of div for nav bar-->

<div class="container">
    <!-- <table class="table table-hover">
    <tr> -->
    <?php
                    if ($state == "ordersuccess"){
                               echo ' <font color="green">Your order is in process.</font> ';
    }
    ?>
    <div class="hero-unit">
        <div>
            <h2 class="text-center"><em><?php echo $site_title; ?></em></h2>
        </div>
        <br/>

        <p>

            Welcome to <?php echo $site_title; ?>! If you would like to purchase an item, please <a
                    href="mailto:webmaster@mycoolstore.com">contact us</a> and we will be happy to help.

        </p>

        <p>

            Check back often for promotional deals and new stock!

        </p>

        <div>


            <?php
				foreach($items as $item) {  ?>
            <div class="preview <?php if ($item->QUAN < 1) echo 'outofstock' ?>">
                <a href="desc?id=<?php echo $item->ID ?>">
                    <?php echo $item->TITLE;?><br>
                    <img src="/static/images/<?php echo $item->IMGSRC ?>" class="thumb"/>
                </a>
            </div>

            <?php

				}
			 ?>

        </div>
        <p style="clear:both"></p>


    </div> <!-- end of the hero-unit-->
</div> <!-- end of the container-->

</body>
</html>
