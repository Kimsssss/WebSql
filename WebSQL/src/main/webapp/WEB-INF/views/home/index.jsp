<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="main">
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Web SQL</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="col-lg-10">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <b>DML</b>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#home" data-toggle="tab">DB연결</a>
                                </li>
                                <li><a href="#profile" data-toggle="tab">selectI</a>
                                </li>
                                <li><a href="#messages" data-toggle="tab">selectII</a>
                                </li>
                                <li><a href="#settings" data-toggle="tab">insert</a>
                                </li>
                                <li><a href="#settings1" data-toggle="tab">update</a>
                                </li>
                                <li><a href="#settings2" data-toggle="tab">delete</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content" style="height: 420px">
                                <div class="tab-pane fade in active" id="home">
                                    <br><img class="img-responsive" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/db.JPG" style="height: 350px; width: 900px;" alt="">
                                </div>
                                <div class="tab-pane fade" id="profile">
                                    <br><img class="img-responsive" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/select1.JPG" style="height: 350px; width: 900px;" alt="">
                                </div>
                                <div class="tab-pane fade" id="messages">
                                    <br><img class="img-responsive" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/select2.JPG" style="height: 350px; width: 900px;" alt="">
                                </div>
                                <div class="tab-pane fade" id="settings">
                                    <br><img class="img-responsive" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/insert.JPG" style="height: 350px; width: 900px;" alt="">
                                </div>
                                <div class="tab-pane fade" id="settings1">
                                    <br><img class="img-responsive" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/update.JPG" style="height: 350px; width: 900px;" alt="">
                                </div>
                                <div class="tab-pane fade" id="settings2">
                                    <br><img class="img-responsive" src="<%=request.getContextPath()%>/resources/startbootstrap-landing-page-1.0.4/img/delete.JPG" style="height: 350px; width: 900px;" alt="">
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