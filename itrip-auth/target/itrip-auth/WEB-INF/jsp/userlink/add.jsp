<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/12/11
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增用户常用联系人</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
        $(function () {
            /*$("#btn").click(function () {
                var str = {
                    "linkUserName": $("#name").val()
                };
                var arrs = JSON.stringify(str);
                $.ajax({
                    "url": "http://localhost:8001/itrip-biz/api/userinfo/queryuserlinkuser",
                    "type": "POST",
                    "contentType": 'application/json',
                    "dataType": "json",
                    "data": arrs,
                    "success": function (data) {
                        console.log(data);
                        if (data.success == "true") {
                           alert("新增数据成功");
                           window.location.href="";
                        } else {
                            alert("新增失败");
                        }
                    },
                    beforeSend: function (request) {
                        request.setRequestHeader("token", $.cookie("token"));
                    }
                });
            });*/
            var linkUserName = $("#linkUserName");
            $("#linkUserName").blur(function () {
                if (linkUserName.val() == "" || linkUserName.val() == null) {
                    // alert("用户名不能为空");
                }
            });
        });

       /* $("#activateId").click(function () {
            $("#div_activate").css("display", "block");
        })*/


</script>
<body>
<div id="div_register" align="center">
    <form action="http://localhost:8001/itrip-biz/api/userinfo/insertuserlinkuse" method="post">
    <ul class="left-form">
        <h2>新增常用联系人</h2>
        <li>
            常用联系人姓名<input type="text" name="linkUserName" id="linkUserName"  placeholder="linkUserName" required/>
            <a href="#" class="icon ticker"> </a>
            <div class="clear"> </div>
        </li>
        <li>
            证件类型<input type="text" name="linkIdCardType" id="linkIdCardType"  placeholder="linkIdCardType" required/>
            <a href="#" class="icon ticker"> </a>
            <div class="clear"> </div>
        </li>
        <li>
            证件号码<input type="text" name="linkIdCard" id="linkIdCard" placeholder="linkIdCard" required/>
            <a href="#" class="icon ticker"> </a>
            <div class="clear"> </div>
        </li>
        <li>
            用户ID<input type="userId" name="userId" id="userId"  placeholder="userId" required/>
            <a href="#" class="icon into"> </a>
            <div class="clear"> </div>
        </li>
        <input type="submit" id="btn" value="Create Account"><br/>
        <input type="reset" id="reset" value="重置">
        <div class="clear"> </div>
    </ul>
    </form>
</div>
</body>
</html>
