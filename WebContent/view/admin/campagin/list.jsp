<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/taglib.jsp" %>
<c:url var="projectApi" value="/api-admin-donate" />
<c:url var="projectList" value="/admin-project-list" />
        <!DOCTYPE html>
        <div class="main-content">
            <div class="main-content-inner">

                <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                    <ul class="breadcrumb">
                        <li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value="/admin-home"/>">Trang chủ</a>
                        </li>
                        <li class="active">Dashboard</li>
                    </ul>
                    <!-- /.breadcrumb -->

                   <!--  <div class="nav-search" id="nav-search">
                        <form class="form-search">
                            <span class="input-icon"> <input type="text"
						placeholder="Search ..." class="nav-search-input"
						id="nav-search-input" autocomplete="off" /> <i
						class="ace-icon fa fa-search nav-search-icon"></i>
					</span>
                        </form>
                    </div> -->
                    <!-- /.nav-search -->
                </div>
                <div class="page-content">
                    <div class="page-header">
                        <h1>
                            Dashboard <small> <i
						class="ace-icon fa fa-angle-double-right"></i> Đợt quyên góp
						<!-- &amp; -->

					</small>
                        </h1>
                    </div>
                    <!-- /.page-header -->

                    <div class="widget-box table-filter">
                        <div class="table-btn-controls">
                            <div class="pull-right tableTools-container">
                                <div class="dt-buttons btn-overlap btn-group">              
                                    <button id="btnWarning" type="button" data-target="#deleteWarning" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="modal" title='Xóa'>
										<span>
											<i class="fa fa-trash-o bigger-110 pink"></i>
										</span>
									</button>
                                </div>
                            </div>
                        </div>
                    </div> <br /><br />

                    <c:if test="${not empty message}">
						<div class="alert alert-success">${message}</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-warning">${error}</div>
					</c:if>

                    <form action="admin-campagin" method="post" id="submitForm">
                        <table id="myTable" class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 2px"></th>
                                    <th scope="col" style="width: 5px">ID</th>
                                    <th scope="col" style="width: 50px">ID chương trình</th>
                                    <th scope="col" style="width: 100px;">Số tiền quyên góp (VND)</th>
                                    <th scope="col" style="width: 50px">Id thành viên</th>
                                    <th scope="col" style="width: 100px">Ngày quyên góp</th>                                                                       
                                    <th scope="col" style="width: 150px">Tên người quyên góp</th>
                                    <th scope="col" style="width: 50px">Email</th>
                                    <th scope="col" style="width: 50px">Số điện thoại</th>
                                    <th scope="col" style="width: 50px">Trạng thái</th>
                                    <th scope="col" style="width: 50px">Chỉnh sửa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Hiển thị dữ liệu trên trang load từ database -->
                                <c:forEach var="item" items="${model.listResult}">
                                    <tr>
                                        <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                        <th>${item.id}</th>                                  
                                        <th>${item.campaginId}</th>                     
                                        <td>
                                        	<fmt:setLocale value="vi_VN"/>
                                        	<fmt:formatNumber pattern="#,###,###" value="${item.amoutMoney}"/>
                                        	
                                        </td>  
                                        <td>${item.userId }</td>
                                        <td>${item.createdDate }</td>
                                        <td>${item.fullName}</td>
                                        <td>${item.email}</td>
                                        <td>${item.mobile}</td>
                                        <c:if test="${item.status == 'transferring'}">
                                            <td><span class="label label-warning">Transferring...</span></td>
                                        </c:if>
                                        <c:if test="${item.status == 'transferred'}">
                                            <td><span class="label label-success">Transferred</span></td>
                                        </c:if>
                                        <td>
                                            <c:url var="editUrl" value="/admin-campagin/edit">                                         
                                                <c:param name="id" value="${item.id}" />
                                            </c:url>
                                            <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Chỉnh sửa" href="${editUrl}">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                            
                            <tfoot>
							<tr>
								<th><input id="checkAll" type="checkbox" id="checkbox_${item.id}" value="${item.id}"></th>
								<th>ID</th>
								<th>Id chương trình</th>
								<th>Số tiền quyên góp (VND)</th>
								<th>Id Thành viên</th>
								<th>Ngày Quyên góp</th>
								<th>Tên người quyên góp</th>
								<th>Email</th>
								<th>Số dt</th>
								<th>Trạng thái</th>
								<th>Chỉnh sửa</th>
							</tr>
							</tfoot> 
                      	</table>
                      	
                        <div id="deleteWarning" class="modal fade">
				            <div class="modal-dialog">
				                <div class="modal-content">
				                    <form>
				                        <div class="modal-header">
				                            <h4 class="del">Delele</h4>
				                            <button type="button" class="close btnDel" data-dismiss="modal" aria-hidden="true">&times;</button>
				                        </div>
				                        <div class="modal-body">
				                            <p>Xác nhận xóa?</p>
				                            <p class="text-warning"><small>Dữ liệu đã xóa không thể phục hồi!</small></p>
				                        </div>
				                        <div class="modal-footer">
				                            <button type="button" class="btn btn-default default" data-dismiss="modal">Hủy</button>
				                            <button id="btnDelete" type="submit" formaction="admin-campagin/delete" class="btn btn-danger danger">Xóa</button>
				                        </div>
				                    </form>
				                </div>
				            </div>
        				</div>
      
                    </form>

                </div>
            </div>
        </div>

        

        <script type="text/javascript"> 
            
        $(document).ready(function() {
    		$('#myTable').DataTable({    			
    			order: [[3, 'desc']],
    			pagingType: 'full_numbers',
    			lengthMenu: [[3, 5, 15, 20, -1], [3, 5, 15, 20, "Tất cả"]],
    			createRow: function(row, data, index) {
    				if (data[5].replace(/[\$,]/g, '') * 1 > 15000) {
    					$('td', row).ep(5).addClass('text-success')
    				}
    			},
    			language: {
    				search: "Tìm kiếm",
    				lengthMenu: "Hiển thị _MENU_ dòng",
    				processing: "Đang load...",
    				info: "Hiển thị từ _START_ đến _END_ tổng cộng _TOTAL_ dòng",
    				infoEmpty: "Hiển thị 0 bản ghi trong 0 tổng cộng 0 ",
    				infoFiltered: "(Từ _MAX_ dòng)",
    				zeroRecords: "Không có dữ liệu đã tìm",
    				paginate: {
    		            first: "Trang đầu",
    		            previous: "Trang trước",
    		            next: "Trang sau",
    		            last: "Trang cuối"
    		        },
    			},
    		});
    	}); 
            
        $('[data-toggle="tooltip"]').tooltip();
        var checkbox = $('table tbody input[type=checkbox]');
        var btn = $('#btnWarning');
        (btn).attr('disabled', 'disabled');
        $(checkbox).click(function() {
        	if ($(btn).prop('disabled')) {
                $(btn).prop('disabled', false);
            } else {
                $(btn).prop('disabled', true);
            }  
        	checkbox.each(function() {
        		if (this.checked) {
        			$(btn).prop('disabled', false);
        		}
        	});
        }); 
                     
        $('#checkAll').click(function() {
            if (this.checked) {
                checkbox.each(function() {
                    this.checked = true;
                    $(btn).prop('disabled', false);                         
                });
            } else {
                checkbox.each(function() {
                    this.checked = false;
                    $(btn).prop('disabled', true);
                });
            }
            checkbox.click(function() {
                if (this.checked) {
                    $("#checkAll").prop("checked", false);                       
                }                          
            });
        });
                      
        </script>