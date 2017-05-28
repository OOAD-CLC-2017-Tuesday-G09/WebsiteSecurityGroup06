package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import model.HistoryLogin;
import model.User;

public class HistoryLoginDAOImpl implements HistoryLoginDao {

	@Override
	public boolean checkUser(String username) {
		Connection con = DBConnect.getConnection();
		String sql = "select * from LoginHistory where username='" + username + "'";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				con.close();
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public void addHistory(HistoryLogin h) {
		Connection con = DBConnect.getConnection();
		String sql = "insert into LoginHistory value(?,?,?,?)";
		PreparedStatement ps;

		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setInt(1, h.getId());
			ps.setString(2, h.getUsername());
			ps.setInt(3, h.getCountlogin());
			ps.setString(4, h.getIplogin());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void updateHistory(HistoryLogin u) {
		Connection con = DBConnect.getConnection();
		String sql = "update LoginHistory set id=?, countlogin=?, iplogin=?where username=?";
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ps.setInt(1, u.getId());
			ps.setInt(2, u.getCountlogin());
			ps.setString(3, u.getIplogin());
			ps.setString(4, u.getUsername());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public List<HistoryLogin> getList(String username) {
		Connection con = DBConnect.getConnection();
		String sql = "select * from LoginHistory where username='"+ username +"'";
		List<HistoryLogin> list = new ArrayList<HistoryLogin>();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String usernameh = rs.getString("username");
				int countlogin = rs.getInt("countlogin");
				String iplogin = rs.getString("iplogin");
				list.add(new HistoryLogin(id, usernameh, countlogin, iplogin));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public HistoryLogin getHitory(String name) {
		Connection con = DBConnect.getConnection();
		String sql = "select * from LoginHistory where username='" + name + "'";
		HistoryLogin u = new HistoryLogin();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String usernameh = rs.getString("username");
				int countlogin = rs.getInt("countlogin");
				String iplogin = rs.getString("iplogin");
				u = new HistoryLogin(id, usernameh, countlogin, iplogin);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
}
