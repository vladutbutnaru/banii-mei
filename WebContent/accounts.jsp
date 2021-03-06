
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
<title>Banii mei : Conturile mele | <%=currentUser.getFirstName() + " " + currentUser.getLastName()%></title>
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
<%@ page import="com.mymoney.entities.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.mymoney.entities.Account"%>
<%@ page import="com.mymoney.entities.Transaction"%>



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
												<img
													src="data/profile/<%=currentUser.getProfileImagePath() %>"
													alt="user-image" class="img-circle img-inline">
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
						class="toggle"> <img
							src="data/profile/<%=currentUser.getProfileImagePath() %>"
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

						<a href="ui-profile.html"> <img
							src="data/profile/<%=currentUser.getProfileImagePath() %>"
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


					<li><a href="home.jsp"> <i class="fa fa-dashboard"></i> <span
							class="title">Interfata de control</span>
					</a></li>
					<li class="open"><a href="accounts.jsp"> <i
							class="fa fa-th"></i> <span class="title">Conturile mele</span><span
							class="label label-orange nosubmenu"><%=numberOfAccounts %></span>
					</a></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-suitcase"></i> <span class="title">Plati &
								Castiguri</span> <span class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li><a class="" href="newpayment.jsp">Plata noua</a></li>
							<li><a class="" href="newincome.jsp">Castig nou</a></li>
							<li><a class="" href="viewhistory.jsp">Istoricul
									tranzactiilor</a></li>
							<li><a class="" href="">Plati recurente</a></li>
							<li><a class="" href="">Sabloane</a></li>
							<li><a class="" href="">Rapoarte</a></li>
							<li><a class="" href="">Intelligent Reports <span
									class="label label-orange">Personal+</span>
							</a></li>

							<li><a class="" href="">Beneficiari</a></li>
							<li><a class="" href="">Bugete</a></li>

						</ul></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-users"></i> <span class="title">Social
								Financing</span> <span class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li><a class="" href="">Verifica pret</a></li>
							<li><a class="" href="">Adauga un pret</a></li>
							<li><a class="" href="">Cele mai cumparate produse</a></li>

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
					<li class=""><a href="javascript:;"> <i
							class="fa fa-users"></i> <span class="title">Familia mea</span> <span
							class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-play-circle"></i> <span class="title">Hobby-urile
								mele</span> <span class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-ambulance"></i> <span class="title">Sanatatea
								mea</span> <span class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i class="fa fa-home"></i>
							<span class="title">Casa mea</span> <span
							class="label label-orange">Personal+</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-graduation-cap"></i> <span class="title">Educatia
								mea</span> <span class="label label-orange">Personal+</span>
					</a></li>

					<li class=""><a href="javascript:;"> <i
							class="fa fa-plane"></i> <span class="title">Planificator
								vacanta</span> <span class="label label-orange">Personal+</span>
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
							<h1 class="title">Conturile mele</h1>
						</div>


					</div>
				</div>
				<div class="clearfix"></div>

				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<section class="box ">
						<header class="panel_header">
							<h2 class="title pull-left">Informatii conturi</h2>

						</header>
						<div class="content-body">
							<div class="row">

								<div class="col-md-12">
									<br>
									<h3>
										Conturi de economii
										<button type="button" data-toggle="modal" href="#modalSavings"
											class="btn btn-primary">
											<i class="fa fa-plus"></i>
										</button>
									</h3>
									<br>
									<%
										//get all accounts and display them first
										boolean hasSavingsAccounts = false;
										accountDAO = new Accounts();
										ArrayList<Account> listOfAccounts = new ArrayList<Account>();
										listOfAccounts = accountDAO.getAccountsForUser(currentUser);
										for (Account a : listOfAccounts) {
											if (a.getAccountType() == 2 && a.getDeleted() == 0) {
												hasSavingsAccounts = true;
									%>


									<div class="well primary">
										<h3><%=a.getAccountName()%>
											- <span class="semi-bold"> <%=a.getAmount()%> <sup><%=a.getCurrency()%></sup></span>
										</h3>
										<%=a.getAccountDescription()%>

									</div>
									<div class="col-md-12">
										<p class="text-right"></p>
										<div class="dropdown">

											<button class="btn btn-default dropdown-toggle" type="button"
												id="dropdownMenu1" data-toggle="dropdown"
												aria-expanded="true">
												Adauga tranzactie noua <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" role="menu"
												aria-labelledby="dropdownMenu1">
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="#">Plata</a></li>
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="#">Castig</a></li>
											</ul>
											<button type="button" class="btn btn-info">Editeaza
												informatii</button>
											<button type="button" class="btn btn-info">Genereaza
												raport</button>
											<button type="button" class="btn btn-danger">Sterge
												cont</button>
											<button type="button" class="btn btn-success">Creaza
												buget</button>

										</div>


									</div>
									<br> <br> <br> <br>
									<%
										}
										}
										if (!hasSavingsAccounts) {
									%>
									<div class="well">
										<h3>
											Nu ai adaugat niciun cont <span class="semi-bold">de
												economii</span>, <a data-toggle="modal" href="#modalSavings"><i>adauga
													acum!</i></a>
										</h3>
										Conturile de economii te ajuta sa tii evidenta economiilor
										tale, sa le administrezi intr-un mod facil si sa creezi un
										buget pentru a ajunge la comfortul financiar la care visezi. <b>80%</b>
										din conturile de economii create de utilizatorilor aplicatiei
										au cunoscut o crestere de peste <b>30%</b> in mai putin de 3
										luni. Incearca si tu!
									</div>



									<%
										}
									%>
									<br> <br>


								</div>
							</div>
							<div class="row">

								<div class="col-md-12">
									<br>
									<h3>
										Conturi de tip numerar
										<button type="button" data-toggle="modal" href="#modalCash"
											class="btn btn-primary">
											<i class="fa fa-plus"></i>
										</button>
									</h3>
									<br>
									<%
										//get all accounts and display them first

										boolean hasCashAccounts = false;
										for (Account a : listOfAccounts) {
											if (a.getAccountType() == 1 && a.getDeleted() == 0) {
												hasCashAccounts = true;
									%>


									<div class="well primary">
										<h3><%=a.getAccountName()%>
											- <span class="semi-bold"> <%=a.getAmount()%> <sup><%=a.getCurrency()%></sup></span>
										</h3>
										<%=a.getAccountDescription()%>

									</div>
									<div class="col-md-12">
										<p class="text-right"></p>
										<div class="dropdown">

											<button class="btn btn-default dropdown-toggle" type="button"
												id="dropdownMenu1" data-toggle="dropdown"
												aria-expanded="true">
												Adauga tranzactie noua <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" role="menu"
												aria-labelledby="dropdownMenu1">
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="#">Plata</a></li>
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="#">Castig</a></li>
											</ul>
											<button type="button" class="btn btn-info">Editeaza
												informatii</button>
											<button type="button" class="btn btn-info">Genereaza
												raport</button>
											<button type="button" class="btn btn-danger">Sterge
												cont</button>
											<button type="button" class="btn btn-success">Creaza
												buget</button>

										</div>


									</div>
									<br> <br> <br> <br>
									<%
										}
										}
										if (!hasCashAccounts) {
									%>
									<div class="well">
										<h3>
											Nu ai adaugat niciun cont <span class="semi-bold">numerar</span>,
											<a data-toggle="modal" href="#modalCash"><i>adauga
													acum!</i></a>
										</h3>
										Conturile de tip numerar te ajuta sa tii evidenta
										cheltuielilor de zi cu zi. Majoritatea utilizatorilor au
										asociat acest cont numerarului din portofel. Este cel mai
										bugetat cont, <b> 75%</b> din utilizatori avand asociat cel
										putin unul acestui cont.
									</div>



									<%
										}
									%>
									<br> <br>


								</div>
							</div>

							<div class="row">

								<div class="col-md-12">
									<br>
									<h3>
										Conturi curente
										<button type="button" data-toggle="modal" href="#modalRegular"
											class="btn btn-primary">
											<i class="fa fa-plus"></i>
										</button>
									</h3>
									<br>
									<%
										//get all accounts and display them first

										boolean hasRegularAccounts = false;
										for (Account a : listOfAccounts) {
											if (a.getAccountType() == 3 && a.getDeleted() == 0) {
												hasRegularAccounts = true;
									%>


									<div class="well primary">
										<h3><%=a.getAccountName()%>
											- <span class="semi-bold"> <%=a.getAmount()%> <sup><%=a.getCurrency()%></sup></span>
										</h3>
										<%=a.getAccountDescription()%>

									</div>
									<div class="col-md-12">
										<p class="text-right"></p>
										<div class="dropdown">

											<button class="btn btn-default dropdown-toggle" type="button"
												id="dropdownMenu1" data-toggle="dropdown"
												aria-expanded="true">
												Adauga tranzactie noua <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" role="menu"
												aria-labelledby="dropdownMenu1">
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="#">Plata</a></li>
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="#">Castig</a></li>
											</ul>
											<button type="button" class="btn btn-info">Editeaza
												informatii</button>
											<button type="button" class="btn btn-info">Genereaza
												raport</button>
											<button type="button" class="btn btn-danger">Sterge
												cont</button>
											<button type="button" class="btn btn-success">Creaza
												buget</button>

										</div>


									</div>

									<br> <br> <br> <br>
									<%
										}
										}
										if (!hasRegularAccounts) {
									%>
									<div class="well">
										<h3>
											Nu ai adaugat niciun cont <span class="semi-bold">curent</span>,
											<a data-toggle="modal" href="#modalRegular"><i>adauga
													acum!</i></a>
										</h3>
										Conturile curente te ajuta sa tii evidenta castigurilor. Este
										cel mai popular dintre conturile create in aplicatie, <b>95%</b>
										din utilizatorii aplicatiei au creat un astfel de cont, iar <b>80%</b>
										dintre acestia si-au creat un castig recurent (salariu)
										asociat acestuia. Tu ce astepti?
									</div>



									<%
										}
									%>
									<br> <br>


								</div>
							</div>
						</div>
					</section>
				</div>




				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<section class="box ">
						<header class="panel_header">
							<h2 class="title pull-left">Sfaturi legate de conturi</h2>

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











				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<section class="box ">
						<header class="panel_header">
							<h2 class="title pull-left">Cele mai utilizat cont</h2>

						</header>
						<div class="content-body">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">

									<ul class="list-inline">
										<%
											//get all accounts and display them first
											Account mostPopularAccount = new Account();
											mostPopularAccount = accountDAO.getMostPopularAccount(currentUser);
											if (mostPopularAccount.getId() > 0) {
										%>
										<li><%=mostPopularAccount.getAccountName()%></li>

										<%
											} else {
										%>
										<li>Nu ai adaugat nicio plata pana acum!</li>
										<%
											}
										%>
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

			<div class="chat-wrapper">
				<h4 class="group-head">Groups</h4>
				<ul class="group-list list-unstyled">
					<li class="group-row">
						<div class="group-status available">
							<i class="fa fa-circle"></i>
						</div>
						<div class="group-info">
							<h4>
								<a href="#">Work</a>
							</h4>
						</div>
					</li>
					<li class="group-row">
						<div class="group-status away">
							<i class="fa fa-circle"></i>
						</div>
						<div class="group-info">
							<h4>
								<a href="#">Friends</a>
							</h4>
						</div>
					</li>

				</ul>


				<h4 class="group-head">Favourites</h4>
				<ul class="contact-list">

					<li class="user-row" id='chat_user_1' data-user-id='1'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-1.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Clarine Vassar</a>
							</h4>
							<span class="status available" data-status="available">
								Available</span>
						</div>
						<div class="user-status available">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_2' data-user-id='2'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-2.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Brooks Latshaw</a>
							</h4>
							<span class="status away" data-status="away"> Away</span>
						</div>
						<div class="user-status away">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_3' data-user-id='3'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-3.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Clementina Brodeur</a>
							</h4>
							<span class="status busy" data-status="busy"> Busy</span>
						</div>
						<div class="user-status busy">
							<i class="fa fa-circle"></i>
						</div>
					</li>

				</ul>


				<h4 class="group-head">More Contacts</h4>
				<ul class="contact-list">

					<li class="user-row" id='chat_user_4' data-user-id='4'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-4.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Carri Busey</a>
							</h4>
							<span class="status offline" data-status="offline">
								Offline</span>
						</div>
						<div class="user-status offline">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_5' data-user-id='5'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-5.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Melissa Dock</a>
							</h4>
							<span class="status offline" data-status="offline">
								Offline</span>
						</div>
						<div class="user-status offline">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_6' data-user-id='6'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-1.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Verdell Rea</a>
							</h4>
							<span class="status available" data-status="available">
								Available</span>
						</div>
						<div class="user-status available">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_7' data-user-id='7'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-2.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Linette Lheureux</a>
							</h4>
							<span class="status busy" data-status="busy"> Busy</span>
						</div>
						<div class="user-status busy">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_8' data-user-id='8'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-3.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Araceli Boatright</a>
							</h4>
							<span class="status away" data-status="away"> Away</span>
						</div>
						<div class="user-status away">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_9' data-user-id='9'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-4.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Clay Peskin</a>
							</h4>
							<span class="status busy" data-status="busy"> Busy</span>
						</div>
						<div class="user-status busy">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_10' data-user-id='10'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-5.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Loni Tindall</a>
							</h4>
							<span class="status away" data-status="away"> Away</span>
						</div>
						<div class="user-status away">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_11' data-user-id='11'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-1.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Tanisha Kimbro</a>
							</h4>
							<span class="status idle" data-status="idle"> Idle</span>
						</div>
						<div class="user-status idle">
							<i class="fa fa-circle"></i>
						</div>
					</li>
					<li class="user-row" id='chat_user_12' data-user-id='12'>
						<div class="user-img">
							<a href="#"><img src="data/profile/avatar-2.png" alt=""></a>
						</div>
						<div class="user-info">
							<h4>
								<a href="#">Jovita Tisdale</a>
							</h4>
							<span class="status idle" data-status="idle"> Idle</span>
						</div>
						<div class="user-status idle">
							<i class="fa fa-circle"></i>
						</div>
					</li>

				</ul>
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



