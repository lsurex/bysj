<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/4/18
  Time: 13:30
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
    <link href="static/css/bootstrap-table.min.css" rel="stylesheet">
    <link href="static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <link href="static/css/metroStyle/metroStyle.css" rel="stylesheet">
    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/Chart.js-2.5.0/dist/Chart.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/bootstrap-table.min.js"></script>
    <script src="static/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="static/js/bootstrap-datetimepicker.min.js"></script>
    <script src="static/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="static/js/jquery.ztree.all.min.js"></script>
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
                    <div class=" col-sm-3" style="background-color: #333333;margin-top: 20px">
                        <div style="background-color: white;border: 1px solid #080808;overflow: scroll"
                             id="div_tree">
                            <ul id="attendanceTree" class="ztree"></ul>
                        </div>
                    </div>
                    <div class=" col-sm-8" style="background-color: white ;margin-top: 20px">
                        <div id="toolbar" class="btn-group">
                            <button type="button" class="btn-default btn" id="btn_record">打卡记录</button>
                            <button type="button" class="btn btn-default" id="btn_attendence">考勤记录</button>
                        </div>
                        <table id="table_record">

                        </table>
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
<div class="modal fade" id="month_view" role="dialog" tabindex="-1" aria-labelledby="myymodel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div id="labelformodalheader"></div>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <canvas id="month_view_bar" width="700" height="400"></canvas>
            </div>
            <div class="modal-footer">
                请选择起止时间：
                <input type="text" id="datetimepicker_start"> -
                <input type="text" id="datetimepicker_end">
                <button type="button" id="btn_datestamp" class="btn-default btn">确认</button>
            </div>
        </div>
    </div>
