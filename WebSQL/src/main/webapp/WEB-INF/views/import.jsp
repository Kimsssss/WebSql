<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<title>Insert title here</title>
</head>
<script>
  $(function() {
    $( ".modal-dialog" ).draggable();
  });
  </script>
<script type="text/javascript">
   $(function(){
      $('#btn').click(function(){
         /* **************************제약조건 테이블**************************** */
      if($('#ddlselect').val() == "constraints"){
         
         var columninput = "<h4>테이블 내의 제약조건을 출력합니다.</h4>";
          
           $('#modalbody3').html(columninput);
           $('#modalfooter3').html("<input type='button' id='constraintsbtn' class='btn btn-default' data-dismiss='modal' name='constraintsbtn' value='확인'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
         
         $('#constraintsbtn').click(function(){
               
               $.ajax({
                 type: 'POST',
                     url: "tableview.html",
                      data : {
                         ip: $('#ip_text').val(),
                        id: $('#id_text').val(),
                        pwd: $('#pwd_text').val(),
                        tablename: $('#tablesel').val()},
                     dataType: "html",
                      success: function(responseData){
                     var codes = JSON.parse(responseData);
                     var code = "<br><br><div class='table-responsive'><table class='table table-striped table-bordered table-hover' border='1'>";
                     code += "<tr><td>COLUMN_NAME</td><td>DATA_TYPE</td><td>CONSTRAINT_TYPE</td><td>CONSTRAINT_NAME</td><td>TABLE_NAME</td><tr>";
                     
                     var colend = codes[codes.length-1];
                     if(codes==0){
                       alert('데이터 없음');
                    }
                     console.log(colend);
                     console.log(codes.length-1);
                     $.each(codes,function(index,items){
                        console.log(items);
                        
                        if(items == "C"){
                           code+= "<td><img src='resources/btnimg/notnull.jpg'></td>";
                        }else if(items=="P"){
                           code += "<td><img src='resources/btnimg/pk.jpg'></td>";
                        }else if(items=="R"){
                           code += "<td><img src='resources/btnimg/fk.jpg'></td>";
                        }
                        else if((index+1)%5 == 0){
                           code += "<td>"+items+"</td></tr><tr>";
                        }else{
                           if(codes.length-1 == index){
                                code += "</tr></table></div>";
                             }else{
                                code += "<td>"+items+"</td>"
                             }
                        
                        }
                     }) 
                     
                     $('#viewdiv').html(code);
                      } 
              })
          });
     
        }
      /* **************************제약조건 테이블 END**************************** */
      
      
      
      /* **************************컬럼, 제약조건 추가(ADD)**************************** */
      else if($('#ddlselect').val() == "add"){
         var tablename= $('#tablesel').val();
        console.log("add");
            var columninput = "<b>ALTER TABLE </b><b>"+tablename+"</b>";
               columninput += "<b> ADD</b><input type='text' id='addtxt' class='form-control' name='addtxt' value='' style='200px'>";
               $('#modalbody3').html(columninput);
               $('#modalfooter3').html("<input type='button' id='addbtn' class='btn btn-default' data-dismiss='modal' name='addbtn' value='추가'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                   $('#addbtn').click(function(){
                      $.ajax({
                           type: 'POST',
                               url: "alterAdd.html",
                                data : {
                                   ip: $('#ip_text').val(),
                                  id: $('#id_text').val(),
                               pwd: $('#pwd_text').val(),
                               tablename: $('#tablesel').val(),
                               addtxt : $('#addtxt').val()},
                            dataType: "html",
                            success: function(responseData){
                               var json = JSON.parse(responseData);
                        console.log(json.row);
                                $('#viewdiv').html("<h5>테이블에" + json.row + "개 추가 되었습니다.</h5>");
                          
                            }
                        })
                       
                   });
        } 
      /* **************************add END**************************** */
      
      
      /* **************************컬럼 수정(modify)**************************** */
      else if($('#ddlselect').val() == "modify"){
         var tablename= $('#tablesel').val();
            var columninput = "<b>ALTER TABLE </b><b>"+tablename+"</b>";
               columninput += "<b> MODIFY</b><input type='text' id='modifytxt' class='form-control' name='modifytxt' value='' style='200px'>";
               $('#modalbody3').html(columninput);
               $('#modalfooter3').html("<input type='button' id='modifybtn' class='btn btn-default' data-dismiss='modal' name='modifybtn' value='수정'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                   $('#modifybtn').click(function(){
                      $.ajax({
                           type: 'POST',
                               url: "alterModify.html",
                                data : {
                                   ip: $('#ip_text').val(),
                                  id: $('#id_text').val(),
                               pwd: $('#pwd_text').val(),
                               tablename: $('#tablesel').val(),
                               modifytxt : $('#modifytxt').val()},
                            dataType: "html",
                            success: function(responseData){
                               var json = JSON.parse(responseData);
                                console.log(json.row);
                                
                              $.ajax({
                                 type: 'POST',
                                     url: "datatype.html",
                                      data : {
                                         ip: $('#ip_text').val(),
                                        id: $('#id_text').val(),
                                     pwd: $('#pwd_text').val(),
                                     tablename: $('#tablesel').val()},
                                  dataType: "html",
                                  success: function(responseData){
                                      var codes = JSON.parse(responseData);
                                      var code = "<br><br><div class='table-responsive'><table class='table table-striped table-bordered table-hover' border='1'>";
                                      code += "<tr><td>COLUMN_NAME</td><td>DATA_TYPE</td><tr>";
                                      
                                      var colend = codes[codes.length-1];
                                      if(codes==0){
                                        alert('데이터 없음');
                                     }
                                      console.log(colend);
                                      console.log(codes.length-1);
                                      $.each(codes,function(index,items){
                                         console.log(items);
                                         if((index+1)%2 == 0){
                                            code += "<td>"+items+"</td></tr><tr>";
                                         }else{
                                            if(codes.length-1 == index){
                                                 code += "</tr></table></div>";
                                              }else{
                                                 code += "<td>"+items+"</td>"
                                              }
                                         
                                         }
                                      }) 
                                      alert('수정된 부분을 확인해주세요.\n수정이 안되었을 경우 해당 컬럼의 데이터를 모두 삭제하세요.');
                                      $('#viewdiv').html(code);
                                       } 
                           })
                            }
                        })
                       
                   });
        } 
      /* **************************(modify) END**************************** */

      
      
      /* **************************테이블 삭제(DROP)**************************** */
       else if($('#ddlselect').val() == "tabledrop"){
        
         var columninput = "<h4>Drop Table 할 경우 Data와 Table이 모두 삭제됩니다.<br>삭제 하시겠습니까?</h4>";
             
           $('#modalbody3').html(columninput);
           $('#modalfooter3').html("<input type='button' id='droptablebtn' class='btn btn-default' data-dismiss='modal' name='droptablebtn' value='삭제'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                   $('#droptablebtn').click(function(){
                      $.ajax({
                           type: 'POST',
                               url: "dropTable.html",
                                data : {
                                   ip: $('#ip_text').val(),
                                  id: $('#id_text').val(),
                               pwd: $('#pwd_text').val(),
                               tablename: $('#tablesel').val()},
                            dataType: "html",
                            success: function(responseData){
                               var json = JSON.parse(responseData);
                                $('#viewdiv').html("<h5>테이블이 삭제되었습니다.</h5>");
                            }
                        })
                       
                   });
        }  
      
      /* *************************DROP END**************************** */
       else if($('#ddlselect').val() == "drop"){
            var tablename= $('#tablesel').val();
               var columninput = "<b>ALTER TABLE </b><b>"+tablename+"</b>";
                  columninput += "<b> DROP</b><input type='text' id='droptxt' class='form-control' name='modifytxt' value='' style='200px'>";
                  $('#modalbody3').html(columninput);
                  $('#modalfooter3').html("<input type='button' id='modifybtn' class='btn btn-default' data-dismiss='modal' name='modifybtn' value='수정'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                      $('#modifybtn').click(function(){
                         $.ajax({
                              type: 'POST',
                                  url: "alterModify.html",
                                   data : {
                                      ip: $('#ip_text').val(),
                                     id: $('#id_text').val(),
                                  pwd: $('#pwd_text').val(),
                                  tablename: $('#tablesel').val(),
                                  modifytxt : $('#modifytxt').val()},
                               dataType: "html",
                               success: function(responseData){
                                  var json = JSON.parse(responseData);
                                   console.log(json.row);
                                   
                                 $.ajax({
                                    type: 'POST',
                                        url: "datatype.html",
                                         data : {
                                            ip: $('#ip_text').val(),
                                           id: $('#id_text').val(),
                                        pwd: $('#pwd_text').val(),
                                        tablename: $('#tablesel').val()},
                                     dataType: "html",
                                     success: function(responseData){
                                         var codes = JSON.parse(responseData);
                                         var code = "<br><br><div class='table-responsive'><table class='table table-striped table-bordered table-hover' border='1'>";
                                         code += "<tr><td>COLUMN_NAME</td><td>DATA_TYPE</td><tr>";
                                         
                                         var colend = codes[codes.length-1];
                                         if(codes==0){
                                           alert('데이터 없음');
                                        }
                                         console.log(colend);
                                         console.log(codes.length-1);
                                         $.each(codes,function(index,items){
                                            console.log(items);
                                            if((index+1)%2 == 0){
                                               code += "<td>"+items+"</td></tr><tr>";
                                            }else{
                                               if(codes.length-1 == index){
                                                    code += "</tr></table></div>";
                                                 }else{
                                                    code += "<td>"+items+"</td>"
                                                 }
                                            
                                            }
                                         }) 
                                         alert('수정된 부분을 확인해주세요.\n수정이 안되었을 경우 해당 컬럼의 데이터를 모두 삭제하세요.');
                                         $('#viewdiv').html(code);
                                          } 
                              })
                               }
                           })
                          
                      });
           } 
      
      });
     
   });
