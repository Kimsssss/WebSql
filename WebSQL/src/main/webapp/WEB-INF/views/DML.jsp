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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
   $(function(){
      
      $('#crudbtn').click(function(){
         console.log($('#crudselect').val());
         console.log($('#tableselect').val());
         if($('#crudselect').val() == "select"){
            console.log("select if문");
            console.log($('#crudselect').val());
            console.log($('#tableselect').val());
            console.log($('#ipip').val());
            console.log($('#idid').val());
            console.log($('#pwdpwd').val());
            var inputstr = "";
            
            
            
             $.ajax({
               type: 'POST',
                 url: "inputselect.html",
                 data : {ip: $('#iptext').val(),
                      id: $('#idtext').val(),
                      pwd: $('#pwdtext').val(),
                      tablename: $('#tableselect').val()},
                 dataType: "html",
                 success: function(responseData){
                      var codes = JSON.parse(responseData);
                      var columninput = "<input type='checkbox' name='all' class='check-all'> <label>Check ALL</label>&nbsp;&nbsp;&nbsp;";
                      console.log("select 비동기 성공");
                      console.log(codes);
                      $.each(codes,function(index,items){
                             
                         columninput += "<input type='checkbox' name='columncheck' id='columncheck' class='sel' value='"+items+"'> <label>"+items+"</label>"+"&nbsp;&nbsp;&nbsp;";
                         console.log(columninput);
                          })
                          columninput += "<table><tr><td width='75px'><h4>WHERE</h4></td><td width='150px'><input type='text' class='form-control' id='wheretext' name='wheretext' value=''></td></tr></table>";
                       /* columninput += "<br>----------------------------------------------------------------<br>"+
                       "<h3>WHERE </h3><input type='text' id='wheretext' name='wheretext'>"; */
                      $('#modalbody2').html(columninput);
                   $('.check-all').click(function(){
                     $('.sel').prop('checked',this.checked);
                        });
                   $('#modalfooter2').html("<input type='button' id='selectviewbtn' name='selectviewbtn' class='btn btn-default' data-dismiss='modal' value='출력'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                        
                   $('#selectviewbtn').click(function(){
                      var obj = document.getElementsByName("columncheck");
                      var list = [];
                      console.log($('#columncheck').val());
                      $.each(obj,function(index,ob){
                        if(ob.checked){
                           list.push(ob.value.toUpperCase());
                        }
                        console.log(ob);
                        console.log(index);
                        console.log(ob.value);
                        console.log(ob.checked);
                      })
                      console.log(list);
                   $.ajax({
                     type: 'POST',
                         url: "selectview.html",
                          data : {list: JSON.stringify(list),
                             ip: $('#iptext').val(),
                            id: $('#idtext').val(),
                            pwd: $('#pwdtext').val(),
                            tablename: $('#tableselect').val(),
                            wheretext: $('#wheretext').val()},
                         dataType: "html",
                          success: function(responseData){
                         var codes = JSON.parse(responseData);
                         console.log("select 비동기 성공");
                         console.log(codes);
                         var code = "<br><br><div class='table-responsive'><table class='table table-striped table-bordered table-hover' border='1'><tr>";
                         console.log(codes[codes.length-1]);
                         console.log(codes.length-1);
                         var colend = codes[codes.length-1];
                         console.log(colend);
                         $.each(codes,function(index,items){
                            console.log(index);
                            if((index+1)%colend == 0){
                               code += "<td>"+items+"</td></tr><tr>";
                            }else{
                               if(codes.length-1 ==index){
                                    code += "</table></div>";
                                 }else{
                                    code += "<td>"+items+"</td>"
                                 }
                            
                            }
                         }) 
                         $('#tableviewdiv').html(code);
                          } 
                  })
                       
                   });
                   
                  }
                 }); 
         }else if($('#crudselect').val() == "update"){
            console.log("update if문");
             console.log($('#crudselect').val());
             console.log($('#tableselect').val());
             console.log($('#ipip').val());
             console.log($('#idid').val());
             console.log($('#pwdpwd').val());
             var inputstr = "";
             
             $.ajax({
                 type: 'POST',
                   url: "inputselect.html",
                   data : {ip: $('#iptext').val(),
                        id: $('#idtext').val(),
                        pwd: $('#pwdtext').val(),
                        tablename: $('#tableselect').val()},
                   dataType: "html",
                   success: function(responseData){
                        var codes = JSON.parse(responseData);
                        var columninput = "UPDATE Column : <select id='updateselect' name='updateselect'>";
                        console.log("update 비동기 성공");
                        console.log(codes);
                        $.each(codes,function(index,items){
                               
                           columninput += "<option value='"+items+"' id='"+items+"' name='"+items+"'>"+items+"</option>";
                           console.log(columninput);
                            })
                            columninput += "</select>&nbsp;&nbsp; UPDATE Value : <input type='text' id='textupdate' name='textupdate' value=''>";
                            columninput += "<br><h3>WHERE&nbsp;&nbsp;</h3><input type='text' id='wheretext' name='wheretext' value=''>";
                         /* columninput += "<br>----------------------------------------------------------------<br>"+
                         "<h3>WHERE </h3><input type='text' id='wheretext' name='wheretext'>"; */
                        $('#modalbody2').html(columninput);
                     $('#modalfooter2').html("<input type='button' id='updateviewbtn' name='updateviewbtn' class='btn btn-info' data-dismiss='modal' value='삽입'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                          
                     $('#updateviewbtn').click(function(){
                        var textupdate = $('#textupdate').val();
                        var wheretext = $('#wheretext').val();
                        var colupdate = $('#updateselect').val();
                        console.log(textupdate);
                        console.log(wheretext);
                        console.log(colupdate);
                        /* $.each(obj,function(index,ob){
                          if(ob.checked){
                             list.push(ob.value.toUpperCase());
                          }
                          console.log(ob);
                          console.log(index);
                          console.log(ob.value);
                          console.log(ob.checked);
                        })
                        console.log(list);
                     $.ajax({
                       type: 'POST',
                           url: "selectview.html",
                            data : {list: JSON.stringify(list),
                               ip: $('#iptext').val(),
                              id: $('#idtext').val(),
                              pwd: $('#pwdtext').val(),
                              tablename: $('#tableselect').val(),
                              wheretext: $('#wheretext').val()},
                           dataType: "html",
                            success: function(responseData){
                           var codes = JSON.parse(responseData);
                           console.log("select 비동기 성공");
                           console.log(codes);
                           var code = "<table border='1'><tr>";
                           console.log(codes[codes.length-1]);
                           console.log(codes.length-1);
                           var colend = codes[codes.length-1];
                           console.log(colend);
                           $.each(codes,function(index,items){
                              console.log(index);
                              if((index+1)%colend == 0){
                                 code += "<td>"+items+"</td></tr><tr>";
                              }else{
                                 if(codes.length-1 ==index){
                                      code += "</table>";
                                   }else{
                                      code += "<td>"+items+"</td>"
                                   }
                              
                              }
                           }) 
                           $('#tableviewdiv').html(code);
                            } 
                    })
                         */ 
                     });
                     
                    }
                   }); 
         }
      });
   });
</script>
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
			<div class="body">
				<h2 align="left" class="page-header">DML 입니다.</h2>
			</div>
		




<table align="center">
<tr><td width="200px">
<select class="form-control" id="crudselect" name="crudselect">
   <option value="select" id="select">select</option>
   <option value="insert" id="insert">insert</option>
   <option value="update" id="update">update</option>
   <option value="delete" id="delete">delete</option>
</select>
</td>

<td width="95px" align="center">
<input type="button" name="frbtn" id="frbtn" class="btn btn-info" data-toggle="modal" data-target="#myModal" value="계정연결" style="
    padding-left: 10px;
    padding-right: 10px;">
</td>

<td width="200px">
<select class="form-control" id="tableselect" name="tableselect">
   <option>테이블 종류</option>
</select>
</td>

<td width="86px" align="right">
<input type="button" id="crudbtn" name="crudbtn" value="실행" class="btn btn-info" data-toggle="modal" data-target="#crudModal" style="
    padding-left: 24px;
    padding-right: 24px;">
</td>

<td width="85px" align="center"><b>연결된 IP</b></td>

<td width="170px">
<input type="text" class="form-control" id="ipip" name="ipip" readonly="readonly">
</td>   
   
<td width="85px" align="center"><b>연결된 계정</b></td>
<td width="170px">  
<input type="text" class="form-control" id="idid" name="idid" readonly="readonly">
<input type="hidden" id="pwdpwd" name="pwdpwd">
</td>
</tr>
</table>

<!-- 테이블 출력 div -->
<div id="tableviewdiv" name="tableviewdiv">
</div>

<div class="container">



  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center">계정 연결</h4>
        </div>
        <div class="modal-body" align="center">
          <p>연결 정보 입력</p>
			<table style="width: 350px">
				<tr height="40px">
					<td><b>IP 주소</b></td>
					<td>
          				<input type="text" class='form-control' name="iptext" id="iptext">
          				<input type="hidden" name="iphidden" id="iphidden" value="">
            		</td>   
				</tr>
				<tr height="40px">
					<td><b>계정 ID</b></td>
					<td>
						<input type="text" class='form-control' name="idtext" id="idtext">
						<input type="hidden" name="idhidden" id="idhidden" value="">
					</td>  
				</tr>
				<tr height="40px">
					<td><b>계정 PWD</b></td>
					<td>  
						<input type="text" class='form-control' name="pwdtext" id="pwdtext">
						<input type="hidden" name="pwdhidden" id="pwdhidden" value="">
          			</td>
          		</tr>
          		<tr>
          			<td align="right" colspan="2">	          				
          				<input type="button" class='btn btn-info' value="연결" id="conbtn" name="conbtn">
          			</td>
          		</tr>
          	</table>	      
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
  
  
  <!-- -------------------------------------modal end------------------------------------------------------------- -->
  <!-- Modal -->
  <div class="modal fade" id="crudModal" role="dialog" tabindex="-1">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="cursor:move">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">세부 설정</h4>
        </div>
        <div class="modal-body" id="modalbody2">
          <!-- modal 메인 html 정보 body -->
        </div>
        <!-- <button type="button" class="btn btn-danger" onclick="javascript:msgform.submit();">Send</button> -->
        
        <div class="modal-footer">
           <div id="modalfooter2" name="modalfooter2">
              <!-- modal 확인 버튼 등 footer -->
           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
        </div>
      </div>
      
    </div>
  </div>
  <!-- -------------------------------------modal end------------------------------------------------------------- -->
</div>

</div>
</div>
</div>


</body>

</html>