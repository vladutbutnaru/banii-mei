
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
<%@ page import="com.mymoney.DAO.*"%>
<%@ page import="com.mymoney.DAO.Transactions"%>
<%@ page import="com.mymoney.DAO.Accounts"%>
<%@ page import="com.mymoney.DAO.Products"%>
<%@ page import="com.mymoney.DAO.Categories"%>
<%@ page import="com.mymoney.DAO.Locations"%>
<%@ page import="com.mymoney.entities.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.mymoney.entities.*"%>
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
												<img src="data/profile/<%=currentUser.getProfileImagePath() %>" alt="user-image"
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



				<ul class='wraplist'>


					<li class=""><a href="home.jsp"> <i
							class="fa fa-dashboard"></i> <span class="title">Interfata
								de control</span>
					</a></li>
					<li class="open"><a href="accounts.jsp"> <i
							class="fa fa-th"></i> <span class="title">Conturile mele</span><span
							class="label label-orange nosubmenu">2</span>
					</a></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-suitcase"></i> <span class="title">Plati & Castiguri</span> <span
							class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li><a class="" href="newpayment.jsp">Plata noua</a></li>
							<li><a class="" href="newincome.jsp">Castig nou</a></li>
							<li><a class="" href="viewhistory.jsp">Istoricul tranzactiilor</a></li>
							<li><a class="" href="ui-progress.html">Plati recurente</a>
							</li>
							<li><a class="" href="ui-icons.html">Sabloane</a></li>
							<li><a class="" href="ui-buttons.html">Rapoarte</a></li>
							<li><a class="" href="ui-buttons.html">Intelligent
									Reports <span class="label label-orange">Personal+</span>
							</a></li>

							<li><a class="" href="ui-modals.html">Beneficiari</a></li>
							<li><a class="" href="ui-modals.html">Bugete</a></li>

						</ul></li>
					<li class=""><a href="javascript:;"> <i
							class="fa fa-users"></i> <span class="title">Social
								Financing</span> <span class="arrow "></span>
					</a>
						<ul class="sub-menu">
							<li><a class="" href="form-elements.html">Verifica pret</a>
							</li>
							<li><a class="" href="form-components.html">Adauga un
									pret</a></li>
							<li><a class="" href="form-wizard.html">Cele mai
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


				</ul>

			</div>
			<!-- MAIN MENU - END -->



			<div class="project-info">

				<div class="block1">
					<div class="data">
						<span class='title'>Castiguri&nbsp;Noi</span> <span class='total'>1,440</span>
					</div>
					<div class="graph">
						<span class="sidebar_orders">...</span>
					</div>
				</div>

				<div class="block2">
					<div class="data">
						<span class='title'>Plati&nbsp;Noi</span> <span class='total'>345</span>
					</div>
					<div class="graph">
						<span class="sidebar_visitors">...</span>
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
							<h1 class="title">Istoricul meu</h1>
						</div>


					</div>
				</div>
				<div class="clearfix"></div>
	   <div class="col-lg-12">
                        <section class="box ">
                            <header class="panel_header">
                                <h2 class="title pull-left">Istoricul tranzactiilor tale</h2>
                                
                            </header>
                            <div class="content-body">    <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">





                                        <!-- start -->
     <ul class="timeline">

                                                 
                                         <%
                                            Transactions transactionDAO = new Transactions();
                                            EarningSources earningSourceDAO = new EarningSources();
                                            Locations locationsDAO = new Locations();
                                            ProductPrices productPricesDAO = new ProductPrices();
                                            Products productDAO = new Products();
                                            Categories categoryDAO = new Categories();
                                            Accounts accountDAO = new Accounts();
                                            ArrayList<Transaction> listOfTransactions = new ArrayList<Transaction>();
                                            ArrayList<EarningSource> listOfEarningSources = new ArrayList<EarningSource>();
                                            ArrayList<Location> listOfLocations = new ArrayList<Location>();
                                            ArrayList<Product> listOfProducts = new ArrayList<Product>();
                                            ArrayList<Category> listOfCategories = new ArrayList<Category>();
                                            EarningSource earningSource = new EarningSource();
                                            listOfTransactions = transactionDAO.getTransactionsForUser(currentUser);
                                            Account account = new Account();
                                            Location location = new Location();
                                            for(Transaction transaction : listOfTransactions){
                                            	listOfProducts = productDAO.getProductsForProductIDs(transaction.getProductID());
                                            	account = accountDAO.getAccountForTransaction(transaction);
                                            %>
                              
                                           <%if(transaction.getTransactionType() == 1){ 
                                         location = locationsDAO.getLocationForTransaction(transaction);
                                           %>
                                              <li>
                                                <div class="timeline-badge danger animated flipInY"><i class="glyphicon glyphicon-minus"></i></div>
                                                <%} 
                                           else  
                                           {
                                           earningSource = earningSourceDAO.getEarningSourceForTransaction(transaction);
                                           %>
                                             <li class="timeline-inverted ">
                                                   <div class="timeline-badge success animated flipInY"><i class="glyphicon glyphicon-plus"></i></div>
                                                   <%} %>
                                                <div class="timeline-panel animated flipInY">
                                                    <div class="timeline-heading">
                                                        <h4 class="timeline-title"><%= transaction.getTransactionName() %></h4>
                                                        <p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> <%=transaction.getTransactionTime() %> via BaniiMei Web</small></p>
                                                    </div>
                                                    <div class="timeline-body">
                                                        <p><%=transaction.getTransactionDescription() %></p>
                                                        <p><b>Cont: </b><%=account.getAccountName() %></p>
                                                          <p><b>Valoare: </b><%=transaction.getAmount() %></p>
                                                          <%if(transaction.getTransactionType()==1){ %>
                                                           <p><b>Locatie: </b><%=location.getLocationName() %></p>
                                                          
                                                         
                                                          <%} %>
                                                        
                                                   <hr>
                                                           <%if(transaction.getTransactionType() == 1){ %>
                                                         
                                                        <div class="btn-group">
                                                            <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
                                                           
                                                                <i class="glyphicon glyphicon-list-alt"> Produse</i> <span class="caret"></span>
                                                              
                                                            </button>
                                                            <ul class="dropdown-menu" role="menu">
                                                                <% for(Product p : listOfProducts){ %>
                                                                <li><a href="#"><%=p.getProductName() %></a></li>
                                                                <%} %>
                                                                <li class="divider"><% %></li>
                                                                <li><a href="#">Vezi tranzactie</a></li>
                                                            </ul>
                                                        </div>
                                                          <%} 
                                                          else
                                                          {
                                                          %>
                                                          
                                                          Sursa: <%=earningSource.getEarningName() %>
                                                          
                                                          
                                                          
                                                          <%} %>
                                                          
                                                    </div>
                                                </div>
                                            </li>
                                            <%} %>
                                            
                                          
                                          
                                           
                                          
                                        </ul>








                                        <!-- end -->

                                    </div>
                                </div>
                            </div>
                        </section></div>







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
	<!-- Sidebar Graph - END -->










</body>
</html>



