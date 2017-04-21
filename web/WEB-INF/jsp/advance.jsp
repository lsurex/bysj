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

    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/mainstyle.css" rel="stylesheet">

    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <link href="static/css/fileinput.min.css" rel="stylesheet">
    <script src="static/js/fileinput.min.js"></script>
    <script src="static/js/zh.js"></script>
    <script src="static/js/bootstrap.min.js"></script>

    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="assets/js/pswd.js"></script>
    <style>

        .nav > li > a {
            color: #9d9d96;
            text-decoration: none;
            /*  background-color: #222222;*/
            border: #080808 1px solid;
        }

        /* a:focus,a:hover{
             background-color: #222;
             border: 1px solid #080808;
         }*/
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
            color: darkred;
            cursor: default;
            background-color: #222;
            border: 1px solid #080808;
            border-bottom-color: transparent;
        }

        .nav-tabs {
            border-bottom: 1px solid #080808;
        }

        .nav > li > a:focus, .nav > li > a:hover {
            text-decoration: none;
            background-color: #222222;
            border: 1px solid #080808;
            color: whitesmoke;
        }

        .file-preview-frame {
            position: relative;
            display: table;
            margin: 8px;
            height: 160px;
            border: 1px solid #080808;
            box-shadow: 1px 1px 5px 0 #a2958a;
            padding: 6px;
            float: left;
            text-align: center;
            vertical-align: middle;
        }

        .file-preview-frame:not(.file-preview-error) .file-footer-caption:hover {
            color: #d9534f;
        }

        .file-preview {
            border-radius: 0px;
            border: 1px solid #6f6761;
            padding: 5px;
            width: 100%;
            margin-bottom: 5px;
        }

        .list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
            z-index: 2;
            color: #fff;
            background-color: #222;
            border-color: #080808;
        }

        .list-group-item:first-child {
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
        }

        #overlay {
            opacity: 1;
            z-index: 1002;
            position: absolute;
            width: 33%;
            height: 33%;
            top: 33%;
            left: 33%;
            display: none;
            background: #292929 url("/assets/gif/lsure2.gif") no-repeat left top;
            background-size: 10%;
        }

        /*     #overlayContent{}*/
        #overlay p {
            font-size: large;
            font-style: italic;
            color: darkred;
            margin-left: 30%;
            margin-top: 20%;
        }

        #overlay button {
            color: whitesmoke;
            background-color: darkred;
            margin-left: 76%;
            margin-top: 20%;
            border: none;
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
                <div id="contentPage">
                    <%--  可替换的内容--%>
                    <div style="margin-top: 20px" class="col-sm-10 col-sm-offset-1">
                        <ul class="nav nav-tabs" id="pages" role="tablist">
                            <li role="presentation" class="active"><a href="#fileimport" aria-controls="fileimport"
                                                                      role="tab"
                                                                      data-toggle="tab">从文件导入</a></li>
                            <%--    <li role="presentation"><a href="#insertbyhand" aria-controls="insertbyhand" role="tab"
                                                           data-toggle="tab">手工录入</a></li>--%>
                            <li role="presentation"><a href="#advanced" id="advancehref" role="tab" data-toggle="tab">高级设置</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="fileimport"
                                 style="height: 0px;padding-bottom: 75%;background-color: #222222 ; border: #080808 1px solid;border-top-color: #222222">
                                <div class="col-sm-5" style="margin-top: 20px">
                                    <div class="alert-danger alert alert-dismissable">
                                        <button type="button" class="close" data-dismiss="alert"
                                                aria-hidden="true">
                                            &times;
                                        </button>
                                        <a href="#" data-toggle="modal" data-target="#demo_excle"> 请导入指定格式excle!</a>
                                    </div>
                                    <input id="input-id" type="file" class="file" name="files">
                                    <button type="button" id="fileAnalysebtn" style="visibility: hidden"
                                            class="btn-success btn-block btn-lg">文件解析
                                    </button>
                                </div>
                                <div class="col-sm-6" id="Mappinginfo"
                                     style="visibility: hidden; border: #080808 1px solid;padding: 0px ;background-color: whitesmoke">

                                    <ul class="list-group" id="Mappinglistgroup">
                                        <li class="list-group-item active">
                                            <h5><span class="glyphicon glyphicon glyphicon-list-alt">&nbsp;解析结果</span>
                                                <small>请配置数据库映射</small>
                                            </h5>
                                        </li>
                                    </ul>
                                    <button id="btn_submitconfig" type="button" style="margin-top:  5px"
                                            class="btn-danger btn-block btn">提交配置
                                    </button>
                                </div>

                            </div>

                            <%--    &lt;%&ndash;手工录入界面&ndash;%&gt;
                                <div role="tabpanel" class="tab-pane" id="insertbyhand"
                                     style="height: 0px;padding-bottom: 75%;background-color: #222222 ; border: #080808 1px solid;border-top-color: #222222">
                                    <div>
                                        &lt;%&ndash;基本表结构&ndash;%&gt;
                                        <div class="col-sm-5" style="color: whitesmoke">
                                            <form role="form">
                                                <div class="form-group">
                                                    <label>学号</label>
                                                    <input type="text" class="fixed_input form-control" placeholder="请输入学号">
                                                </div>
                                                <div class="form-group">
                                                    <label>姓名</label>
                                                    <input type="text" class="fixed_input form-control" placeholder="请输入学号">
                                                </div>
                                                <div class="form-group">
                                                    <label>年龄</label>
                                                    <input type="text" class="fixed_input form-control" placeholder="请输入学号">
                                                </div>
                                                <div class="form-group">
                                                    <label>密码</label>
                                                    <input type="text" class="fixed_input form-control" placeholder="请输入学号">
                                                </div>
                                                <div class="form-group">
                                                    <label>性别</label>
                                                    <input type="text" class="fixed_input form-control" placeholder="请输入学号">
                                                </div>
                                                <div class="form-group">
                                                    <label>年纪</label>
                                                    <input type="text" class="fixed_input form-control" placeholder="请输入学号">
                                                </div>


                                            </form>
                                        </div>
                                        &lt;%&ndash;扩展表结构&ndash;%&gt;
                                        <div class="col-sm-5">

                                        </div>
                                    </div>
                                </div>--%>
                            <div role="tabpanel" class="tab-pane" id="advanced"
                                 style="height: 0px;padding-bottom: 75%;background-color: #222222 ; border: #080808 1px solid;border-top-color: #222222">
                                <%--高级功能页面--%>


                                <div class="col-sm-5" style="margin-top: 20px">
                                    <button type="button" style="margin-bottom: 20px"
                                            class="btn btn-block btn-success btn-lg" id="btn_getbjg">获取当前表结构
                                    </button>
                                    <ul class="list-group" id="fixedlist">
                                    </ul>

                                </div>
                                <div class="panel-group col-sm-6" style="margin-top: 20px " id="insertmethod">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">

                                            <a data-toggle="collapse" data-parent="#insertmethod" href="#insertpanel">
                                                <button class="btn-block btn-success btn-lg"><span
                                                        class="glyphicon glyphicon-plus">添加新列</span></button>
                                            </a>
                                        </div>
                                        <div id="insertpanel" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <form class="form-horizontal" role="form" id="form_add_newitem">
                                                    <div class="form-group">
                                                        <label for="input_bm" style="color: whitesmoke"
                                                               class="control-label col-sm-4">
                                                            字段名：</label>
                                                        <div class=" col-sm-8">
                                                            <input id="input_bm" class="form-control">
                                                        </div>

                                                    </div>
                                                    <div class="form-group">
                                                        <label for="input_bz" style="color: whitesmoke"
                                                               class="control-label col-sm-4">
                                                            备注：</label>
                                                        <div class=" col-sm-8">
                                                            <input id="input_bz" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="input_type" style="color: whitesmoke"
                                                               class="control-label col-sm-4">
                                                            类型：</label>
                                                        <div class=" col-sm-8">
                                                            <select id="input_type"
                                                                    class="form-control">
                                                                <option value="VARCHAR(50)">VARCHAR</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <input type="button" class="btn-block btn-success btn" value="提交"
                                                           id="btn_addsubmti">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">

                                            <a data-toggle="collapse" data-parent="#insertmethod" href="#insertpanel2">
                                                <button type="button" id="btn_del_tb"
                                                        class="btn-danger btn-block btn-lg"><span
                                                        class="glyphicon glyphicon-remove">删除列</span></button>
                                            </a>
                                        </div>
                                        <div id="insertpanel2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <form class="form-horizontal" role="form">
                                                    <div class="form-group">
                                                        <label for="input_bm" style="color: whitesmoke"
                                                               class="control-label col-sm-4">
                                                            删除：</label>
                                                        <div class=" col-sm-8">
                                                            <select id="input_del_bm" class="form-control"></select>
                                                        </div>

                                                    </div>
                                                    <input type="button" class="btn-block btn-success btn" value="提交"
                                                           id="btn_delsubmti">
                                                </form>
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
<div class="modal fade" id="demo_excle" role="dialog" tabindex="-1" aria-labelledby="demo_excle_modal"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="demo_excle_modal"><span class="glyphicon glyphicon-file"></span>文件格式模板</h4>
            </div>
            <div class="modal-body">
                <img src="assets/gif/MKh84yW - Imgur.gif" style="width: 100%">
            </div>
            <div class="modal-footer">
                支持xlsx,xls格式文件。
            </div>
        </div>
    </div>
