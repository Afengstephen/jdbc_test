<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>jdbc测试</title>
</head>
<body>
	<hr align="center" width="55%" color="#991111" size="5"/>
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		request.setCharacterEncoding("GBK");
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}
		catch(ClassNotFoundException ce){
			out.println(ce.getMessage());
		}
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			conn = DriverManager.getConnection(url,"scott","123456");
			stmt = conn.prepareStatement("select * from emp");
			
			rs = stmt.executeQuery();
			out.print("<TABLE BORDER='1' width='55%' cellpadding='3' align=center>");
			out.print("<TR><TD>"+"<b>Empno</b>"+"</TD>");
			out.print("<TD>"+"<b>Ename</b>"+"</TD>");
			out.print("<TD>"+"<b>Job</b>"+"</TD>");
			out.print("<TD>"+"<b>Mgr</b>"+"</TD>");
			out.print("<TD>"+"<b>hiredate</b>"+"</TD>");
			out.print("<TD align=center>"+"<b>Sal</b>"+"</TD>");
			out.print("<TD>"+"<b>Comm</b>"+"</TD>");
			out.print("<TD>"+"<b>Deptno</b>"+"</TD></TR>");
			
			while(rs.next()){
				out.print("<TR><TD>"+rs.getString(1)+"</TD>");
				out.print("<TD>"+rs.getString(2)+"</TD>");
				out.print("<TD>"+rs.getString(3)+"</TD>");
				out.print("<TD>"+rs.getString(4)+"</TD>");
				out.print("<TD>"+rs.getString(5)+"</TD>");
				out.print("<TD>"+rs.getString(6)+"</TD>");
				out.print("<TD>"+rs.getString(7)+"</TD>");
				out.print("<TD>"+rs.getString(8)+"</TD></TR>");
			}
			out.print("</TABLE>");
			
			rs.close();
			stmt.close();
			conn.close();
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
	%>
</body>
</html>