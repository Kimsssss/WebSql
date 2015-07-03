<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
  <style>
  .draggable { }
  .button {width: 10px; height: 10px}
  </style>
   <script>
   var tableNumber2 = 1;
     $(function() {
        
        
        
       $( "#sections" ).droppable({
         
         accept: "#createtable",
          drop: function( event, ui ) {
           var tableNumber = tableNumber2++; 
           var colNumber = 1;
           
           
           
           /* 테이블 생성 */
            $( this ).prepend("<form action='create.htm' method='post'><table border='1' id='tbs' class='draggable' ><tbody><tr><td colspan='3'><input type='text' name='tablename"+ tableNumber +"' placeholder='테이블명'></td></tr>   <tr><td>컬러명</td><td>데이터 타입</td><td>제약조건</td></tr><tr id='colplus'><td><input type='text' name='col"+ tableNumber +"_"+ colNumber +"'></td><td><input type='text' name='col_data"+ tableNumber +"_"+ colNumber +"'></td><td><input type='button' id='constraint"+ tableNumber +"_"+ colNumber +"' name='constraint' value='제약설정'><input type='hidden' id='conhidden' value='constraintDialog"+ tableNumber +"_"+ colNumber +"'></td></tr><tr><td colspan='3'><center><input id='sub"+ tableNumber +"' type='button' value='전송' style='width: 100px;'> <input type='button' id='plus"+ tableNumber +"' value='추가' style='width: 100px; '></center></td></tr></tbody></table></form>");
             $(this).append("<div hidden id='constraintDialog"+ tableNumber +"_"+ colNumber +"' title='제약조건'>PRIMARY KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='PRIMARY KEY'>   FOREIGN KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='FOREIGN KEY'>   NOT NULL <input type='checkbox' name='constraint_ck' id='constraint_ck' value='NOT NULL'>NULL <input type='checkbox' name='constraint_ck' id='constraint_ck' value='NULL'></div>");
           /* 생성된 테이블에 드래그 추가 */
            $( ".draggable" ).draggable();
             
         //클릭시 다이얼 로그 생성
               $(document).on('click',"#constraint"+ tableNumber +"_"+ colNumber ,function() {
                  
                  $("#"+$(this).parent().children("#conhidden").val()).dialog({
                           height : 200,
                           width : 600,
                           modal : true,
                           draggable : false,
                           buttons: {
                              "설정":function(){
                                $(this).children("input[name=constraint_ck]:checked").each(function() {
                                    var test = $(this).val();
                                    console.log(test);
                                });
                              }
                           }
                         });
               });
           
           //데이터 전송
              $(document).on('click',"#sub"+tableNumber ,function() {
               
               var colNameArray= new Array(colNumber);
               var coldataArray= new Array(colNumber);
               var tableName = $("input[name=tablename"+tableNumber+"]").val();
               console.log(tableName);
               /* colNumber 갯수많큼 값을 넣어준다. */
               for(var i=0;i<colNumber;i++){
                  colNameArray[i] = $("input[name=col"+tableNumber+"_"+(i+1)+"]").val();
                  coldataArray[i] = $("input[name=col_data"+tableNumber+"_"+(i+1)+"]").val()
               }
               
               
               
               jQuery.ajaxSettings.traditional = true;   /* ajax를 사용해 배열값을 넘기기위한 세팅 */
               
               $.ajax({
               type : "get",
               url : "create.htm",
               dataType : "html",
               data : {
                  "colName" : colNameArray, "coldatatype":coldataArray, "tablename":tableName
               },
               success : function(table) {
                  
                  alert("테이블 생성 성공")
               },
               error : function(xhr) {
                  alert("테이블 생성 실패...");
               }
            });
                
            });
            
           /* 클릭시 컬럼 추가 */
             $(document).on('click',"#plus"+tableNumber ,function() {
               
               //console.log($(this).parent().parent().parent().parent());
               //console.log($(this).parent().parent().parent());
               console.log($(this).parent().parent().parent().parent().parent().parent().parent());
               
               //컬럼을 추가 한다
               $(this).parent().parent().parent().parent().append("<tr><td><input type='text' name='col"+ tableNumber +"_"+ ++colNumber +"'></td><td><input type='text' name='col_data"+ tableNumber +"_"+ colNumber +"'></td><td><input type='button' id='constraint"+ tableNumber +"_"+ colNumber +"' name='constraint' value='제약설정'><input type='hidden' id='conhidden' value='constraintDialog"+ tableNumber +"_"+ colNumber +"'></td></tr>");
               
               //버튼을 추가
               $(this).parent().parent().parent().parent().append("<tr><td colspan='3'><center><input id='sub"+ tableNumber +"' type='button' value='전송' style='width: 100px;'> <input type='button' id='plus"+ tableNumber +"' value='추가' style='width: 100px; '></center></td></tr>");
               
               //다이얼 로그 추가
               $(this).parent().parent().parent().parent().parent().parent().parent().append("<div hidden id='constraintDialog"+ tableNumber +"_"+ colNumber +"' title='제약조건'>PRIMARY KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='PRIMARY KEY'>   FOREIGN KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='FOREIGN KEY'>   NOT NULL <input type='checkbox' name='constraint_ck' id='constraint_ck' value='NOT NULL'>NULL <input type='checkbox' name='constraint_ck' id='constraint_ck' value='NULL'></div>");
               
               //버튼 삭제
               $(this).parent().parent().parent().empty();
               
               //클릭시 다이얼 로그 생성
                $(document).on('click',"#constraint"+ tableNumber +"_"+ colNumber ,function() {
                   
                   $("#"+$(this).parent().children("#conhidden").val()).dialog({
                            height : 200,
                            width : 600,
                            modal : true,
                            draggable : false,
                            buttons: {
                               "설정":function(){
                                 // document.getElementsByName("constraint_ck");
                                  $(this).children("input[name=constraint_ck]:checked").each(function() {
                                         var test = $(this).val();
                                         console.log(test);
                                     });
                               }
                            }
                          });
                });
               
            });
          
            
            
           
          }
        });
      
     });
  </script>
