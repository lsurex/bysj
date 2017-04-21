<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/4/10
  Time: 17:26
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

    <link href="static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/Chart.js-2.5.0/dist/Chart.js"></script>
    <script src="static/js/bootstrap-datetimepicker.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="static/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="assets/js/pswd.js"></script>
    <style>
        #ul_panel {

            border-bottom: none;
        }

        #li_late > a {
            color: #FFFFFF;
            margin-right: 0px;
            border: 0px solid transparent;
            border-radius: 0px 0px 0 0;

        }

        #li_late > a:hover {
            background-color: #ffeee5;
            color: #ff5400;
        }

        #li_late.active > a, #li_late.active > a:active, #li_late.active > a:focus {
            color: #FFFFFF;
            background-color: #ff5400;
            border: none;
        }

        #li_absent > a {
            color: #FFFFFF;
            margin-right: 0px;
            border: 0px solid transparent;
            border-radius: 0px 0px 0 0;

        }

        #li_absent > a:hover {
            background-color: #ffeee5;
            color: #d9534f;
        }

        #li_absent.active > a, #li_absent.active > a:active, #li_absent.active > a:focus {
            color: #FFFFFF;
            background-color: #d9534f;
            border: none;
        }

        #li_normal > a {
            color: #FFFFFF;
            margin-right: 0px;
            border: 0px solid transparent;
            border-radius: 0px 0px 0 0;

        }

        #li_normal > a:hover {
            background-color: #ffeee5;
            color: #5cb85c;
        }

        #li_normal.active > a, #li_normal.active > a:active, #li_normal.active > a:focus {
            color: #FFFFFF;
            background-color: #5cb85c;
            border: none;
        }

        /*        #table_absent {
                    border: 2px solid #d9534f;
                }

                #table_absent > thead > tr > th {
                    border: 1px solid #d9534f;
                }

                #table_absent > tbody > tr > th {
                    border: 1px solid #d9534f;
                }

                #table_late {
                    border: 2px solid #ff5400;
                }

                #table_late > thead > tr > th {
                    border: 1px solid #ff5400;
                }

                #table_late > tbody > tr > th {
                    border: 1px solid #ff5400;
                }

                #table_normal {
                    border: 2px solid #5cb85c;
                }

                #table_normal > thead > tr > th {
                    border: 1px solid #5cb85c;
                }

                #table_normal > tbody > tr > th {
                    border: 1px solid #5cb85c;
                }*/

        .datetimepicker table tr td.today {
            background-color: #333333;
        }

        .datetimepicker table tr td.day:hover {
            background: #d9534f;
            cursor: pointer;
        }

        .datetimepicker table tr td.today {
            background-color: #d9534f;;
        }

        .datetimepicker table tr td.disabled, .datetimepicker table tr td.disabled:hover {
            color: #bdbdbd;
        }

        .datetimepicker table tr td.active:active, .datetimepicker table tr td.active:hover:active, .datetimepicker table tr td.active.disabled:active, .datetimepicker table tr td.active.disabled:hover:active, .datetimepicker table tr td.active.active, .datetimepicker table tr td.active.active:hover, .datetimepicker table tr td.active.disabled.active, .datetimepicker table tr td.active.disabled.active:hover {
            background-color: #d9534f;
        }

        .datetimepicker table tr td.today:hover, .datetimepicker table tr td.today:hover, .datetimepicker table tr td.today.disabled:hover, .datetimepicker table tr td.today.disabled:hover, .datetimepicker table tr td.today:active, .datetimepicker table tr td.today:hover:active, .datetimepicker table tr td.today.disabled:active, .datetimepicker table tr td.today.disabled:hover:active, .datetimepicker table tr td.today.active, .datetimepicker table tr td.today.active:hover, .datetimepicker table tr td.today.disabled.active, .datetimepicker table tr td.today.disabled.active:hover, .datetimepicker table tr td.today.disabled, .datetimepicker table tr td.today.disabled:hover, .datetimepicker table tr td.today.disabled.disabled, .datetimepicker table tr td.today.disabled.disabled:hover, .datetimepicker table tr td[disabled].today, .datetimepicker table tr td[disabled].today:hover, .datetimepicker table tr td[disabled].today.disabled, .datetimepicker table tr td[disabled].today.disabled:hover {
            background-color: red;
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
                               href="/attendance">实时考勤</a>
                        </div>
                        <div class="panel-body">
                            <a class="center-block text-center" style="text-decoration: none" href="/record">考勤记录</a>
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
                <div id="contentPage" class="col-sm-5"
                     style=" margin: 15px; border: 1px solid #080808; background-color: #222222">

                    <div id="datepicker" class="col-sm-offset-1"
                         style="color: white; padding: 10px; background: url('assets/image/calendar/calender.png') no-repeat;background-size: cover">

                    </div>
                    <hr style="height: 2px; border: none;border-top: 2px solid #bdbdbd ">
                    <div style="margin: 15px;">
                        <canvas id="mychart" width="300" height="300"></canvas>
                    </div>
                </div>
                <div class="col-sm-6" style="background-color: #333333 ;margin: 15px">
                    <ul class="nav nav-tabs" id="ul_panel">
                        <li class="active" id="li_absent">
                            <a href="#div_absent" data-toggle="tab">缺席</a>
                        </li>
                        <li id="li_late">
                            <a href="#div_late" data-toggle="tab">迟到</a></li>
                        <li id="li_normal">
                            <a href="#div_normal" data-toggle="tab">正常</a></li>
                    </ul>
                    <div class="tab-content" style="background-color: #FFFFFF">
                        <div class="tab-pane active " style="border: 1px solid #d9534f" id="div_absent">
                            <table class="table table-striped  " id="table_absent">
                                <caption>
                                    <h3 class="text-center" style="background-color: #d9534f;color: white"
                                        id="caption_absent"></h3>
                                </caption>
                                <thead>
                                <tr>
                                    <th>学号</th>
                                    <th>姓名</th>
                                </tr>
                                </thead>
                                <tbody id="table_absent_body">
                                <%--  <tr>
                                      <th>xxx</th>
                                      <th>xxx</th>
                                  </tr>--%>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane"  style="border: 1px solid #ff5400" id="div_late">
                            <table class="table table-striped" id="table_late">
                                <caption>
                                    <h3 class="text-center" style="background-color: #ff5400;color: white"
                                        id="caption_late"></h3>
                                </caption>
                                <thead>
                                <tr>
                                    <th>学号</th>
                                    <th>姓名</th>
                                </tr>
                                </thead>
                                <tbody id="table_late_body">
                                <%-- <tr>
                                     <th>xxx</th>
                                     <th>xxx</th>
                                 </tr>--%>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" style="border: 1px solid #5cb85c" id="div_normal">
                            <table class="table table-striped" id="table_normal">
                                <caption>
                                    <h3 class="text-center" style="background-color: #5cb85c;color: white"
                                        id="caption_normal"></h3>
                                </caption>
                                <thead>
                                <tr>
                                    <th>学号</th>
                                    <th>姓名</th>
                                </tr>
                                </thead>
                                <tbody id="table_normal_body">
                                <%-- <tr>
                                     <th>xxx</th>
                                     <th>xxx</th>
                                 </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

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
<script type="text/javascript">
    /*时间格式设置*/
    function add0(m) {
        return m < 10 ? '0' + m : m
    }
    Date.prototype.format = function () {
        return this.getFullYear() + "-" + add0((this.getMonth() + 1)) + "-" + add0(this.getDate())
    }
    function format2(obj) {
        return obj.getFullYear() + "-" + add0((obj.getMonth() + 1)) + "-" + add0(obj.getDate())
    }

    function calendarEvent(time) {
        $.post("/dailyRecord/attendance", {specific: time}, function (data) {
            /*人数统计*/
            var absentcount = 0;
            var latecount = 0;
            var normalcount = 0;

            $("#table_absent_body tr").remove();
            $("#table_late_body tr").remove();
            $("#table_normal_body tr").remove();
            for (var token in data.absent) {
                absentcount++;
                $("#table_absent_body").append("<tr> <th>" + data.absent[token].yjs_id + "</th><th>" + data.absent[token].yjs_name + "</th></tr>");

                /*  alert(data.absent[token].yjs_id);*/
            }
            for (var token in data.late) {
                latecount++;
                $("#table_late_body").append("<tr> <th>" + data.late[token].yjs_id + "</th><th>" + data.late[token].yjs_name + "</th></tr>");
            }
            for (var token in data.normal) {
                normalcount++;
                $("#table_normal_body").append("<tr> <th>" + data.normal[token].yjs_id + "</th><th>" + data.normal[token].yjs_name + "</th></tr>");

            }
            mypieChart.data.datasets[0].data[0] = absentcount;
            mypieChart.data.datasets[0].data[1] = latecount;
            mypieChart.data.datasets[0].data[2] = normalcount;
            mypieChart.update();
            $("#caption_absent").text(time + " 缺勤情况");
            $("#caption_late").text(time + " 迟到情况");
            $("#caption_normal").text(time + " 正常情况");

            /*饼状图更新*/
        })

    }

    calendarEvent((new Date()).format());
    /*日历初始化设置*/
    $("#datepicker").datetimepicker(
            {
                minView: "month",
                todayHighlight: true,
                format: 'yyyy/mm/dd',
                /*todayBtn: true,*/
                daysOfWeekDisabled: '0,6',
                language: "zh-CN"
            }
    ).on("changeDate", function (ev) {
        calendarEvent((ev.date.format()));
        /* $.post("/dailyRecord/attendance", {specific: ev.date.format()}, function (data) {
         /!*人数统计*!/
         var absentcount = 0;
         var latecount = 0;
         var normalcount = 0;

         $("#table_absent_body tr").remove();
         $("#table_late_body tr").remove();
         $("#table_normal_body tr").remove();
         for (var token in data.absent) {
         absentcount++;
         $("#table_absent_body").append("<tr> <th>" + data.absent[token].yjs_id + "</th><th>" + data.absent[token].yjs_name + "</th></tr>");

         /!*  alert(data.absent[token].yjs_id);*!/
         }
         for (var token in data.late) {
         latecount++;
         $("#table_late_body").append("<tr> <th>" + data.late[token].yjs_id + "</th><th>" + data.late[token].yjs_name + "</th></tr>");
         }
         for (var token in data.normal) {
         normalcount++;
         $("#table_normal_body").append("<tr> <th>" + data.normal[token].yjs_id + "</th><th>" + data.normal[token].yjs_name + "</th></tr>");

         }
         mypieChart.data.datasets[0].data[0] = absentcount;
         mypieChart.data.datasets[0].data[1] = latecount;
         mypieChart.data.datasets[0].data[2] = normalcount;
         mypieChart.update();
         $("#caption_absent").text(ev.date.format() + " 出勤情况");
         $("#caption_late").text(ev.date.format() + " 迟到情况");
         $("#caption_normal").text(ev.date.format() + " 正常情况");

         /!*饼状图更新*!/
         })*/

    });


    /*设置未来时间不可访问*/
    $("#datepicker").datetimepicker("setEndDate", new Date().format())
    var data = {
        labels: [
            "缺勤",
            "迟到",
            "正常"
        ],
        datasets: [
            {
                borderColor: "#080808",
                data: [0, 0, 0],
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
    var mypieChart = new Chart(ctx, {
        type: 'pie',
        data: data,
        options: {
            title: {
                display: true,
                text: "出勤饼状图",
                fontSize: 24,
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
                    fontSize: 20,
                    fontColor: "#FFFFFF",

                }
            }
        }
    });
</script>
</body>
</html>