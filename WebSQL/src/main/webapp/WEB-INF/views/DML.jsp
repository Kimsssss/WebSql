<%@page import="com.sqlweb.dto.AccountDTO"%>
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
<% 
	HttpSession session = request.getSession();
	AccountDTO acdto = (AccountDTO)session.getAttribute("acdto");
	if(acdto == null){
		System.out.println("acdto null : "+acdto);
	}else{
		System.out.println("DML.jsp acdto not null : "+acdto);
		System.out.println("DML.jsp acdto not null : "+acdto.getId());
		System.out.println("DML.jsp acdto not null : "+acdto.getPwd());
		System.out.println("DML.jsp acdto not null : "+acdto.getUid());
		System.out.println("DML.jsp acdto not null : "+acdto.getIp());
	}
%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
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
      $('#crudbtn').click(function(){
         console.log($('#crudselect').val());
         console.log($('#tableselect').val());
         
         /**********************select  ******************************/
         if($('#crudselect').val() == "select"){
        	 
        	 $('#modalcontent2').empty();
        	 
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
                           columninput += "<br><br><table><tr><td width='80px'><h4>WHERE</h4></td><td width='300px'><input type='text' class='form-control' id='wheretext' name='wheretext' value=''></td></tr></table>";
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
                           data : {
                        	   list: JSON.stringify(list),
                               ip: $('#iptext').val(),
                               id: $('#idtext').val(),
                               pwd: $('#pwdtext').val(),
                               tablename: $('#tableselect').val(),
                               wheretext: $('#wheretext').val()},
                           dataType: "html",
                           success: function(responseData){
                          		var codes = JSON.parse(responseData);
                          		var code = "<br><br><div class='table-responsive'>"+
                              	"<table class='table table-striped table-bordered table-hover'><tr><td>row</td>";
                          		var colend = codes[codes.length-1];
                          		var sort = 1;
                          		$.each(codes,function(index,items){
                             		if(colend == 1){
                            	 		if(index == codes.length-2){
                            				 code += "<td>"+items+"</td></tr></table>";
                            		 
                            	 		}else{
                            	 			if(index != codes.length-1){
                            	 				code += "<td>"+items+"</td></tr><tr><td>"+sort+"</td>";
                            	 				sort +=1;
                            	 			}
                            	 		}
                            	 
                             		}else{
                            	 		if((index+1)%colend == 0){
                                     		if(index != codes.length-2){
                                    			 code += "<td>"+items+"</td></tr><tr><td>"+sort+"</td>";
                                    			 sort +=1;}
                                     		else{
                                        		code += "<td>"+items+"</td></tr>";
                                     		}
                                     
                                  		}else{
                                     		if(codes.length-1 ==index){
                                          		code += "</table></div>";
                                       		}else{
                                          		code += "<td>"+items+"</td>";
                                       		}
                                  
                                  		}
                             		}
                             
                          		}) 
                          		$('#tableviewdiv').html(code);
                           		} 
                   			})
                        
                    	});
                    
                   	}
                  }); 
          }/**********************select end  ******************************/
        
         
          
         
         
         /*********************insert ********************************  */
         else if($('#crudselect').val() == "insert"){
             console.log("insert if문");
             console.log($('#crudselect').val());
             console.log($('#tableselect').val());
             console.log($('#ipip').val());
             console.log($('#idid').val());
             console.log($('#pwdpwd').val());
             
              var inputstr ="";
              
              
              
             $.ajax({
            	  type: 'POST',
                  url: "tableviewinsert.html",
                  data : {ip: $('#iptext').val(),
                       id: $('#idtext').val(),
                       pwd: $('#pwdtext').val(),
                       tablename: $('#tableselect').val()},
                  dataType: "html",  
                  success : function(responseData){
                	  
                	  /*****************************제약조건 추가******************************/
                	  
                	  var codes = JSON.parse(responseData);
                      
                      console.log("codes : "+codes.length);
                      var code = "<br><br><div class='table-responsive'><table class='table table-striped table-bordered table-hover' border='1'>";
                      code += "<tr><td>COLUMN_NAME</td><td>DATA_TYPE</td><td>CONSTRAINT_TYPE</td><td>CONSTRAINT_NAME</td><td>TABLE_NAME</td></tr>";
                      
                      var colend = codes[codes.length-1];

                      console.log(colend);
                      console.log(codes.length-1);
                      $.each(codes,function(index,items){
                         console.log("items : "+items);
                         
                         if(items == "C"){
                            code+= "<td><img src='resources/btnimg/notnull.jpg'></td>";
                         }else if(items=="P"){
                            code += "<td><img src='resources/btnimg/pk.jpg'></td>";
                         }else if(items=="R"){
                            code += "<td><img src='resources/btnimg/fk.jpg'></td>";
                         }
                         
                         /* TABLE NAME값을 나타낸다.  */
                         else if((index+1)%5 == 0){
                         	console.log((index+1)%5 == 0);
                         	console.log(index);
                            code += "<td>"+items+"</td></tr><tr>";
                            
                            console.log("(index+1)%5 == 0 : "+code);
                            console.log("TEST");
                         }else{
                            if(codes.length-1 == index){
                         	   console.log(codes.length);
                                 code += "</tr></table></div>";
                                 
                                 
                              }
                            
                            else{
                             	 
                                 code += "<td>"+items+"</td>"
                                 console.log("GOOD");
                              }
                            $('#viewdiv').html(code);
                         }
                      }) 
                      /**************************** 제약 조건 End  ***************************************/
                     
                	  
       
                	  
                	  /**************************** 컬럼 추가 ********************************************/
                	   $.ajax({
                      	 type: 'POST',
                           url: "inputdataTYPE.html",
                           data : {ip: $('#iptext').val(),
                                id: $('#idtext').val(),
                                pwd: $('#pwdtext').val(),
                                tablename: $('#tableselect').val()},
                           dataType: "html",
                           success: function(responseData){
                                var codedata = JSON.parse(responseData);
                                var columninput = "";
                                console.log("컬럼명타입 비동기 성공");
                                console.log(codedata);
                      
                           
                                /********************** ajax(비동기) inputselect.html********************************/
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
                                         var columninput = "";   //기본 데이터 
                                         var columninputAuto = "";  //자동 데이터
                                         var inserts="" //다중 insert 
                                         var insertsvalue=0;
                                         
                 
          							    var Value="";
          							    var AutoValue = "";
          							    var AutoNumber = 0;
          							   
                                         console.log("컬럼명 비동기 성공");
                                         console.log(codes);
           								
                                         columninput += "<table class='table table-striped table-bordered table-hover dataTable no-footer'>";
                                         columninput += "<tr><th>컬럼명</th><th>타입</th><th>입력</th></tr>";
                                      	  
                                         var abc=[];
                                         var cd=0;
                                     
                                         
                                         
                                         $.each(codes,function(index,items){
          	
                                      	if(codedata[index] == "NUMBER"){
                                      		columninput += "<tr><td>"+items+"</td><td>"+codedata[index]+"</td><td><input type='text' name='columnname' id='columnname' class='sel'";
                                      		columninput += "value=''</td></tr>";
                                      		
                                      		
                                         }else if(codedata[index] == "VARCHAR2"){
                                         	columninput += "<tr><td>"+items+"</td><td>"+codedata[index]+"</td><td><input type='text' name='columnname' id='columnname' class='sel'";
                                      		columninput += "value=''</td></tr>";
                                      	
                                         	
                                         }else if(codedata[index] == "DATE"){
                                         	columninput += "<tr><td>"+items+"</td><td>"+codedata[index]+"</td>";
                                      		columninput += "<td><input type='text' name='columnname' id='datepicker"+index+"' class='sel' value=''</td></tr>"; 
                                      	    
                                      		abc[cd]=index;
                                      		cd++;
           
                                        	      }
                            				
                                         });
                                         
                                         $('#modalbody2').html(code + columninput);
                                         for(var i=0; i<cd; i++){
                                         	console.log(abc);
                                         	console.log(abc[i]);
                                         	console.log(cd);
                                         	
                                   
                                         	$("#datepicker"+abc[i]).datepicker ({dateFormat : "yy/mm/dd",
                                         										changeMonth: true,
                                         	      								changeYear: true}); 
                                        
                                      	  
                                         }
                                         
                                         columninput +="</table>";
                                         
                                      	
                                         
                                       inserts = "<h4>row insert수 <input type='number' id='inserts' name='inserts' class='' value=''></h4>";
                                     
                         	   	        $('#modalcontent2').html(inserts);
                                    
                         	   	        
                                      $('#modalfooter2').html("<input type='button' id='selectviewbtn' name='selectviewbtn' class='btn btn-default' data-dismiss='modal' value='insert'> "  
                                    		  			       +"<input type='button' id='insertselect2' class='btn btn-default' data-toggle='modal' data-target='#insertselect'   value='select'>"
                                         		               +"<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                                     
   
   
                                  	 $('#selectviewbtn').click(function(){
                                             	
                                  	    	
                                  	    	/* datapicker = "'"+$('#datepicker').val()+"'";
                                  	    	 
                                  	    	 
                                              console.log(datapicker+" / TEST"); */
                                              var obj = document.getElementsByName("columnname");
                                              var list = [];
                                              console.log($('#columnname').val());
                                              $.each(obj,function(index,ob){
                                              
                                              	list.push(ob.value);
                
                                                
                                              });
                                            
                                           
                                          jQuery.ajaxSettings.traditional = true;   
                                          
                                          console.log("inserts : "+$('#inserts').val());
                                          
                                          if($('#inserts').val() == 0){
                                          	
                                          	 $('#inserts').val(1);

                                          }else{
                                          	
                                          	
                                          }
                                          

                                          $.ajax({
                                            type: 'POST',
                                                url: "insertcheck.html",
                                                 data : {list: JSON.stringify(list),
                                                 inserts : $('#inserts').val(),	
                                                    ip: $('#iptext').val(),
                                                   id: $('#idtext').val(),
                                                   pwd: $('#pwdtext').val(),
                                                   tablename: $('#tableselect').val()},
                                                dataType: "html",
                                                 success: function(responseData){
                                                 	var json = JSON.parse(responseData);
                                     
                                              		 if( json.result == 0){
                                              			 $('#tableviewdiv').html("<h3>에러메세지 : "+json.error+"</h3>");
                                              			$('#inserts').val("");
                                              		 }
                                              		   
                                              	     else{
                                              	    	$('#tableviewdiv').html("<h3>"+json.result+"Row가 insert 되었습니다. </h3>");
                                              	    	$('#inserts').val("");
                                              	     }
                                              	   
                                                                               } 
                                         })
                                              
                                          }); 

                                      
                                     }

                                });  /********************** ajax(비동기) inputselect.html END********************************/
                         
             }
                  
                	  
                  });
              
                  }
    
             
             });
              


         } /* ********************insertEND ********************************  */
      
      
 
          /*********************UPDATE ********************************  */
         else if($('#crudselect').val() == "update"){	 
        	 $('#modalcontent2').empty();
        	 
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
                         var columninput = "<table><tr><td width='130px'><b>UPDATE Column</b></td> <td width='170px'><select id='updateselect' class='form-control' name='updateselect'>";
                         console.log("update 비동기 성공");
                         console.log(codes);
                         $.each(codes,function(index,items){
                                
                            columninput += "<option value='"+items+"' id='"+items+"' name='"+items+"'>"+items+"</option>";
                            console.log(columninput);
                             })
                             columninput += "</select></td><td width='10px'></td><td width='113px'><b>UPDATE Value</b></td> <td width='170px'><input type='text' id='textupdate' class='form-control' name='textupdate' value=''></td></tr></table>";
                             columninput += "<br><br><table><tr><td width='80px'><h4>WHERE</h4></td><td width='350px'><input type='text' class='form-control' id='wheretext' name='wheretext' value=''></td></tr></table>";
                          /* columninput += "<br>----------------------------------------------------------------<br>"+
                          "<h3>WHERE </h3><input type='text' id='wheretext' name='wheretext'>"; */
                         $('#modalbody2').html(columninput);
                      $('#modalfooter2').html("<input type='button' id='updateviewbtn' name='updateviewbtn' class='btn btn-default' data-dismiss='modal' value='삽입'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                           
                      $('#updateviewbtn').click(function(){
                         var textupdate = $('#textupdate').val();
                         var wheretext = $('#wheretext').val();
                         var colupdate = $('#updateselect').val();
                         console.log(textupdate);
                         console.log(wheretext);
                         console.log(colupdate);
                        
                      $.ajax({
                        type: 'POST',
                            url: "updateview.html",
                             data : {ip: $('#iptext').val(),
                               id: $('#idtext').val(),
                               pwd: $('#pwdtext').val(),
                               tablename: $('#tableselect').val(),
                               wheretext: wheretext,
                               textupdate: textupdate,
                               colupdate: colupdate},
                            dataType: "html",
                             success: function(responseData){
                            var codes = JSON.parse(responseData);
                            console.log("select 비동기 성공");
                            console.log(codes);
                            if(codes == 0){
                               alert("변경 실패");
                            }else{
                               alert("변경 성공");
                            }
                           /*  var code = "<table border='1'><tr>";
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
                            $('#tableviewdiv').html(code); */
                             } 
                     })
                          
                      });
                      
                     }
                    }); 
          } /*********************UPDATE end ********************************  */
          
          
         
         
         
         
         /********************************* DML delete 부분 ******************/
         
         else if($('#crudselect').val() == "delete"){ 
        $('#modalcontent2').empty();
        
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
                        var columninput = "<table><tr><td width='80px'><h4>WHERE</h4></td> <td width='170px'><select id='deleteselect' class='form-control' name='deleteselect'>";
                        $.each(codes,function(index,items){
                               
                           columninput += "<option value='"+items+"' id='"+items+"' name='"+items+"'>"+items+"</option>";
                           console.log(columninput);
                            })
                            columninput += "</select></td><td width='10px'></td><td width='20px'><b>=</b></td> <td width='250px'><input type='text' id='deletetxt' class='form-control' name='deletetxt' value=''></td></tr></table>";
                            
                            
                        $('#modalbody2').html(columninput);
                        $('#modalfooter2').html("<input type='button' id='deletebtn' class='btn btn-default' data-dismiss='modal' name='deletebtn' value='삭제'>    <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
                          
                        $('#deletebtn').click(function(){
                           $.ajax({
                               type: 'POST',
                                   url: "deleteTable.html",
                                    data : {
                                       ip: $('#iptext').val(),
                                      id: $('#idtext').val(),
                                   pwd: $('#pwdtext').val(),
                                   tablename: $('#tableselect').val(),
                                   coldelete : $('#deleteselect').val(),
                                   deletetxt : $('#deletetxt').val()},
                                dataType: "html", 
                                success: function(responseData){
                                   var json = JSON.parse(responseData);
                                    
                                        if(json.row==0){
                                           $('#tableviewdiv').html("<h5>" + json.error + "</h5>");
                                        }
                                      
                                        else{
                                          $('#tableviewdiv').html("<h5>" + json.row + "개 데이터가 삭제되었습니다.</h5>");
                                        }
                                   }
                                   
                                     
                         })
                         
                     });
                     
                    }
                   }); 


               
             
          
         }
         /************************************* DML delete 부분 끝~~ ******************************/
       
         
         
      });
   });
