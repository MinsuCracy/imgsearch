<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>test</title>
<!--         <meta name="description" content="A responsive folded flyer-like restaurant menu with some 3D" /> -->
<!--         <meta name="keywords" content="css3, perspective, 3d, jquery, transform3d, responsive, template, restaurant, menu, leaflet, folded, flyer, concept" /> -->
<!--         <meta name="author" content="Codrops" /> -->
<!--         <link rel="shortcut icon" href="../favicon.ico">  -->
        <link rel="stylesheet" type="text/css" href="/resources/main/menuView/css/style.css" />
<!-- 		<link href='http://fonts.googleapis.com/css?family=Raleway:300,500|Arvo:700' rel='stylesheet' type='text/css'> -->
		<script type="text/javascript" src="/resources/main/menuView/js/modernizr.custom.79639.js"></script> 
		
		<!--[if lte IE 8]><style>.support-note .note-ie{display:block;}</style><![endif]-->

		
</head>
    
    
    <body>
<!--         <div class="container"> -->
		
<!-- 		<br><br> -->
			
			<section class="main">

				<div id="rm-container" class="rm-container">

					<div class="rm-wrapper">

						<div class="rm-cover">

							<div class="rm-front">
								<div class="rm-content">

									<div class="rm-logo"></div>
									<h2>가게이름</h2>
									<h3>test</h3>

									<a href="#" class="rm-button-open">View the Menu</a>
<!-- 									<div class="rm-info"> -->
<!-- 										<p> -->
<!-- 										<strong>Gourmet Castle Restaurant</strong><br> -->
<!-- 										246 Wonderful Paradise Ln.<br> -->
<!-- 										Pasadena, CA 91101<br> -->
<!-- 										<strong>Phone</strong> 626.511.1170<br> -->
<!-- 										<strong>Fax</strong> 626.992.1020</p> -->
<!-- 									</div> -->

								</div><!-- /rm-content -->
							</div><!-- /rm-front -->

							<div class="rm-back">
								<div class="rm-content">
									<h4>Appetizers</h4>
<!-- 									<dl> -->
<!-- 										<dt>Bella's Artichokes</dt> -->
<!-- 										<dd>Roasted artichokes with chipotle aioli and cream cheese</dd> -->

<!-- 										<dt>Bruschetta Blue Delight</dt> -->
<!-- 										<dd>Blue cheese and citrus bruschetta</dd> -->

<!-- 										<dt>Pomme Dulse</dt> -->
<!-- 										<dd>Baked potatoes with crisped dulse</dd> -->

<!-- 										<dt><a href="http://herbivoracious.com/2011/11/crostini-with-young-pecorino-grilled-figs-and-arugula-mint-pesto-recipe.html" class="rm-viewdetails" data-thumb="images/1.jpg">Green Love Crostini</a></dt> -->
<!-- 										<dd>Crostini with young pecorino, grilled figs and arugula &amp; mint pesto</dd> -->
										
<!-- 										<dt>Focaccia di Carciofi</dt> -->
<!-- 										<dd>Artichoke focaccia with fresh thyme</dd> -->
<!-- 									</dl> -->

<!-- 									<h4>Salads &amp; More</h4> -->
<!-- 									<dl> -->
<!-- 										<dt>Green Delight</dt> -->
<!-- 										<dd>Watercress, frisee and avocado salad</dd> -->

<!-- 										<dt><a href="http://herbivoracious.com/2010/02/thai-tofu-salad-recipe.html" class="rm-viewdetails" data-thumb="images/13.jpg">Gourmet Yam Taohu</a></dt> -->
<!-- 										<dd>Thai tofu salad yam taohu</dd> -->

<!-- 										<dt>Panini Deluxe</dt> -->
<!-- 										<dd>Buffalo mozzarella basil panini</dd> -->
<!-- 									</dl> -->
								</div><!-- /rm-content -->
								<div class="rm-overlay"></div>

							</div><!-- /rm-back -->

						</div><!-- /rm-cover -->

						<div class="rm-middle">
							<div class="rm-inner">
								<div class="rm-content">
									<h4>Main Courses</h4>
									
										<h5>${menuList }</h5>
<!-- 									<dl> -->
<!-- 										<dt><a href="http://herbivoracious.com/2009/03/panfried-gnocchi-with-arugula-recipe.html" class="rm-viewdetails" data-thumb="images/11.jpg">Crispy Gnocchi with Arugula</a></dt> -->
<!-- 										<dd>Pan-fried potato gnocchi with arugula salad</dd> -->

<!-- 										<dt>Sea Palm Spicy Peanut Curry</dt> -->
<!-- 										<dd>Tender sea palm noodles, seasoned vegetables, spicy peanut curry and tempeh fenel croquettes</dd> -->

<!-- 										<dt><a href="http://herbivoracious.com/2012/09/caviar-lentil-salad-with-arugula-crispy-shallots-and-roasted-garlic-recipe.html" class="rm-viewdetails" data-thumb="images/8.jpg">Lentil Caviar &amp; Arugula</a></dt> -->
<!-- 										<dd>Black lentil curry with arugula salad, caramelized shallots and roasted garlic</dd> -->

