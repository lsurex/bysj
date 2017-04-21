<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/3/21
  Time: 19:40
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
    <link href="/static/css/bootstrap-select.min.css">
    <link href="static/css/bootstrap-table.min.css" rel="stylesheet">
    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="static/js/bootstrap-table.min.js"></script>
    <script src="static/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="static/js/bootstrap-select.min.js"></script>
    <script>
        var delsingle;
        /*定义全局变量,使得能被ready外部调用*/
        $().ready(function () {
            var priority = "yjs_id";
            /*初始化优先级*/
            var pages = 0;
            var items_global;
            delsingle = function (obj) {
                var dellist = new Array();
                console.log($(obj))
                console.log($(this))
                dellist.push($(obj).parent().parent().children(".keyword").text());
                var result = confirm("您即将删除该信息：" + dellist.toString());
                if (result == true) {
                    $.post("/pageQuery/deletebatch", {delete_list: dellist.toString()}, function (data) {
                        if (data == "success") {
                            init_method($("#selector").val());
                        }
                        else {
                            alert("删除失败！")
                        }
                    })
                }

            }
            /*页表首次初始化*/
            init_method(1);
            /*从第一页开始*/

            /*单个删除*/


            /*删除信息function*/
            $("#batch_delete_btn").click(function () {
                var dellist = new Array();
                /*获取当前页数*/
                var pagecurrent = $("#selector").val();
                $("input[name='delete_checkbox']:checked").each(function () {
                    dellist.push($(this).parent().parent().children(".keyword").text());
                })
                if (dellist.length > 0) {
                    var result = confirm("您即将删除该信息：" + dellist.toString());
                    if (result == true) {
                        $.post("/pageQuery/deletebatch", {delete_list: dellist.toString()}, function (data) {
                            if (data == "success") {
                                init_method($("#selector").val());
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

            /*显示方法*/
            function querymethod(priority, value) {
                $.post("/pageQuery/stuInfo", {
                    startRow: value,
                    pageSize: 12,
                    priority: priority
                }, function (data) {
                    $("#infocontent tr").empty()
                    /*清空上次信息*/
                    for (key in data) {

                        $("#infocontent").append("+<tr class='details' > <th class='keyword'>" + data[key].yjs_id + "</th> <th>" + data[key].yjs_name + "</th> <th>" + data[key].yjs_tutor + "</th><th>" + "<a style='color: black' class='detais_href' href='javascript:;'><span class='glyphicon glyphicon-list-alt'></sapn></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='delsingle(this)'  style='color: darkred'><span class='glyphicon glyphicon-trash'></sapn></a>&nbsp;&nbsp;&nbsp;&nbsp;<input name='delete_checkbox' type='checkbox'>" + "</th></tr>")
                    }
                    /*showintable(data);*/
                }, "json");
            }

            /*实例化方法*/
            function init_method(value) {
                querymethod(priority, value);
                var counts = 0;
                /*获取页数*/
                var obj = document.getElementById("selector");
                $.post("/pageQuery/counts", function (data) {
                    counts = Number(data);
                    $("#counts p").remove();
                    $("#counts").append("<p>共计:" + counts + "条信息</p>")
                    pages = parseInt(counts / 12 + 1);
                    $("#selector option").remove();
                    for (var page = 1; page <= Number(pages); page++) {
                        obj.add(new Option(page, page));
                    }
                }, "json");
            }


            /*更改优先级*/
            /*根据姓名排序*/
            $("#btn_priority_name").dblclick(function () {
                priority = "yjs_id";
                querymethod(priority, 1);
                /*显示查询结果*/
                /*修改页数为1*/
                $("#selector").val(1)

            })
            /*根据id排序*/
            $("#btn_priority_tutor").dblclick(function () {
                priority = "yjs_name";
                querymethod(priority, 1);
                /*从第一页开始显示*/
                /*显示查询结果*/
                /*修改页数为1*/
                $("#selector").val(1)
            })
            /*根据sex排序*/
            $("#btn_priority_id").dblclick(function () {
                priority = "yjs_tutor";
                querymethod(priority, 1);
                /*显示查询结果*/
                /*修改页数为1*/
                $("#selector").val(1)
            })

            /*换页方法*/
            /*  function changepages(value) {
             $.post("/pageQuery/stuInfo", {
             startRow: value,
             pageSize: 12,
             priority: priority
             }, function (data) {
             /!*alert(data[4].stu_name+data[4].stu_age)*!/
             $("#infocontent tr").empty();
             for (key in data) {
             $("#infocontent").append("+<tr class='details' > <th class='keyword'>" + data[key].yjs_id + "</th> <th>" + data[key].yjs_name + "</th> <th>" + data[key].yjs_sex + "</th><th>" + "<a style='color: black' href='#'><span class='glyphicon glyphicon-list-alt'></sapn></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' style='color: darkred'><span class='glyphicon glyphicon-trash'></sapn></a>&nbsp;&nbsp;&nbsp;&nbsp;<input name='delete_checkbox' type='checkbox'>" + "</th></tr>")
             }
             });
             }*/

            /*换页触发*/
            $("#selector").change(function () {
                querymethod(priority, $("#selector").val());
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
                /*alert(pages)*/
                if ($("#selector").val() < pages) {
                    var val = Number($("#selector").val()) + 1;
                    /* alert(val)*/
                    $("#selector").val((val))
                    $("#selector").trigger("change")
                }
            });

            /*模糊查询方法*/


            $("#search_byid_btn").click(function () {
                var token = $("#input_search_byid").val();//获取输入值
                var method = "byID";
                $.post("/pageQuery/fuzzyQuery", {token: token, method: method}, function (data) {
                            $("#ul_result_byid >.li_search_item").remove()
                            for (key in data) {
                                $("#ul_result_byid").append("<li class='li_search_item list-group-item'>" + data[key].yjs_id + "-" + data[key].yjs_name + "-" + data[key].yjs_tutor + "<a href='javascript:;' class='li_result_href'><span class='glyphicon glyphicon-list-alt'></span></a></li>")
                            }

                        }
                )
            })

            $("#search_byname_btn").click(function () {
                var token = $("#input_search_byname").val();//获取输入值
                var method = "byName";
                $.post("/pageQuery/fuzzyQuery", {token: token, method: method}, function (data) {
                            $("#ul_result_byname >.li_search_item").remove()
                            for (key in data) {
                                $("#ul_result_byname").append("<li class='li_search_item list-group-item'>" + data[key].yjs_id + "-" + data[key].yjs_name + "-" + data[key].yjs_tutor + "<a href='javascript:;' class='li_result_href'><span class='glyphicon glyphicon-list-alt'></span></a></li>")
                            }

                        }
                )
            })

            $("#search_bytutor_btn").click(function () {
                var token = $("#input_search_btutor").val();//获取输入值
                var method = "byTutor";
                $.post("/pageQuery/fuzzyQuery", {token: token, method: method}, function (data) {
                            $("#ul_result_bytutor >.li_search_item").remove()
                            for (key in data) {
                                $("#ul_result_bytutor").append("<li class='li_search_item list-group-item'>" + data[key].yjs_id + "-" + data[key].yjs_name + "-" + data[key].yjs_tutor + "<a href='javascript:;' class='li_result_href'><span class='glyphicon glyphicon-list-alt'></span></a></li>")
                            }

                        }
                )

            })

            /*chaxun*/
            $("#ul_result_byid").on("click", ".li_result_href", function () {
                var focus = $(this).parent().text().split("-");
                var keyword = focus[0];
                getdetails_method(keyword);
            })
            $("#ul_result_byname").on("click", ".li_result_href", function () {
                var focus = $(this).parent().text().split("-");
                var keyword = focus[0];
                getdetails_method(keyword);
            })
            $("#ul_result_bytutor").on("click", ".li_result_href", function () {
                var focus = $(this).parent().text().split("-");
                var keyword = focus[0];
                getdetails_method(keyword);
            })
            /*      /!*模糊查询*!/
             $("#fuzzyQuerybtn").click(function () {
             var token = $("#fuzzyQueryinput").val();//获取输入值
             var method = $("input[name='querymethod']:checked").val();//获取选中radio的值
             //ajax获取查询数据
             $.post("/pageQuery/fuzzyQuery", {token: token, method: method}, function (data) {
             $("#fuzzyQueryResult li").remove();
             for (key in data) {
             $("#fuzzyQueryResult").append("<li class='fuzzyResultli list-group-item'>" + data[key].yjs_id + "+" + data[key].yjs_name + "+" + data[key].yjs_sex + "</li>")
             }
             })
             });
             /!*模糊查询触发详细信息事件*!/
             $("#fuzzyQueryResult").on("dblclick", '.fuzzyResultli', function () {
             var focus = $(this).text().split("+");
             /!*alert(focus[0]);*!/
             $.post("/pageQuery/fixedQuery", {keyword: focus[0]}, function (data) {

             $("#showDetails").modal("toggle")
             $("#detail_id").val(data.yjs_id)
             $("#detail_age").val(data.yjs_age)
             $("#detail_name").val(data.yjs_name)
             $("#detail_nj").val(data.yjs_nj)
             $("#detail_sex").val(data.yjs_sex)


             });
             /!*获取扩展信息*!/
             $("#extensive_ul  .extensiveli").remove();
             $.post("/pageQuery/getextensiveItems", function (items) {
             if (items != null) {
             items_global = items;//保存当前表结构
             $.post("/pageQuery/extensiveQuery", {keyword: focus[0]}, function (data) {

             if (data != null) {
             for (var key in items) {
             var item = items[key].jlb_lm;
             $("#extensive_ul").append("<li class='list-group-item extensiveli' >" + items[key].jlb_bz + "<input class='form-control shiftinfo' name='extensive_input' value=\'" + data[item] + "\'/></li>")
             }
             }
             $(".shiftinfo").attr("readonly", true);
             })
             }

             })


             })*/
            function getdetails_method(keyword) {
                $.post("/pageQuery/fixedQuery", {keyword: keyword}, function (data) {
                    $("#showDetails").modal("toggle")
                    seteditable(false)
                    $("#detail_id").val(data.yjs_id)
                    $("#detail_age").val(data.yjs_age)
                    $("#detail_name").val(data.yjs_name)
                    $("#detail_nj").val(data.yjs_nj)
                    $("#detail_sex").val(data.yjs_sex)
                    $("#detail_tutor").val(data.yjs_tutor)


                });
                /*获取扩展信息*/
                $("#extensive_ul  .extensiveli").remove();
                $.post("/pageQuery/getextensiveItems", function (items) {
                    items_global = items;//保存当前表结构
                    if (items != null) {
                        $.post("/pageQuery/extensiveQuery", {keyword: keyword}, function (data) {

                            if (data != null) {
                                for (var key in items) {
                                    var item = items[key].jlb_lm;
                                    $("#extensive_ul").append("<li class='list-group-item extensiveli'>" + items[key].jlb_bz + "<input class='form-control   shiftinfo' name='extensive_input' value=\'" + data[item] + "\'/></li>")
                                }
                            }
                            $(".shiftinfo").attr("readonly", true);
                        })
                    }

                })
            }

            /*详细查询*/
            $("#infocontent").on('click', '.detais_href', function () {
                var keyword = $(this).parent().parent().children().first().text();//id
                /*获取事件触发源的首元素key*/
                /*详细查询操作*/
                /*获取基本信息*/
                getdetails_method(keyword);


            });
            function seteditable(state) {
                if (state == true) {
                    $(".shiftinfo").attr("readonly", false);
                    $("#btn_updatedetail").css("visibility", "visible")
                    $("#btn_deletedetail").css("visibility", "visible")
                } else {
                    $(".shiftinfo").attr("readonly", true);
                    $("#btn_updatedetail").css("visibility", "hidden")
                    $("#btn_deletedetail").css("visibility", "hidden")
                }

            }

            /*详细信息启用编辑*/
            $("#enableEdit").click(function () {
                seteditable(true);
            });
            /*详细信息删除*/
            $("#btn_deletedetail").click(function () {
                var key = $("#detail_id").val();
                var result = confirm("您即将删除该信息：" + key);
                if (result == true) {
                    $.post("/pageQuery/deletebatch", {delete_list: key}, function (data) {
                        if (data == "success") {
                            seteditable(false);
                            $("#showDetails").modal("toggle")
                            init_method($("#selector").val());
                        }
                        else {
                            alert("删除失败！")
                        }
                    })
                }
            });
            /*详细信息修改提交*/
            $("#detailsUpdateform").validate({
                submitHandler: function () {
                    $.post("/pageQuery/fixedUpdate", {
                                yjs_id: $("#detail_id").val(),
                                yjs_name: $("#detail_name").val(),
                                yjs_age: $("#detail_age").val(),
                                yjs_sex: $("#detail_sex").val(),
                                yjs_nj: $("#detail_nj").val(),
                                yjs_tutor: $("#detail_tutor").val()
                            },
                            function (data) {
                                if (data == "success") {
                                    seteditable(false);
                                    $("#showDetails").modal("hide")
                                    init_method($("#selector").val())
                                }
                                else {
                                    seteditable(false);
                                    alert("error")
                                }
                            }
                    )
                    var extensivedata = "";
                    /*获取扩展表值*/
                    $("input[name='extensive_input']").each(function () {
                        extensivedata = extensivedata + $(this).val() + ",";

                    })
                    console.log(extensivedata);

                    $.post("/pageQuery/extensiveUpdate", {data: extensivedata}, function (data) {
                                if (data == "success") {
                                    /*  init_method($("#selector").val())*/
                                }
                                else {
                                    alert("错误")
                                }

                            }
                    )

                }
            })
        })


    </script>
    <style>
        #search_byid_btn {
            color: #FFFFFF;
            background-color: #d9534f;
            border: 1px solid #d9534f;
            border-radius: 0px;
        }

        #input_search_byid {
            border: 2px solid #d9534f;
            border-radius: 0px;
        }

        #search_byname_btn {
            color: #FFFFFF;
            background-color: #c60000;
            border: 1px solid #c60000;
            border-radius: 0px;
        }

        #input_search_byname {
            border: 2px solid #c60000;
            border-radius: 0px;
        }

        #search_bytutor_btn {
            color: #FFFFFF;
            background-color: #ff5400;
            border: 1px solid #ff5400;
            border-radius: 0px;
        }

        #input_search_btutor {
            border: 2px solid #ff5400;
            border-radius: 0px;
        }

        #ul_panel {

            border-bottom: none;
        }

        #li_byid > a {
            color: #FFFFFF;
            margin-right: 0px;
            border: 0px solid transparent;
            border-radius: 0px 0px 0 0;

        }

        #li_byid > a:hover {
            background-color: #ffeee5;
            color: #d9534f;

        }

        #li_byid.active > a, #li_byid.active > a:active, #li_byid > a:focus {
            color: #FFFFFF;
            background-color: #d9534f;
            border: none;

        }

        #li_byname > a {
            color: #FFFFFF;
            margin-right: 0px;
            border: 0px solid transparent;
            border-radius: 0px 0px 0 0;
        }

        #li_byname > a:hover {
            background-color: #ffeee5;
            color: #c60000;

        }

        #li_byname.active > a, #li_byname.active > a:active, #li_byname > a:focus {
            background-color: #c60000;
            color: #FFFFFF;
            border: none;

        }

        #li_bytutor > a {
            color: #FFFFFF;
            margin-right: 0px;
            border: 0px solid transparent;
            border-radius: 0px 0px 0 0;
        }

        #li_bytutor > a:hover {
            background-color: #ffeee5;
            color: #ff5400;

        }

        #li_bytutor.active > a, #li_bytutor.active > a:active, #li_bytutor > a:focus {
            background-color: #ff5400;
            border: none;
            color: #FFFFFF;

        }

        #ul_result_byid .list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
            z-index: 2;
            color: #fff;
            background-color: #d9534f;
            border-color: #d9534f;
        }

        #ul_result_byid > .list-group-item:last-child {
            margin-bottom: 0;
            border-bottom-right-radius: 0px;
            border-bottom-left-radius: 0px;
        }

        #ul_result_byid > .list-group-item:first-child {
            margin-top: 20px;
            border-top-right-radius: 0px;
            border-top-left-radius: 0px;
        }

        #ul_result_byname .list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
            z-index: 2;
            color: #fff;
            background-color: #c60000;
            border-color: #c60000;
        }

        #ul_result_byname > .list-group-item:last-child {
            margin-bottom: 0;
            border-bottom-right-radius: 0px;
            border-bottom-left-radius: 0px;
        }

        #ul_result_byname > .list-group-item:first-child {
            margin-top: 20px;
            border-top-right-radius: 0px;
            border-top-left-radius: 0px;
        }

        #ul_result_bytutor .list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
            z-index: 2;
            color: #fff;
            background-color: #ff5400;
            border-color: #ff5400;
        }

        #ul_result_bytutor > .list-group-item:last-child {
            margin-bottom: 0;
            border-bottom-right-radius: 0px;
            border-bottom-left-radius: 0px;
        }

        #ul_result_bytutor > .list-group-item:first-child {
            margin-top: 20px;
            border-top-right-radius: 0px;
            border-top-left-radius: 0px;
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
                            <a href="#" class="center-block text-center" style="text-decoration: none" <%--data-toggle="collapse"
                              data-parent="#accordion"--%>
                               onclick="load_home()">
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
                    <div></div>

                    <%--  可替换的内容--%>
                    <div class="col-sm-7"
                         style="border: #080808 1px solid;margin:20px 20px 0px 30px ;background-color:#FFFFFF;padding: 0px">
                        <div id="show" style="background-color: white ">
                            <table id="infotable" class="table table-bordered table-hover">
                                <caption style="background-color:#222222"><h5 style="color: white">
                                    &nbsp;&nbsp;学生信息表</h5></caption>
                                <thead>
                                <tr>
                                    <th id="btn_priority_name">ID</th>
                                    <th id="btn_priority_id">姓名</th>
                                    <th id="btn_priority_tutor">导师</th>
                                    <th id="btn_operation">操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="infocontent" style="font-size: small">

                                </tbody>


                            </table>

                            <div id="counts" class="col-sm-8"></div>
                            <div class="col-sm-2">
                                <button id="batch_delete_btn" class="btn btn-danger">批量删除</button>
                            </div>

                            <div class="col-sm-offset-3 col-sm-6">

                                <ul class="pagination">
                                    <li class="prev">
                                        <a href="#" id="prevbtn">上一页</a>
                                    </li>
                                    <li class="next">
                                        <a id="nextbtn" href="#">下一页</a>
                                    </li>
                                    <div style="float: left">
                                        <li>
                                            <select id="selector" class="input-sm"></select>
                                        </li>
                                    </div>


                                </ul>
                            </div>

                        </div>

                    </div>
                    <div class="col-sm-4" style="margin: 20px 0px 0px 0px">
                        <%--  <div class="col-sm-10 col-sm-offset-1">--%>

                        <%--查询面板--%>
                        <ul class="nav nav-tabs" id="ul_panel">
                            <li class="active" id="li_byid">
                                <a href="#byid" data-toggle="tab">学号</a>

                            </li>
                            <li id="li_byname">
                                <a href="#byname" data-toggle="tab">姓名</a>

                            </li>
                            <li id="li_bytutor">
                                <a href="#bytutor" data-toggle="tab">导师</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="byid">
                                <div class="input-group">
                                    <input type="search" id="input_search_byid" class="form-control">
                                    <div class="input-group-btn">
                                        <button class="btn-default btn" id="search_byid_btn">查询</button>
                                    </div>
                                </div>
                                <ul class="list-group" id="ul_result_byid">
                                    <li class=" list-group-item active">
                                        学号 姓名 导师
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-pane" id="byname">
                                <div class="input-group">
                                    <input type="search" id="input_search_byname" class="form-control">
                                    <div class="input-group-btn ">
                                        <button class="btn-default btn" id="search_byname_btn">查询</button>
                                    </div>
                                </div>
                                <ul class="list-group" id="ul_result_byname">
                                    <li class="list-group-item active">
                                        学号 姓名 导师
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-pane " id="bytutor">
                                <div class="input-group">
                                    <input type="search" id="input_search_btutor" class="form-control">
                                    <div class="input-group-btn">
                                        <button class="btn-default btn" id="search_bytutor_btn">查询</button>
                                    </div>
                                </div>
                                <ul class="list-group" id="ul_result_bytutor">
                                    <li class="list-group-item active">
                                        学号 姓名 导师
                                    </li>
                                </ul>
                            </div>
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
            <form id="detailsUpdateform">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">

                            <div class="col-sm-5">

                                <ul class="list-group">
                                    <li class="list-group-item active">基本信息
                                    </li>
                                    <li class="list-group-item">学号：
                                        <input required class="form-control shiftinfo" id="detail_id"/>
                                    </li>
                                    <li class="list-group-item">姓名：
                                        <input required class="form-control shiftinfo" id="detail_name"/>
                                    </li>
                                    <li class="list-group-item">年龄：
                                        <input required class="form-control shiftinfo" id="detail_age"/>
                                    </li>
                                    <li class="list-group-item">年级：
                                        <input class="form-control shiftinfo" id="detail_nj"/>
                                    </li>
                                    <li class="list-group-item">性别：
                                        <input class="form-control shiftinfo" id="detail_sex"/>
                                    </li>
                                    <li class="list-group-item">导师：
                                        <input class="form-control shiftinfo" id="detail_tutor"/>
                                    </li>
                                </ul>


                            </div>
                            <div class="col-sm-5">

                                <ul class="list-group" id="extensive_ul">
                                    <li class="list-group-item active">
                                        更多信息
                                    </li>

                                </ul>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer" id="modalfooter">
                    <div>123123123123</div>
                    <button type="button" class="btn btn-danger" id="btn_deletedetail" style="visibility: hidden">删除
                        <button type="button" class="btn btn-success" id="enableEdit">编辑</button>
                        <button type="submit" class="btn btn-warning" id="btn_updatedetail" style="visibility: hidden">
                            提交
                        </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
</script>
</body>
</html>