<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: lsure
  Date: 2017/3/10
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head class="masthead">
    <meta charset="UTF-8">
    <title>MAMS系统登录</title>
    <meta name="viewpoint" content="width=device-width,initial-scale=1.0">

    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/bootstrap-switch-3.3.4/dist/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">

    <script src="static/js/jquery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="static/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="static/bootstrap-switch-3.3.4/dist/js/bootstrap-switch.min.js"></script>
    <link href="/assets/css/loginstyle.css">

    <script>

        $().ready(function () {
            $("#changevalidate").click(function () {
                now = new Date();
                this.src = "/validate/code?time=" + now.getTime();
            })
            $("#commentform").validate(
                    {
                        rules: {
                            validateCode: {
                                //required: true,
                                remote: {
                                    type: "post",
                                    url: "doValidate",
                                    data: {
                                        validatecode: function () {
                                            return $("#validateCode").val();
                                        }
                                    }
                                }

                            }
                        },
                        messages: {
                            validateCode: {
                                remote: "验证码错误",
                                required: "请输入验证码",
                                minlength: "请输入正确验证码"
                            }
                        },
                        submitHandler: function () {
                            $.post("/loginValidate", {
                                        userID: $("#userID").val(),
                                        userPswd: $("#userPswd").val(),
                                        userRole: getvalofswitch(),
                                    },
                                    function (data) {

                                        if (data == "success") {
                                            window.location.href = "/home";
                                        }
                                        else {
                                            $("#login_info").fadeIn();
                                            $("#login_info").fadeOut(3000);
                                        }

                                    }
                            )
                        },
                        errorPlacement: function (error, element) {
                            error.appendTo(element.parent().parent())

                        }
                    }
            )
        })
    </script>
    <style type="text/css" rel="stylesheet">
        body {
            background: url("/assets/image/background/2.jpg") no-repeat fixed center 0;
            background-size: cover;
             -webkit-background-size:  cover;
        }

        #box {
            background-color: black;
            opacity: 0.8;
            height: 0px;
            padding-bottom: 75%
        }

        form {
            margin-top: 8%;
        }

        .input-group {
            margin-top: 8%;
        }

        .headtitle {
            margin-top: 38%;
            opacity: 1;
            color: white;
        }

        .btn-success {
            margin-top: 6%;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
<div class="container" id="mycontainer">
    <div class="row">

        <div id="box" class="col-sm-offset-6 col-sm-5 ">
            <div class="headtitle col-md-offset-3 col-md-5">
                <h1><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;登录
                </h1>
            </div>
            <div class=" col-md-4"></div>
            <form class="form-horizontal col-sm-9 col-sm-offset-1" method="post" role="form" id="commentform">
                <di>
                    <div class="form-group input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user "></span>
                            </span>
                        <input type="text" minlength="6" class="form-control input-lg" name="userID"
                               id="userID" placeholder="用户"
                               required>
                    </div>
                </di>
                <div>
                    <div class="input-group form-group">

                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock "></span>
                            </span>

                        <input type="password" minlength="6" class="form-control input-lg" id="userPswd"
                               placeholder="密码"
                               required>

                    </div>
                </div>
                <div>
                    <div class="input-group form-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-check"></span>
                            </span>

                        <input type="text" minlength="4" class="form-control input-lg" id="validateCode"
                               name="validateCode"
                               placeholder="验证码" required>
                        <span class="input-group-addon">
                             <img id="changevalidate" src="/validate/code">
                            </span>
                    </div>
                </div>
                <div class="pull-right">
                    <input type="checkbox" id="role_control">
                </div>
                <div>
                    <input type="submit" id="submit" class="btn btn-block btn-lg pull-right btn-success"
                           value="登录">
                    <a href="https://www.baidu.com/">忘记密码？</a>
                </div>

                <div id="login_info" style="color: red;display: none">账号或者密码错误</div>
            </form>
        </div>
    </div>
</div>
<script>
    $("#role_control").bootstrapSwitch(
            {
                state: false,
                onText: "教师",
                offText: "学生",
                onColor: "success",
                offColor: "danger",
                size: "small",
                onInit: function () {
                    $(this).val("student");
                },
                onSwitchChange: function (event, state) {
                    if (state == true) {
                        $(this).val("teacher");
                    } else {
                        $(this).val("student");
                    }
                }
            });
    $("#role_control").bootstrapSwitch('state', true, false);
    // $('#role_control').bootstrapSwitch('setState', true);

    function getvalofswitch() {
     /*   alert($("#role_control").val())*/
        return $("#role_control").val();
    }
</script>
</body>

</html>