<!-- 										<dt>Tamari-Maple Glazed Tofu</dt> -->
<!-- 										<dd>Wasabi emulsion, sesame seeds and scallions</dd> -->

<!-- 										<dt>Maple Barbeque Tofu</dt> -->
<!-- 										<dd>Grilled marinated tofu, maple barbeque sauce, tahini slaw, grilled seasonal vegetables and mashed potatoes</dd> -->
																													
<!-- 										<dt><a href="http://herbivoracious.com/2012/07/king-oyster-mushroom-with-roasted-cherries-and-sage-no-that-isnt-meat-recipe-and-thought-process.html" class="rm-viewdetails" data-thumb="images/4.jpg">Luxur Oyster</a></dt> -->
<!-- 										<dd>King oyster mushroom with roasted cherries and sage</dd> -->
										
<!-- 										<dt><a href="http://herbivoracious.com/2012/09/rigatoni-with-roasted-cauliflower-and-spicy-tomato-sauce-recipe.html" class="rm-viewdetails" data-thumb="images/3.jpg">Rigatoni di Cavolfiore</a></dt> -->
<!-- 										<dd>Rigatoni with roasted cauliflower and spicy tomato sauce</dd> -->
										
<!-- 										<dt><a href="http://herbivoracious.com/2012/06/saffron-chickpea-stew-with-grilled-porcini-mushroom-recipe.html" class="rm-viewdetails" data-thumb="images/14.jpg">Saffron Chana Secret</a></dt> -->
<!-- 										<dd>Saffron chickpea stew with grilled porcini mushrooms</dd> -->
<!-- 									</dl> -->
								</div><!-- /rm-content -->
								<div class="rm-overlay"></div>
							</div><!-- /rm-inner -->
						</div><!-- /rm-middle -->

						<div class="rm-right">

							<div class="rm-front">
								
							</div>

							<div class="rm-back">
								<span class="rm-close">Close</span>
								<div class="rm-content">
									<h4>Desserts</h4>
<!-- 									<dl> -->
<!-- 										<dt><a href="http://herbivoracious.com/2012/08/crepes-with-roasted-french-plums-yogurt-and-honey.html" class="rm-viewdetails" data-thumb="images/5.jpg">French Plum Crepes</a></dt> -->
<!-- 										<dd>Crepes with roasted french plums, yogurt &amp; honey</dd> -->
										
<!-- 										<dt><a href="http://herbivoracious.com/2012/05/butterscotch-pudding-with-bittersweet-ganache-and-caramelize-white-chocolate-crunchies-recipe.html" class="rm-viewdetails" data-thumb="images/6.jpg">Butterscotch Pudding</a></dt> -->
<!-- 										<dd>Butterscotch pudding with bittersweet ganache and caramelize white chocolate crispies</dd> -->
										
<!-- 										<dt><a href="http://herbivoracious.com/2009/12/gateaux-de-crepes-recipe.html" class="rm-viewdetails" data-thumb="images/12.jpg">Chocolate Gâteau de Crêpes</a></dt> -->
<!-- 										<dd>Gâteau de crêpes with chocolate pastry cream and dulce de leche</dd> -->
										
<!-- 										<dt><a href="http://herbivoracious.com/2009/05/dutch-baby-with-sauteed-apples-giant-ovenbaked-pancakes-recipe.html" class="rm-viewdetails" data-thumb="images/10.jpg">Dutch Baby With Sauteed Apples</a></dt> -->
<!-- 										<dd>Dutch ginat oven-baked pancakes with sauteed apples</dd> -->
										
<!-- 										<dt><a href="http://herbivoracious.com/2008/08/blueberry-napol.html" class="rm-viewdetails" data-thumb="images/7.jpg">Blueberry Napoleon</a></dt> -->
<!-- 										<dd>Blueberry Napoleon with crème fraîche and raspberry powder</dd> -->
										
<!-- 										<dt><a href="http://herbivoracious.com/2008/09/rings-of-saturn.html" class="rm-viewdetails" data-thumb="images/2.jpg">Rings of Saturn</a></dt> -->
<!-- 										<dd>Saturn peach on challah french toast</dd> -->
										
<!-- 										<dt><a href="http://herbivoracious.com/2008/04/recipe-atayef.html" class="rm-viewdetails" data-thumb="images/9.jpg">Classic Atayef</a></dt> -->
<!-- 										<dd>Syrian ricotta-filled dessert pancakes</dd> -->
<!-- 									</dl> -->
									<div class="rm-order">
<!-- 										<p><strong>Would you like us to cater your event?</strong> Call us &amp; we'll help you find a venue and organize the event: <strong>626.511.1170</strong></p> -->
									</div>
								</div><!-- /rm-content -->
							</div><!-- /rm-back -->

						</div><!-- /rm-right -->
					</div><!-- /rm-wrapper -->

				</div><!-- /rm-container -->

			</section>
			
<!--         </div> -->
		<!-- jQuery if needed -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
        <script type="text/javascript" src="/resources/main/menuView/js/menu.js"></script>
		<script type="text/javascript">
			$(function() {

				Menu.init();
			
			});
		</script>
    </body>
</html>
