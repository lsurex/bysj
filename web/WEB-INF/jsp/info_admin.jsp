<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/4/12
  Time: 15:24
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
    <link href="static/css/metroStyle/metroStyle.css" rel="stylesheet">
    <%--   <link href="static/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">--%>
    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/jquery.ztree.all.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="assets/js/pswd.js"></script>
    <style>
        .div_stu_info {
            margin: 10px;
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
                <div id="contentPage" style="background-color: #FFFFFF">
                    <div class="col-sm-12">
                        <div class="col-sm-2" style="background-color: #222222;color: whitesmoke">
                            <h3>信息管理</h3>
                        </div>
                        <div class="col-sm-10" style="background-color: #222222;color: whitesmoke">
                            <h3>信息管理</h3>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div style="background-color: #FFFFFF;border: 1px solid #080808;overflow: scroll"

                             id="div_tree">

                            <ul id="treeDemo" class="ztree"></ul>
                        </div>
                    </div>
                    <div class="col-sm-9" id="div_form"
                         style="background-color: #FFFFFF;padding: 10px;overflow: scroll">
                        <form id="form_stuinfo">

                        </form>

                        <div class="btn-group pull-right">
                            <button class="btn-default btn" style="visibility: hidden" id="btn_add_new">
                                <span class="glyphicon glyphicon-pencil">新增</span>
                            </button>
                            <button class="btn-default btn " style="visibility: hidden" id="btn_edit">
                                <span class="glyphicon glyphicon-pencil">编辑</span>
                            </button>
                            <button type="button" id="btn_edit_submit" class="btn pull-right btn-success">提交</button>
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
<script>
    function seteditable(state) {
        if (state == true) {
            $(".input_item").attr("readonly", false);
            $("#btn_edit_submit").css("visibility", "visible")
        } else {
            $(".input_item").attr("readonly", true);
            $("#btn_edit_submit").css("visibility", "hidden")
        }

    }
    $("#btn_edit").click(function () {
        seteditable(true);
    })
    $.post("/advance/getInputItems", function (data) {
        console.log(data)
        for (var key in data) {
            $("#form_addnew").append("<div class='form-group'> <label>" + data[key].jlb_bz + "</label> <input type='text' class='form-control insert_item' id=" + data[key].jlb_lm + " name='insertitem'> </div>")
            $("#form_stuinfo").append("<div class='form-group'> <label>" + data[key].jlb_bz + "</label> <input type='text' class='form-control input_item' id=" + data[key].jlb_lm + " name='inputitem'> </div>")
        }
        seteditable(false);
    })

    function settreeheight() {
        var height = 2 * window.screen.height / 3;
        $("#div_tree").css("height", height);
        $("#div_form").css("height", height);

    }
    settreeheight();
    $(document).ready(function () {
        $("#btn_add_new").click(function () {
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
                if (data == "success") {
                    $("#addnewmodal").modal("toggle");
                    location.reload();
                } else {
                    alert("修改失败！");
                }
            })
        })

        $("#btn_edit_submit").click(function () {
            var row = {}
            $("input[name='inputitem']").each(function () {

                var id = $(this).attr("id");
                row[id] = $(this).val();
                //json.push(row);
            })
            console.log(row)
            $.post("/info/update", {json: JSON.stringify(row)}, function (data) {
                if (data = "success") {
                    seteditable(false);
                    alert("修改成功")
                    if (currentParent != null)
                        zTreeObj.reAsyncChildNodes(currentParent, "refresh");

                } else {
                    alert("修改失败，请刷新重试");
                }
            })
        })

        var tree = ${treeJsonString};
        var setting = {
            data: {
                Keep: {
                    parent: true
                },
                SimpleData: {
                    enable: true
                }
            },
            edit: {
                enable: true,
                showRemoveBtn: true,
                showRenameBtn: false
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
                beforeRemove: beforeRemovefunction,
                onRightClick: righclickfunction,
                onClick: clickfunction

            }

        }

        function beforeRemovefunction(treeId, treeNode) {
            if (!treeNode.isParent) {
                if (confirm("确定要删除该学生信息？")) {
                    /*数据库操作*/
                    var cmd = false
                    $.ajax({
                        async: false,
                        type: "post",
                        url: "/info/delete",
                        data: {delete_list: treeNode.id},
                        success: function (data) {
                            if (data == "success")  cmd = true;
                            else cmd = false;
                        }
                    })
                    return cmd;
                }
                return false;

            }
            else {
                if (confirm("您确定要删除该节点下所有子节点？")) {
                    // zTreeObj.removeChildNodes(treeNode);
                    alert("该功能我还没写")
                    return false;
                }
                return false
            }

        }

        function righclickfunction(event, treeId, treeNode, clickFlag) {

        }

        /*当前学生信息*/
        var currentParent = null;
        /*详细信息显示*/
        function clickfunction(event, treeId, treeNode, clickFlag) {
            if (!treeNode.isParent) {
                $("#btn_add_new").css("visibility", "visible");
                $("#btn_edit").css("visibility", "visible");
                seteditable(false);
                currentParent = treeNode.getParentNode();
                $.post("/info/getIndividual", {yjs_id: treeNode.id}, function (data) {
                    console.log(data)
                    $("input[name='inputitem']").each(function () {
                        var id = $(this).attr("id")
                        $(this).val(data[id]);
                    });
                })
            }
        }

        function filter(treeId, parentNode, childNodes) {
            return JSON.parse(childNodes)
        }

        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, tree);
    });
</script>
</body>
</html>