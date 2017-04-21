<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/3/18
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/mainstyle.css" rel="stylesheet">
    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="assets/js/pswd.js"></script>
</head>

<body style="padding-top: 50px;background-color: #222222">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed" aria-expanded="true" aria-controls="navbar" type="button"
                    data-toggle="collapse" data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <a class="navbar-brand" href="/home"> 东北大学研究生实验室管理系统</a>
        </div>
        <div class="navbar-collapse collapse" id="navbar" aria-expanded="false" style="height: 1px;">
            <ul class="nav navbar-nav pull-right">
                <li>
                    <a href="#"><span class="
glyphicon glyphicon-bookmark"></span> ${userRole}</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> ${userName}
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/individual">个人中心</a></li>
                        <li><a data-toggle="modal" data-target="#alterPswd" href="#">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="/logout">退出</a></li>
                    </ul>

                </li>
                <li><a href="/logout" id="logout"><span class="glyphicon glyphicon-log-out"></span> 退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid" style="padding: 0px" id="content3">
    <div row class="row-fluid">
        <div class=" col-sm-2 pull-left" id="leftnav">
            <img src="assets/image/badge/SchoolBadgewhite.png" class="img-responsive">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="/home" class="center-block text-center" style="text-decoration: none" <%--data-toggle="collapse"
                              data-parent="#accordion"--%>
                            <%-- onclick="load_home()--%>">
                            主页
                            </a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="center-block text-center" style="text-decoration: none" data-toggle="collapse"
                               data-parent="#accordion"
                               href="#collapseOne">
                                学生信息管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">
                            <a class="center-block text-center" style="text-decoration: none"
                               href="/info">信息管理</a>
                        </div>

                        <div class="panel-body">
                            <a class="center-block text-center" style="text-decoration: none"
                               href="/advance">高级功能</a>
                        </div>
                    </div>

                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" class="center-block text-center" data-parent="#accordion"
                               href="#collapseTwo" style="text-decoration: none">
                                考勤管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <a class="center-block text-center" style="text-decoration: none"
                               href="/record">考勤记录</a>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" class="center-block text-center" data-parent="#accordion"
                               href="#collapseThree" style="text-decoration: none">
                                实验室管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="panel-body">
                                <a class="center-block text-center" style="text-decoration: none" href="#">实验室管理</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-10" style="padding: 0px;">
            <div style="padding-right:0px;border: 1px solid #080808 ;height: 0px;;padding-left: 0px; background-color: #333333;padding-bottom:100% ;">
                <div id="contentPage">
                    <%--  可替换的内容--%>

                    <div>
                        <div class="col-sm-offset-1 col-sm-10"
                             style="background-color: #222222;border: 1px solid #080808 ;margin-top: 30px ">

                            <div style="margin: 30px">
                                <div class="carousel slide" id="carousel-172005">
                                    <ol class="carousel-indicators">
                                        <li class="active" data-target="#carousel-172005" data-slide-to="0">
                                        </li>
                                        <li data-target="#carousel-172005" data-slide-to="1">
                                        </li>
                                        <li data-target="#carousel-172005" data-slide-to="2">
                                        </li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <img alt="" src="/assets/image/mainPage/1.jpg"/>
                                            <div class="carousel-caption">
                                                <h4>
                                                    First Thumbnail label
                                                </h4>
                                                <p>
                                                    Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec
                                                    id elit
                                                    non
                                                    mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
                                                    vehicula
                                                    ut id
                                                    elit.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <img alt="" src="asset/mainPage/2.jpg"/>
                                            <div class="carousel-caption">
                                                <h4>
                                                    Second Thumbnail label
                                                </h4>
                                                <p>
                                                    Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec
                                                    id elit
                                                    non
                                                    mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
                                                    vehicula
                                                    ut id
                                                    elit.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <img alt="" src="asset/mainPage/3.jpg"/>
                                            <div class="carousel-caption" style="background-color: black ;opacity: 0.8">
                                                <h4>
                                                    Third Thumbnail label
                                                </h4>
                                                <p>
                                                    Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec
                                                    id elit
                                                    non
                                                    mi porta gravida at eget metus. Nullam id dolor id nibh ultricies
                                                    vehicula
                                                    ut id
                                                    elit.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left carousel-control" href="#carousel-172005" data-slide="prev"><span
                                            class="glyphicon glyphicon-chevron-left"></span></a> <a
                                        class="right carousel-control"
                                        href="#carousel-172005"
                                        data-slide="next"><span
                                        class="glyphicon glyphicon-chevron-right"></span></a>
                                </div>
                            </div>


                        </div>

                        <div class="col-sm-offset-1 col-sm-6"
                             style="background-color: #222222;border: 1px solid #080808 ; margin-right: 10px;margin-top: 30px;">

                            <div class="panel-default">
                                <div class="panel-heading">
                                    <h4>tips</h4>
                                </div>
                                <div class="panel-group" id="notificationer">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#notificationer"
                                                   href="#notice1">
                                                    关于xxx的通知
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="notice1" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                孙茂峰大傻逼
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#notificationer"
                                                   href="#notice2">
                                                    关于xxx的通知2
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="notice2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                孙茂峰大傻逼2
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#notificationer"
                                                   href="#notice3">
                                                    关于xxx的通知
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="notice3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                孙茂峰大傻逼3
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4"
                             style="background-color: #222222;border: 1px solid #080808 ; margin-top: 30px; margin-left: 10px;margin-right: 10px">
                            <div class="panel-default">
                                <div class="panel-heading">
                                    <h4>Notice</h4>
                                </div>
                                <div class="panel-group" id="notificationer2">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#notificationer2"
                                                   href="#notice21">
                                                    关于xxx的通知
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="notice21" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                孙茂峰大傻逼
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#notificationer2"
                                                   href="#notice22">
                                                    关于xxx的通知2
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="notice22" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                孙茂峰大傻逼2
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#notificationer2"
                                                   href="#notice23">
                                                    关于xxx的通知
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="notice23" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                孙茂峰大傻逼3
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%--end--%>
                </div>
            </div>
        </div>
    </div>
</div>

<%--模态框--%>
<div class="modal fade" id="alterPswd" role="dialog" tabindex="-1" aria-labelledby="myymodel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="mymodel"><span class="glyphicon glyphicon glyphicon-cog"></span>修改密码</h4>
            </div>
            <div class="modal-body">
                <div>
                    <form action="" id="form_alterPswd" class="form col-md-12 center-block ">
                        <div class="form-group">
                            <input type="password" class="form-control input-lg" id="recPswd" placeholder="原始密码"
                                   name="recPswd" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control input-lg" placeholder="新密码" id="newPswd"
                                   name="newPswd">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control input-lg" placeholder="确认密码" id="confirmPswd"
                                   name="confirmPswd">
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-lg btn-block" value="确认修改"/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                Created by lsure
            </div>
        </div>
    </div>
</div>
<script>

</script>
</body>
</html>
N