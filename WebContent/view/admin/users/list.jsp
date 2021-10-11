<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>

<div class="main-content">
	<div class="main-content-inner">

		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a
					href="<c:url value=" /admin-home "/>">Trang chủ</a></li>
				<li class="active">Dashboard</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>
					Dashboard <small> <i
						class="ace-icon fa fa-angle-double-right"></i> Users <!-- &amp; -->

					</small>
				</h1>
			</div>
			<!-- /.page-header -->
			<form action="admin-user" method="post">
				<div class="widget-box table-filter">
					<div class="table-btn-controls">
						<div class="pull-right tableTools-container">
							<div class="dt-buttons btn-overlap btn-group">
								<a class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
									data-toggle="tooltip" title="Thêm mới"
									href="<c:url value="/admin-user/edit" />">
									 <span><i class="fa fa-plus-circle bigger-110 purple"></i></span>
								</a>
								
								<button id="btnWarning" type="button" data-target="#deleteWarning" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="modal" title='Xóa'>
									<span>
										<i class="fa fa-trash-o bigger-110 pink"></i>
									</span>
								</button>
								<!-- <button type="submit" id="btnWarning" formaction="admin-user/delete" class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" title='Xóa'
										onclick="return confirm('Are you sure?')">
									<span>
										<i class="fa fa-trash-o bigger-110 pink"></i>
									</span>
								</button> -->
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

				<table id="myTable" class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col" style="width: 10px">Id</th>
							<th scope="col">Icon</th>
							<th scope="col" style="width: 200px">Họ&tên</th>
							<th scope="col" style="width: 120px">Email</th>
							<!-- <th scope="col" style="width: 120px">Mật khẩu</th> -->
							<th scope="col" style="width: 120px">Số điện thoại</th>
							<th scope="col" style="width: 120px">Ngày đăng ký</th>
							<th scope="col" style="width: 50px">Role</th>
							<th scope="col" style="width: 90px">Trạng thái</th>
							<th scope="col" style="width: 100px">Chỉnh sửa</th>
						</tr>
					</thead>
					<tbody>
						<!-- Hiển thị dữ liệu trên trang load từ database -->
						<c:forEach var="item" items="${model.listResult}">
							<tr>
								<td><input type="checkbox" id="checkbox_${item.id}"
									value="${item.id}" name="id"></td>
								<td>${item.id}</td>
								<td><img src="${item.avatar}" style="width: 30px; height: 30px;" /></td>
								<td>${item.fullName}</td>
								<td>${item.email}</td>
								<%-- <td>${item.password}</td> --%>
								<td>${item.mobile}</td>
								<td>${item.createdDate}</td>
								<%-- <td>${item.admin? 'Admin':'User'}</td> --%>
								<c:if test="${item.admin == true}">
									<td><span class="label label-danger">Admin</span></td>
								</c:if>
								<c:if test="${item.admin == false}">
									<td><span class="label label-info">User</span></td>
								</c:if>
								<c:if test="${item.status == true}">
									<td><span class="label label-warning">Active</span></td>
								</c:if>
								<c:if test="${item.status == false}">
									<td><span class="label label-success">Unactive</span></td>
								</c:if>							
								<td><c:url var="editUrl" value="/admin-user/edit">
										<c:param name="id" value="${item.id}" />
									</c:url> <a class="btn btn-sm btn-primary btn-edit"
									data-toggle="tooltip" title="Chỉnh sửa" href="${editUrl}">
										<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
								</a></td>
							</tr>
						</c:forEach>
	
					</tbody>
					<tfoot>
						<tr>
							<th><input type="checkbox" id="checkAll"
										value="${item.id}"></th>
							<th>Id</th>
							<th>Icon</th>
							<th>Họ tên</th>
							<th>Email</th>
							<!-- <th>Mật khẩu</th> -->
							<th>Số điện thoại</th>
							<th>Ngày đăng ký</th>
							<th>Role</th>
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
					                <button type="submit" class="btn btn-danger danger" formaction="admin-user/delete" >Xóa</button>
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
			lengthMenu: [[3, 5, 15, 20, -1], [3, 5, 15, 20, "All"]],
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
				/* paginate: {
		            first: "Trang đầu",
		            previous: "Trang trước",
		            next: "Trang sau",
		            last: "Trang cuối"
		        }, */
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
                $("checkAll").prop("checked", false);                       
            }                          
        });
    });


</script>