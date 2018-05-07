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
    
    <title>My JSP 'emp.jsp' starting page</title>
    
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
 	final String DBDRIVER = "com.mysql.jdbc.Driver";	
 	final String DBURL = "jdbc:mysql://127.0.0.1:3306/mydb";
 	final String DBUSER = "root";
 	final String DBPASS = "VB110119asd";
 	
 	Connection conn = null;
 	try{
 	Class.forName(DBDRIVER);
 	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
 	//System.out.println(conn);
 	String sql = "select id,name,hobby,zhuanye,xingbie,age,shoujihao,shengri from emp where 1=1 ";
 	
 	PreparedStatement pstmt = conn.prepareStatement(sql);
 	ResultSet rs = pstmt.executeQuery();
 %>
  	<center>
  	<div style="background:white"> 
	<p>学生全部信息表</p>

	  <table border="0" align="center" width="800" bgcolor=#f1c4cd>
	    	<tr>
	    		<td>学号</td>
	    		<td>姓名</td>
	    		<td>爱好</td>
	    		<td>专业</td>
	    		<td>性别</td>
	    		<td>年龄</td>
	    		<td>手机号</td>
	    		<td>出生日期</td>
	    		<td colspan="2">操作</td>
	    	</tr>
	    	
	  <%
			while(rs.next()){
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String hobby = rs.getString(3);
			    String  zhuanye = rs.getString(4);
			    int xingbie = rs.getInt(5);
			    int age = rs.getInt(6);
			    String  shoujihao = rs.getString(7);
			    Date shengri=rs.getDate(8);
			    SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
		        String sfDate = sf.format(shengri);
			    	  %>

	  		<tr>
	  			<td><%=id %></td>
	  			<td><%=name %></td>
	  			<td><%=hobby %></td>
	  			<td><%=zhuanye %></td>
	  			<td><%=xingbie %></td>
	  			<td><%=age %></td>
	  			<td><%=shoujihao %></td>
	  			<td><%=sfDate %></td>
	  			<td><a href="update.jsp?id=<%=id %>" style="color: aqua">更新</a></td>
	  			<td><a href="delete.jsp?id=<%=id %>" style="color: aqua">删除</a></td>
	  		</tr>
	  <%
			} 
			rs.close();
			pstmt.close(); 
		}catch(Exception e){
			out.println(e);		
		}finally{
			conn.close();
		}
	   %>
	   </table>
		<a href="add.jsp"><font color=blue>新增</font></a>
		<a href="145.jsp">返回首页面</a>
	   </div>
    </center>
  </body>
</html>
