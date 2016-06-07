
<!DOCTYPE html>
<html class=" ">
<head>
<!-- 
         * @Package: Ultra Admin - Responsive Theme
         * @Subpackage: Bootstrap
         * @Version: 1.0
         * This file is part of Ultra Admin Theme.
        -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta charset="utf-8" />
<%
	String userName = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user"))
				userName = cookie.getValue();
		}
	}
	if (userName == null)
		response.sendRedirect("login.jsp");
	Users userDAO = new Users();
	User currentUser = userDAO.getUserByEmail(userName);
%>
<title>Banii mei : Plata noua | <%=currentUser.getFirstName() + " " + currentUser.getLastName()%></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta content="" name="description" />
<meta content="" name="author" />

<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon" />
<!-- Favicon -->
<link rel="apple-touch-icon-precomposed"
	href="assets/images/apple-touch-icon-57-precomposed.png">
<!-- For iPhone -->
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/images/apple-touch-icon-114-precomposed.png">
<!-- For iPhone 4 Retina display -->
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/images/apple-touch-icon-72-precomposed.png">
<!-- For iPad -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/images/apple-touch-icon-144-precomposed.png">
<!-- For iPad Retina display -->
<%@ page import="com.mymoney.DAO.Users"%>
<%@ page import="com.mymoney.DAO.Transactions"%>
<%@ page import="com.mymoney.DAO.Accounts"%>
<%@ page import="com.mymoney.DAO.Products"%>
<%@ page import="com.mymoney.DAO.Categories"%>
<%@ page import="com.mymoney.DAO.Locations"%>
<%@ page import="com.mymoney.entities.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.mymoney.entities.Account"%>
<%@ page import="com.mymoney.entities.Transaction"%>
<%@ page import="com.mymoney.entities.Product"%>
<%@ page import="com.mymoney.entities.Category"%>
<%@ page import="com.mymoney.entities.Location"%>

<!-- CORE CSS FRAMEWORK - START -->
<link href="assets/plugins/pace/pace-theme-flash.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/plugins/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css" />
<link href="assets/css/animate.min.css" rel="stylesheet" type="text/css" />
<link href="assets/plugins/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" type="text/css" />
<!-- CORE CSS FRAMEWORK - END -->

<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START -->
<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START -->
<link href="assets/plugins/jquery-ui/smoothness/jquery-ui.min.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="assets/plugins/datepicker/css/datepicker.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="assets/plugins/daterangepicker/css/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="assets/plugins/timepicker/css/timepicker.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="assets/plugins/datetimepicker/css/datetimepicker.min.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="assets/plugins/colorpicker/css/bootstrap-colorpicker.min.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="assets/plugins/ios-switch/css/switch.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="assets/plugins/tagsinput/css/bootstrap-tagsinput.css"
	rel="stylesheet" type="text/css" media="screen" />
<link href="assets/plugins/select2/select2.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="assets/plugins/typeahead/css/typeahead.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="assets/plugins/multi-select/css/multi-select.css"
	rel="stylesheet" type="text/css" media="screen" />
<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->

<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->


<!-- CORE CSS TEMPLATE - START -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
<!-- CORE CSS TEMPLATE - END -->

