package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BaseDao {
		private static String URL="jdbc:mysql://localhost:3306/talk";
		private static String USERNAME="root";
		private static String PASSWORD="admin";
		public Connection getConn(){
			Connection conn=null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(URL, USERNAME, PASSWORD);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			if(conn!=null){
//				System.out.println("数据库链接成功!");
//			}else{
//				System.out.println("数据库链接失败!");
//			}
			return conn;
		}
		
		
		public void closeAll(ResultSet rs,PreparedStatement ps,Connection conn){
			if(rs!=null){
				try {
					rs.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			if(ps!=null){
				try {
					ps.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		
		public int exeUpdate(String sql,String[] params){
			Connection conn=this.getConn();
			PreparedStatement ps=null;
			int flag=-1;
			try {
				ps=conn.prepareStatement(sql);
				for (int i = 0; i < params.length; i++) {
					ps.setString(i+1,params[i]);
				}
				flag=ps.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally{
				closeAll(null, ps, conn);
			}
			return flag;
		}
}