</head>

<body>
   
   
	<div id="page-wrapper">
		<div class="col-lg-12">
			<header>
				<%pageContext.include("DropTest.jsp"); %>
			</header>
         
			<div class="panel panel-default" style="height: 158px; width: 450px">
				<div class="panel-heading" style="padding-top: 2px; padding-bottom: 2px; ">
					<input class='form-control' type='text' name='tablename"+ tableNumber +"' placeholder='테이블명을 입력 하세요.' style=" height: 25px;">
				</div>
				<div class="panel-body" style=" padding-top: 3px;">
					<div class="table-responsive">
						<form action='create.htm' method='post'>
						<table id='tbs' class='table' >
							<tr height="20px">
								<td width="30px"></td>
								<td colspan="2" align="center">컬럼명</td>
								<td colspan="2" align="center">데이터 타입</td>
								<td width="50px" align="center">제약조건</td>
							</tr>
							<tr id='colplus'>
								<td width="30px">
									<img class="img-responsive" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/1.jpg" alt="">
									<%-- <img id="colimg" name="colimg" src="<%=request.getContextPath()%>/resources/img/N.jpg"> --%>
								</td>
								<td colspan="2">	
									<input type='text' class='form-control' name='col"+ tableNumber +"_"+ colNumber +"' style=" height: 23px; padding-top: 3px; padding-bottom: 3px;">
								</td>
								<td colspan="2">
									<input type='text' class='form-control' name='col_data"+ tableNumber +"_"+ colNumber +"' style=" height: 23px; padding-top: 3px; padding-bottom: 3px;">
								</td>
								<td>
									<input type="button" class="btn btn-outline btn-default" id="constraint" name="constraint" value="제약설정" style=" padding-top: 1px; padding-bottom: 1px; padding-left: 5px; padding-right: 5px;">
									<input type='hidden' id='conhidden' value='constraintDialog"+ tableNumber +"_"+ colNumber'>
								</td>
							</tr>
							<tr>
								<td colspan="6" align="right" width="">
									<input id='sub' type='button' class="btn btn-outline btn-default" value='전송' style=" padding-top: 2px; padding-bottom: 2px; padding-left: 30px; padding-right: 30px;"> 
								
									<input type='button' class="btn btn-outline btn-default" id='plus"+ tableNumber +"' value='추가' style=" padding-top: 2px; padding-bottom: 2px; padding-left: 30px; padding-right: 30px;">
								</td>
							</tr>
						</table>
						</form>
					</div>
				</div> 
			</div>
		</div>
	</div>
  
	</body>
</html>