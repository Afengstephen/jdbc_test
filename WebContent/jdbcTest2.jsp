<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>jsp的jdbc</title>
<style>
	h2{
		text-align: center;
	}
	table{
		margin: 0 auto;
		border: 1px solid grey;
		border-collapse: collapse; 
	}
	table tr,td{
		border: 1px solid grey;
	}
	table tr:nth-child(odd){
		background-color: #E6EED6;
	}
	table tr:nth-child(even){
		background-color: #F6F6F6;
	}
</style>
</head>
<body>
	<h2>通过Java访问oracle数据库的emp表，然后返回页面</h2>
	<%
		Connection conn = null;  /* 创建一个数据库连接 */
		PreparedStatement ps = null;  /* 创建预编译语句 */
		ResultSet rs = null;   /* 创建一个结果集对象 */
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");  /* 加载oracle驱动程序 */
			System.out.println("开始连接oracle数据库...");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl","scott","123456");
			System.out.println("oracle数据库连接成功!");
			ps = conn.prepareStatement("select * from emp");  /* 实例化预编译语句 */
			rs = ps.executeQuery();         /* 执行查询，得到结果集 */
			
			out.print("<table cellpadding='4'>");
				out.print("<tr>");
					out.print("<td>"+"<b>EMPNO</b>"+"</td>");
					out.print("<td>"+"<b>ENAME</b>"+"</td>");
					out.print("<td>"+"<b>JOB</b>"+"</td>");
					out.print("<td>"+"<b>MGR</b>"+"</td>");
					out.print("<td>"+"<b>HIREDATE</b>"+"</td>");
					out.print("<td>"+"<b>SAL</b>"+"</td>");
					out.print("<td>"+"<b>COMM</b>"+"</td>");
					out.print("<td>"+"<b>DEPTNO</b>"+"</td>");
				out.print("</tr>");
			while(rs.next()){
				/* 当结果集不为空的时候 */
				out.print("<tr>");
					out.print("<td>"+rs.getString(1)+"</td>");
					out.print("<td>"+rs.getString(2)+"</td>");
					out.print("<td>"+rs.getString(3)+"</td>");
					out.print("<td>"+rs.getString(4)+"</td>");
					out.print("<td>"+rs.getDate(5)+"</td>");
					out.print("<td>"+rs.getDouble(6)+"</td>");
					out.print("<td>"+rs.getDouble(7)+"</td>");
					out.print("<td>"+rs.getString(8)+"</td>");
				out.print("</tr>");
			}
			out.print("</table>");
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			try{
				//逐一将上面的几个对象关闭，因为不关闭会影响性能、并且占用资源
				//注意关闭的顺序，最后使用的最先关闭
				if(rs != null){
					rs.close();
				}
				if(ps != null){
					ps.close();
				}
				if(conn != null){
					conn.close();
				}
				System.out.println("oracle数据库连接已关闭!");
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
</body>
</html>