</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class=" ">
	<!-- START TOPBAR -->

	<div class='page-topbar '>
		<div class='logo-area'></div>
		<div class='quick-area'>
			<div class='pull-left'>
				<ul class="info-menu left-links list-inline list-unstyled">
					<li class="sidebar-toggle-wrap"><a href="#"
						data-toggle="sidebar" class="sidebar_toggle"> <i
							class="fa fa-bars"></i>
					</a></li>
					<li class=""><a href="#" data-toggle="dropdown" class="toggle">
							<i class="fa fa-envelope"></i> <span class="badge badge-primary">7</span>
					</a>
						<ul class="dropdown-menu messages animated fadeIn">

							<li class="list">

								<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
									<li class="unread status-available"><a href="javascript:;">
											<div class="user-img">
												<img src="data/profile/avatar-1.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong> <%=currentUser.getFirstName() + " " + currentUser.getLastName()%>
												</strong> <span class="time small">- 15 mins ago</span> <span
													class="profile-status available pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-away"><a href="javascript:;">
											<div class="user-img">
												<img src="data/profile/avatar-2.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Brooks Latshaw</strong> <span
													class="time small">- 45 mins ago</span> <span
													class="profile-status away pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-busy"><a href="javascript:;">
											<div class="user-img">
												<img src="data/profile/avatar-3.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Clementina
														Brodeur</strong> <span class="time small">- 1 hour ago</span> <span
													class="profile-status busy pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-offline"><a href="javascript:;">
											<div class="user-img">
												<img src="data/profile/avatar-4.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Carri Busey</strong> <span
													class="time small">- 5 hours ago</span> <span
													class="profile-status offline pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-offline"><a href="javascript:;">
											<div class="user-img">
												<img src="data/profile/avatar-5.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Melissa Dock</strong> <span
													class="time small">- Yesterday</span> <span
													class="profile-status offline pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-available"><a href="javascript:;">
											<div class="user-img">
												<img src="data/profile/avatar-1.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Verdell Rea</strong> <span
													class="time small">- 14th Mar</span> <span
													class="profile-status available pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-busy"><a href="javascript:;">
											<div class="user-img">
												<img src="data/profile/avatar-2.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Linette Lheureux</strong>
													<span class="time small">- 16th Mar</span> <span
													class="profile-status busy pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>
									<li class=" status-away"><a href="javascript:;">
											<div class="user-img">
												<img src="data/profile/avatar-3.png" alt="user-image"
													class="img-circle img-inline">
											</div>
											<div>
												<span class="name"> <strong>Araceli
														Boatright</strong> <span class="time small">- 16th Mar</span> <span
													class="profile-status away pull-right"></span>
												</span> <span class="desc small"> Sometimes it takes a
													lifetime to win a battle. </span>
											</div>
									</a></li>

								</ul>

							</li>

							<li class="external"><a href="javascript:;"> <span>Read
										All Messages</span>
							</a></li>
						</ul></li>
					<li class=""><a href="#" data-toggle="dropdown" class="toggle">
							<i class="fa fa-bell"></i> <span class="badge badge-orange">3</span>
					</a>
						<ul class="dropdown-menu notifications animated fadeIn">
							<li class="total"><span class="small"> Ai <strong>3</strong>
									notificari noi. <a href="javascript:;" class="pull-right">Marcheaza-le
										pe toate ca citite.</a>
							</span></li>
							<li class="list">

								<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
									<li class="unread available">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-check"></i>
											</div>
											<div>
												<span class="name"> <strong>Toate bugetele
														arata bine!</strong> <span class="time small">astazi</span>
												</span>
											</div>
									</a>
									</li>
									<li class="unread away">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-envelope"></i>
											</div>
											<div>
												<span class="name"> <strong>2 plati
														recurente in valoare de 250 RON</strong> <span class="time small">in
														7 zile</span>
												</span>
											</div>
									</a>
									</li>
									<li class=" busy">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-times"></i>
											</div>
											<div>
												<span class="name"> <strong>Va expira ITP-ul
														masinii!</strong> <span class="time small">peste 5 zile</span>
												</span>
											</div>
									</a>
									</li>

									<li class=" offline">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-user"></i>
											</div>
											<div>
												<span class="name"> <strong>Social Financing
														a gasit un pret mai bun</strong> <span class="time small">Ieri</span>
												</span>
											</div>
									</a>
									</li>
									<li class=" available">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-check"></i>
											</div>
											<div>
												<span class="name"> <strong>Ai creat un
														buget nou!</strong> <span class="time small">9 noiembrie</span>
												</span>
											</div>
									</a>
									</li>
									<li class=" busy">
										<!-- available: success, warning, info, error --> <a
										href="javascript:;">
											<div class="notice-icon">
												<i class="fa fa-times"></i>
											</div>
											<div>
												<span class="name"> <strong>O plata la
														termen nu a fost confirmata!</strong> <span class="time small">3
														noiembrie</span>
												</span>
											</div>
									</a>
									</li>

								</ul>

							</li>

							<li class="external"><a href="javascript:;"> <span>Citeste
										toate notificarile</span>
							</a></li>
						</ul></li>
					<li class="hidden-sm hidden-xs searchform">
						<div class="input-group">
							<span class="input-group-addon input-focus"> <i
								class="fa fa-search"></i>
							</span>
							<form action="search-page.html" method="post">
								<input type="text" class="form-control animated fadeIn"
									placeholder="Search & Enter"> <input type='submit'
									value="">
							</form>
						</div>
					</li>
				</ul>
			</div>
			<div class='pull-right'>
				<ul class="info-menu right-links list-inline list-unstyled">
					<li class="profile"><a href="#" data-toggle="dropdown"
						class="toggle"> <img src="data/profile/<%=currentUser.getProfileImagePath() %>"
							alt="user-image" class="img-circle img-inline"> <span><%="Salut, " + currentUser.getFirstName() + " " + currentUser.getLastName()%>
								<i class="fa fa-angle-down"></i></span>
					</a>
						<ul class="dropdown-menu profile animated fadeIn">
							<li><a href="#settings"> <i class="fa fa-wrench"></i>
									Setari profil
							</a></li>

							<li><a href="#help"> <i class="fa fa-info"></i> Ghid
									pentru inceput
							</a></li>
							<li class="last"><a href="LogoutServlet"> <i
									class="fa fa-lock"></i> Delogare
							</a></li>
						</ul></li>
					<li class="chat-toggle-wrapper"><a href="#"
						data-toggle="chatbar" class="toggle_chat"> <i
							class="fa fa-comments"></i> <span class="badge badge-warning">9</span>
					</a></li>
				</ul>
			</div>
		</div>

	</div>
	<!-- END TOPBAR -->
	<!-- START CONTAINER -->
	<div class="page-container row-fluid">

		<!-- SIDEBAR - START -->
		<div class="page-sidebar ">


			<!-- MAIN MENU - START -->
			<div class="page-sidebar-wrapper" id="main-menu-wrapper">

				<!-- USER INFO - START -->
				<div class="profile-info row">

					<div class="profile-image col-md-4 col-sm-4 col-xs-4">
						<a href="ui-profile.html"> <img src="data/profile/<%=currentUser.getProfileImagePath() %>"
							class="img-responsive img-circle">
						</a>
					</div>

					<div class="profile-details col-md-8 col-sm-8 col-xs-8">

						<h3>
							<a href="ui-profile.html"><%=currentUser.getFirstName() + " " + currentUser.getLastName()%></a>

							<!-- Available statuses: online, idle, busy, away and offline -->
							<span class="profile-status online"></span>
						</h3>

						<p class="profile-title">Personal+</p>

					</div>

				</div>
				<!-- USER INFO - END -->
