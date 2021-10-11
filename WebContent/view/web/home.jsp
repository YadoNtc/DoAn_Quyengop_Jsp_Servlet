<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>

<main>

        <div class="container-fluid p-0">
            <div class="bd-example">
                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleCaptions" data-slide-to="0" class=""></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="1" class=""></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="2" class=""></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="3" class=""></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="4" class="active"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item">
                            <img src="https://onehealth.foundation/wp-content/uploads/2019/11/banner_6.png" width="100%">
                            <div class="text-left carousel-caption d-none d-md-block" style="margin-bottom: 10rem;">
                                <h2 style="font-size: 50px;text-shadow: 0px 4px 15px #ffffff;color: #000;">
                                    <p style="font-size: 50px;">MINH BẠCH<br> BỀN VỮNG<br> TẬN TÂM</p>
                                </h2>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="https://onehealth.foundation/wp-content/uploads/2019/11/banner_2.png" width="100%">
                            <div class="text-left carousel-caption d-none d-md-block" style="margin-bottom: 10rem;">
                                <h2 style="font-size: 50px;text-shadow: 0px 4px 15px #ffffff;color: #000;"></h2>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="https://onehealth.foundation/wp-content/uploads/2019/11/banner_1-1.png" width="100%">
                            <div class="text-left carousel-caption d-none d-md-block" style="margin-bottom: 10rem;">
                                <h2 style="font-size: 50px;text-shadow: 0px 4px 15px #ffffff;color: #000;"></h2>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="https://onehealth.foundation/wp-content/uploads/2019/11/banner_4.png" width="100%">
                            <div class="text-left carousel-caption d-none d-md-block" style="margin-bottom: 10rem;">
                                <h2 style="font-size: 50px;text-shadow: 0px 4px 15px #ffffff;color: #000;"></h2>
                            </div>
                        </div>
                        <div class="carousel-item active">
                            <img src="https://onehealth.foundation/wp-content/uploads/2019/11/banner_5.png" width="100%">
                            <div class="text-left carousel-caption d-none d-md-block" style="margin-bottom: 10rem;">
                                <h2 style="font-size: 50px;text-shadow: 0px 4px 15px #ffffff;color: #000;"></h2>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                        <span class="fas fa-chevron-double-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                        <!-- <i class="fas fa-chevron-double-right"></i> -->
                        <span class="fas fa-chevron-double-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>

        <div class="home-blog section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-xxl-3 col-xl-3">
                        <div class="section-tittle mb-130">
                            <span>Hoàn cảnh</span>
                            <h2>Chiến dịch</h2>
                        </div>
                    </div>
                    
                    <div class="col-xxl-9 col-xl-9">
                        <div id="news-slider" class="owl-carousel blog-active">
                        	
                        	<c:forEach var="item" items="${model.listResult}">
                        		<c:if test="${item.status == 'inprogress' }">
                        			<div class="single-blogs post-slide">
		                                <div class="blog-img">
		                                    <img src="${item.image}" alt="">
		                                </div>
		                                <div class="blog-caption">
		                                    <h3><a href="#"></a>${item.name}</h3>
		                                    <p>${item.description} </p>
		                                    <a href="<c:url value="/trang-chu?action=detail&id=${item.id}"/>" class="browse-btn">Xem chi tiết</a>
		                                </div>
		                            </div>
                        		</c:if>                  		
                        	</c:forEach>                      	                                                   
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <section class="about-area1 section-bg pt-60 pb-60">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xxl-6 col-xl-5 col-lg-6 col-md-8">

                        <div class="about-img about-img1  ">
                            <img src="<c:url value="/template/web/image/hotro.jpg"/>" alt="">
                        </div>
                    </div>
                    <div class="offset-xl-1 col-xxl-4 col-xl-6 col-lg-6 col-md-9">
                        <div class="about-caption about-caption1">

                            <div class="section-tittle mb-25">
                                <span>Đang quyên góp...</span>
                                <h2>Chung tay hỗ trợ nghiên cứu và sản xuất cho phòng chống dịch bệnh</h2>
                                <p class="mb-30">Cùng chung tay nghiên cứu và phát triển công nghệ (sản xuất vắc xin, trang thiết bị chống dịch,...) để phục vụ phát triển kinh tế-xã hội và đặc biệt là phòng chống dịch trong thời điểm hiện nay.</p>
                            </div>
                            <div class="double-btn d-flex flex-wrap">
                                <a href="<c:url value="/trang-chu?action=donate"/>" class="btn_01 mr-15">Quyên góp</a>
                                <a href="<c:url value="/trang-chu?action=detail&id=${model.id}"/>" class="border-btn">Chi tiết</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="about" class="about-area1 section-padding">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xxl-5 col-xl-5 col-lg-6 col-md-9">
                        <div class="about-caption about-caption2">
                            <div class="section-tittle mb-25">
                                <span>Về chúng tôi</span>
                                <h2>Chúng tôi là quỹ từ thiện trái tim dịu dàng.</h2>
                                <p class="mb-50 pt-20">Thực hiện những dự án nhằm nâng cao các cơ hội được chăm sóc y tế và giáo dục phổ thông tới những người có hoàn cảnh kinh tế khó khăn tại Việt Nam. Đồng thời chúng tôi sẽ tìm ra các giải pháp khắc phục các vấn đề về ô nhiễm môi trường sống cho cộng đồng</p>
                            </div>
                            <a href="<c:url value="/trang-chu?action=about"/>" class="btn_01">Xem nhiều hơn</a>
                        </div>
                    </div>
                    <div class="offset-xxl-1 col-xxl-6 col-xl-7 col-lg-6 col-md-10">
                        <div class="about-img about-img1  ">
                            <img src="<c:url value="/template/web/image/traitim.jpg"/>" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div id="campagin" class="class-offer-area fix">
            <div class="container-fluid p-0">
                <div class="class-offer-active row">
                	
                	<c:forEach var="item" items="${model.listResult}">
                		<c:if test="${item.status == 'inprogress'}">
                			<div class="col-lg-4 col-md-6 col-sm-6">
		                        <div class="properties pb-30">
		                            <div class="properties__card">
		                                <div class="properties__img">
		                                    <a href="#"><img src="${item.image}" alt=""></a>
		                                </div>
		                                <div class="properties__caption">
		                                    <h3><a href="#">${item.name}</a></h3>
		                                    <p>${item.description}</p>
		                                </div>
		                                <div class="properties__footer d-flex flex-wrap justify-content-between align-items-center">
		                                    <div class="class-day">
		                                        <p>Cần quyên góp</p>		                                    
		                                        <span><fmt:formatNumber pattern="#,###,###" value="${item.targetMoney}"/> đ</span>
		                                    </div>
		                                    <div class="class-day">
		                                        <p>Đã nhận được</p>
		                                        <span><fmt:formatNumber pattern="#,###,###" value="${item.currentMoney}"/> đ</span>
		                                    </div>
		                                    <div class="class-day">
		                                        <a href="<c:url value="/chi-tiet-quyen-gop?action=bank&id=${item.id}"/>" class="btn_01">Quyên góp</a>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
                		</c:if>               			                    
                	</c:forEach>
                   
                </div>
            </div>
        </div>

        <section class="about-area1 section-padding">
            <div class="container">
                <div class="row align-items-center">
                    <div class="offset-xl-1 col-xxl-5 col-xl-5 col-lg-6 col-md-6">

                        <div class="about-img about-img1  ">
                            <img src="<c:url value="/template/web/image/yte.png"/>" alt="">
                        </div>
                    </div>
                    <div class="offset-xl-1 col-xxl-5 col-xl-5 col-lg-6 col-md-6">
                        <div class="about-caption about-caption1">

                            <div class="section-tittle m-0">
                                <span>Việc tốt hôm nay</span>
                                <h2>Chúng tôi đang làm gì?</h2>
                                <p class="mb-30">Tập trung xây dựng một hệ thống y tế cộng đồng bền vững trên toàn lãnh thổ Việt Nam để đảm bảo cho tất cả người dân đều được chăm sóc về y tế, giáo dục hiệu quả với chi phí phù hợp và sống trong môi trường lành mạnh.</p>
                                <a href="#" class="border-btn">Tham gia</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="our-services-area section-img-bg section-padding" data-background="https://preview.colorlib.com/theme/charitee/assets/img/gallery/section-bg1.jpg.webp">
            <div class="container">
                <div class="row justify-content-center mb-25">
                    <div class="col-xl-12">

                        <div class="section-tittle section-tittle2 text-center">
                            <span>Sứ mệnh hôm nay</span>
                            <h2>Chúng tôi giúp đỡ mọi người như thế nào?</h2>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-between">
                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services1 text-center">
                            <div class="services-ion">
                                <img src="https://preview.colorlib.com/theme/charitee/assets/img/icon/services1.svg" alt="">
                            </div>
                            <div class="services-cap">
                                <h5><a href="#">Thực phẩm</a></h5>
                                <p>Xây dựng các bếp ăn từ thiện, phát bữa ăn miễn phí cho bệnh nhân và người nhà bệnh nhân. Với ý nghĩa "một miếng khi đói bằng một gói khi no".</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services1 text-center">
                            <div class="services-ion">
                                <img src="https://preview.colorlib.com/theme/charitee/assets/img/icon/services2.svg" alt="">
                            </div>
                            <div class="services-cap">
                                <h5><a href="#">Sức khỏe & y tế</a></h5>
                                <p>Cùng xã hội trong công tác chăm sóc sức khỏe cộng đồng đã trở thành sự quan tâm ưu tiên hàng đầu và luôn được tự ý thức là nhiệm vụ.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                        <div class="single-services1 text-center">
                            <div class="services-ion">
                                <img src="https://preview.colorlib.com/theme/charitee/assets/img/icon/services3.svg" alt="">
                            </div>
                            <div class="services-cap">
                                <h5><a href="#">Giáo dục</a></h5>
                                <p>Hỗ trợ trẻ em đến từ các địa phương vẫn còn nghèo đói hoặc chậm phát triển kinh tế hoàn thành chương trình phổ thông hoặc tiếp tục tại các bậc học hoặc đào tạo cao hơn.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="map-are section-padding40">
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.298698336496!2d106.74441501411715!3d10.864870760527523!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527f2ce1f27cb%3A0x4c19acb9933c71fa!2zMzEgUGjDuiBDaMOidSwgVGFtIFBow7osIFRo4bunIMSQ4bupYywgVGjDoG5oIHBo4buRIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1630336471388!5m2!1svi!2s"
                    width="100%" height="500" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>
        </div>
    </main>
    
   