package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.User;

public class UserDao  extends BaseDao{
	//静态，单例
	private static UserDao instences=new UserDao();//静态
	public static UserDao getInstences() {//get方法
		return instences;
	}
	private UserDao() {//单例
		// TODO Auto-generated constructor stub
	}
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	//添加
	public int add(User u){
		String sql="insert into t_user (name,loginName,loginPwd) values(?,?,?)";
		String[] params={
				
				u.getName(),
				u.getLoginName(),
				u.getLoginPwd()
		};
		return this.exeUpdate(sql, params);
	}
	//删除
	public int del(int id){
		String sql="delete from t_user where id=?";
		String[] params={
				String.valueOf(id),
		};
		return this.exeUpdate(sql, params);
	}
	//修改
	public int upd(User u){
		String sql="update t_user set name=?,loginName=?,loginPwd=? where id=?";
		String[] params={
				u.getName(),
				u.getLoginName(),
				u.getLoginPwd(),
				String.valueOf(u.getId())
		};
		
		return this.exeUpdate(sql, params);
	}
	//查询单个
	public User findOneById(int id){
		User user=new User();
		try {
			conn=this.getConn();
			ps=conn.prepareStatement("select * from t_user where id=?");
			ps.setInt(1,id);
			rs=ps.executeQuery();
			while(rs.next()){
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setLoginName(rs.getString("loginName"));
				user.setLoginPwd(rs.getString("loginPwd"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.closeAll(rs, ps, conn);
		}
		return user;
	}
	public User findOneByName(String name){
		User user=new User();
		try {
			conn=this.getConn();
			ps=conn.prepareStatement("select * from t_user where name=?");
			ps.setString(1,name);
			rs=ps.executeQuery();
			while(rs.next()){
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setLoginName(rs.getString("loginName"));
				user.setLoginPwd(rs.getString("loginPwd"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.closeAll(rs, ps, conn);
		}
		return user;
	}
	//查询全部
	public List findAll(){
		List list=new ArrayList();
		String sql="select * from t_user";
		try {
			conn=this.getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setLoginName(rs.getString("loginName"));
				user.setLoginPwd(rs.getString("loginPwd"));
				list.add(user);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.closeAll(rs, ps, conn);
		}
		return list;
	}
}