<%Accounts accountDAO = new Accounts();
	int numberOfAccounts = accountDAO.getNumberOfAccountsForUser(currentUser);

%>

		<ul class='wraplist'>


					<li><a href="home.jsp"> <i
							class="fa fa-dashboard"></i> <span class="title">Interfata
								de control</span>
					</a></li>
					<li><a href="accounts.jsp"> <i class="fa fa-th"></i>
							<span class="title">Conturile mele</span><span
							class="label label-orange nosubmenu"><%=numberOfAccounts %></span>
					</a></li>
					<li class="open"><a href="javascript:;"> <i
							class="fa fa-suitcase"></i> <span class="title">Plati & Castiguri</span> <span
							class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li class="open"><a class="" href="newpayment.jsp">Plata noua</a></li>
							<li><a class="" href="newincome.jsp">Castig nou</a></li>
						<li><a class="" href="viewhistory.jsp">Istoricul tranzactiilor</a></li>
							<li><a class="" href="">Plati recurente</a>
							</li>
							<li><a class="" href="">Sabloane</a></li>
							<li><a class="" href="">Rapoarte</a></li>
							<li><a class="" href="">Intelligent
									Reports <span class="label label-orange">Personal+</span>
							</a></li>

							<li><a class="" href="">Beneficiari</a></li>
							<li><a class="" href="">Bugete</a></li>

						</ul></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-users"></i> <span class="title">Social
								Financing</span> <span class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li><a class="" href="">Verifica pret</a>
							</li>
							<li><a class="" href="">Adauga un
									pret</a></li>
							<li><a class="" href="">Cele mai
									cumparate produse</a></li>

						</ul></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-signal"></i> <span class="title">Optimum
								spending</span> <span class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-bar-chart-o"></i> <span class="title">Smart
								Forecast</span> <span class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i class="fa fa-car"></i>
							<span class="title">Masina mea</span> <span
							class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i class="fa fa-users"></i>
							<span class="title">Familia mea</span> <span
							class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i class="fa fa-play-circle"></i>
							<span class="title">Hobby-urile mele</span> <span
							class="label label-orange">Personal+</span>
					</a></li>
						<li class=""><a href="javascript:;"> <i class="fa fa-ambulance"></i>
							<span class="title">Sanatatea mea</span> <span
							class="label label-orange">Personal+</span>
					</a></li>
						<li class=""><a href="javascript:;"> <i class="fa fa-home"></i>
							<span class="title">Casa mea</span> <span
							class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i class="fa fa-graduation-cap"></i>
							<span class="title">Educatia mea</span> <span
							class="label label-orange">Personal+</span>
					</a></li>
					
					<li class=""><a href="javascript:;"> <i class="fa fa-plane"></i>
							<span class="title">Planificator vacanta</span> <span
							class="label label-orange">Personal+</span>
					</a></li>


				</ul>
			</div>
			<!-- MAIN MENU - END -->



				<div class="project-info">
