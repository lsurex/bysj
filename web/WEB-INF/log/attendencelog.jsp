<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/4/1
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/mainstyle.css" rel="stylesheet">
    <script src="static/Chart.js-2.5.0/dist/Chart.js"></script>
    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="assets/js/pswd.js"></script>
    <style>
        #absenta:hover, #absenta:focus {
            border: #c9302c 4px solid;
        }

        #latea:hover, #latea:focus {
            border: #ee7700 4px solid;
        }

        #goodboya:hover, #goodboya:focus {
            border: #5cb85c 4px solid;
        }

        #infonavbar > li > a {
            border: none;
        }

        .nav-tabs {
            border-bottom: 1px solid #080808;
        }
    </style>

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
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <h5>
                            <div class="panel-body">
                                <a class="center-block text-center" style="text-decoration: none"
                                   href="/information">信息管理</a>
                            </div>
                        </h5>
                        <h5>
                            <div class="panel-body">
                                <a class="center-block text-center" style="text-decoration: none"
                                   href="/import">学生录入</a>
                            </div>
                        </h5>
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
                            <a class="center-block text-center" style="text-decoration: none" href="#">实时考勤</a>
                        </div>
                        <div class="panel-body">
                            <a class="center-block text-center" style="text-decoration: none" href="#">考勤记录</a>
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
            <div style="padding-right:0px;border: 1px solid #080808 ;height: 0px;padding-left: 0px; background-color: #333333;padding-bottom:100% ;">
                <div id="contentPage">
                    <%--  可替换的内容--%>

                    <div class="col-sm-6"
                         style="border: 1px solid #080808;margin: 20px; background-color: #222222">
                        <canvas id="mychart" width="400" height="400"></canvas>
                    </div>


                    <div class="col-sm-5" style="margin-top: 20px" >
                        <ul class="nav nav-tabs" id="infonavbar">
                            <li class="active"><a id="absenta" href="#absent"
                                                  style=" ; color: #080808; background-color:#c9302c" data-toggle="tab">缺勤</a>
                            </li>
                            <li><a id="latea" href="#late" style="color: #080808; background-color:#ee7700"
                                   data-toggle="tab">迟到</a></li>
                            <li><a id="goodboya" href="#goodboy" style="color: #080808; background-color:#5cb85c"
                                   data-toggle="tab">好孩子 </a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="absent"  style="border: 1px solid #c9302c; background-color: #c9302c">
                                <div >
                                    <ul class=" list-group ">
                                        <li class="list-group-item">缺勤人数</li>
                                        <li class="list-group-item">孙茂峰</li>
                                        <li class="list-group-item">孙茂峰</li>
                                        <li class="list-group-item">孙茂峰</li>

                                    </ul>
                                </div>

                            </div>
                            <div class="tab-pane" id="late" style="border: 1px solid #ee7700;background-color: #ee7700 ">
                                <div style="background-color: #ee7700 ;">
                                    <ul class=" list-group ">
                                        <li class="list-group-item">迟到</li>
                                        <li class="list-group-item">许文光</li>
                                        <li class="list-group-item">许文光</li>
                                        <li class="list-group-item">许文光</li>
                                        <li class="list-group-item">许文光</li>
                                        <li class="list-group-item">许文光</li>
                                        <li class="list-group-item">许文光</li>

                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane" id="goodboy" style="border: 1px solid #5cb85c;background-color:#5cb85c">
                                <div>
                                    <ul class=" list-group ">
                                        <li class="list-group-item">好孩子</li>
                                        <li class="list-group-item">梁硕</li>
                                        <li class="list-group-item">梁硕</li>
                                        <li class="list-group-item">梁硕</li>
                                        <li class="list-group-item">梁硕</li>
                                        <li class="list-group-item">梁硕</li>
                                        <li class="list-group-item">梁硕</li>

                                    </ul>
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
    var ctx = $("#mychart").get(0).getContext("2d");

    var data = {
        labels: [
            "缺勤",
            "迟到",
            "好孩子"
        ],
        datasets: [
            {
                borderColor: "#080808",
                data: [10, 50, 100],
                backgroundColor: [
                    "#c9302c",
                    "#EE7700",
                    "#5cb85c"
                ],
                hoverBackgroundColor: [
                    "#FF0000",
                    "#FFCC22",
                    "#90EE90"
                ]
            }]
    };

    var ctx = $("#mychart").get(0).getContext("2d");
    var myBarChart = new Chart(ctx, {
        type: 'pie',
        data: data,
        options: {
            title: {
                display: true,
                text: "实时出勤",
                fontSize: 26,
                fontColor: "#FFFFFF",
                fontStyle: "bold"
            },
            animateScale: true,
            hover: {
                // Overrides the global setting
                mode: 'nearest'
            },
            legend: {
                labels: {
                    fontSize: 24,
                    fontColor: "#FFFFFF",

                }
            }
        }
    });

</script>
</body>
</html>