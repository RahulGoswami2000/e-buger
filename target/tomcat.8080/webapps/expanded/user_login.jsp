<%-- 
    Document   : user_login
    Created on : 9 Sep, 2021, 9:26:17 AM
    Author     : ACER
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import = "java.sql.*,java.util.*,javax.swing.JFrame,javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username=(String)session.getAttribute("uname");
		String Username=request.getParameter("uname");
		String Password=request.getParameter("Pswd");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-buger","root","$712000Rahul");
		String sql="select username,password from user where username=? and password=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,Username);
		ps.setString(2,Password);
		ResultSet rs=ps.executeQuery();
		int c=0;
		while(rs.next()){
			c=c+1;
		}
		if(c==1){
			System.out.println("Username and password Match!");
			session.setAttribute("user",Username);
			ServletContext sc = getServletContext();
			sc.getRequestDispatcher("/bug_form.html").forward(request,response);
		}
		else{
			JFrame parent = new JFrame(); 
		    JOptionPane.showMessageDialog(parent, "Wrong Credentials!!");
		    ServletContext sc = getServletContext();
			sc.getRequestDispatcher("/index.html").forward(request,response);
		}
	%>
</body>
</html>

