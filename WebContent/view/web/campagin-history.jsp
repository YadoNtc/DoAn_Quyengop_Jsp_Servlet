<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>


<main style="margin-top: 104px;">

	<div class="u-dashboard-top"
		style="background-image: url(https://unica.vn/media/img/bg-db.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p>Thành viên: ${userModel.fullName}</p>
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav nav-tabs" style="border-bottom: 0px !important">																								
							<li class="">
								<a href="<c:url value="/trang-chu?action=profile&id=${userModel.id}"/>" class=""><i class="fa fa-user" aria-hidden="true"></i> Hồ sơcá nhân</a>
							</li>			
							<li class="">
								<a href="<c:url value="/trang-chu?action=history&id=${userModel.id}"/>" class=""><i class="fa fa-user" aria-hidden="true"></i> Lịch sử quyên góp</a>
							</li>																
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content-main-user" style="background: #F2F2F2;">
		<div class="container">	
			<div class="panel panel-default">
				<div class="panel-heading">
					<span style="font-weight: bold;"><i class="fa fa-user"
						aria-hidden="true"></i> Lịch sử quyên góp</span>
				</div>
						
			<div class="panel-body">							
				<div class="table-responsive">
                    <table id="myTable" class="table table-hover">
                        <thead>
                            <tr>                           
                                <th>TÊN CHƯƠNG TRÌNH QUYÊN GÓP</th>
                                <th>IDCTQG</th>
                                <th style="width: 120px;">TRẠNG THÁI</th>
                                <th>NGÀY</th>
                                <th>SỐ TIỀN (vnd)</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        	<c:forEach var="item" items="${detailModel.listResult}">
                        		<tr>                     	                                    									
                                   	<td>
                                    	<c:forEach var="d" items="${donateModel}">                               	
	                                    	<c:if test="${d.id == item.campaginId}">
	                                    		${d.name}
	                                    	</c:if>	                                    	
                                    	</c:forEach>                                
                                   	</td>
                                    <td>${item.campaginId}</td>
                                    <td>
                                    	<c:if test="${item.status == 'transferring' }">Chưa chuyển khoản</c:if>
                                    	<c:if test="${item.status == 'transferred' }">Đã chuyển khoản</c:if>
                                    </td>
                                    <td><fmt:formatDate value="${item.createdDate}"/></td>
                                    <td>
                                    	<fmt:setLocale value = "vi_VN"/>
         								<fmt:formatNumber  value ="${item.amoutMoney}" type ="currency"/>                               	
                                   	</td>                                       	
                                </tr>
                        	</c:forEach>                                                             
                           </tbody>
                           <tfoot>
					            <tr>					       
					                <th colspan="4" style="text-align:right">Tổng: </th>
					                <th>
					                	<fmt:setLocale value = "vi_VN"/>
         								<fmt:formatNumber value = "${toltalAmout}" type = "currency"/>        							
       								</th>
					                
					            </tr>
        					</tfoot>
                    </table>              
				 </div>
			</div>
		</div>		
		</div>
	</div>
	
</main>

<script type="text/javascript">
	
		var table = $('#myTable').DataTable({
			order: [[3, 'desc']],
			pagingType: 'full_numbers',
			lengthMenu: [[5, 10, 20, 50, -1], [5, 10, 20, 50, "Tất cả"]],
			createRow: function(row, data, index) {
				if (data[5].replace(/[\$,]/g, '') * 1 > 15000) {
					$('td', row).ep(5).addClass('text-success')
				}
			},
			language: {
				search: "Tìm kiếm",
				lengthMenu: "Hiển thị _MENU_ dòng",
				info: "Hiển thị từ _START_ đến _END_ tổng cộng _TOTAL_ dòng",
				infoEmpty: "Hiển thị 0 bản ghi trong 0 tổng cộng 0 ",
				zeroRecords: "Không có dữ liệu đã tìm",		
			},
			
		/*	"footerCallback": function(row, data, start, end, display) {
                var api = this.api(),
                    data;

                // Remove the formatting to get integer data for summation
                var intVal = function(i) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ?
                        i : 0;
                };

                // Total over all pages
                total = api
                    .column(4)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(4, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);	

                // Update footer
                $(api.column(4).footer()).html(
                    pageTotal + ' đ ( ' + total + ' total)'
                );
            }	*/
					
		});
		
		/* $.fn.dataTable.Api.register( 'sum()', function () {
		    var sum = 0;
		 
		    for ( var i=0, ien=this.length ; i<ien ; i++ ) {
		        sum += this[i];
		    }
		 
		    return sum;
		} );
		var sum = table.column(4).data().sum();
		$('#sum').text(sum); */
	
</script>