</div>
<script>
    /*tree生成*/
    function settreeheight() {
        var height = 2 * window.screen.height / 3;
        $("#div_tree").css("height", height);
    }
    settreeheight();

    $().ready(function () {
                var id;
                var currentTable_status = "record";
                var monthviewchart = null;
                var tree = ${treeJsonString};
                /*TreeOptions*/
                var setting = {
                    data: {
                        SimpleData: {
                            enable: true
                        }
                    },
                    edit: {
                        enable: false, /*不允许编辑*/
                    },
                    treeNodeKey: "id",
                    treeNodeParentKey: "pid",
                    showLine: true,
                    async: {
                        dataFilter: filter,
                        autoParam: ["id"],
                        type: "post",
                        url: '/tree/getTree',
                        enable: true,
                    },
                    callback: {
                        onClick: onclickcallback

                    }

                }
                /*点击返回事件*/
                function onclickcallback(event, treeid, treeNode) {
                    if (treeNode.isParent) {
                        init_monthview(treeNode.id);
                        /*显示月视图*/
                    } else {
                        /*显示学生的详细考勤信息*/
                        id = treeNode.id;
                        $.post("/dailyRecord/getRecord", {id: id}, function (data) {
                            init_recordtable();
                            for (var key in data) {
                                /*格式化时间*/
                                data[key].kqsj = (new Date(data[key].kqsj)).format("yyyy-MM-dd hh:mm:ss");
                                /*console.log(data)*/

                            }
                            currentRecord = data;
                            $("#table_record").bootstrapTable("load", data);
                        });

                    }

                }

                /*服务器接收数据过滤器*/
                function filter(treeId, parentNode, childNodes) {
                    return JSON.parse(childNodes)
                }

                /*ztree初始化*/
                zTreeObj = $.fn.zTree.init($("#attendanceTree"), setting, tree);
                /******************************************************/

                $("#datetimepicker_start").datetimepicker({
                            minView: "month",
                            /* todayHighlight: true,*/
                            format: 'yyyy-mm-dd',
                            /*todayBtn: true,*/
                            /*daysOfWeekDisabled: '0,6',*/
                            language: "zh-CN"
                        }
                )
                $("#datetimepicker_end").datetimepicker({
                            minView: "month",
                            todayHighlight: true,
                            format: 'yyyy-mm-dd',
                            /*todayBtn: true,*/
                            /*daysOfWeekDisabled: '0,6',*/
                            language: "zh-CN"
                        }
                )


                Date.prototype.format = function (fmt) {
                    var o = {
                        "M+": this.getMonth() + 1,                 //月份
                        "d+": this.getDate(),                    //日
                        "h+": this.getHours(),                   //小时
                        "m+": this.getMinutes(),                 //分
                        "s+": this.getSeconds(),                 //秒
                        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                        "S": this.getMilliseconds()             //毫秒
                    };
                    if (/(y+)/.test(fmt)) {
                        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                    }
                    for (var k in o) {
                        if (new RegExp("(" + k + ")").test(fmt)) {
                            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                        }
                    }
                    return fmt;
                }

                /*查询开始时间*/
                var start;
                /*查询结束时间*/
                var end;
                /*绘制柱状图*/
                function drawMonthview(timestamp) {
                    $.post("/dailyRecord/getMonthView", timestamp, function (data) {
                        console.log(data);
                        var labelforview = new Array();
                        var dateforlate = new Array();
                        var dateforontime = new Array();
                        var dateforabsent = new Array();
                        for (var key in data) {
                            labelforview.push(data[key].stu_name);
                            dateforontime.push(data[key].ontime_count);
                            dateforlate.push(data[key].late_count);
                            dateforabsent.push(data[key].absent_count);
                        }
                        var ctx = $("#month_view_bar").get(0).getContext("2d");
                        var data = {
                            labels: labelforview,
                            datasets: [
                                {
                                    label: "正常",
                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',

                                    borderColor: 'rgba(75, 192, 192, 1)',

                                    borderWidth: 1,

                                    data: dateforontime
                                },
                                {
                                    label: "迟到",
                                    backgroundColor: 'rgba(255, 159, 64, 0.2)',

                                    borderColor: 'rgba(255, 159, 64, 1)',
                                    borderWidth: 1,

                                    data: dateforlate
                                }, {
                                    label: "缺勤",
                                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    borderColor: 'rgba(255,99,132,1)',
                                    borderWidth: 1,

                                    data: dateforabsent
                                }
                            ]
                        };
                        monthviewchart = new Chart(ctx, {
                            type: 'bar',
                            data: data,
                            options: {responsive: true}
                        });
                    })
                }

                var currentutorid;
                /*月视图更换时间*/
                $("#btn_datestamp").click(function () {
                    if (monthviewchart != null)
                        monthviewchart.destroy();
                    start = $("#datetimepicker_start").val();
                    end = $("#datetimepicker_end").val();
                    data = {
                        startdate: start,
                        enddate: end,
                        tutorid: currentutorid

                    }
                    $("#labelformodalheader").append("从 " + start + " 到 " + end);
                    drawMonthview(data);
                })
                /*月视图初始化*/
                function init_monthview(tutorid) {
                    $("#month_view").modal("toggle");
                    start = new Date().format("yyyy-MM") + "-01";
                    end = new Date().format("yyyy-MM-dd");
                    currentutorid = tutorid
                    var initdata = {
                        startdate: start,
                        enddate: end,
                        tutorid: currentutorid,
                    }
                    if (monthviewchart != null)
                        monthviewchart.destroy();
                    $("#labelformodalheader").append("从 " + start + " 到 " + end);

                    drawMonthview(initdata);

                }


                /*初始化考勤记录*/
                function init_attendancetable() {
                    $.post("/dailyRecord/getAttendance", {id: id}, function (data) {
                        if (currentTable_status == "record") {
                            $("#table_record").bootstrapTable('destroy');
                            $("#table_record").bootstrapTable(
                                    {
                                        toolbar: '#toolbar',
                                        search: true,
                                        pagination: true,
                                        showRefresh: true,
                                        showToggle: true,
                                        showColumns: true,
                                        iconSize: 'outline',
                                        pageList: [10, 25, 50, 100],
                                        pageNumber: 1,
                                        sortName: "kqrq",
                                        sortOrder: "desc",
                                        toolbarAlign: 'right',
                                        buttonsAlign: 'left',
                                        searchAlign: 'left',
                                        minimumCountColumns: 2,
                                        icons: {
                                            refresh: 'glyphicon-repeat',
                                            toggle: 'glyphicon-list-alt',
                                            columns: 'glyphicon-list'
                                        },
                                        columns: [{
                                            checkbox: true
                                        }, {
                                            field: 'yjs_id',
                                            title: '学号'
                                        }, {
                                            field: 'kqsj_first',
                                            title: '考勤时间'
                                        }, {
                                            field: 'kqsj_last',
                                            title: '离开时间'
                                        }, {
                                            field: 'kqrq',
                                            title: '考勤日期'
                                        }, {
                                            field: 'uuid',
                                            title: '记录编号'
                                        }
                                        ]
                                    });
                            currentTable_status = "attendance";
                            for (var key in data) {
                                /*格式化时间*/
                                data[key].kqsj_first = (new Date(data[key].kqsj_first)).format("yyyy-MM-dd hh:mm:ss");
                                data[key].kqsj_last = (new Date(data[key].kqsj_last)).format("yyyy-MM-dd hh:mm:ss");
                                /*console.log(data)*/

                            }
                            currentAttdance = data;
                            $("#table_record").bootstrapTable("load", data);

                        }

                    })
                }

                /*初始化打卡记录*/
                function init_recordtable() {
                    if (currentTable_status != "record") {
                        $("#table_record").bootstrapTable('destroy');
                        $("#table_record").bootstrapTable(
                                {
                                    toolbar: '#toolbar',
                                    search: true,
                                    pagination: true,
                                    showRefresh: true,
                                    showToggle: true,
                                    showColumns: true,
                                    iconSize: 'outline',
                                    pageList: [10, 25, 50, 100],
                                    pageNumber: 1,
                                    sortName: "kqsj",
                                    sortOrder: "desc",
                                    toolbarAlign: 'right',
                                    buttonsAlign: 'left',
                                    searchAlign: 'left',
                                    minimumCountColumns: 2,
                                    icons: {
                                        refresh: 'glyphicon-repeat',
                                        toggle: 'glyphicon-list-alt',
                                        columns: 'glyphicon-list'
                                    },
                                    columns: [{
                                        checkbox: true
                                    }, {
                                        field: 'kqsj',
                                        title: '打卡记录'
                                    }, {
                                        field: 'yjs_id',
                                        title: '学号'
                                    }, {
                                        field: 'yjs_name',
                                        title: '姓名'
                                    }, {
                                        field: 'uuid',
                                        title: '记录编号'
                                    },]
                                });
                        currentTable_status = 'record'
                    }
                }

                $("#btn_attendence").click(function () {
                    init_attendancetable();
                })

                $("#btn_record").click(function () {
                    init_recordtable();
                    $("#table_record").bootstrapTable("load", currentRecord)

                })
                /*页面展示*/
                var $table = $("#table_record").bootstrapTable(
                        {
                            toolbar: '#toolbar',
                            search: true,
                            pagination: true,
                            showRefresh: true,
                            showToggle: true,
                            showColumns: true,
                            iconSize: 'outline',
                            pageList: [10, 25, 50, 100],
                            pageNumber: 1,
                            sortName: "kqsj",
                            sortOrder: "desc",
                            toolbarAlign: 'right',
                            buttonsAlign: 'left',
                            searchAlign: 'left',
                            minimumCountColumns: 2,
                            icons: {
                                refresh: 'glyphicon-repeat',
                                toggle: 'glyphicon-list-alt',
                                columns: 'glyphicon-list'
                            },
                            columns: [{
                                checkbox: true
                            }, {
                                field: 'kqsj',
                                title: '打卡记录'
                            }, {
                                field: 'yjs_id',
                                title: '学号'
                            }, {
                                field: 'yjs_name',
                                title: '姓名'
                            }, {
                                field: 'uuid',
                                title: '记录编号'
                            },]
                        });

                /* $table.bootstrapTable("hideColumn", 'kqsj');*/

            }
    )


</script>
</body>
</html>
