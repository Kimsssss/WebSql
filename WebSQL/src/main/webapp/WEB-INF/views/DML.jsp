<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function(){
		$('#conbtn').click(function(){
			  $.ajax({
				  type: 'POST',
		          url: "conview.html",
		          data : {ip: $('#iptext').val(),
		        	  	id: $('#idtext').val(),
		        	  	pwd: $('#pwdtext').val()},
		          dataType: "html",
		          success: function(responseData){
		             var codes = JSON.parse(responseData);
		             var code = "";
		             console.log("aaa");
		             console.log(codes);
		             console.log(codes[0]);
		             console.log(codes[1]);
		             console.log(codes[2]);
		             console.log(codes[3]);
		             if(codes[3] == true){
		            	 $('#iphidden').val(codes[0]);
		            	 $('#idhidden').val(codes[1]);
		            	 $('#pwdhidden').val(codes[2]);
		            	 $('#conmodal').html("<input type='button' id='conmodalview' name='conmodalview' value='확인' class='btn btn-danger' data-dismiss='modal'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
		            	 alert("연결 성공");
		             }else{
		            	 alert("연결 실패");
		            	 $('#conmodal').html("");
		            	 $('#iphidden').val("");
		            	 $('#idhidden').val("");
		            	 $('#pwdhidden').val("");
		            	 
		             }
		             
		             $('#conmodalview').click(function(){
		            	$('#ipip').val( $('#iphidden').val());
		            	$('#idid').val($('#idhidden').val());
		            	$('#pwdpwd').val($('#pwdhidden').val());
		            	console.log($('#ipip').val());
		            	console.log($('#idid').val());
		            	console.log($('#pwdpwd').val());
		            	$.ajax({
		            		type: 'POST',
		              	  	url: 'contable.html',
		              	  	data:{
		              	  		ip: $('#ipip').val(),
		              	  		id: $('#idid').val(),
		              	  		pwd: $('#pwdpwd').val()}, 
		              		dataType: "html",
		              	 	 success: function(responseData){
		              	  	
		              		  var codes = JSON.parse(responseData);
		              		  console.log(codes);
		              		  var optionstr = "<option>테이블 종류</option>";
		              		  
		              		
		              		$.each(codes,function(index,items){
		              			
		              			optionstr += "<option>"+items+"</option>"
		              		})
		              		$('#tableselect').html(optionstr);
		              	  }
		            	})
		             })
		            
		          } 
		       }) 
		})
	});
</script>
<body>

  <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">



<h3>DML 입니다.</h3>
<select>
	<option value="select" id="select">select</option>
	<option value="insert" id="insert">insert</option>
	<option value="update" id="update">update</option>
	<option value="delete" id="delete">delete</option>
</select>
<input type="button" name="frbtn" id="frbtn" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" value="계정연결">
<div>
	연결된 IP : <input type="text" id="ipip" name="ipip" readonly="readonly">
	연결된 계정 : <input type="text" id="idid" name="idid" readonly="readonly">
	<input type="hidden" id="pwdpwd" name="pwdpwd">
</div>
<select id="tableselect" name="tableselect">
	<option>테이블 종류</option>
</select>

<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">계정 연결</h4>
        </div>
        <div class="modal-body">
          <p>연결 정보 입력</p>
          IP 주소 : <input type="text" name="iptext" id="iptext"><br><input type="hidden" name="iphidden" id="iphidden" value="">
               계정 ID : <input type="text" name="idtext" id="idtext"><br><input type="hidden" name="idhidden" id="idhidden" value="">
               계정 PASSWORD : <input type="text" name="pwdtext" id="pwdtext"><br><input type="hidden" name="pwdhidden" id="pwdhidden" value="">
          <input type="button" value="연결" id="conbtn" name="conbtn">
        </div>
        <!-- <button type="button" class="btn btn-danger" onclick="javascript:msgform.submit();">Send</button> -->
        
        <div class="modal-footer">
       	 <div id="conmodal" name="conmodal">
        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</div>
</div>
</div>



</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function(){
		$('#frbtn').click(function(){
			
		})
	});
</script>
<body>
<h3>DML 입니다.</h3>
<select>
	<option value="select" id="select">select</option>
	<option value="insert" id="insert">insert</option>
	<option value="update" id="update">update</option>
	<option value="delete" id="delete">delete</option>
</select>
<input type="button" name="frbtn" id="frbtn" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">


<div class="container">
  <h2>테이블 선택</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">테이블 선택</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>


</body>
</html>
