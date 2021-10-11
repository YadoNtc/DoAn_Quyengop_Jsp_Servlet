<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Context-type" content="text/html" charset="UTF-8">
<title><dec:title default="Admin" /></title>
<base href="/com.doan.quyengop/" />
<link rel="stylesheet" href="<c:url value='/template/admin/css/modalstyle.css' />" /> 
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  --> 
<!-- <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"> --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css"> 

<!--==================================================================================================  -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
<!--==================================================================================================  -->
	<script src="<c:url value="/template/register/js/main.js"/>"></script>		
<!--==================================================================================================  -->	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
<!--==================================================================================================  -->
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
<link rel="stylesheet" href="<c:url value='/template/admin//font-awesome/4.5.0/css/font-awesome.min.css' />" /> 

<!-- text fonts -->
<link rel="stylesheet" href="<c:url value='/template/admin/css/fonts.googleapis.com.css' />" />

<!-- ace styles -->
<link rel="stylesheet" href="<c:url value='/template/admin/css/style.css' />" />
<link rel="stylesheet" href="<c:url value='/template/admin/css/ace.min.css' />" class="ace-main-stylesheet" id="main-ace-style" />

<script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
<script src="<c:url value='/ckfinder/ckfinder.js' />"></script>
</head>

<body class="no-skin">

	<%@ include file="/common/admin/header.jsp" %>
	
	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.loadState('main-container')
			} catch (e) {}
		</script>
		
		<%@ include file="/common/admin/menu.jsp" %>
		
		<dec:body/>
		
		<%@ include file="/common/admin/footer.jsp" %>
		
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse display"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	
	
	

	<!-- ace scripts -->
	<script src="<c:url value='/template/admin/js/ace.min.js' />"></script>

</body>
</html>