<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/3/21
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/3/18
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="/jsp/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="/jsp/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <%--    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery/jquery-3.1.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <style>
        #leftnav {
            background-color: #222;
            opacity: 1;
            height: 0px;
            padding: 30px 0px 100%;
            border-color: #080808;
        }

        .panel {
            border-radius: 0px;
        }

        .panel-group .panel {
            border-radius: 0px;

        }

        .heading + .panel-collapse > .panel-body {
            border-top: 4px;
        }

        .panel-default {
            border-color: #080808;
        }

        .panel-title {
            margin-top: 8px;
            margin-bottom: 8px;
            font-size: 18px;
            color: inherit;
        }

        .panel-default > .panel-heading {
            color: #9d9d96;
            background-color: #222;
            border-color: #080808
        }

        .panel {
            background-color: #333333;;
        }

        .panel-default > .panel-heading + .panel-collapse > .panel-body {
            border-top-color: #080808;
        }

        .heading + .panel-collapse > .panel-body {
            border-top: 3px solid #ddd;
        }
    </style>
   <%-- <script>
        $().ready(function () {
            /*页表首次初始化*/
            $.post("/pageQuery/stuInfo", {
                startRow: 1,
                pageSize: 12
            }, function (data) {
                $("#infocontent tr").empty();
                for (key in data) {

                    $("#infocontent").append("+<tr class='details' > <th class='keyword'>" + data[key].stu_name + "</th> <th>" + data[key].stu_age + "</th> <th>" + data[key].stu_tutor + "</th> </tr>")
                }
                /*showintable(data);*/
            }, "json");
            /*获取页数*/
            var pages;
            $.post("/pageQuery/counts", function (data) {
                pages = data;
                for (var page = 1; page <= Number(pages); page++) {
                    obj.add(new Option(page, page));
                }
            }, "json");
            /*选页*/
            var obj = document.getElementById("selector");
            $("#selector").change(function () {
                $.post("/pageQuery/stuInfo", {
                    startRow: $("#selector").val(),
                    pageSize: 12
                }, function (data) {
                    /*alert(data[4].stu_name+data[4].stu_age)*/
                    $("#infocontent tr").empty();
                    for (key in data) {
                        $("#infocontent").append("+<tr class='details'> <th class='keyword'>" + data[key].stu_name + "</th> <th>" + data[key].stu_age + "</th> <th>" + data[key].stu_tutor + "</th> </tr>")
                    }
                });
            });
            /*上一页*/
            $("#prevbtn").click(function () {
                if ($("#selector").val() != 1) {
                    var val = Number($("#selector").val()) - 1;
                    $("#selector").val((val))
                    $("#selector").trigger("change")
                    /*触发换页*/
                }
            });
            /*下一页*/
            $("#nextbtn").click(function () {
                if ($("#selector").val() < pages) {
                    var val = Number($("#selector").val()) + 1;
                    /*    alert(val)*/
                    $("#selector").val((val))
                    $("#selector").trigger("change")
                }
            });
            /*模糊查询*/
            $("#fuzzyQuerybtn").click(function () {
                var token = $("#fuzzyQueryinput").val();//获取输入值
                var method = $("input[name='querymethod']:checked").val();//获取选中radio的值
                //ajax获取查询数据
                $.post("/pageQuery/fuzzyQuery", {token: token, method: method}, function (data) {
                    $("#fuzzyQueryResult li").remove();
                    for (key in data) {
                        $("#fuzzyQueryResult").append("<li class='fuzzyResultli list-group-item'>" + data[key].stu_name +"+"+data[key].stu_id+"+"+data[key].stu_tutor + "</li>")
                    }
                })
            });
            /*模糊查询触发详细信息事件*/
            $("#fuzzyQueryResult").on("dblclick",'.fuzzyResultli',function () {
                var focus= $(this).text().split("+");
                /*  alert(focus[0]);*/
                $.post("/pageQuery/detailsQuery", {keyword: focus[0]}, function (data) {

                    $("#showDetails").modal("toggle")
                    $("#detail_name").val(data.stu_name)
                    $("#detail_age").val(data.stu_age)
                    $("#detail_sex").val(data.stu_sex)
                    $(".shiftinfo").attr("readonly", true);


                })
            })
            /*详细查询*/
            $("#infocontent").on('dblclick', '.details', function () {
                var keyword = $(this).children().first().text();
                /*获取事件触发源的首元素key*/
                /*详细查询操作*/
                $.post("/pageQuery/detailsQuery", {keyword: keyword}, function (data) {

                    $("#showDetails").modal("toggle")
                    $("#detail_name").val(data.stu_name)
                    $("#detail_age").val(data.stu_age)
                    $("#detail_sex").val(data.stu_sex)
                    $(".shiftinfo").attr("readonly", true);


                })

            });
            /*详细信息启用编辑*/
            $("#enableEdit").click(function () {
                $(".shiftinfo").attr("readonly",false);
                $("#btn_updatedetail").css("visibility","visible")
            })
        })
    </script>--%>
<%--</head>

<body style="padding-top: 50px;background-color: #222222">--%>

<%--<nav class="navbar navbar-inverse navbar-fixed-top">
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
            <a class="navbar-brand" href="#"> 东北大学研究生实验室管理系统</a>
        </div>
        <div class="navbar-collapse collapse" id="navbar" aria-expanded="false" style="height: 1px;">
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> ${userName}
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">个人中心</a></li>
                        <li><a data-toggle="modal" data-target="#alterPswd" href="#">账号设置</a></li>
                        <li class="divider"></li>
                        <li><a href="/logout">退出</a></li>
                    </ul>

                </li>
                <li><a href="/logout" id="logout"><span class="glyphicon glyphicon-log-out"></span> 退出</a></li>
            </ul>
        </div>
    </div>
