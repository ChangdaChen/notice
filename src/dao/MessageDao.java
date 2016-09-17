package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Message;

public class MessageDao  extends BaseDao{
	//静态，单例
	private static MessageDao instences=new MessageDao();//静态
	public static MessageDao getInstences() {//get方法
		return instences;
	}
	private MessageDao() {//单例
		// TODO Auto-generated constructor stub
	}
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	//添加
	public int add(Message m){
		String sql="insert into t_message (userName,title,createTime,contents) values(?,?,?,?)";
		String[] params={
				m.getUserName(),
				m.getTitle(),
				String.valueOf(m.getCreateTime()),
				m.getContents()
		};
		return this.exeUpdate(sql, params);
	}
	//删除
	public int del(int id){
		String sql="delete from t_message where id=?";
		String[] params={
				String.valueOf(id),
		};
		return this.exeUpdate(sql, params);
	}
	//修改
	public int upd(Message m){
		String sql="update t_message set id=?,userName=?,title=?,createTime=?,contents=?";
		String[] params={
				String.valueOf(m.getId()),
				m.getUserName(),
				m.getTitle(),
				String.valueOf(m.getCreateTime()),
				m.getContents()
		};
		
		return this.exeUpdate(sql, params);
	}
	//查询单个
	public Message findOne(int id){
		Message m=new Message();
		try {
			conn=this.getConn();
			ps=conn.prepareStatement("select * from t_message where id=?");
			ps.setInt(1,id);
			rs=ps.executeQuery();
			while(rs.next()){
				m.setId(rs.getInt("id"));
				m.setUserName(rs.getString("userName"));
				m.setTitle(rs.getString("title"));
				m.setCreateTime(rs.getTime("createTime"));
				m.setContents(rs.getString("contents"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.closeAll(rs, ps, conn);
		}
		return m;
	}
	//查询全部
	public List findAll(){
		List list=new ArrayList();
		String sql="select * from t_message";
		try {
			conn=this.getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Message m=new Message();
				m.setId(rs.getInt("id"));
				m.setUserName(rs.getString("userName"));
				m.setTitle(rs.getString("title"));
				m.setCreateTime(rs.getTime("createTime"));
				m.setContents(rs.getString("contents"));
				list.add(m);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.closeAll(rs, ps, conn);
		}
		return list;
	}
	//查询我的发帖
	public List findMy(String username){
		List list=new ArrayList();
		String sql="select * from t_message where userName=?";
		try {
			conn=this.getConn();
			ps=conn.prepareStatement(sql);
			ps.setString(1, username);
			rs=ps.executeQuery();
			while(rs.next()){
				Message m=new Message();
				m.setId(rs.getInt("id"));
				m.setUserName(rs.getString("userName"));
				m.setTitle(rs.getString("title"));
				m.setCreateTime(rs.getTime("createTime"));
				m.setContents(rs.getString("contents"));
				list.add(m);
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
