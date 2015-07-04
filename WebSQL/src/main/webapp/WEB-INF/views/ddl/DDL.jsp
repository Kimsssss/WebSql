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
           
           
           
           //테이블 생성
           $( this ).prepend("<form action='create.htm' method='post'><table border='1' id='tbs' class='draggable' ><tbody><tr><td colspan='3'><input type='text' name='tablename"+ tableNumber +"' placeholder='테이블명'></td></tr>   <tr><td>컬럼명</td><td>데이터 타입</td><td>제약조건</td></tr><tr><td><img id='colimg' name='colimg' src='<%=request.getContextPath()%>/resources/img/1.jpg'><input type='text' name='col"+ tableNumber +"_"+ colNumber +"'></td><td><input type='text' name='col_data"+ tableNumber +"_"+ colNumber +"'></td><td id='cons'><input type='button' id='constraint"+ tableNumber +"_"+ colNumber +"' name='constraint' value='제약설정'><input type='hidden' id='conhidden' value='constraintDialog"+ tableNumber +"_"+ colNumber +"'><input type='hidden' id='conhidden_hidden' value='constraintDialog_Dialog"+ tableNumber +"_"+ colNumber +"'><input type='hidden' id='constraints' value=''><input type='hidden' id='hidden_tableName' value=''><input type='hidden' id='hidden_colName' value=''></td></tr><tr><td colspan='3'><center><input id='sub"+ tableNumber +"' type='button' value='전송' style='width: 100px;'> <input type='button' id='plus"+ tableNumber +"' value='추가' style='width: 100px; '></center></td></tr></tbody></table></form>");
           //다이얼 로그 생성
           $(this).append("<div hidden id='constraintDialog"+ tableNumber +"_"+ colNumber +"' title='제약조건'>PRIMARY KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='PRIMARY KEY'>   FOREIGN KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='FOREIGN KEY'>   NOT NULL <input type='checkbox' name='constraint_ck' id='constraint_ck' value='NOT NULL'></div>");
           $(this).append("<div hidden id='constraintDialog_Dialog"+ tableNumber +"_"+ colNumber +"' title='FOREIGN KEY 설정'> 테이블명 <input type='text' name='FK_Table_Name' id='FK_Table_Name' placeholder='테이블명 입력' ><br>   컬럼명 <input type='text' name='FK_Col_Name' id='FK_Col_Name' placeholder='컬럼명 입력'></div>")
           /* 생성된 테이블에 드래그 추가 */
            $( ".draggable" ).draggable();
             
         //클릭시 다이얼 로그 생성
          $(document).on('click',"#constraint"+ tableNumber +"_"+ colNumber ,function() {
                  console.log($(this).parent().parent().children().children("#colimg"));
                  var constraints = $(this).parent().children("#constraints");
                  var hidden_TableName = $(this).parent().children("#hidden_tableName");
                   var hidden_ColName = $(this).parent().children("#hidden_colName");
                  var FK_dialog =$(this).parent().children("#conhidden_hidden").val();
                  $("#"+$(this).parent().children("#conhidden").val()).dialog({
                           height : 200,
                           width : 600,
                           modal : true,
                           draggable : false,
                           buttons: {
                              "설정":function(){
                                  var constraintName="";
                                  
                                   $(this).children("input[name=constraint_ck]:checked").each(function() {
                                      constraintName+=$(this).val()+",";
                                      if($(this).val()=="FOREIGN KEY"){
                                         console.log(FK_dialog);
                                         
                                         $("#"+FK_dialog).dialog({
                                            buttons: {
                                                 "설정": function() {
                                                 
                                                     $(hidden_TableName).val($(this).children("#FK_Table_Name").val());
                                                     $(hidden_ColName).val($(this).children("#FK_Col_Name").val());
                                                   $( this ).dialog( "close" );
                                                 }
                                            }
                                         });
                    
                                      }
                                      
                                   });
                                   
                                   $(constraints).val(constraintName);
                                   console.log($(constraints).val());
                                   $( this ).dialog( "close" );
                              }
                           }
                         });
               });
           
           //데이터 전송
              $(document).on('click',"#sub"+tableNumber ,function() {
               
               var colNameArray= new Array(colNumber);//컬럼의 이름을 받는 배열
               var coldataArray= new Array(colNumber);//컬럼의 데이터 타입을 받는 배열
               var colconsArray= new Array(colNumber);//컬럼의 제약조건을 받는 배열
               var hidden_tableNameArray= new Array(colNumber);//컬럼의 제약조건을 받는 배열
               var hidden_colNameArray= new Array(colNumber);//컬럼의 제약조건을 받는 배열
               
               var tableName = $("input[name=tablename"+tableNumber+"]").val();
               //console.log(tableName);
               /* colNumber 갯수많큼 값을 넣어준다. */
               for(var i=0;i<colNumber;i++){
                  colNameArray[i] = $("input[name=col"+tableNumber+"_"+(i+1)+"]").val();
                  coldataArray[i] = $("input[name=col_data"+tableNumber+"_"+(i+1)+"]").val();
                  colconsArray[i] = $("input[name=col"+tableNumber+"_"+(i+1)+"]").parent().parent().children("#cons").children("#constraints").val();
                  hidden_tableNameArray[i] = $("input[name=col"+tableNumber+"_"+(i+1)+"]").parent().parent().children("#cons").children("#hidden_tableName").val();
                  hidden_colNameArray[i] = $("input[name=col"+tableNumber+"_"+(i+1)+"]").parent().parent().children("#cons").children("#hidden_colName").val();
               }
               
               
               
               jQuery.ajaxSettings.traditional = true;   /* ajax를 사용해 배열값을 넘기기위한 세팅 */
               
               $.ajax({
               type : "get",
               url : "create.htm",
               dataType : "html",
               data : {
                  "colName" : colNameArray, "coldatatype":coldataArray, "tablename":tableName, "colcons":colconsArray, "hidden_tablename":hidden_tableNameArray , "hidden_colname":hidden_colNameArray
               },
               success : function(table) {
                 console.log(table);
                  alert(table);
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
               $(this).parent().parent().parent().parent().append("<tr><td><img id='colimg' name='colimg' src='<%=request.getContextPath()%>/resources/img/1.jpg'><input type='text' name='col"+ tableNumber +"_"+ ++colNumber +"'></td><td><input type='text' name='col_data"+ tableNumber +"_"+ colNumber +"'></td><td id='cons'><input type='button' id='constraint"+ tableNumber +"_"+ colNumber +"' name='constraint' value='제약설정'><input type='hidden' id='conhidden' value='constraintDialog"+ tableNumber +"_"+ colNumber +"'><input type='hidden' id='conhidden_hidden' value='constraintDialog_Dialog"+ tableNumber +"_"+ colNumber +"'><input type='hidden' id='constraints' value=''><input type='hidden' id='hidden_tableName' value=''><input type='hidden' id='hidden_colName' value=''></td></tr>");
               
               //버튼을 추가
               $(this).parent().parent().parent().parent().append("<tr><td colspan='3'><center><input id='sub"+ tableNumber +"' type='button' value='전송' style='width: 100px;'> <input type='button' id='plus"+ tableNumber +"' value='추가' style='width: 100px; '></center></td></tr>");
               
               //다이얼 로그 추가
               $(this).parent().parent().parent().parent().parent().parent().parent().append("<div hidden id='constraintDialog"+ tableNumber +"_"+ colNumber +"' title='제약조건'>PRIMARY KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='PRIMARY KEY'>   FOREIGN KEY <input type='checkbox' name='constraint_ck' id='constraint_ck' value='FOREIGN KEY'>   NOT NULL <input type='checkbox' name='constraint_ck' id='constraint_ck' value='NOT NULL'></div>");
               $(this).parent().parent().parent().parent().parent().parent().parent().append("<div hidden id='constraintDialog_Dialog"+ tableNumber +"_"+ colNumber +"' title='FOREIGN KEY 설정'> 테이블명 <input type='text' name='FK_Table_Name' id='FK_Table_Name' placeholder='테이블명 입력' ><br>   컬럼명 <input type='text' name='FK_Col_Name' id='FK_Col_Name' placeholder='컬럼명 입력'></div>");
               
               //버튼 삭제
               $(this).parent().parent().parent().empty();
               
             //클릭시 다이얼 로그 생성
               $(document).on('click',"#constraint"+ tableNumber +"_"+ colNumber ,function() {
                  
                       var constraints = $(this).parent().children("#constraints");
                       var hidden_TableName = $(this).parent().children("#hidden_tableName");
                         var hidden_ColName = $(this).parent().children("#hidden_colName");
                       var FK_dialog =$(this).parent().children("#conhidden_hidden").val();
                       $("#"+$(this).parent().children("#conhidden").val()).dialog({
                                height : 200,
                                width : 600,
                                modal : true,
                                draggable : false,
                                buttons: {
                                   "설정":function(){
                                       var constraintName="";
                                       
                                        $(this).children("input[name=constraint_ck]:checked").each(function() {
                                           constraintName+=$(this).val()+",";
                                           if($(this).val()=="FOREIGN KEY"){
                                              console.log(FK_dialog);
                                              
                                              $("#"+FK_dialog).dialog({
                                                 buttons: {
                                                      "설정": function() {
                                                      
                                                          $(hidden_TableName).val($(this).children("#FK_Table_Name").val());
                                                          $(hidden_ColName).val($(this).children("#FK_Col_Name").val());
                                                        $( this ).dialog( "close" );
                                                      }
                                                 }
                                              });
                         
                                           }
                                           
                                        });
                                        
                                        $(constraints).val(constraintName);
                                        console.log($(constraints).val());
                                        $( this ).dialog( "close" );
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
            <tr><td colspan='3'><input type='text' name='tablename"+ tableNumber +"' placeholder='테이블명'></td></tr>
            <tr><td>컬러명</td><td>데이터 타입</td><td>제약조건</td></tr>
            <tr id='colplus'><td><img id='colimg"+ tableNumber +"_"+ colNumber +"' name='colimg"+ tableNumber +"_"+ colNumber +"' src='<%=request.getContextPath()%>/resources/img/1.jpg'><input type='text' name='col"+ tableNumber +"_"+ colNumber +"'></td><td><input type='text' name='col_data"+ tableNumber +"_"+ colNumber +"'></td><td id='cons'><input type='button' id='constraint"+ tableNumber +"_"+ colNumber +"' name='constraint' value='제약설정'><input type='hidden' id='conhidden' value='constraintDialog"+ tableNumber +"_"+ colNumber +"'><input type='hidden' id='conhidden_hidden' value='constraintDialog_Dialog"+ tableNumber +"_"+ colNumber +"'><input type='hidden' id='constraints' value=''><input type='hidden' id='hidden_tableName' value=''><input type='hidden' id='hidden_colName' value=''></td></tr>
            <tr><td colspan='3'><center><input id='sub"+ tableNumber +"' type='button' value='전송' style='width: 100px;'> <input type='button' id='plus"+ tableNumber +"' value='추가' style='width: 100px; '></center></td></tr>
            </tbody>
            </table>
            </form>
            </section>
            
            
         </div>
      </div>   
   </div>
   <div id="errercode">
   
   </div>
   
   
</body>
</html>