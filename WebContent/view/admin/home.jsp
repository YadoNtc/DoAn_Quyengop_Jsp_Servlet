<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>

<body>
	<div class="main-content">
		<div class="main-content-inner">

			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>
					<li class="active">Dashboard</li>
				</ul>
				<!-- /.breadcrumb -->

				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon"> <input type="text"
							placeholder="Search ..." class="nav-search-input"
							id="nav-search-input" autocomplete="off" /> <i
							class="ace-icon fa fa-search nav-search-icon"></i>
						</span>
					</form>
				</div>
				<!-- /.nav-search -->
			</div>
			<div class="page-content">
				<div class="page-header">
					<h1>
						Dashboard <small> <i
							class="ace-icon fa fa-angle-double-right"></i> Tổng quan &amp;
							số liệu thống kê
						</small>
					</h1>
				</div>
				<!-- /.page-header -->

				<div class="row">
					<div class="space-6"></div>

					<div class="col-sm-7 infobox-container">
						<div class="infobox infobox-green">
							<div class="infobox-icon">
								<i class="ace-icon fa fa-comments"></i>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">32</span>
								<div class="infobox-content">Bình luận + 2 đánh giá</div>
							</div>

							<div class="stat stat-success">8%</div>
						</div>

						<div class="infobox infobox-blue">
							<div class="infobox-icon">
								<i class="ace-icon fa fa-twitter"></i>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">11</span>
								<div class="infobox-content">Lượt theo dõi</div>
							</div>

							<div class="badge badge-success">
								+32% <i class="ace-icon fa fa-arrow-up"></i>
							</div>
						</div>

						<div class="infobox infobox-pink">
							<div class="infobox-icon">
								<i class="ace-icon fas fa-donate"></i>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">${newCampagin}</span>
								<div class="infobox-content">Quyên góp mới</div>
							</div>
							<div class="stat stat-important">4%</div>
						</div>


						<div class="infobox infobox-orange2">
							<div class="infobox-chart">
								<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
							</div>

							<div class="infobox-data">
								<span class="infobox-data-number">6,251</span>
								<div class="infobox-content">Lượt xem</div>
							</div>

							<div class="badge badge-success">
								7.2% <i class="ace-icon fa fa-arrow-up"></i>
							</div>
						</div>

						<div class="infobox infobox-blue2">
							<div class="infobox-progress">
								<div class="easy-pie-chart percentage" data-percent="42"
									data-size="46">
									<span class="percent">${model.totalItem}</span>
								</div>
							</div>

							<div class="infobox-data">
								<span class="infobox-text">Chương trình</span>

								<div class="infobox-content">
									<span class="bigger-110">~</span> ${completed} completed
								</div>
							</div>
						</div> 

						<div class="space-6"></div>
					</div>

					<div class="vspace-12-sm"></div>

					<div class="col-sm-5">
						<div class="widget-box">
							<div class="widget-header widget-header-flat widget-header-small">
								<h5 class="widget-title">
									<i class="ace-icon fa fa-signal"></i> Nguồn lưu lượng
								</h5>

								<div class="widget-toolbar no-border">
									<div class="inline dropdown-hover">
										<button class="btn btn-minier btn-primary">
											This Week <i
												class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>
										</button>

										<ul
											class="dropdown-menu dropdown-menu-right dropdown-125 dropdown-lighter dropdown-close dropdown-caret">
											<li class="active"><a href="#" class="blue"> <i
													class="ace-icon fa fa-caret-right bigger-110">&nbsp;</i>
													This Week
											</a></li>

											<li><a href="#"> <i
													class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
													Last Week
											</a></li>

											<li><a href="#"> <i
													class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
													This Month
											</a></li>

											<li><a href="#"> <i
													class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
													Last Month
											</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main">
									<div id="piechart-placeholder"></div>

									<div class="hr hr8 hr-double"></div>

									<div class="clearfix">
										<div class="grid3">
											<span class="grey"> <i
												class="ace-icon fa fa-facebook-square fa-2x blue"></i>
												&nbsp; likes
											</span>
											<h4 class="bigger pull-right">1,255</h4>
										</div>

										<div class="grid3">
											<span class="grey"> <i
												class="ace-icon fa fa-twitter-square fa-2x purple"></i>
												&nbsp; tweets
											</span>
											<h4 class="bigger pull-right">941</h4>
										</div>

										<div class="grid3">
											<span class="grey"> <i
												class="ace-icon fa fa-pinterest-square fa-2x red"></i>
												&nbsp; pins
											</span>
											<h4 class="bigger pull-right">1,050</h4>
										</div>
									</div>
								</div>
								<!-- /.widget-main -->
							</div>
							<!-- /.widget-body -->
						</div>
						<!-- /.widget-box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
		</div>
	</div>
</body>