<%
Transactions transactionDAO = new Transactions();
double newPayments = transactionDAO.getAmountSpentToday(currentUser);
double newEarnings = transactionDAO.getAmountEarnedToday(currentUser);
%>
				<div class="block1">
					<div class="data">
						<span class='title'>Castiguri&nbsp;Noi</span> <span class='total'><%=newEarnings %></span>
					</div>
					<div class="graph">
						<span class="sidebar_orders" id="sidebar_orders">...</span>
					</div>
				</div>

				<div class="block2">
					<div class="data">
						<span class='title'>Plati&nbsp;Noi</span> <span class='total'><%=newPayments %></span>
					</div>
					<div class="graph">
						<span class="sidebar_visitors" id="sidebar_visitors">...</span>
					</div>
				</div>

			</div>



		</div>
		<!--  SIDEBAR - END -->
		<!-- START CONTENT -->
		<section id="main-content" class=" ">
			<section class="wrapper"
				style='margin-top: 60px; display: inline-block; width: 100%; padding: 15px 0 0 15px;'>

				<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>
					<div class="page-title">

						<div class="pull-left">
							<h1 class="title">Creaza o plata noua</h1>
						</div>


					</div>
				</div>
				<div class="clearfix"></div>

				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<section class="box ">
						<header class="panel_header">
							<h2 class="title pull-left">Detalii plata</h2>

						</header>
						<div class="content-body">
							<div class="row">

								<div class="col-md-12">
									<br>
									<h3>Completeaza campurile de mai jos</h3>
									<br>
									<form id="plataNoua" action="NewPaymentServlet" method="post">
									<div class="form-group">
										<label class="form-label" for="field-1">Contul din
											care executi plata</label> <span class="desc">e.g. "Cont
											curent"</span>

										<div class="controls">
											<select class="form-control input-lg m-bot15" id="contPlata"
												form="plataNoua" name="contPlata"">
												<%
													//get all accounts and display them first
													boolean hasAccounts = false;
													 accountDAO = new Accounts();
													ArrayList<Account> listOfAccounts = new ArrayList<Account>();
													listOfAccounts = accountDAO.getAccountsForUser(currentUser);
													for (Account a : listOfAccounts) {
														if (a.getDeleted() == 0) {
															hasAccounts = true;
												%>
												<option value=<%="\"" + a.getId() + "\""%>><%=a.getAccountName()%></option>

												<%
													}
													}
												%>
											</select>
										</div>
									</div>
									<br>

									<div class="form-group">
										<label class="form-label" for="field-1">Denumire plata</label>
										<span class="desc">e.g. "iPhone 6S"</span>
										<div class="controls">
											<input type="text" class="form-control" id="numePlata"
												name="numePlata">
										</div>
									</div>
									<br>
									<div class="form-group">
										<label class="form-label" for="field-1">Descriere
											plata</label> <span class="desc">e.g. "Cadou ziua Stefaniei"</span>
										<div class="controls">
											<input type="text" class="form-control" id="descrierePlata"
												name="descrierePlata">
										</div>
									</div>
									<br>

									<div class="form-group">
										<label class="form-label" for="field-1">Valoare plata</label>
										<span class="desc">e.g. "2500"</span>
										<div class="controls">
											<input type="text" class="form-control" id="valoarePlata"
												name="valoarePlata">
										</div>
									</div>
									<br>


								</div>
								<br>
								<div class="row"></div>
								<div class="col-md-12">
									<h3>Alege produsele achizitionate</h3>
									<br>
									<div class="col-md-12">
										<h4>Produse din Social Financing</h4>
										<select name="produsePlata" class="multi-select" multiple="multiple"
											id="my_multi_select3">
											<%
												Products productDAO = new Products();
												ArrayList<Product> listOfProducts = productDAO.getAllProducts();
												for (Product p : listOfProducts) {
											%>
											<option value="<%=p.getID()%>"><%=p.getProductName()%></option>

											<%
												}
											%>
										</select>


									</div>
									
									<button type="button" data-toggle="modal"
										href="#modalProdusNou" class="btn btn-primary">
										<i class="fa fa-plus"> Adauga produs nou</i>
									</button>
								</div>


							</div>

							<div class="row">
								<div class="col-md-12">
									<h3>De unde ai cumparat produsele?</h3>
									<div class="form-group">
										<label class="form-label" for="field-1">Magazinul din
											care ai achizitionat produsele</label> <span class="desc">e.g.
											"Kaufland Pacurari"</span>

										<div class="controls">
											<select class="form-control input-lg m-bot15" id="locatiePlata"
												form="plataNoua" name="locatiePlata">
												<%
													ArrayList<Location> listOfLocations = new ArrayList<Location>();
													Locations locationDAO = new Locations();
													listOfLocations = locationDAO.getLocations(currentUser);
													for (Location a : listOfLocations) {
												%>
												<option value=<%="\"" + a.getID() + "\""%>><%=a.getLocationName() + " - " + a.getLocationCity()%></option>

												<%
													}
												%>
											</select>
											
										</div>
								
										
									</div>
									<button type="button" data-toggle="modal"
												href="#modalLocatieNoua" class="btn btn-primary">
												<i class="fa fa-plus"> Adauga locatie noua</i>
											</button>
								</div>
							</div>

							<div class="row">
							<br><br><br>
								<button type="button" onclick="checkFields();"
									class="btn btn-success">
									<i class="fa fa-check-circle"> Salveaza plata</i>
								</button>
								</form>
							</div>
						</div>

					</section>




				</div>




				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<section class="box ">
						<header class="panel_header">
							<h2 class="title pull-left">Sfaturi legate de plati</h2>

						</header>
						<div class="content-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">

									<ul>
										<li>Iti recomandam sa iti creezi cel putin <b>cate un
												cont</b> pentru fiecare categorie.
										</li>
										<li>Tine balantele actualizate zilnic.</li>
										<li>Foloseste-te de graficele volumului monetar.</li>
										<li>Creaza bugete pentru toate conturile.
											<ul>
												<li>Bugete de economisire.</li>
												<li>Bugete de cheltuieli regulate.</li>
												<li>Bugete pentru vacante.</li>
											</ul>
										</li>
										<li>Gaseste-ti motivatia sa economisesti mai mult.</li>
										<li>Platile si castigurile vor actualiza automat balanta
											conturilor.</li>
										<li>Foloseste serviciul <b>Optimum Spending</b> pentru a
											economisi mai mult.
										</li>
										<li>Creaza rapoarte saptamanale pentru cheltuielile si
											castigurile tale.</li>
									</ul>

								</div>
							</div>
						</div>
					</section>
				</div>







			</section>
		</section>
		<!-- END CONTENT -->
		<div class="page-chatapi hideit">

			<div class="search-bar">
				<input type="text" placeholder="Search" class="form-control">
			</div>



		</div>


		<div class="chatapi-windows "></div>
	</div>
	<!-- END CONTAINER -->
	<!-- LOAD FILES AT PAGE END FOR FASTER LOADING -->


	<!-- CORE JS FRAMEWORK - START -->
	<script src="assets/js/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.easing.min.js" type="text/javascript"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/pace/pace.min.js" type="text/javascript"></script>
	<script src="assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/viewport/viewportchecker.js"
		type="text/javascript"></script>
	<!-- CORE JS FRAMEWORK - END -->


	<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START -->
	<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->


	<!-- CORE TEMPLATE JS - START -->
	<script src="assets/js/scripts.js" type="text/javascript"></script>
	<!-- END CORE TEMPLATE JS - END -->

	<!-- Sidebar Graph - START -->
	<script src="assets/plugins/sparkline-chart/jquery.sparkline.min.js"
		type="text/javascript"></script>
	<script src="assets/js/chart-sparkline.js" type="text/javascript"></script>
	<script src="assets/js/BottomCharts.js" type="text/javascript"></script>
	<script type="text/javascript">
	getLast5DaysTransactions('<%=currentUser.getEmail()%>');
    </script>
	<!-- Sidebar Graph - END -->








	<!-- modal adauga cont economii start -->
	<div class="modal fade" id="modalSavings" tabindex="-1" role="dialog"
		aria-labelledby="ultraModal-Label" aria-hidden="true">
		<div class="modal-dialog animated zoomInDown">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Adauga cont economii</h4>
				</div>
				<div class="modal-body">
					<form action="CreateSavingsAccountServlet" method="post"
						id="createSavingsAccountForm" name="createSavingsAccountForm">
						<div class="form-group">
							<label class="form-label" for="field-1">Nume</label> <span
								class="desc">e.g. "Cont economii Banca Transilvania"</span>
							<div class="controls">
								<input type="text" class="form-control" id="numeCont"
									name="numeCont">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Descriere</label> <span
								class="desc">e.g. "Cont pentru cuantificare si evidenta
								pensiei private"</span>
							<div class="controls">
								<input type="text" class="form-control" id="descriereCont"
									name="descriereCont">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Moneda</label> <span
								class="desc">e.g. "RON/EUR"</span>
							<div class="controls">
								<select class="form-control input-lg m-bot15" id="monedaCont"
									form="createSavingsAccountForm" name=monedaCont">
									<option value="RON">RON</option>
									<option value="EUR">EUR</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Sold initial</label> <span
								class="desc">e.g. "500"</span>
							<div class="controls">
								<input type="text" class="form-control" id="soldCont"
									name="soldCont">
							</div>
						</div>
						<input type="submit" name="wp-submit" id="wp-submit"
							class="btn btn-success" value="Adauga!" />
						<button data-dismiss="modal" class="btn btn-danger" type="button">Inchide</button>
					</form>
					<br>




				</div>
				<div class="modal-footer">
					<p>
						Completeaza campurile de mai sus si apasa pe <b>Adauga!</b>
					</p>


				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->
