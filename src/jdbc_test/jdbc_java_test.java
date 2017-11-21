package jdbc_test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jdbc_test")
public class jdbc_java_test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public jdbc_java_test(){
		super();
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","123456");
			stmt = conn.prepareStatement("select * from emp");
			rs = stmt.executeQuery();
			while(rs.next()){
				//System.out.println(rs.getString("empno"));
				response.getOutputStream().write(rs.getString("empno").getBytes());
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("hahahah");
		//request.getSession().setAttribute(arg0, arg1);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		doGet(request,response);
	}
}
