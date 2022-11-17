<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>mainPage</title>

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />

<link href="css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">

	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Music Sharing</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">What?</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Login
							/ Signup</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">

			<img class="masthead-avatar mb-5" src="img/itunes.png" />

			<h1 class="masthead-heading text-uppercase mb-0">Music Sharing</h1>

			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<p class="masthead-subheading font-weight-light mb-0">나만 알고있는 노래를
				공유해보세요!!</p>
		</div>
	</header>

	<section class="page-section portfolio" id="portfolio">
		<div class="container">

			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">어떤
				사이트인가요?</h2>

			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<div class="row">
				<div class="row">
					<div class="col-lg-4 ms-auto">
						<img class="masthead-avatar mb-56" src="img/share.png" />
					</div>
					<div class="col-lg-98 me-auto">
						<h3 class="lead2" style="margin-left: 50px">나만 알고있는 좋은 노래를</h3>
						<div class="col-lg-97 me-auto">
							<h3 class="lead2">다른 사람들과 함께 공유해보세요!</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="page-section bg-primary text-white text-center mb-0"
		id="about">
		<div class="container">

			<h2
				class="page-section-heading text-center text-uppercase text-white">또
				무엇을 할 수 있나요?</h2>

			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<div class="row">
				<div class="row">
					<div class="col-lg-4 ms-auto">
						<img class="masthead-avatar mb-56" src="img/question.png" />
					</div>
					<div class="col-lg-98 me-auto">
						<h3 class="lead2" style="margin-left: 50px">질문게시판을 통해</h3>
						<div class="col-lg-97 me-auto">
							<h3 class="lead2">찾고싶은 노래를 다른사람들과 묻고 답해보세요!</h3>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section class="page-section" id="contact">
		<div class="container">

			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">로그인
				/ 회원가입</h2>

			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<h1 class="masthead-heading text-uppercase mb-0 text-center">지금
				바로 시작해보세요!</h1>
			<div class="text-center mt-4">
				<div class="col-lg-96 ms-auto align-items-center">
					<img class="masthead-avatar mb-55" src="img/login.png" />
				</div>
				<button class="btn btn-xl btn-outline-black1"
					onclick="location.href='Login.jsp'">로그인</button>
				<button class="btn btn-xl btn-outline-black2"
					onclick="location.href='signUp.jsp'">회원가입</button>
			</div>
		</div>
	</section>

	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Ingi 2022</small>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>