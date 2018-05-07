<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">

  <title>My JSP 'index.jsp' starting page</title>

  <!--<link rel="stylesheet" type="text/css" href="styles.css">-->
</head>

<body >
<%--<center><h2><font color=blue><marquee width=50% bgcolor=red>欢迎学生信息信息管理系统</marquee></font></h2></center>--%>
<form action="dologin.jsp" method="post">
  <table border="0" align="center" width="300" bgcolor=#f5f5dc>
    <tr>
      <td width="30%"><font color=blue>管理员账号</font></td>
      <td width="70%"><input type="text" name="uname" /></td>
    </tr>
  </table>
  <table border="0" align="center" width="300" bgcolor=#f5f5dc>
    <tr>
      <td width="30%"><font color=blue>密码</font></td>
      <td width="70%"><input type="text" name="upwd" /></td>
    </tr>
  </table>
  <table border="0" align="center" width="300" bgcolor=#f5f5dc>
    <tr>
      <td width="30%"></td>
      <td width="70%"><input type="submit" value="登录" /></td>
    </tr>
  </table>

</form>
</body>
</html>

