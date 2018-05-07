<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'add.jsp' starting page</title>
    
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
    <center>
    	新增学生
    	<form action="add.jsp" method="post">
    		<input type="hidden" name="oper" value="1">
    		<table>
    			<tr>
    				<td>学号：</td>
    				<td><input type="text" name="id"></td>
    			</tr>
    			<tr>
    				<td>姓名：</td>
    				<td><input type="text" name="name"></td>
    			</tr>
    			<tr>
    				<td>爱好：</td>
    				<td><input type="text" name="hobby"></td>
    			</tr>
    			<tr>
    				<td>专业：</td>
    				<td><input type="text" name="zhuanye"></td>
    			</tr>
    			<tr>
    				<td>性别：</td>
    				<td><input type="text" name="xingbie"></td>
    			</tr>
    			<tr>
    				<td>年龄：</td>
    				<td><input type="text" name="age"></td>
    			</tr>
    			<tr>
    				<td>手机号：</td>
    				<td><input type="text" name="shoujihao"></td>
    			</tr>
    			<tr>
    				<td>出生日期：</td>
    				<td><input type="text" name="shengri"></td>
    			</tr>
    		</table>
    		<input type="submit" value="保存">
    		<input type="reset" value="重置">
    	</form>
    </center>
<%
	request.setCharacterEncoding("utf-8");
	String oper = request.getParameter("oper");
	if(oper !=null && oper.length() > 0){
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String hobby = request.getParameter("hobby");
		String zhuanye = request.getParameter("zhuanye");
		int xingbie = Integer.parseInt(request.getParameter("xingbie"));
		int age = Integer.parseInt(request.getParameter("age"));
		String shoujihao = request.getParameter("shoujihao");
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
		Date shengri=sf.parse(request.getParameter("shengri"));
		
		final String DBDRIVER = "com.mysql.jdbc.Driver";	
	 	final String DBURL = "jdbc:mysql://127.0.0.1:3306/mydb";
	 	final String DBUSER = "root";
	 	final String DBPASS = "VB110119asd";
	 	
	 	Connection conn = null;
	 	try{
	 	Class.forName(DBDRIVER);
	 	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
	 	String sql = "insert into emp(id,name,hobby,zhuanye,xingbie,age,shoujihao,shengri) values(?,?,?,?,?,?,?,?)";
	 	PreparedStatement pstmt = conn.prepareStatement(sql);
	 	pstmt.setInt(1,id);
	 	pstmt.setString(2,name);
	 	pstmt.setString(3,hobby);
	 	pstmt.setString(4,zhuanye);
	 	pstmt.setInt(5,xingbie);
	 	pstmt.setInt(6,age);
	 	pstmt.setString(7,shoujihao);
	 	String sfDate = sf.format(shengri);
  		pstmt.setString(8,request.getParameter("shengri"));
	 	
	 	pstmt.executeUpdate();
	 	pstmt.close();
	 	}catch(Exception e){
	 		out.println(e);
	 	}finally{
//	 		conn.close();
	 	}
	 	response.sendRedirect("emp.jsp");
	}
 %>
  </body>
</html>