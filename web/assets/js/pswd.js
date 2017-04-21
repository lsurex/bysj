/**
 * Created by lsure on 2017/3/28.
 */
$().ready(function () {
    $("#form_alterPswd").validate(
        {
            rules: {
                recPswd: {
                    remote: {
                        type: "post",
                        url: "/modify/pswd",
                        data: {
                            recPswd: function () {
                                return $("#recPswd").val();
                            }
                        }
                    }
                },
                newPswd: {
                    required: true,
                    minlength: 6
                },
                confirmPswd: {
                    equalTo: "#newPswd",
                    required: true
                }
            },
            messages: {
                recPswd: {
                    remote: "请输入正确密码",
                    required: "请输入密码"
                },
                newPswd: {
                    required: "请输入新的密码",
                    minlength: "密码长度不够"
                },
                confirmPswd: {
                    equalTo: "请再次输入相同的值"
                }
            },
            submitHandler: function () {
                $.post("/modify/update", {newPswd: $("#newPswd").val()}, function (data) {
                    if (data == true) {
                        alert("修改成功")
                        window.location.href("/logout");
                    }
                    else
                        alert("修改失败")
                });
            }

        }
    )
})