</div>

<%--遮罩框--%>
<div id="overlay">
    <p id="overlaycontent"></p>
    <button id="overlay_succcess" style="visibility:  hidden" class="btn btn-default" type="button">确定</button>

</div>
<script>
    $("#overlay_succcess").click(function () {
        $("#overlay").fadeOut();
    })
    function overlayshow() {
        $("#overlay").fadeIn();
        $("#overlaycontent").text("正在配置请稍后····");
        $("#overlaycontent").css("color", "red");
    }
    var headitems = new Array();

    $("#advancehref").click(function () {
        alert("注意！请谨慎使用该功能.")
    })

    $("#input-id").fileinput(
            {
                showUpload: true,
                language: 'zh',
                uploadAsync: true,
                dropZoneEnabled: false,
                uploadUrl: 'excle/upload2',
                maxFileCount: 1,
                /*  showCaption: false,*/
                showPreview: true,
                /* browseClass: "btn btn-primary btn-lg",*/
                allowedFileExtensions: ['xls', 'xlsx'],

                previewFileIcon: "<img src='assets/image/badge/ExcelLogowhite.png' class='file-preview-image' alt='Desert' title='Desert'>"


            }
    )
    $("#input-id").on("fileuploaded", function (event, data, previewId, index) {
        alert(data.response)
        if (data.response == "上传成功") {
            $("#fileAnalysebtn").css("visibility", "visible");
        } else {
            alert("未知错误!");
        }
        console.log(data);
    })

    /*解析结果展示*/
    $("#fileAnalysebtn").click(function () {
        $("#Mappinginfo").css("visibility", "visible")
        $("#mappinglistgroup li").remove();
        $.post("/excle/getItems", function (data) {
                    $(".appendmappingitem").remove();
                    for (var key in  data) {
                        headitems.push(data[key].toString());
                        /*  console.log(data[key])*/
                        $("#Mappinglistgroup").append("<li class='list-group-item appendmappingitem'> <div class='list-group-item-heading'>" + data[key] + "</div><select  name='append' class='Mappingselect form-control'> </select> </li>")

                    }
                    console.log(headitems);
                    $("#Mappingselect option").remove();
                    $(".Mappingselect").append("<option  value='null'>空</option>");
                    /*option添加空*/
                    $.post("/advance/getInputItems", function (data) {/*获取固定表结构*/
                        if (data != null) {
                            for (var token in data) {
                                $(".Mappingselect").append("<option  value=" + data[token].jlb_lm + ">" + data[token].jlb_lm + data[token].jlb_bz + data[token].jlb_type + "</option>")
                            }
                        }
                    })

                }
        )
    })


    /*获取表结构*/
    $("#btn_getbjg").click(function () {
        $(".fixedappend").remove();
        $.post("/advance/getInputItems", function (data) {
            if (data != null) {
                for (var token in data) {
                    $("#fixedlist").append("<li class='list-group-item fixedappend'> <h5 class='list-group-item-heading'>字段名：" + data[token].jlb_lm + "  备注:" + data[token].jlb_bz + "<small>  类型" + data[token].jlb_type + "</small></h5> </li>")

                }
            }
        });
    })
    /*删除select选项*/
    $("#btn_del_tb").click(function () {
        $.post("/advance/getDeletableItems", function (data) {
            $("#input_del_bm option").remove();
            for (var token in data) {
                $("#input_del_bm").append("<option  value=" + data[token].jlb_lm + ">" + data[token].jlb_lm + "/" + data[token].jlb_bz + "/" + data[token].jlb_type + "</option>")
            }

        })
    })
    $("#btn_delsubmti").click(function () {
        alert($("#input_del_bm").val())
        $.post("/advance/deleteTableItem", {colname: $("#input_del_bm").val()}, function (data) {
            if (data == "success") {
                alert("修改成功!")
                $("#btn_getbjg").trigger("click");
                $.post("/advance/getDeletableItems", function (data) {
                    $("#input_del_bm option").remove();
                    for (var token in data) {
                        $("#input_del_bm").append("<option  value=" + data[token].jlb_lm + ">" + data[token].jlb_lm + "/" + data[token].jlb_bz + "/" + data[token].jlb_type + "</option>")
                    }

                })
            }
            else {
                alert("修改失败!")
            }
        })
    })
    $("#btn_addsubmti").click(function () {
        $.post("/advance/addTableItem", {
            newcol: $("#input_bm").val(),
            type: $("#input_type").val(),
            comment: $("#input_bz").val()
        }, function (data) {
            if (data == "success") {
                alert("修改成功")
                $("#input_bm").val("");
                $("#input_bz").val("");
                $("#btn_getbjg").trigger("click");
            } else {
                alert("修改失败")
            }
        })
    })
    /*提交配置*/
    $("#btn_submitconfig").click(function () {
        $("#overlay_succcess").css("visibility", "hidden");
        /*隐藏*/
        var iterator = Number(0);
        var json = [];

        $("select[name='append'] option:selected").each(function () {
                    /*console.log(headitems[iterator]);*/
                    var row = {};
                    row.name = headitems[iterator];
                    row.map = $(this).val();
                    iterator++;
                    /*   console.log($(this).val())*/
                    json.push(row);

                }
        )
        overlayshow();
        // console.log(json)
        $.ajax(
                {
                    url: "/advance/uploadConfigure",
                    type: "POST",
                    success: function (data) {
                        setTimeout(function () {
                            if (data == "success") {
                                $("#overlaycontent").css("color", "green");
                                $("#overlaycontent").text("录入成功!");
                                $("#overlay_succcess").css("visibility", "visible");
                                $("#overlay_succcess").css("background-color", "green");
                            } else {
                                $("#overlaycontent").css("color", "red");
                                $("#overlaycontent").text("错误代码:" + data);
                                $("#overlay_succcess").css("visibility", "visible");
                                $("#overlay_succcess").css("background-color", "red");
                            }
                        }, 3000);

                    },
                    error: function () {

                    },
                    data: JSON.stringify(json),
                    dataType: "json",
                    contentType: "application/json",
                }
        )
    })
</script>
</body>
</html>