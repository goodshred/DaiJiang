<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showall.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div style="background-color:white;height:600px">
 <%
 	request.setCharacterEncoding("utf-8");
 	final String DBDRIVER = "com.mysql.jdbc.Driver";	
 	final String DBURL = "jdbc:mysql://127.0.0.1:3306/mydb";
 	final String DBUSER = "root";
 	final String DBPASS = "VB110119asd";
 	
 	Connection conn = null;
 	try{
 	Class.forName(DBDRIVER);
 	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
 	//System.out.println(conn);
 	String sql = "select id,name,hobby,zhuanye,xingbie,age,shoujihao,shengri from emp where 1=1  ";
 	
 	PreparedStatement pstmt = conn.prepareStatement(sql);
 	ResultSet rs = pstmt.executeQuery();
 %>

        <center>
        <a href="emp.jsp"><font color=blue>学生管理</font></a>
        </center>

        <%--<center>--%>
  		<%--<a href="dept.jsp"><font color=blue>部门管理</font></a>--%>
  		<%--</center>--%>
  
  		<%--<center>--%>
  		<%--<a href="salgrade.jsp"><font color=blue>工资等级管理</font></a>--%>
  		<%--</center>--%>
 
  		<%--<center>--%>
  		<%--<a href="xuesheng.jsp">显示所有学生信息</a>--%>
  		<%--</center>--%>
 
  		<center>
  		<a href="index.jsp">注销</a>
  		</center>
  			  <%
			rs.close();
			pstmt.close(); 
		}catch(Exception e){
			out.println(e);		
		}finally{
//			conn.close();
		}
	   %>
	   </div>
</body>
</html>
