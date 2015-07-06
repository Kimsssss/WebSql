<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="main">
	<div id="page-wrapper">
   <div class="row">
      <div class="col-lg-12">
				<h1 class="page-header">Web SQL</h1>
			
			<!-- /.col-lg-12 -->
		
		<!-- /.row -->
		<div class="col-lg-10">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <b>DDL</b>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">DB연결</a>
                                </li>
                                <li><a href="#profile" data-toggle="tab">Create TABLE(테이블 생성)</a>
                                </li>
                                <li><a href="#CONSTRAINT_TYPE" data-toggle="tab">CONSTRAINT_TYPE(제약조건)</a>
                                </li>
                                <li><a href="#ALTERADD" data-toggle="tab">ALTER ADD</a>
                                </li>
                                <li><a href="#ALTERMODIFY" data-toggle="tab">ALTER MODIFY</a>
                                </li>
                                <li><a href="#ALTERDROP" data-toggle="tab">ALTER DROP</a>
                                
                                </li>
                                <li><a href="#DROPTABLE" data-toggle="tab">DROP TABLE(테이블 삭제)</a>
                                
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content" style="height: 420px">
                                <div class="tab-pane fade in active" id="home">
                                    <br> <img class="img-responsive" style="height: 350px; width: 900px;" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/db.JPG" alt=""> 
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <br><img class="img-responsive" style="height: 350px; width: 900px;" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/select1.JPG" alt="">
                                </div>
                                <div class="tab-pane fade" id="CONSTRAINT_TYPE">
                                    <br><img class="img-responsive"  style="height: 350px; width: 900px;" src="<%=request.getContextPath()%>/resources/DDLintroimg/CONSTRAINT_TYPE.PNG" alt="">
                                </div>
                                <div class="tab-pane fade" id="ALTERADD">
                                    <br><img class="img-responsive" style="height: 350px; width: 900px;" src="<%=request.getContextPath()%>/resources/DDLintroimg/ALTER_ADD.PNG" alt="">
                                </div>
                                <div class="tab-pane fade" id="ALTERMODIFY">
                                    <br><img class="img-responsive"  style="height: 350px; width: 900px;" src="<%=request.getContextPath()%>/resources/DDLintroimg/ALTER_MODIFY.PNG" alt="">
                                </div>
                                <div class="tab-pane fade" id="ALTERDROP">
                                    <br><img class="img-responsive" style="height: 350px; width: 900px;" src="<%=request.getContextPath()%>/resources/DDLintroimg/ALTER_DROP.PNG" alt="">
                                </div>
                                <div class="tab-pane fade" id="DROPTABLE">
                                    <br><img class="img-responsive" style="height: 350px; width: 900px;" src="<%=request.getContextPath()%>/resources/DDLintroimg/DROP_TABLE.PNG" alt="">
                                </div>
                            
                            
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
		<!-- /.row -->
	</div>
</div>

</div><!-- /.row  -->

</div><!-- /.main -->