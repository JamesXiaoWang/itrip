<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/12/5
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#div_register input[name='userCode']").blur(function () {
            var userCode = $("#div_register input[name='userCode']").val();
            $.ajax({
                "url": "${pageContext.request.contextPath}/api/user/ckusr",
                "type": "GET",
                "data": {"name": userCode},
                "dataType": "json",
                "success": function (data) {
                    console.log(data);
                }
            });
        });

        $("#btn").click(function () {
            var str = {
                "userCode": $("#div_register input[name='userCode']").val(),
                "userName": $("#div_register input[name='userName']").val(),
                "userPassword": $("#div_register input[name='userPassword']").val()
            };
            var arrs = JSON.stringify(str);
            $.ajax({
                "url": "${pageContext.request.contextPath}/api/user/doregister",
                "type": "POST",
                "data": arrs,
                "contentType": 'application/json',
                "dataType": "json",
                "success": function (data) {
                    console.log(data);
                    if (data.success == "true") {
                        console.log("注册成功，邮件发送成功");
                        $("#div_activate").css("display", "block");
                    } else {
                        console.log("注册失败，邮件发送失败");
                        $("#div_activate_fail").html("注册失败，邮件发送失败");
                    }
                }
            });
        });

        $("#activateTijiao").click(function () {
            var user = $("#div_activate input[name='user']").val();
            var code = $("#div_activate input[name='code']").val();

            alert(user);
            alert(code);
            $.ajax({
                "url": "${pageContext.request.contextPath}/api/user/activate",
                "type": "POST",
                "data": {"user": user, "code": code},
                "dataType": "json",
                "success": function (data) {
                    console.log(data);
                }
            });
        });

        $("#activateId").click(function () {
            $("#div_activate").css("display", "block");
        })
    });
</script>
<body>
<div id="div_register" align="center">
        <ul class="left-form">
            <h2>山寨注册:</h2>
            <li>
                邮箱<input type="text" name="userCode"  placeholder="userCode" required/>
                <a href="#" class="icon ticker"> </a>
                <div class="clear"> </div>
            </li>
            <li>
                昵称<input type="text" name="userName"  placeholder="Username" required/>
                <a href="#" class="icon ticker"> </a>
                <div class="clear"> </div>
            </li>
            <li>
                密码<input type="password" name="userPassword"   placeholder="password" required/>
                <a href="#" class="icon into"> </a>
                <div class="clear"> </div>
            </li>
            <label class="checkbox"><input type="checkbox" id="checkbox" name="checkbox"><i> </i>是否同意，注册了就不能反悔了</label>
            <input type="submit" id="btn" value="Create Account"><br/>
            <input type="button" id="activateId" value="激活已经有账号">
            <div class="clear"> </div>
        </ul>
    <div id="div_activate" style="display: none">
        <form>
            <table align="center">
                <tr>
                    <td>激活账号:</td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td><input type="text" name="user"></td>
                </tr>
                <tr>
                    <td>激活码:</td>
                    <td><input type="text" name="code"></td>
                </tr>
                <tr>
                    <td><input type="button" id="activateTijiao" value="提交"></td>
                    <td><input type="reset" value="重置"></td>
                    <div><a href="${pageContext.request.contextPath}/api/user/register_phone.html">手机注册</a></div>
                </tr>
            </table>
        </form>
    </div>
    <div id="div_activate_fail"></div>
</div>
</body>
</html>
