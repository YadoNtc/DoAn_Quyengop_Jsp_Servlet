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
                    </div>
                    /.nav-search -->
                </div>
                <div class="page-content">
                    <div class="page-header">
                        <h1>
                            Dashboard <small> <i
						class="ace-icon fa fa-angle-double-right"></i> Chương trình quyên góp
						<!-- &amp; -->

					</small>
                        </h1>
                    </div>
                    <!-- /.page-header -->

                    <div class="widget-box table-filter">
                        <div class="table-btn-controls">
                            <div class="pull-right tableTools-container">
                                <div class="dt-buttons btn-overlap btn-group">
                                    <a class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip" title="Thêm chương trình quyên góp" href="<c:url value="/admin-project-edit" />">
                                        <span>
										<i class="fa fa-plus-circle bigger-110 purple"></i>
									</span>
                                    </a>
                                    <button id="btnWarning" type="button" data-target="#deleteWarning" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="modal" title='Xóa'>
										<span>
											<i class="fa fa-trash-o bigger-110 pink"></i>
										</span>
									</button>
                                </div>
                            </div>
                        </div>
                    </div> <br /><br />

                    <c:if test="${not empty messageText}">
                        <p class="alert alert-${alert}">
                            ${messageText}
                        </p>
                    </c:if>

                    <form action="<c:url value='/admin-project'/>" method="get" id="submitForm">
                        <table id="myTable" class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 2px"></th>
                                    <th scope="col" style="width: 5px">ID</th>
                                    <th scope="col" style="width: 150px">Tên chương trình</th>
                                    <th scope="col" style="width: 100px; ">Cần quyên góp (VND)</th>
                                    <th scope="col" style="width: 100px">Đã quyên góp (VND)</th>
                                    <th scope="col" style="width: 100px">Ngày bắt đầu</th>
                                    <th scope="col" style="width: 20px">Trạng thái</th>
                                    <th scope="col" style="width: 50px">Chỉnh sửa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Hiển thị dữ liệu trên trang load từ database -->
                                <c:forEach var="item" items="${model.listResult}">
                                    <tr>
                                        <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                        <th>${item.id}</th>
                                        <th>${item.name}</th>
                                        <td>
                                        	<fmt:setLocale value="vi_VN"/>
                                        	<fmt:formatNumber pattern="#,###,###" value="${item.targetMoney}"/>
                                        	
                                        </td>
                                        <td>
                                        	<fmt:setLocale value="vi_VN"/>
                                        	<fmt:formatNumber pattern="#,###,###" value="${item.currentMoney}"/>
                                        	
                                        </td>
                                        <td>${item.createdDate }</td>
                                        <c:if test="${item.status == 'inprogress'}">
                                            <td><span class="label label-warning">In Progress</span></td>
                                        </c:if>
                                        <c:if test="${item.status == 'completed'}">
                                            <td><span class="label label-success">Completed</span></td>
                                        </c:if>
                                        <td>
                                            <c:url var="editUrl" value="/admin-project-edit">
                                                 <%-- <c:param name="type" value="edit" />  --%>
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
						<th>Tên chương trình</th>
						<th>Cần quyên góp (VND)</th>
						<th>Đã quyên góp</th>
						<th>Ngày bắt đầu</th>
						<th>Trạng thái</th>
						<th>Chỉnh sửa</th>
					</tr>
					</tfoot> 
                        </table>
                    </form>

                </div>
            </div>
        </div>

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
                            <button id="btnDelete" type="button" class="btn btn-danger danger">Xóa</button>
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

        $('#btnDelete').click(function() {
            var data = {};
            var ids = $('tbody input[type=checkbox]:checked').map(function() {
                return $(this).val();
            }).get();
            data['ids'] = ids;
            if (ids == "") {
                //alert('Chọn mục cần xóa');
                window.location.href = "${projectList}";
            } else {
                deleteModel(data);
            }
        });

        function deleteModel(data) {
            $.ajax({
                type: "DELETE",
                url: "${projectApi}",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function(result) {
                    window.location.href = "${projectList}?message=delete_success";
                },
                error: function(error) {
                    window.location.href = "${projectList}?message=error_system";
                }
            });
        }
                       
        </script>