</nav>--%>
<%--<div class="container-fluid" style="padding: 0px" id="content3">
    <div row class="row-fluid">
        <div class=" col-sm-2 pull-left" id="leftnav">

            <img src="asset/SchoolBadgewhite.png" class="img-responsive">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="#" class="center-block text-center" style="text-decoration: none" &lt;%&ndash;data-toggle="collapse"
                              data-parent="#accordion"&ndash;%&gt;
                               onclick="load_home()">
                                主页
                            </a>
                        </h4>
                    </div>
                    <!-- <div id="collapsehome" class="panel-collapse collapse in">
                         <h5>
                             <div class="panel-body">
                                 <a class="center-block text-center" style="text-decoration: none"
                                    href="#">学生录入</a>
                             </div>
                         </h5>
                         <h5>
                             <div class="panel-body">
                                 <a class="center-block text-center" style="text-decoration: none" href="#">实验室分配</a>
                             </div>
                         </h5>
                     </div>-->


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
                                   href="#">学生录入</a>
                            </div>
                        </h5>
                        <h5>
                            <div class="panel-body">
                                <a class="center-block text-center" style="text-decoration: none" href="#">实验室分配</a>
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
                    &lt;%&ndash;  可替换的内容&ndash;%&gt;

                </div>
            </div>
        </div>
    </div>
</div>
</div>--%>
<%--模态框--%>
<div class="col-sm-7"
     style="border: #080808 1px solid;margin:20px 20px 0px 30px ;background-color:#FFFFFF;padding: 0px">
    <div id="show" style="background-color: white ">
        <table id="infotable" class="table table-bordered table-hover">
            <caption style="background-color:#222222"><h3 style="color: white">
                &nbsp;&nbsp;学生信息表</h3></caption>
            <thead>
            <tr>
                <th>姓名</th>
                <th>年龄</th>
                <th>导师</th>
            </tr>
            <tbody id="infocontent">

            </tbody>
            </thead>
        </table>
        <div class="col-sm-offset-3 col-sm-6">
            <ul class="pager">
                <li class="prev">
                    <a href="#" id="prevbtn">上一页</a>
                </li>
                <li class="next">
                    <a id="nextbtn" href="#">下一页</a>
                </li>
                <li>
                    <select id="selector" class="form-group input-sm">
                    </select>
                </li>
            </ul>
        </div>
    </div>

</div>
<div class="col-sm-4" style="margin: 20px 0px 0px 0px">
    <%--  <div class="col-sm-10 col-sm-offset-1">--%>

    <%--查询面板--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="input-group">
                <input type="search" id="fuzzyQueryinput" class="form-control"
                       placeholder="支持模糊查询">
                <div class="input-group-btn">
                    <button type="button" id="fuzzyQuerybtn" class="btn btn-default">查询
                    </button>
                </div>
            </div>
            <div class="checkbox-inline">
                <div>
                    <input id="checkbox_forname" checked type="radio" name="querymethod"
                           value="byName">按照姓名
                </div>
                <div>
                    <input id="checkbox_forID" type="radio" name="querymethod" value="byID">按照学号
                </div>
            </div>
        </div>
        <div class="panel-body">
            <ul class="list-group" id="fuzzyQueryResult">
            </ul>
        </div>
    </div>
</div>
<div class="modal fade" id="alterPswd" role="dialog" tabindex="-1" aria-labelledby="myymodel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="mymodel"><span class="glyphicon glyphicon glyphicon-cog"></span>修改密码</h4>
            </div>
            <div class="modal-body">
                <div>
                    <form action="" class="form col-md-12 center-block ">
                        <div class="form-group">
                            <input type="password" class="form-control input-lg" placeholder="原始密码">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control input-lg" placeholder="新密码">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control input-lg" placeholder="确认密码">
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
<div class="modal fade" id="showDetails" role="dialog" tabindex="-1" aria-labelledby="infodetails" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="infodetails"><span class="glyphicon glyphicon-th-list"></span>&nbsp;详细信息
                </h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-5">
                            <ul class="list-group">
                                <li class="list-group-item-warning">基本信息</li>
                                <li class="list-group-item">姓名：
                                    <input class="shiftinfo" id="detail_name"/>
                                </li>
                                <li class="list-group-item">年龄：
                                    <input class="shiftinfo" id="detail_age"/>
                                </li>
                                <li class="list-group-item">性别：
                                    <input class="shiftinfo" id="detail_sex"/>
                                </li>
                                <li class="list-group-item">导师：
                                    <input class="shiftinfo" id="detail_tutor"/>
                                </li>
                                <li class="list-group-item">学号：
                                    <input class="shiftinfo" id="detail_id"/>
                                </li>
                            </ul>
                        </div>
                        <div class="col-sm-5">
                            <ul class="list-group">
                                <ul class="list-group">
                                    <li class="list-group-item-danger">详细信息</li>
                                    <li class="list-group-item">姓名：
                                        <input class="input-group-sm " placeholder="liangshuo" readonly="true"/>
                                    </li>
                                    <li class="list-group-item">年龄：
                                        <input/>
                                    </li>
                                    <li class="list-group-item">性别：
                                        <input/>
                                    </li>
                                    <li class="list-group-item">导师：
                                        <input/>
                                    </li>
                                    <li class="list-group-item">学号：
                                        <input/>
                                    </li>
                                </ul>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="enableEdit">编辑</button>
                <button type="submit" class="btn btn-warning" id="btn_updatedetail" style="visibility: hidden">提交</button>
            </div>
        </div>
    </div>
</div>
<%--
<script>
    function load_home() {
        $("#contentPage").load("mainPage.jsp")
        /* $("#contentPage").load("page.jsp")*/
    }
</script>
</body>
</html>--%>
