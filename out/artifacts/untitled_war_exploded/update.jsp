<%@page import="java.sql.ResultSet"%>
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
    
    <title>My JSP 'update.jsp' starting page</title>
    
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
 <%
 	 request.setCharacterEncoding("utf-8");
	String oper = request.getParameter("oper");
	
	final String DBDRIVER = "com.mysql.jdbc.Driver";	
 	final String DBURL = "jdbc:mysql://127.0.0.1:3306/mydb";
 	final String DBUSER = "root";
 	final String DBPASS = "VB110119asd";
 	
 	Connection conn = null;
 	
 	if(oper !=null && oper.length()>0){
 		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String hobby = request.getParameter("hobby");
		String zhuanye = request.getParameter("zhuanye");
		int xingbie = Integer.parseInt(request.getParameter("xingbie"));
		int age = Integer.parseInt(request.getParameter("age"));
		String shoujihao = request.getParameter("shoujihao");
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
		Date shengri=sf.parse(request.getParameter("shengri"));
		
		try{
		Class.forName(DBDRIVER);
	 	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
	 	String sql = "update emp set name=?,hobby=?,zhuanye=?,xingbie=?,age=?,shoujihao=?,shengri=? where id=? ";
	 	PreparedStatement pstmt = conn.prepareStatement(sql);
	 	
	 	pstmt.setString(1,name);
	 	pstmt.setString(2,hobby);
	 	pstmt.setString(3,zhuanye);
	 	pstmt.setInt(4,xingbie);
	 	pstmt.setInt(5,age);
	 	pstmt.setString(6,shoujihao);
	 	String sfDate = sf.format(shengri);
  		pstmt.setString(7,request.getParameter("shengri"));
  		pstmt.setInt(8,id);
  				
	 	pstmt.executeUpdate();
	 	pstmt.close();
	 	}catch(Exception e){
	 		out.println(e);
	 	}finally{
	 		conn.close();
	 	}
	 	response.sendRedirect("emp.jsp");
 	}else{
		int id = Integer.parseInt(request.getParameter("id"));
		try{
 		Class.forName(DBDRIVER);
	 	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
	 	String sql = "select name,hobby,zhuanye,xingbie,age,shoujihao,shengri from emp where id = ?";
	 	PreparedStatement pstmt = conn.prepareStatement(sql);
	 	pstmt.setInt(1,id);

 		ResultSet rs = pstmt.executeQuery();
 		if(rs.next()){
 			String name = rs.getString(1);
 			String hobby = rs.getString(2);
 			String  zhuanye = rs.getString(3);
 			int xingbie = rs.getInt(4);
 		    int age = rs.getInt(5);
 			String  shoujihao=rs.getString(6);
 			Date shengri=rs.getDate(7);
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
		    String sfDate = sf.format(shengri);
 	%>
    <center>
    	编辑员工信息
    	<form action="update.jsp" method="post">
    		<input type="hidden" name="oper" value="1">
    		<table>
    			<tr>
    				<td>学号：</td>
    				<td><input type="text" name="id" readonly="readonly" value="<%=id %>"></td>
    			</tr>
    			<tr>
    				<td>姓名：</td>
    				<td><input type="text" name="name" value="<%=name %>"></td>
    			</tr>
    			<tr>
    				<td>爱好：</td>
    				<td><input type="text" name="hobby" value="<%=hobby %>"></td>
    			</tr>
    			<tr>
    				<td>专业：</td>
    				<td><input type="text" name="zhuanye" value="<%=zhuanye %>"></td>
    			</tr>
    			<tr>
    				<td>性别：</td>
    				<td><input type="text" name="xingbie" value="<%=xingbie %>"></td>
    			</tr>
    			<tr>
    				<td>年龄：</td>
    				<td><input type="text" name="age" value="<%=age %>"></td>
    			</tr>
    			<tr>
    				<td>手机号：</td>
    				<td><input type="text" name="shoujihao" value="<%=shoujihao %>"></td>
    			</tr>
    			<tr>
    				<td>出生日期：</td>
    				<td><input type="text" name="shengri" value="<%=sfDate %>"></td>
    			</tr>
    		</table>
    		<input type="submit" value="保存">
    		<input type="reset" value="重置">
    	</form>
    </center>
 	<%
 		}
 		rs.close();
 		pstmt.close();
 		}catch(Exception e){
 			out.println(e);
 		}finally{
// 			conn.close();
 		}
 	}
 	
 	
  %>

  </body>
</html>
