package jdbc_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class jdbc_java_test2 {
	public static void main(String[] args) {
		Connection conn = null;  //创建一个数据库链接
		PreparedStatement ps = null;  //创建预编译语句
		ResultSet rs = null;     //创建一个结果集对象
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //加载oracle驱动程序
			System.out.println("开始连接oracle数据库");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl","scott","123456");
			System.out.println("oracle数据库连接成功");
			ps = conn.prepareStatement("select * from emp");  //实例化预编译语句
			rs = ps.executeQuery();    //执行查询，得到结果集
			while(rs.next()){
				//当结果集不为空的时候
				System.out.println("姓名："+rs.getString("ENAME")+" 工作："+rs.getString("JOB"));
				System.out.println("工资："+rs.getDouble(6)); //或者rs.getInt("SAL"),6是字段的列数
			}
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
	}
}
