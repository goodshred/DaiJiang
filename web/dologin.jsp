<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>

		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>

	<body>
		<%
			// 获取用户名和密码
			String strUname = request.getParameter("uname");
			String strUpwd = request.getParameter("upwd");
			// 采用jdbc访问数据库
			// 驱动类的mingzi
			String strClass = "com.mysql.jdbc.Driver";
			// 连接字符串
			String strUrl = "jdbc:mysql://127.0.0.1:3306/mydb";
			// 用户名
			String strDBUser = "root";
			// 密码
			String strDBPwd = "VB110119asd";

			Connection conn;
			Statement st;
			// PreparedStatement  //建议使用。
			ResultSet rs;
			
			int count =0;
			// 加载驱动类
			try {
				Class.forName(strClass);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			try {
				conn = DriverManager.getConnection(strUrl, strDBUser, strDBPwd);
				st = conn.createStatement();
				rs = st.executeQuery("select count(*) ct from tb_user where uname='"+strUname+"' and upwd='"+strUpwd+"' ");
				
				while(rs.next())
				{
					count = rs.getInt("ct");
				
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			if(count>0)//？
			{
				request.getRequestDispatcher("/145.jsp").forward(request,response);
			}else{
				request.getRequestDispatcher("/index1.jsp").forward(request,response);
			}
		%>
	</body>
</html>
