package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entity.Reply;


public class ReplyDao  extends BaseDao{
	//静态，单例
	private static ReplyDao instences=new ReplyDao();//静态
	public static ReplyDao getInstences() {//get方法
		return instences;
	}
	private ReplyDao() {//单例
		// TODO Auto-generated constructor stub
	}
	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	//添加
	public int add(Reply reply){
		String sql="insert into t_reply (messageId,userId,createTime,contents) values(?,?,?,?)";
		String[] params={
				String.valueOf(reply.getMessageId()),
				String.valueOf(reply.getUserId()),
				String.valueOf(reply.getCreateTime()),
				reply.getContents()
		};
		return this.exeUpdate(sql, params);
	}
	//删除
	public int del(int id){
		String sql="delete from t_reply where id=?";
		String[] params={
				String.valueOf(id),
		};
		return this.exeUpdate(sql, params);
	}
	//修改
	public int upd(Reply reply){
		String sql="update t_reply set id=?,messageId=?,userId=?,createTime=?,contents=?";
		String[] params={
				String.valueOf(reply.getId()),
				String.valueOf(reply.getMessageId()),
				String.valueOf(reply.getUserId()),
				String.valueOf(reply.getCreateTime()),
				reply.getContents()
		};
		
		return this.exeUpdate(sql, params);
	}
	//查询单个
	public Reply findOne(int id){
		Reply reply=new Reply();
		try {
			conn=this.getConn();
			ps=conn.prepareStatement("select * from t_reply where id=?");
			ps.setInt(1,id);
			rs=ps.executeQuery();
			while(rs.next()){
				reply.setId(rs.getInt("id"));
				reply.setMessageId(rs.getInt("messageId"));
				reply.setUserId(rs.getInt("userId"));
				reply.setCreateTime(rs.getTime("createTime"));
				reply.setContents(rs.getString("contents"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.closeAll(rs, ps, conn);
		}
		return reply;
	}
	//查询全部
	public List findAll(){
		List list=new ArrayList();
		String sql="select * from t_reply";
		try {
			conn=this.getConn();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Reply reply=new Reply();
				reply.setId(rs.getInt("id"));
				reply.setMessageId(rs.getInt("messageId"));
				reply.setUserId(rs.getInt("userId"));
				reply.setCreateTime(rs.getTime("createTime"));
				reply.setContents(rs.getString("contents"));
				list.add(reply);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.closeAll(rs, ps, conn);
		}
		return list;
	}
	//查询全部
	public List findListBymess(int messageid){
		List list=new ArrayList();
		String sql="select * from t_reply where messageId=?";
		try {
			conn=this.getConn();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, messageid);
			rs=ps.executeQuery();
			while(rs.next()){
				Reply reply=new Reply();
				reply.setId(rs.getInt("id"));
				reply.setMessageId(rs.getInt("messageId"));
				reply.setUserId(rs.getInt("userId"));
				reply.setCreateTime(rs.getTime("createTime"));
				reply.setContents(rs.getString("contents"));
				list.add(reply);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.closeAll(rs, ps, conn);
		}
		return list;
	}
	public List findListByuser(int userid){
		List list=new ArrayList();
		String sql="select * from t_reply where userId=?";
		try {
			conn=this.getConn();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, userid);
			rs=ps.executeQuery();
			while(rs.next()){
				Reply reply=new Reply();
				reply.setId(rs.getInt("id"));
				reply.setMessageId(rs.getInt("messageId"));
				reply.setUserId(rs.getInt("userId"));
				reply.setCreateTime(rs.getTime("createTime"));
				reply.setContents(rs.getString("contents"));
				list.add(reply);
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