<!-- modal adauga locatie noua start -->
	<div class="modal fade" id="modalLocatieNoua" tabindex="-1" role="dialog"
		aria-labelledby="ultraModal-Label" aria-hidden="true">
		<div class="modal-dialog animated zoomInDown">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Adauga locatie noua</h4>
				</div>
				<div class="modal-body">
					<form action="CreateLocationServlet" method="post"
						id="createLocationForm" name="createLocationForm">
						<div class="form-group">
							<label class="form-label" for="field-1">Nume locatie</label> <span
								class="desc">e.g. "Mega Image Unirii"</span>
							<div class="controls">
								<input type="text" class="form-control" id="numeLocatie"
									name="numeLocatie">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Descriere locatie</label> <span
								class="desc">e.g. "Magazin Mega Image pe Unirii"</span>
							<div class="controls">
								<input type="text" class="form-control" id="descriereLocatie"
									name="descriereLocatie">
							</div>
						</div>
						
						<div class="form-group">
							<label class="form-label" for="field-1">Oras</label> <span
								class="desc">e.g. "Bucuresti"</span>
							<div class="controls">
								<input type="text" class="form-control" id="orasLocatie"
									name="orasLocatie">
							</div>
						</div>
						<input type="submit" name="wp-submit" id="wp-submit"
							class="btn btn-success" value="Adauga!" />
						<button data-dismiss="modal" class="btn btn-danger" type="button">Inchide</button>
					</form>
					<br>




				</div>
				<div class="modal-footer">
					<p>
						Completeaza campurile de mai sus si apasa pe <b>Adauga!</b>
					</p>


				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->



	<!-- modal adauga cont numerar start -->
	<div class="modal fade" id="modalCash" tabindex="-1" role="dialog"
		aria-labelledby="ultraModal-Label" aria-hidden="true">
		<div class="modal-dialog animated zoomInDown">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Adauga cont de tip numerar</h4>
				</div>
				<div class="modal-body">
					<form action="CreateCashAccountServlet" method="post"
						id="createSavingsAccountForm" name="createSavingsAccountForm">
						<div class="form-group">
							<label class="form-label" for="field-1">Nume</label> <span
								class="desc">e.g. "Portofelul meu"</span>
							<div class="controls">
								<input type="text" class="form-control" id="numeCont"
									name="numeCont">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Descriere</label> <span
								class="desc">e.g. "Numerarul din portofelul meu"</span>
							<div class="controls">
								<input type="text" class="form-control" id="descriereCont"
									name="descriereCont">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Moneda</label> <span
								class="desc">e.g. "RON/EUR"</span>
							<div class="controls">
								<select class="form-control input-lg m-bot15" id="monedaCont"
									form="createSavingsAccountForm" name=monedaCont">
									<option value="RON">RON</option>
									<option value="EUR">EUR</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Sold initial</label> <span
								class="desc">e.g. "500"</span>
							<div class="controls">
								<input type="text" class="form-control" id="soldCont"
									name="soldCont">
							</div>
						</div>
						<input type="submit" name="wp-submit" id="wp-submit"
							class="btn btn-success" value="Adauga!" />
						<button data-dismiss="modal" class="btn btn-danger" type="button">Inchide</button>
					</form>
					<br>




				</div>
				<div class="modal-footer">
					<p>
						Completeaza campurile de mai sus si apasa pe <b>Adauga!</b>
					</p>


				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->


	<!-- modal adauga cont curent start -->
	<div class="modal fade" id="modalRegular" tabindex="-1" role="dialog"
		aria-labelledby="ultraModal-Label" aria-hidden="true">
		<div class="modal-dialog animated zoomInDown">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Adauga cont curent</h4>
				</div>
				<div class="modal-body">
					<form action="CreateRegularAccountServlet" method="post"
						id="createSavingsAccountForm" name="createSavingsAccountForm">
						<div class="form-group">
							<label class="form-label" for="field-1">Nume</label> <span
								class="desc">e.g. "Cont curent salariu"</span>
							<div class="controls">
								<input type="text" class="form-control" id="numeCont"
									name="numeCont">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Descriere</label> <span
								class="desc">e.g. "Cont pentru salariu deschis la
								Unicredit Bank"</span>
							<div class="controls">
								<input type="text" class="form-control" id="descriereCont"
									name="descriereCont">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Moneda</label> <span
								class="desc">e.g. "RON/EUR"</span>
							<div class="controls">
								<select class="form-control input-lg m-bot15" id="monedaCont"
									form="createSavingsAccountForm" name=monedaCont">
									<option value="RON">RON</option>
									<option value="EUR">EUR</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Sold initial</label> <span
								class="desc">e.g. "500"</span>
							<div class="controls">
								<input type="text" class="form-control" id="soldCont"
									name="soldCont">
							</div>
						</div>
						<input type="submit" name="wp-submit" id="wp-submit"
							class="btn btn-success" value="Adauga!" />
						<button data-dismiss="modal" class="btn btn-danger" type="button">Inchide</button>
					</form>
					<br>




				</div>
				<div class="modal-footer">
					<p>
						Completeaza campurile de mai sus si apasa pe <b>Adauga!</b>
					</p>


				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->

	<!-- modal adauga produs start -->
	<div class="modal fade" id="modalProdusNou" tabindex="-1" role="dialog"
		aria-labelledby="ultraModal-Label" aria-hidden="true">
		<div class="modal-dialog animated zoomInDown">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Adauga un produs nou</h4>
				</div>
				<div class="modal-body">
					<form action="CreateProductServlet" method="post"
						id="createProductForm" name="createProductForm">
						<div class="form-group">
							<label class="form-label" for="field-1">Nume</label> <span
								class="desc">e.g. "Dunhill Albastru"</span>
							<div class="controls">
								<input type="text" class="form-control" id="numeProdus"
									name="numeProdus">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Descriere</label> <span
								class="desc">e.g. "Pachet de tigari Dunhill Albastru 6 mg
								nicotina"</span>
							<div class="controls">
								<input type="text" class="form-control" id="descriereProdus"
									name="descriereProdus">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="field-1">Categorie</label> <span
								class="desc">e.g. "Produse din tutun"</span>
							<div class="controls">
								<select class="form-control input-lg m-bot15"
									id="productCategory" form="createProductForm"
									name="productCategory">
									<%
										Categories categoryDAO = new Categories();
										ArrayList<Category> categories = categoryDAO.getAllCategoriesAlphabetically();
										for (Category c : categories) {
									%>
									<option value="<%=c.getID()%>"><%=c.getCategoryName()%></option>
									<%
										}
									%>

								</select>
							</div>
						</div>

						<input type="submit" name="wp-submit" id="wp-submit"
							class="btn btn-success" value="Adauga!" />
						<button data-dismiss="modal" class="btn btn-danger" type="button">Inchide</button>
					</form>
					<br>




				</div>
				<div class="modal-footer">
					<p>
						Completeaza campurile de mai sus si apasa pe <b>Adauga!</b>
					</p>


				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->

