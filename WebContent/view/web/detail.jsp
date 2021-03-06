<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>

<main class="details">
	
	<section class="bg-white dona-detail-hero" id="truonghop">
            <div class="container">
                <div class="row align-items-end justify-content-between">
                    <div class="col-12 order-2 order-md-1">
                        <h1 class="mb-1 h2">${model.name}</h1>
                        <div class="row align-items-end">
                            <div class="infomgz__meta col-12">
                                <span class="time">${model.createdDate}</span>
                                <div class="fb-like fb_iframe_widget" data-layout="button_count" data-action="like" data-size="small" data-share="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="action=like&amp;app_id=320653355376196&amp;container_width=0&amp;href=https%3A%2F%2Fmomo.vn%2Fcong-dong%2Fchung-tay-ho-tro-nghien-cuu-va-san-xuat-cho-phong-chong-dich-benh&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true&amp;size=small">
                                    <span style="vertical-align: bottom; width: 150px; height: 28px;">
                                        <iframe name="f77110205c074" width="1000px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v1.3/plugins/like.php?action=like&amp;app_id=320653355376196&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df346f22806d72b8%26domain%3Dmomo.vn%26is_canvas%3Dfalse%26origin%3Dhttps%253A%252F%252Fmomo.vn%252Ff2b174908dd4cf%26relation%3Dparent.parent&amp;container_width=0&amp;href=https%3A%2F%2Fmomo.vn%2Fcong-dong%2Fchung-tay-ho-tro-nghien-cuu-va-san-xuat-cho-phong-chong-dich-benh&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;share=true&amp;size=small" style="border: none; visibility: visible; width: 150px; height: 28px;" __idm_frm__="580" class=""></iframe>
                                    </span>
                                </div>
                            </div>
                            <div class="col-12 col-md mt-3">
                                <p class="lead text-gray-600">
                                    <span><img src="<c:url value="/template/web/image/icon-heart.png"/>" style="width: 20px; heigth: 20px" alt=""></span> 
                                     ${model.description}
                                </p>
                            </div>
                        </div>
                    </div>                           
                </div>
            </div>
        </section>


        <div class="dona-nav-container isSticky">
            <div class="container">
                <div class="wrap__scroll wrap__scroll__tintuc">
                    <nav class="nav sg-nav wrap__scroll__target" id="navbar-sg">
                        <a class="nav-link dona-link-scroll" href="#truonghop">Ho??n c???nh</a>
                        <a class="nav-link dona-link-scroll" href="#cauchuyen">C??u chuy???n</a>
                        <a class="nav-link dona-link-scroll ng-scope" href="#nhahaotam" data-scrollto="#nhahaotam" data-offset="120">Nh?? h???o t??m</a>
                        <a class="nav-link dona-link-scroll" href="#chuongtrinhkhac" data-scrollto="#chuongtrinhkhac" data-offset="120">Ch????ng tr??nh kh??c</a>
                    </nav>
                </div>
            </div>
        </div>


        <section class="bg-white sc-content" style="transform: none;">
            <div class="container" style="transform: none;">
            
                <div class="row align-content-around" style="transform: none;">
                
                    <div class="col-12 col-lg-7 order-2 order-lg-1 sticky-content">
                        <div class="theiaStickySidebar">
                        	<div class="" id="cauchuyen">${model.detail}  </div>                       
                        </div>
                    </div>

                    <div class="col-12 col-lg-5 order-1 order-lg-2 sticky-sidebar">
                        <div class="quyengop-sticky">
                            <div class="widget-donation pb-0 pb-lg-4">
                                <h2 class="mb-4 text-gray-900 d-none d-md-block h4">Th??ng tin quy??n g??p</h2>
                                <div class="campaign-money">
                                    <strong class="value text-gray-900 fs-24"><fmt:formatNumber pattern="#,###,###" value="${model.currentMoney}"/> ??</strong> quy??n g??p /
                                    <div class="sub"><fmt:formatNumber pattern="#,###,###" value="${model.targetMoney}"/> ??</div>                             
                                </div>

                                <div class="campaign-progress">
                                    <div class="campaign-progress-bar" style="width:50%"></div>
                                </div>

                                <div class="row sm-gutters justify-content-between widget-donation-meta mt-3">
                                    <div class="col-auto">
                                        <div class="">
                                            L?????t quy??n g??p
                                        </div>
                                        <div class="text-gray-900 font-weight-bold">
                                            ${totalCampagin}
                                        </div>
                                    </div>

                                    <div class="col-auto">
                                        <div class="text-center">
                                            ?????t ???????c
                                        </div>
                                        <div class="text-gray-900 font-weight-bold text-center">
                                            4.22%
                                        </div>
                                    </div>                                   
                                </div>

                                <div class="row align-items-end no-gutters mt-3 mt-md-3">
                                    <div class="col">
                                        <div class="campaign-cta">
                                            <div class="my-2">
                                                <a href="<c:url value="/chi-tiet-quyen-gop?action=bank&id=${model.id}"/>" class="btn btn-block btn-primary-3 font-weight-bold cta-donation-1 d-md-block d-none">Quy??n g??p</a>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="widget-sponser">
                                    <div class="text-gray-800 mb-1 font-weight-bold">?????ng h??nh c??ng d??? ??n</div>
                                    <div class="row align-items-center no-gutters position-relative">
                                        <div class="col-auto sponser-logo">
                                            <img src="https://static.mservice.io/blogscontents/momo-upload-api-210625232556-637602603565588447.jpg" loading="lazy" class="img-fluid" alt="">
                                        </div>
                                        <div class="col">
                                            <strong>???y ban M???t tr???n T??? Qu???c Vi???t Nam</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="pb-3 d-none d-lg-block">
                                <div class="pb-3 d-none d-lg-block">
                                    <h4 class="mt-5 mb-3">Ch????ng tr??nh ??ang di???n ra</h4>
                                    <div class="mb-3">
                                        <div class="campaign-dn">
                                            <a href="/cong-dong/chung-tay-quyen-gop-xay-quy-tai-tro-hoc-bong-cho-2-em-hoc-sinh-ngheo-vuot-kho" class="link-absolute"></a>
                                            <div class="campaign-dn-img">
                                                <img src="https://static.mservice.io/blogscontents/momo-upload-api-210615104708-637593508287155649.jpg" alt="Chung tay quy??n g??p x??y qu??? t??i tr??? h???c b???ng cho 2 em h???c sinh ngh??o v?????t kh??" loading="lazy">
                                            </div>
                                            <div class="campaign-dn-body">
                                                <h5 class="campaign-dn-title">
                                                    Chung tay quy??n g??p x??y qu??? t??i tr??? h???c b???ng cho 2 em h???c sinh ngh??o v?????t kh??
                                                </h5>
                                                <p class="campaign-dn-summary">
                                                    C??ng quy??n g??p, l??m t??? thi???n ????? g??y qu??? t??i tr??? h???c b???ng cho 2 em l?? Tr???n V??n Huy v?? B??i Th??? Uy??n Trang c?? ?? ch?? v?????t kh?? v????n l??n trong h???c t???p trong ch????ng tr??nh ???C???P L?? Y??U TH????NG???. Chung tay ngay!
                                                </p>
                                            </div>
                                            <div class="campaign-dn-footer">
                                                <div class="campaign-dn-info">
                                                    <div class="campaign-dn-money">
                                                        <b>10.615.406??</b>
                                                        <span>quy??n g??p</span>
                                                    </div>
                                                    <div class="campaign-dn-percent">22.12%</div>
                                                </div>

                                                <div class="campaign-progress">
                                                    <div class="campaign-progress-bar" style="width:22.12%"></div>
                                                </div>

                                                <div class="campaign-dn-time">
                                                    <div>
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users ico"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                                        <span>708 l?????t quy??n g??p</span>
                                                    </div>
                                                    <div>
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock ico"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                                        <span>Th???i h???n c??n 45 Ng??y</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="nhahaotam" class="ds-nhahaotam ng-scope">
                                <div class="donation__detail__heading has-border-top">
                                    <h2 class="fw-600 m-0 h4">Nh?? h???o t??m m???i nh???t</h2>
                                </div>
                                
                                <div class="border rounded px-3">
                                
                                    <div class="campaign-people-list">
                                    
                                        <div class="campaign-people-item">
                                            <div class="campaign-people-avatar ng-binding">MN</div>

                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">NGUYEN THI MINH NGUYET</div>
                                                <div class="campaign-people-phone ng-binding">*******451</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">5.000</text>
                                                <text class="ng-scope">??</text>
                                            </div>
                                        </div>

                                        <div class="campaign-people-item">

                                            <div class="campaign-people-avatar ng-binding ng-scope">MN</div>
                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">NGUYEN THI MINH NGUYET</div>
                                                <div class="campaign-people-phone ng-binding">*******451</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">5.000</text>
                                                <text class="ng-scope">??</text>
                                            </div>
                                        </div>

                                        <div class="campaign-people-item">

                                            <div class="campaign-people-avatar ng-binding ng-scope">TT</div>

                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">DANH THI THANH TUYEN</div>
                                                <div class="campaign-people-phone ng-binding">*******119</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">20.000</text>
                                                <text class="ng-scope">??</text>

                                            </div>
                                        </div>

                                        <div class="campaign-people-item">
                                            <div class="campaign-people-avatar ng-binding ng-scope">DB</div>
                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">TA DANG BIEN</div>
                                                <div class="campaign-people-phone ng-binding">*******173</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">1.000</text>
                                                <text class="ng-scope">??</text>

                                            </div>
                                        </div>
                                        <!-- end ngRepeat: item in ModelTrans.Items|limitTo:10 -->
                                        <div class="campaign-people-item">

                                            <div class="campaign-people-avatar is-image ng-scope">
                                                <img src="https://static.mservice.io/images/s/momo-upload-api-200520135933-637255799731362042.png" width="28" alt="">
                                            </div>

                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">Nh?? h???o t??m</div>
                                                <div class="campaign-people-phone ng-binding">*******000</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">100.000</text>
                                                <text class="ng-scope">??</text>

                                            </div>
                                        </div>

                                        <div class="campaign-people-item">
                                            <div class="campaign-people-avatar ng-binding ng-scope">MH</div>

                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">L?? MINH HO??NG</div>
                                                <div class="campaign-people-phone ng-binding">*******387</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">1.000</text>
                                                <text class="ng-scope">??</text>

                                            </div>
                                        </div>

                                        <div class="campaign-people-item">
                                            <div class="campaign-people-avatar ng-binding ng-scope">ND</div>
                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">NGUY???N NG???C DI???P</div>
                                                <div class="campaign-people-phone ng-binding">*******438</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">11.000</text>
                                                <text class="ng-scope">??</text>
                                            </div>
                                        </div>

                                        <div class="campaign-people-item">

                                            <div class="campaign-people-avatar ng-binding ng-scope">BT</div>


                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">NGUYEN TUONG BAO TRAN</div>
                                                <div class="campaign-people-phone ng-binding">*******562</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">1.000</text>
                                                <text class="ng-scope">??</text>

                                            </div>
                                        </div>

                                        <div class="campaign-people-item">

                                            <div class="campaign-people-avatar ng-binding ng-scope">TP</div>


                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">TR???N TH??? PH????NG</div>
                                                <div class="campaign-people-phone ng-binding">*******382</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">100.000</text>
                                                <text class="ng-scope">??</text>

                                            </div>
                                        </div>
                                        
                                        <div class="campaign-people-item">

                                            <div class="campaign-people-avatar is-image ng-scope">
                                                <img src="https://static.mservice.io/images/s/momo-upload-api-200520135933-637255799731362042.png" width="28" alt="">
                                            </div>

                                            <div class="campaign-people-info">
                                                <div class="campaign-people-name ng-binding">Nh?? h???o t??m</div>
                                                <div class="campaign-people-phone ng-binding">*******119</div>
                                            </div>

                                            <div class="campaign-people-money">
                                                <text class="ng-binding">20.000</text>
                                                <text class="ng-scope">??</text>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <!-- <div class="mt-3">
                                    <a href="#" class="btn btn-outline-dark font-weight-bold">
                                    Xem t???t c???
                                	</a>
                                </div> -->
                            </div>
                
            </div>                    
        </section>
        
        <section class="bg-white" id="chuongtrinhkhac">
            <div class="container">

                <div class="row align-items-center">
                    <div class="col-12 col-md pb-2">
                        <h2 class="h4">C??c ch????ng tr??nh quy??n g??p kh??c</h2>
                    </div>
                </div>
                
                <div class="row sm-gutters">
                
                    <div class="col-12 col-md-6 col-lg-4 mb-3 d-lg-none">                    
                        <div class="campaign-dn">
                            <a href="" class="link-absolute"></a>
                            <div class="campaign-dn-img">
                                <img src="https://static.mservice.io/blogscontents/momo-upload-api-210615104708-637593508287155649.jpg" alt="Chung tay quy??n g??p x??y qu??? t??i tr??? h???c b???ng cho 2 em h???c sinh ngh??o v?????t kh??" loading="lazy">
                            </div>
                            <div class="campaign-dn-body">
                                <h5 class="campaign-dn-title">
                                    Chung tay quy??n g??p x??y qu??? t??i tr??? h???c b???ng cho 2 em h???c sinh ngh??o v?????t kh??
                                </h5>
                                <p class="campaign-dn-summary">
                                    C??ng quy??n g??p, l??m t??? thi???n ????? g??y qu??? t??i tr??? h???c b???ng cho 2 em l?? Tr???n V??n Huy v?? B??i Th??? Uy??n Trang c?? ?? ch?? v?????t kh?? v????n l??n trong h???c t???p trong ch????ng tr??nh ???C???P L?? Y??U TH????NG???. Chung tay ngay!
                                </p>
                            </div>
                            <div class="campaign-dn-footer">
                                <div class="campaign-dn-info">
                                    <div class="campaign-dn-money">
                                        <b>10.615.406??</b>
                                        <span>quy??n g??p</span>
                                    </div>
                                    <div class="campaign-dn-percent">22.12%</div>
                                </div>

                                <div class="campaign-progress">
                                    <div class="campaign-progress-bar" style="width:22.12%"></div>
                                </div>

                                <div class="campaign-dn-time">
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users ico"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                        <span>708 l?????t quy??n g??p</span>
                                    </div>
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock ico"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                        <span>Th???i h???n c??n 45 Ng??y</span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4 mb-3">
                        <div class="campaign-dn">
                            <a href="#" class="link-absolute"></a>
                            <div class="campaign-dn-img">
                                <img src="https://static.mservice.io/blogscontents/momo-upload-api-210813110411-637644494519487360.png" alt="" loading="lazy">
                            </div>
                            <div class="campaign-dn-body">
                                <h5 class="campaign-dn-title">
                                    C??ng Th??nh ??o??n TP.HCM v???n ?????ng ????ng g??p h???c b???ng ????????ng h??nh c??ng h???c sinh kh?? kh??n v?????t qua ?????i d???ch???
                                </h5>
                                <p class="campaign-dn-summary">
                                    C??ng chung tay ????ng g??p h???c b???ng trao t???ng c??c b???n h???c sinh kh?? kh??n ch???u ???nh h?????ng b???i d???ch b???nh tr?????c th???m n??m h???c 2021 - 2022.
                                </p>
                            </div>
                            <div class="campaign-dn-footer">
                                <div class="campaign-dn-info">
                                    <div class="campaign-dn-money">
                                        <b>26.227.756??</b>
                                        <span>quy??n g??p</span>
                                    </div>
                                    <div class="campaign-dn-percent">52.46%</div>
                                </div>

                                <div class="campaign-progress">
                                    <div class="campaign-progress-bar" style="width:52.46%"></div>
                                </div>

                                <div class="campaign-dn-time">
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users ico"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                        <span>781 l?????t quy??n g??p</span>
                                    </div>
                                    <!-- <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock ico"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                        <span>Th???i h???n c??n 7 Gi???</span>
                                    </div> -->

                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-12 col-md-6 col-lg-4 mb-3">
                        <div class="campaign-dn">
                            <a href="/cong-dong/chung-tay-ho-tro-cho-tuyen-dau-truc-tiep-tham-gia-phong-chong-dich" class="link-absolute"></a>
                            <div class="campaign-dn-img">
                                <img src="https://static.mservice.io/blogscontents/momo-upload-api-210625182125-637602420857550435.jpg" alt="Chung tay h??? tr??? cho tuy???n ?????u tr???c ti???p tham gia ph??ng ch???ng d???ch" loading="lazy">
                            </div>
                            <div class="campaign-dn-body">
                                <h5 class="campaign-dn-title">
                                    Chung tay h??? tr??? cho tuy???n ?????u tr???c ti???p tham gia ph??ng ch???ng d???ch
                                </h5>
                                <p class="campaign-dn-summary">
                                    C??ng chia s??? v???i nh???ng kh?? kh??n, v???t v???, hi???m nguy m?? ?????i ng?? c??n b???, nh??n vi??n ng??nh Y t??? (y s???, b??c s??, ??i???u d?????ng, nh??n vi??n y t???, l???c l?????ng v?? trang, t??? ph??ng ch???ng d???ch ??? c???ng ?????ng...) ??ang c??ng m??nh tr??n tuy???n ?????u ph??ng, ch???ng d???ch.
                                </p>
                            </div>
                            <div class="campaign-dn-footer">
                                <div class="campaign-dn-info">
                                    <div class="campaign-dn-money">
                                        <b>157.098.000??</b>
                                        <span>quy??n g??p</span>
                                    </div>
                                    <div class="campaign-dn-percent">15.71%</div>
                                </div>

                                <div class="campaign-progress">
                                    <div class="campaign-progress-bar" style="width:15.71%"></div>
                                </div>

                                <div class="campaign-dn-time">
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users ico"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                        <span>2.591 l?????t quy??n g??p</span>
                                    </div>
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock ico"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                        <span>Th???i h???n c??n 2 Gi???</span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-12 col-md-6 col-lg-4 mb-3">
                        <div class="campaign-dn">
                            <a href="/cong-dong/ung-ho-quy-vaccine-trai-tim-ket-noi-trai-tim-de-cung-nhau-vuot-qua-dai-dich" class="link-absolute"></a>
                            <div class="campaign-dn-img">
                                <img src="https://static.mservice.io/blogscontents/momo-upload-api-210625165627-637602369877886730.jpg" alt="???ng h??? Qu??? Vaccine: Tr??i tim k???t n???i tr??i tim ????? c??ng nhau v?????t qua ?????i d???ch" loading="lazy">
                            </div>
                            <div class="campaign-dn-body">
                                <h5 class="campaign-dn-title">
                                    ???ng h??? Qu??? Vaccine: Tr??i tim k???t n???i tr??i tim ????? c??ng nhau v?????t qua ?????i d???ch
                                </h5>
                                <p class="campaign-dn-summary">
                                    C??ng chung tay g??p s???c trong c??ng t??c ph??ng, ch???ng d???ch, quy???t t??m ho??n th??nh vi???c ti??m ch???ng ?????i tr?? vaccine cho tr??n 70% ng?????i d??n trong n??m nay.

                                </p>
                            </div>
                            <div class="campaign-dn-footer">
                                <div class="campaign-dn-info">
                                    <div class="campaign-dn-money">
                                        <b>310.090.385??</b>
                                        <span>quy??n g??p</span>
                                    </div>
                                    <div class="campaign-dn-percent">15.50%</div>
                                </div>

                                <div class="campaign-progress">
                                    <div class="campaign-progress-bar" style="width:15.50%"></div>
                                </div>

                                <div class="campaign-dn-time">
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users ico"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                        <span>14.525 l?????t quy??n g??p</span>
                                    </div>
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock ico"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                        <span>Th???i h???n c??n 2 Gi???</span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>

</main>
