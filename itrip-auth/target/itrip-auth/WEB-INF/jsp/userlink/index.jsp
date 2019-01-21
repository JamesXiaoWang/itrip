<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/retoken.js"></script>
    <script type="text/javascript">
        $(function () {
            $(function () {
                $("#search").click(function () {
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
                                var list = data.data;
                                $("#tabDiv").html("");
                                var tab = $("<table border='1'></table>").append("<tr><td>id</td><td>userId</td><td>用户名</td><td>电话</td><td>操作</td></tr>").appendTo($("#tabDiv"));
                                $(list).each(function () {
                                    tab.append("<tr><td>" + this.id + "</td><td>" + this.userId + "</td><td>" + this.linkUserName + "</td><td>" + this.linkPhone + "</td><td>"
                                        +"<input type='checkbox' name='message' />选中"+"<a href='#' class='del'>刪除</a><br><a href='#'class='update'>修改</a></td></tr>");
                                });

                                $(".del").click(function () {
                                    var  checked=[];
                                    if (confirm("是否删除?")) {
                                    $("input:checkbox:checked").each(function () {
                                        checked.push($(this).parent().siblings(0).html());
                                    });
                                    }
                                    /*var sid=[$(this).parent().siblings(0).html()];*/
                                     var arrs = JSON.stringify(checked);
                                    alert(arrs);
                                    $.ajax({
                                        "url": "http://localhost:8001/itrip-biz/api/userinfo/delUserLinkUse",
                                        "type": "POST",
                                        "contentType": 'application/json',
                                        "dataType": "json",
                                        "data": arrs,
                                        "success": function (data) {
                                            if (data.success == "true") {
                                                console.log("删除成功，删除联系人成功");
                                                $("#div_activate_fail").html("删除成功，删除联系人成功");
                                                alert("页面将在数秒后，转到主页面!!!!!!!!!!!")
                                                window.setInterval(refreshCount, 3500);
                                                function refreshCount() {
                                                    window.location.reload();
                                                }
                                            } else {
                                                console.log("删除失败，删除联系人失败");
                                                $("#div_activate_fail").html("删除失败，删除联系人失败");
                                            }
                                        },
                                        beforeSend: function (request) {
                                            request.setRequestHeader("token", $.cookie("token"));
                                        }
                                    });
                                });

                                $(".update").click(function () {
                                    var id=$(this).parent().siblings(0).html();
                                    var arrs = JSON.stringify(id);
                                    alert(arrs);
                                    $.ajax({
                                        "url": "http://localhost:8001/itrip-biz/api/userinfo/modify_search",
                                        "type": "POST",
                                        "contentType": 'application/json',
                                        "dataType": "json",
                                        "data": arrs,
                                        "success": function (data) {
                                            console.log(data);
                                            if (data.success == "true") {
                                                var list = data.data;
                                                $("#tabDiv").html("");
                                                var tab = $("<table border='1'></table>").append("<tr><td>id</td><td>userId</td><td>用户名</td><td>电话</td><td>操作</td></tr>").appendTo($("#tabDiv"));
                                                $(list).each(function () {
                                                    tab.append("<tr><td><input type='text' id='id' value="+this.id+">" +
                                                        "<input type='text' id='linkUserName' value="+this.linkUserName+"><input type='text' id='linkPhone' value="+this.linkPhone+">"+"<a href='#'class='update_btn'>修改</a></td></tr>");
                                                });
                                                $(".update_btn").click(function () {
                                                    var str = {
                                                        "id": $("#id").val(),
                                                        "linkUserName": $("#linkUserName").val(),
                                                        /*"linkIdCard": $("#div_add input[name='linkIdCard']").val(),*/
                                                        "linkPhone": $("#linkPhone").val()
                                                    };
                                                    var arrs = JSON.stringify(str);
                                                    alert(arrs);
                                                    $.ajax({
                                                        "url": "http://localhost:8001/itrip-biz/api/userinfo/modifyuserlinkuser",
                                                        "type": "POST",
                                                        "contentType": 'application/json',
                                                        "dataType": "json",
                                                        "data": arrs,
                                                        "success": function (data) {
                                                            console.log(data);
                                                            if (data.success == "true") {
                                                                console.log("修改成功，修改联系人成功");
                                                                $("#div_activate_fail").html("修改成功，修改联系人成功");
                                                                alert("页面将在数秒后，转到主页面!!!!!!!!!!!")
                                                                window.setInterval(refreshCount, 5000);
                                                                function refreshCount() {
                                                                    window.location.reload();
                                                                }
                                                            } else {
                                                                console.log("修改失败，修改联系人失败");
                                                                $("#div_activate_fail").html("修改失败，修改联系人失败");
                                                            }
                                                        },
                                                        beforeSend: function (request) {
                                                            request.setRequestHeader("token", $.cookie("token"));
                                                        }
                                                    });
                                                });
                                            }
                                        },
                                        beforeSend: function (request) {
                                            request.setRequestHeader("token", $.cookie("token"));
                                        }
                                    });
                                });

                            } else {
                                alert("token失效，请重新登录");
                            }
                        },
                        beforeSend: function (request) {
                            request.setRequestHeader("token", $.cookie("token"));
                        }
                    })
                });
            });

            $("#add").click(function(){
                        $("#div_add").css("display", "block");
            });
        });
        $(function () {
            $("#btn").click(function () {
                var str = {
                    "linkUserName": $("#div_add input[name='linkUserName']").val(),
                    /*"linkIdCardType": $("#div_add input[name='linkIdCardType']").val(),*/
                    "linkIdCard": $("#div_add input[name='linkIdCard']").val(),
                    "linkPhone": $("#div_add input[name='linkPhone']").val()
                };
                alert(str);
                var arrs = JSON.stringify(str);
                $.ajax({
                    "url": "http://localhost:8001/itrip-biz/api/userinfo/adduserlinkuser",
                    "type": "POST",
                    "data": arrs,
                    "contentType": 'application/json',
                    "dataType": "json",
                    "success": function (data) {
                        console.log(data);
                        if (data.success == "true") {
                            console.log("添加成功，新增联系人成功");
                            $("#div_activate_fail").html("添加成功，新增联系人成功");
                            alert("页面将在数秒后，转到主页面!!!!!!!!!!!")
                            window.setInterval(refreshCount, 5000);
                            function refreshCount() {
                                window.location.reload();
                            }
                        } else {
                            console.log("新增失败，新增联系人失败");
                            $("#div_activate_fail").html("新增失败，新增联系人失败");
                        }
                    }
                    ,beforeSend: function (request) {
                        request.setRequestHeader("token", $.cookie("token"));
                    }
                });
            });

        });
    </script>