<script type="text/javascript">
function checkFields(){
	if(document.getElementById('numePlata').value =="" || document.getElementById('descrierePlata').value =="" || document.getElementById('valoarePlata').value=="" || document.getElementById('contPlata').value == ""){
	alert("Te rugam sa completezi toate campurile inainte sa salvezi");
		return false;
	}
	
	if(isNaN(document.getElementById('valoarePlata').value)){
		alert("Valoarea platii trebuie sa fie un numar");
	}
	else{
		document.getElementById('plataNoua').submit();
		
	}
	
	
	
}


</script>


	<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - START -->
	<script src="assets/plugins/jquery-ui/smoothness/jquery-ui.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/datepicker/js/datepicker.js"
		type="text/javascript"></script>
	<script src="assets/plugins/daterangepicker/js/moment.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/daterangepicker/js/daterangepicker.js"
		type="text/javascript"></script>
	<script src="assets/plugins/timepicker/js/timepicker.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/datetimepicker/js/datetimepicker.min.js"
		type="text/javascript"></script>
	<script
		src="assets/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.fr.js"
		type="text/javascript"></script>
	<script
		src="assets/plugins/colorpicker/js/bootstrap-colorpicker.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/tagsinput/js/bootstrap-tagsinput.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/select2/select2.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/typeahead/typeahead.bundle.js"
		type="text/javascript"></script>
	<script src="assets/plugins/typeahead/handlebars.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/multi-select/js/jquery.multi-select.js"
		type="text/javascript"></script>
	<script src="assets/plugins/multi-select/js/jquery.quicksearch.js"
		type="text/javascript"></script>
	<!-- OTHER SCRIPTS INCLUDED ON THIS PAGE - END -->


	<!-- General section box modal start -->
	<div class="modal" id="section-settings" tabindex="-1" role="dialog"
		aria-labelledby="ultraModal-Label" aria-hidden="true">
		<div class="modal-dialog animated bounceInDown">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Section Settings</h4>
				</div>
				<div class="modal-body">Body goes here...</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
					<button class="btn btn-success" type="button">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->
</body>
</html>



