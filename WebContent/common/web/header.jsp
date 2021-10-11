<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>

<header>
        <div class="main-menu .header-transparent sticky-bar">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="logo">
                    <a href="<c:url value="/trang-chu"/>"><img class="logo-icon" src="<c:url value="/template/web/image/xfavicon.jpg"/>">Charitee</a>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="menu" class="navbar-nav mr-auto">
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/trang-chu"/>">Trang chủ <span class="sr-only">(current)</span></a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">Về chúng tôi?</a></li>
                        <li class="nav-item"><a class="nav-link" href="#campagin">Chương trình</a></li>
                        <!-- <li class="nav-item"><a class="nav-link" href="about.html">About</a></li> -->
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="blog.html">Quỹ từ thiện</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Quỹ từ thiện</a></li>
                                <li><a class="dropdown-item" href="#">Hội chữ thập đỏ Vn</a></li>
                                <li><a class="dropdown-item" href="#">MTTQ</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a href="#lienhe">Liên hệ</a></li>
                    </ul>
                </div>
                <div class="header-right-btn f-right  ml-15 row" style="display: contents;">
                	<c:if test="${empty userModel}">
                		<a href="<c:url value="/dang-ky"/>" class="btn btn-outline-success my-2 my-sm-0" type="submit">Đăng ký</a>
                    	<a href="<c:url value="/dang-nhap?action=login"/>" class="btn btn-outline-success my-2 my-sm-0">Đăng nhập</a>
                    	<a href="<c:url value="/trang-chu?action=donate"/>" class="btn_1 header-btn"><i class="fas fa-heart"></i>Quyên góp</a>
                	</c:if>
                	
                	<c:if test="${not empty userModel}">
                		<div class="col" style="display: contents;">             	                		
                    		<a href="<c:url value="/trang-chu?action=donate"/>" class="btn_1 header-btn"><i class="fas fa-heart"></i>Quyên góp</a>
                    	</div>      
                    	
                    	<div class="col navbar-buttons navbar-header pull-right" role="navigation">
							<ul class="nav ace-nav">
								<li class="light-blue dropdown-modal">
									<a data-toggle="dropdown" href="#" class="dropdown-toggle">
										<span class="user-info"> <small>Xin chào, </small>${userModel.fullName}</span>
									    <!-- <i class="ace-icon fa fa-caret-down"></i> -->
									</a>	
									<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close"
										style="min-width: 13rem;">
										<li><a href="#"> <i class="ace-icon fa fa-cog" style="padding: 0 5px;"></i>Cài đặt</a></li>				
										<li><a href="<c:url value="/trang-chu?action=profile&id=${userModel.id}"/>"> <i class="ace-icon fa fa-user" style="padding: 0 5px;"></i> Cập nhật tài khoản</a></li>
										<li><a href="<c:url value="/trang-chu?action=history&id=${userModel.id}"/>"> <i class="ace-icon fas fa-donate" style="padding: 0 5px;"></i> Lịch sử quyên góp</a></li>			
										<li class="divider" style="height: 2vw; background: #20075f;"></li>				
										<li><a href="<c:url value="/thoat?action=logout" />"> <i class="ace-icon fa fa-power-off" style="padding: 0 5px;"></i>Đăng xuất</a></li>
									</ul></li>
							</ul>
						</div>					
                	</c:if>             
                </div>
            </nav>

        </div>
    </header>