</head>
<body>
<div align="center">
    旅客姓名：<input type="text" id="name"/>
    <input type="button" id="search" value="获取常用联系人列表"/>
    <input type="button" id="add" value="新增"/>
    <input type="button" id="del" value="删除"/>
    <input type="button" id="update" value="更新"/>
</div>
<div id="tabDiv" align="center">
</div>
<div id="tabDiv2" align="center">
   <%-- <th id="ckBox" style="text-align:center;width: 3%;"  data-bind="visible: deleteqx == '1'"> 
        <input type="checkbox" id="ckAll" onclick="CKAlls()" />
    </th>


    <td style="text-align:center;" data-bind="visible: deleteqx == '1'">
        <div>
            <input type="checkbox" name="subcheck" id="subcheck" data-bind="value: id" onclick="CKAllsOne()" />
        </div>
    </td>--%>
</div>
<div id="div_add" style="display: none" align="center">
<ul class="left-form">
    <h2>新增常用联系人</h2>
    <li>
        常用联系人姓名<input type="text" name="linkUserName" id="linkUserName"  placeholder="linkUserName" required/>
        <a href="#" class="icon ticker"> </a>
        <div class="clear"> </div>
    </li>
    <%--<li>证件类型
        <select name="linkIdCardType" id="linkIdCardType">
            <option value="">请选择</option>
            <option value="0">身份证</option>
            <option value="1">护照</option>
            <option value="2">学生证</option>
            <option value="3">军人证</option>
            <option value="4">驾驶证</option>
            <option value="5">旅行证</option>
        </select>
        <a href="#" class="icon ticker"> </a>
        <div class="clear"> </div>
    </li>--%>
    <li>
        证件号码<input type="text" name="linkIdCard" id="linkIdCard" placeholder="linkIdCard" required/>
        <a href="#" class="icon ticker"> </a>
        <div class="clear"> </div>
    </li>
    <li>
        手机号码<input type="text" name="linkPhone" id="linkPhone"  placeholder="linkPhone" required/>
        <a href="#" class="icon into"> </a>
        <div class="clear"> </div>
    </li>
    <input type="submit" id="btn" value="Create Account"><br/>
    <input type="reset" id="reset" value="重置">
    <div class="clear"> </div>
</ul>
    <div id="div_activate_fail"></div>
</div>
</body>
</html>
