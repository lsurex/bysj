<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/3/24
  Time: 23:18
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
    <link href="assets/css/importstyle.css" rel="stylesheet">
    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>

    <script src="static/js/jquery/jquery.iframe-transport.js"></script>
    <script src="static/js/jquery/jquery.ui.widget.js"></script>
    <script src="static/js/jquery/jquery.fileupload.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <%--    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery/jquery-3.1.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
    <style>

   /*     #leftnav {
            background-color: #222;
            opacity: 1;
            height: 0px;
            padding: 30px 0px 100%;
            border-color: #080808;
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
        }*/

      /*  body {
            color: #bdbdbd;
            padding-top: 50px;
            background-color: #222222
        }

        .contentpanel {
            background-color: #222222;
        }

        a {
            color: #bdbdbd;
            text-decoration: none;
        }
*/

    </style>
    <script>
        $().ready(function () {
            $("#fileAnalysebtn").click(function () {
                $("#Mappinginfo").css("visibility", "visible")
                $("#mappinglistgroup li").remove();
                $.post("/excle/items?x=" + (new Date()).valueOf(), function (data) {
                            $("#Mappinglistgroup .list-group-item").remove();
                            for (var key in  data) {
                                /*  console.log(data[key])*/

                                $("#Mappinglistgroup").append("<li class='list-group-item'> <div class='list-group-item-heading'>" + data[key] + "</div><select  class='Mappingselect form-control'> </select> </li>")

                            }
                            $(".Mappingselect").append("<option  value='stu_age'>" + "stu_age" + "</option>")
                            $(".Mappingselect").append("<option value='stu_sex'>" + "stu_sex" + "</option>")
                            $(".Mappingselect").append("<option value='stu_name'>" + "stu_name" + "</option>")
                            $(".Mappingselect").append("<option value='stu_tutor'>" + "stu_tutor" + "</option>")
                            $(".Mappingselect").append("<option value='stu_id'>" + "stu_id" + "</option>")
                            $(".Mappingselect").append("<option value='stu_properties'>" + "stu_properties" + "</option>")


                        }
                )
            })


            $("#importsubmit").click(function () {
                $.ajax({
                    url: 'excle/upload?x=' + (new Date()).valueOf(),
                    type: 'POST',
                    cache: false,
                    data: new FormData($('#importfile')[0]),
                    processData: false,
                    contentType: false,
                    async: false,
                    dataType: 'json',
                    success: function (data) {
                        if (data == "success") {
                            alert(data)
                            $("#fileAnalysebtn").css("visibility", "visible")
                        }
                    },

                })
            });
            $("#btn_addbyhand").click(function () {

            })
        })

    </script>

</head>

<body>

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
                        <li><a data-toggle="modal" data-target="#alterPswd" href="#">账号设置</a></li>
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
                            <%-- onclick="load_home()--%>>
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
            <div style="padding-right:0px;border: 1px solid #080808 ;height: 0px;;padding-left: 0px; background-color: #333333;padding-bottom:100% ;">
                <div id="contentPage">
                    <%--  可替换的内容--%>

                    <div class="col-sm-4" style="margin: 20px;">
                        <div class="contentpanel panel "
                             style="margin-bottom: 20px;background-color: #222222;border: #080808 solid 1px ;height: 0px ;padding-bottom: 100%">
                            <div class="panel-heading">
                                <div style="">
                                    <a data-toggle="collapse" href="#importFloder">
                                        <h1>
                                            <span class="glyphicon glyphicon-folder-open"></span>
                                            从文件中导入
                                        </h1>
                                    </a>
                                </div>
                            </div>
                            <div id="importFloder" class="panel-collapse collapse ">
                                <div class="panel-body">
                                    <form enctype="multipart/form-data" class="form-group" method="post"
                                          id="importfile">
                                        <div class="input-group">
                                          <span class="input-group-addon">
                                              <span class="glyphicon glyphicon-magnet"></span>
                                          </span>
                                            <input class="form-control" name="file" type="file">
                                        </div>
                                        <button type="button" class="btn-block btn-danger pull-right form-control"
                                                id="importsubmit">提交
                                        </button>
                                    </form>
                                    <%-- <input type="file" id="fileupload" name="files[]" data-url="excle/upload" multiple>
                                     <div id="progress" class="progress">
                                         <div class="progress-bar progress-bar-success" id="progressbar">
                                         </div>
                                     </div>
                                     <p id="uploadresult"></p>
                                     <div hidden>上传失败</div>--%>

                                </div>
                            </div>
                        </div>
                        <button type="button" id="fileAnalysebtn" style="visibility: hidden"
                                class="btn-success btn-block btn-lg">文件解析
                        </button>
                        <div class="contentpanel panel "
                             style="margin-top: 20px;background-color: #222222;border: #080808 solid 1px">
                            <div class="panel-heading">
                                <div>
                                    <a data-toggle="collapse" href="#importbyhand">
                                        <h1>
                                            <span class=" glyphicon glyphicon-edit"></span>
                                            手动添加
                                        </h1>
                                    </a>
                                </div>
                            </div>
                            <div id="importbyhand" class="panel-collapse collapse ">
                                <div class="panel-body">
                                 <button type="button" id="btn_addbyhand" class="btn-block btn-lg btn-success">添加</button>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="col-sm-7"
                         style="background-color: #222222 ;border: #080808 solid 1px;height: 0px;margin:20px;padding-bottom:90%;">
                        <div id="Mappinginfo" style="visibility: hidden">
                            <ul id="Mappinglistgroup" class="list-group ">
                                <li class="list-group-heading">
                                    <h4><span class="glyphicon glyphicon glyphicon-list-alt">&nbsp;解析结果</span>
                                        <small>请配置数据库映射</small>
                                    </h4>
                                </li>
                                <%--       <div class="pre-scrollable">
                                         &lt;%&ndash;  <li class="list-group-item">
                                               <div class="list-group-item-heading">123</div>
                                               <select class="Mappingselect form-control">
                                               </select>
                                           </li>&ndash;%&gt;

                                       </div>
            --%>

                            </ul>

                            <button id="confirmMapping" class=" btn-block btn-danger btn-lg" type="button">提交配置</button>
                        </div>

                    </div>
                    <%--end--%>
                </div>
            </div>
        </div>
    </div>
</div>
<%--模态框--%>
<%--修改密码模态框--%>
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
<script>
</script>
</body>
</html>