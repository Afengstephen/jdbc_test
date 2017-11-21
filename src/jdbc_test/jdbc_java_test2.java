package jdbc_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class jdbc_java_test2 {
	public static void main(String[] args) {
		Connection conn = null;  //����һ�����ݿ�����
		PreparedStatement ps = null;  //����Ԥ�������
		ResultSet rs = null;     //����һ�����������
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //����oracle��������
			System.out.println("��ʼ����oracle���ݿ�");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl","scott","123456");
			System.out.println("oracle���ݿ����ӳɹ�");
			ps = conn.prepareStatement("select * from emp");  //ʵ����Ԥ�������
			rs = ps.executeQuery();    //ִ�в�ѯ���õ������
			while(rs.next()){
				//���������Ϊ�յ�ʱ��
				System.out.println("������"+rs.getString("ENAME")+" ������"+rs.getString("JOB"));
				System.out.println("���ʣ�"+rs.getDouble(6)); //����rs.getInt("SAL"),6���ֶε�����
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally{
			try{
				//��һ������ļ�������رգ���Ϊ���رջ�Ӱ�����ܡ�����ռ����Դ
				//ע��رյ�˳�����ʹ�õ����ȹر�
				if(rs != null){
					rs.close();
				}
				if(ps != null){
					ps.close();
				}
				if(conn != null){
					conn.close();
				}
				System.out.println("oracle���ݿ������ѹر�!");
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
