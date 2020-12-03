<%--
  Created by IntelliJ IDEA.
  User: sunshengwei-pc
  Date: 2020/3/10
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery-2.0.3.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
    <title>学生列表</title>
    <script>
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });
        });
    </script>
</head>
<body>
<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">

        <caption>学生列表 - 共${page.total}人</caption>
        <thead>
        <tr class="success">
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>出生日期</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${students}" var="s" varStatus="status">
            <tr>
                <td>${s.studentID}</td>
                <td>${s.name}</td>
                <td>${s.age}</td>
                <td>${s.sex}</td>
                <td>${s.birthday}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<nav class="pageDIV">
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=0">
                <span>首页</span>
            </a>
        </li>

        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=${page.start-page.count}">
                <span>上一页</span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">

            <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                    <a
                            href="?page.start=${status.index*page.count}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>
            </c:if>
        </c:forEach>

        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.start+page.count}">
                <span>下一页</span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.last}">
                <span>尾页</span>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>
