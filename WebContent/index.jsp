<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Construim viitorul finantelor tale</title>
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon" />
<meta name="description"
	content="Banii mei - Primul serviciu de gestionare a finantelor proprii, special conceput pentru romani!">
<meta name="keywords"
	content="bani, contabilitate, gestiune, social financing, romani, romania, aplicatie romaneasca, romanian application">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- ===== START CSS ===== -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- ===== END CSS ===== -->
<!-- ===== START JAVASCRIPT ===== -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/options.js"></script>
<!-- ===== END JAVASCRIPT ===== -->

<!-- Histats.com  START (hidden counter)-->
<script type="text/javascript">document.write(unescape("%3Cscript src=%27http://s10.histats.com/js15.js%27 type=%27text/javascript%27%3E%3C/script%3E"));</script>
<a href="http://www.histats.com" target="_blank"
	title="counter create hit"><script type="text/javascript">
try {Histats.start(1,3272314,4,0,0,0,"");
Histats.track_hits();} catch(err){};
</script></a>
<noscript>
	<a href="http://www.histats.com" target="_blank"><img
		src="http://sstatic1.histats.com/0.gif?3272314&101"
		alt="counter create hit" border="0"></a>
</noscript>
<!-- Histats.com  END  -->




</head>
<body>

	<div class="container">
		<div class="sidebar">
			<h1>Banii Mei</h1>
			<div class="working"></div>
			<h3>Aplicatia va fi disponibila in::</h3>
			<div class="arrow"></div>
			<div class="separate"></div>

			<h3>Introdu adresa ta de email</h3>
			<p>Pentru a fi notificat cand lansam</p>
			<div class="subscription">
				<form class="subscription_form" action="SubscribeServlet"
					method="post">
					<span class="border"> <input name="email"
						class="subscription_line email" type="text">
					</span> <input name="send" type="submit" class="subscription_button"
						value="Trimite">
				</form>
				<form class="subscription_form" action="ViewDocummentationServlet"
					method="post">

					<input name="send" type="submit" class="subscription_button"
						value="Vezi mai multe informatii!">
				</form>
				<div id="contactresult"></div>
				<div class="clear"></div>
			</div>
			<div class="social">

				<ul class="social_icons">

					<li><a class="facebook show-tooltip" title="Facebook"
						href="https://www.facebook.com/baniimeiro/"></a></li>

				</ul>
				<div class="clear"></div>
			</div>
		</div>
		<div class="content">
			<div class="top_line"></div>
			<div class="top_head"></div>
			<div class="bottle_box">
				<div id="days" class="bottle">
					<div class="bottle_section">
						<div class="overflow">
							<div class="fill fill_d"></div>
							<div class="drop drop_d"></div>
						</div>
						<div class="bottle_bg"></div>
					</div>
					<div class="bottle_counter bottle_d">58</div>
				</div>
				<div id="hours" class="bottle">
					<div class="bottle_section">
						<div class="overflow">
							<div class="fill fill_h"></div>
							<div class="drop drop_h"></div>
						</div>
						<div class="bottle_bg"></div>
					</div>
					<div class="bottle_counter bottle_h">0</div>
				</div>
				<div id="minutes" class="bottle">
					<div class="bottle_section">
						<div class="overflow">
							<div class="fill fill_m"></div>
							<div class="drop drop_m"></div>
						</div>
						<div class="bottle_bg"></div>
					</div>
					<div class="bottle_counter bottle_m">0</div>
				</div>
				<div id="seconds" class="bottle_last">
					<div class="bottle_section">
						<div class="overflow">
							<div class="fill fill_s"></div>
							<div class="drop drop_s"></div>
						</div>
						<div class="bottle_bg"></div>
					</div>
					<div class="bottle_counter bottle_s">0</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">
		<div class="container">� 2015 Banii mei - Reinventam Economiile.
			Impreuna</div>
	</div>
</body>
</html>