</script>
<script type="text/javascript">
   $(function(){
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
<td>&nbsp;&nbsp;</td>
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
                      <input type="text" class='form-control' name="iptext" id="iptext" value="<%=acdto.getIp()%>">
                      <input type="hidden" name="iphidden" id="iphidden" value="<%=acdto.getIp()%>">

                  </td>   
            </tr>
            <tr height="40px">
               <td><b>계정 ID</b></td>
               <td>
                  <input type="text" class='form-control' name="idtext" id="idtext" value="<%=acdto.getId()%>">
                  <input type="hidden" name="idhidden" id="idhidden" value="<%=acdto.getId()%>">

               </td>  
            </tr>
            <tr height="40px">
               <td><b>계정 PWD</b></td>
               <td>  
                  <input type="text" class='form-control' name="pwdtext" id="pwdtext" value="<%=acdto.getPwd()%>">
                  <input type="hidden" name="pwdhidden" id="pwdhidden" value="<%=acdto.getPwd()%>">

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
  <div class="modal fade" id="crudModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 980px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">세부 설정</h4>
        </div>
        <div class="modal-body" id="modalbody2">
          <!-- modal 메인 html 정보 body -->
        </div>
        <!-- <button type="button" class="btn btn-danger" onclick="javascript:msgform.submit();">Send</button> -->
        
         <div class="modal-body" id="modalcontent1">
        </div>
        
        
          <div class="modal-body" id="modalcontent2">
        </div>
        
        
        <div class="modal-footer">
           <div id="modalfooter2" name="modalfooter2">
              <!-- modal 확인 버튼 등 footer -->
           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
  <div class="modal fade" id="insertselect" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Insert Select</h4>
        </div>
        <div class="modal-body" id="modalbody3">
 
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
  
  
  
  
  <!-- -------------------------------------modal end------------------------------------------------------------- -->
</div>

</div>
</div>
</div>



</body>

</html>
