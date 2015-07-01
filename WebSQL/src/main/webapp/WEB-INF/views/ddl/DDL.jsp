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
                  console.log($(this).parent().children("#conhidden").val());
                  $("#"+$(this).parent().children("#conhidden").val()).dialog({
                           height : 200,
                           width : 600,
                           modal : true,
                           draggable : false,
                           buttons: {
                              "설정":function(){
                                 
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
                   console.log($(this));
                   $("#"+$(this).parent().children("#conhidden").val()).dialog({
                            height : 200,
                            width : 600,
                            modal : true,
                            draggable : false,
                            buttons: {
                               "설정":function(){
                                  
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
      <div class="row">
         <div class="col-lg-12">
            <header>
            <%pageContext.include("DropTest.jsp"); %>
            </header>
            <section id="sections" style="width: 500px; height: 500px;">
            <form action='create.htm' method='post'>
            <table border='1' id='tbs' class='draggable' >
            <tbody>
            <tr><td colspan="3"><input type='text' name='tablename"+ tableNumber +"' placeholder='테이블명'></td></tr>
            <tr><td>컬러명</td><td>데이터 타입</td><td>제약조건</td></tr>
            <tr id='colplus'><td><input type='text' name='col"+ tableNumber +"_"+ colNumber +"'></td><td><input type='text' name='col_data"+ tableNumber +"_"+ colNumber +"'></td><td><input type="button" id="constraint" name="constraint" value="제약설정"><input type='hidden' id='conhidden' value='constraintDialog"+ tableNumber +"_"+ colNumber'></td></tr>
            <tr><td colspan="3"><center><input id='sub' type='button' value='전송' style="width: 100px;"> <input type='button' id='plus"+ tableNumber +"' value='추가' style="width: 100px; "></center></td></tr>
            </tbody>
            </table>
            
            </form>

            </section>
         </div>
      </div>   
   </div>
   <!-- 
   <div hidden id='constraintDialog' title='제약조건'>
            PRIMARY KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='PRIMARY KEY'>
            FOREIGN KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='FOREIGN KEY'>
            NOT NULL <input type='checkbox' name='constraint_ck' id='constraint_ck' value='NOT NULL'>
            NULL <input type='checkbox' name='constraint_ck' id='constraint_ck' value='NULL'>
            </div> -->
   
   
</body>
</html>