</script>
<script type="text/javascript">
   $(function(){
      $('#con_btn').click(function(){
           $.ajax({
              type: 'POST',
                url: "conview.html",
                data : {ip: $('#ip_text').val(),
                      id: $('#id_text').val(),
                      pwd: $('#pwd_text').val()},
                dataType: "html",
                success: function(responseData){
                   var codes = JSON.parse(responseData);
                   var code = "";
                   if(codes[3] == true){
                      $('#ip_hidden').val(codes[0]);
                      $('#id_hidden').val(codes[1]);
                      $('#pwd_hidden').val(codes[2]);
                      $('#con_modal').html("<input type='button' id='con_modalview' name='con_modalview' value='확인' class='btn btn-danger' data-dismiss='modal'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                      alert("연결 성공");
                   }else{
                      alert("연결 실패");
                      $('#con_modal').html("");
                      $('#ip_hidden').val("");
                      $('#id_hidden').val("");
                      $('#pwd_hidden').val("");
                      
                   }
                   
                   $('#con_modalview').click(function(){
                     $('#user_ip').val( $('#ip_hidden').val());
                     $('#userid').val($('#id_hidden').val());
                     $('#userpwd').val($('#pwd_hidden').val());
                     $.ajax({
                        type: 'POST',
                            url: 'contable.html',
                            data:{
                               ip: $('#user_ip').val(),
                               id: $('#userid').val(),
                               pwd: $('#userpwd').val()}, 
                          dataType: "html",
                            success: function(responseData){
                            var codes = JSON.parse(responseData);
                            var optionstr = "<option>테이블 종류</option>";
                            
                          $.each(codes,function(index,items){
                             
                             optionstr += "<option>"+items+"</option>"
                          })
                          $('#tablesel').html(optionstr);
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
               <h2 align="left" class="page-header">불러오기</h2>
            </div>





            <table align="center">
               <tr>
                  <td width="200px"><select class="form-control" id="ddlselect"
                     name="ddlselect">
                        <option value="constraints" id="constraints">constraints</option>
                        <option value="add" id="add">Alter add</option>
                        <option value="modify" id="modify">Alter modify</option>
                        <option value="drop" id="drop">Alter drop</option>
                        <option value="rename" id="rename">Alter rename</option>
                        <option value="tabledrop" id="tabledrop">Drop Table</option>
                  </select></td>
                  <td width="95px" align="center"><input type="button"
                     name="submitbtn" id="submitbtn" class="btn btn-info"
                     data-toggle="modal" data-target="#ipModal" value="계정연결"
                     style="padding-left: 10px; padding-right: 10px;"></td>

                  <td width="200px"><select class="form-control" id="tablesel"
                     name="tablesel">
                        <option>테이블 종류</option>
                  </select></td>

                  <td width="86px" align="right"><input type="button"
                     id="btn" name="btn" value="실행" class="btn btn-info"
                     data-toggle="modal" data-target="#ddlModal"
                     style="padding-left: 24px; padding-right: 24px;"></td>
                  

                  <td width="85px" align="center"><b>연결된 IP</b></td>

                  <td width="170px"><input type="text" class="form-control"
                     id="user_ip" name="user_ip" readonly="readonly"></td>

                  <td width="85px" align="center"><b>연결된 계정</b></td>
                  <td width="170px"><input type="text" class="form-control"
                     id="userid" name="userid" readonly="readonly"> <input
                     type="hidden" id="userpwd" name="userpwd"></td>
               </tr>
            </table>

            <!-- 테이블 출력 div -->
            <div id="viewdiv" name="viewdiv"></div>

            <div class="container">




               <!-- Modal -->
               <div class="modal fade" id="ipModal" role="dialog">
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
                                 <td><input type="text" class='form-control'
                                    name="ip_text" id="ip_text"> <input type="hidden"
                                    name="ip_hidden" id="ip_hidden" value=""></td>
                              </tr>
                              <tr height="40px">
                                 <td><b>계정 ID</b></td>
                                 <td><input type="text" class='form-control'
                                    name="id_text" id="id_text"> <input type="hidden"
                                    name="i_+hidden" id="id_hidden" value=""></td>
                              </tr>
                              <tr height="40px">
                                 <td><b>계정 PWD</b></td>
                                 <td><input type="text" class='form-control'
                                    name="pwd_text" id="pwd_text"> <input type="hidden"
                                    name="pwd_hidden" id="pwd_hidden" value=""></td>
                              </tr>
                              <tr>
                                 <td align="right" colspan="2"><input type="button"
                                    class='btn btn-info' value="연결" id="con_btn" name="con_btn">
                                 </td>
                              </tr>
                           </table>
                        </div>
                        <!-- <button type="button" class="btn btn-danger" onclick="javascript:msgform.submit();">Send</button> -->

                        <div class="modal-footer">
                           <div id="con_modal" name="con_modal">
                              <button type="button" class="btn btn-default"
                                 data-dismiss="modal">Close</button>
                           </div>
                        </div>
                     </div>

                  </div>
               </div>
               
               <!-- Modal -->
   <div class="modal fade" id="ddlModal" role="dialog">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">세부 설정</h4>
            </div>
            <div class="modal-body" id="modalbody3">
               <!-- modal 메인 html 정보 body -->
            </div>
            <!-- <button type="button" class="btn btn-danger" onclick="javascript:msgform.submit();">Send</button> -->

            <div class="modal-footer">
               <div id="modalfooter3" name="modalfooter3">
                  <!-- modal 확인 버튼 등 footer -->
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

</html>