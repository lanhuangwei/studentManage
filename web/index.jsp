<%--
  Created by IntelliJ IDEA.
  User: sunshengwei-pc
  Date: 2020/3/10
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <script src="js/jquery-2.0.3.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
    <title>信息管理</title>
  </head>
  <body>
  <div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">

      <caption>信息管理选择</caption>
      <thead>
      <tr class="success">
        <th>序号</th>
        <th>姓名</th>
      </tr>
      </thead>

      <tbody>

        <tr>
          <td>
            <a href="/ListServlet" target="_blank">
              <span>管理信息</span>
            </a>
          </td>
          <td>
            <a href="/ListServlet">
              <span>查看信息</span>
            </a>
          </td>
        </tr>

      </tbody>
    </table>
  </div>
  </body>
</html>
