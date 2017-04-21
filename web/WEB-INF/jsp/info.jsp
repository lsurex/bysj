<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/4/19
  Time: 14:21
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
    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/Chart.js-2.5.0/dist/Chart.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/bootstrap-table.min.js"></script>
    <script src="static/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="static/js/bootstrap-table-editable.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="static/js/bootstrap-datetimepicker.min.js"></script>
    <script src="static/js/bootstrap-datetimepicker.zh-CN.js"></script>
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
            <div style="padding-right:0px;border: 1px solid #080808 ;height: 0px;;padding-left: 0px; background-color: #333333;padding-bottom:100% ;">
                <div id="contentPage" class="col-sm-10 col-sm-offset-1"
                     style="background-color: #FFFFFF;margin-top: 30px">
                    <%--  可替换的内容--%>
                    <div id="toolbar" class="btn-group">
                        <button type="button" class="btn-danger btn" id="btn_batchdelete">批量删除</button>
                        <button type="button" class="btn btn-default" id="btn_addnew">添加</button>
                    </div>
                    <table id="table_info">

                    </table>

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
<div class="modal fade" id="addnewmodal" role="dialog" tabindex="-1" aria-labelledby="infodetails" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="infodetails"><span class="glyphicon glyphicon-th-list"></span>&nbsp;添加
                </h4>
            </div>
            <div class="modal-body">
                <form id="form_addnew">
                </form>
            </div>
            <div class="modal-footer" id="addnewfooter">
                <button type="submit" class="btn btn-success" id="btn_add_submit">
                    新增
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="showDetails" role="dialog" tabindex="-1" aria-labelledby="infodetails" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="addnew"><span class="glyphicon glyphicon-th-list"></span>&nbsp;详细信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="form_entire">

                </form>
                <%----%>
            </div>
            <div class="modal-footer" id="modalfooter">
                <%--<button type="button" class="btn btn-danger" id="btn_deletedetail" style="visibility: hidden">删除
                </button>--%>
                <button type="button" class="btn btn-success" id="enableEdit">编辑</button>
                <button type="submit" class="btn btn-warning" id="btn_updatedetail" style="visibility: hidden">
                    提交
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    /*初始化modal*/

    var tableitems;
    $.post("/advance/getInputItems", function (data) {
        console.log(data)
        for (var key in data) {
            $("#form_entire").append("<div class='form-group'> <label>" + data[key].jlb_bz + "</label> <input type='text' class='form-control input_item' id=" + data[key].jlb_lm + " name='inputitem'> </div>")
            $("#form_addnew").append("<div class='form-group'> <label>" + data[key].jlb_bz + "</label> <input type='text' class='form-control insert_item' id=" + data[key].jlb_lm + " name='insertitem'> </div>")
        }
        seteditable(false);
        // tableitems = data;
    })
    function seteditable(state) {
        if (state == true) {
            $(".input_item").attr("readonly", false);
            $("#btn_updatedetail").css("visibility", "visible")
            $("#btn_deletedetail").css("visibility", "visible")
        } else {
            $(".input_item").attr("readonly", true);
            $("#btn_updatedetail").css("visibility", "hidden")
            $("#btn_deletedetail").css("visibility", "hidden")
        }

    }
    $("#enableEdit").click(function () {
        seteditable(true);
    });
    window.operateEvents = {
        'click .btn_detail': function (e, value, row, index) {
            $.post("/info/getIndividual", {yjs_id: row.yjs_id}, function (data) {
                console.log(data)

                $("input[name='inputitem']").each(function () {
                    var id = $(this).attr("id")
                    $(this).val(data[id]);
                })
                $("#showDetails").modal("toggle");
            })


        }, 'click .btn_trash': function (e, value, row, index) {
            $.post("/info/delete", {delete_list: row.yjs_id}, function (data) {
                if (data == "success") {
                    if (confirm("您是否要删除" + row.yjs_id))
                        $("#table_info").bootstrapTable("refresh", {url: "/info/getstudents"})
                }
                else {
                    alert("删除失败！")
                }
            })

        }

    }

    $().ready(function () {
        /*添加新学生模态框划出*/
        $("#btn_addnew").click(function () {
            $("#addnewmodal").modal("toggle");
        })
        /*添加提交事件*/
        $("#btn_add_submit").click(function () {
            var row = {}
            /*信息map生成*/
            $("input[name='insertitem']").each(function () {

                var id = $(this).attr("id");
                row[id] = $(this).val();
                //json.push(row);
            })
            console.log(row)
            $.post("/info/insert", {json: JSON.stringify(row)}, function (data) {

            })
        })

        $("#table_info").bootstrapTable({
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
            url: "/info/getstudents",
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
                field: 'yjs_name',
                title: '姓名'
            }, {
                field: 'yjs_age',
                title: '年龄'
            }, {
                field: 'yjs_sex',
                title: '性别'
            }, {
                field: 'yjs_nj',
                title: '年级'
            }, {
                field: 'sys_jc',
                title: '实验室名称'
            }, {
                field: 'zwh',
                title: '座位号'
            }, {
                filed: 'operate',
                title: '操作',
                events: operateEvents,
                formatter: operateFormatter

            }
            ]
        });
        $("#btn_batchdelete").click(function () {
            var checked = $("#table_info").bootstrapTable("getSelections");
            var dellist = new Array();
            for (var key in checked) {
                dellist.push(checked[key].yjs_id);
            }
            if (dellist.length > 0) {
                var result = confirm("您即将删除该信息：" + dellist.toString());
                if (result == true) {
                    $.post("/info/delete", {delete_list: dellist.toString()}, function (data) {
                        if (data == "success") {
                            $("#table_info").bootstrapTable("refresh", {url: "/info/getstudents"})
                        }
                        else {
                            alert("删除失败！")
                        }
                    })
                }
            } else {
                alert("未选择任何");
            }
        })
        $("#btn_updatedetail").click(function () {
            var row = {}
            $("input[name='inputitem']").each(function () {

                var id = $(this).attr("id");
                row[id] = $(this).val();
                //json.push(row);
            })
            $.post("/info/update", {json: JSON.stringify(row)}, function (data) {
                if (data = "success") {
                    seteditable(false);
                    $("#showDetails").modal("toggle");
                    $("#table_info").bootstrapTable("refresh", {url: "/info/getstudents"})
                } else {
                    alert("修改失败，请刷新重试");
                }
            })
        })

        function operateFormatter(value, row, index) {
            return ["<button type='button' style='margin-right: 5px' class='btn btn-default btn_detail'><span class='glyphicon glyphicon-list-alt'></span></button>", "<button type='button' class='btn btn-default btn_trash'><span class='glyphicon glyphicon-trash'></span></button>"].join("")
        }


    });


</script>
</body>
</html>