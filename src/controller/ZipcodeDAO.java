package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ZipcodeDAO
{
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	public ZipcodeDAO()
	{
		try
		{
			Context ctx = new InitialContext();
			DataSource source = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");
			con = source.getConnection();
			System.out.println("DBCP연결성공");
		} catch (Exception e)
		{
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}
	}

	//우편번호 테이블에서 시/도 가져오기
	public ArrayList<String> getSido()
	{
		ArrayList<String> sidoAddr = new ArrayList<>();
		String sql = "SELECT sido FROM zipcode WHERE 1=1 GROUP BY sido ORDER BY sido asc";
		try
		{
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next())
			{
				sidoAddr.add(rs.getString(1));
			}
			System.out.println("getSido()성공");
		} catch (Exception e)
		{
			System.out.println("getSido()실패");
			e.printStackTrace();
		}
		return sidoAddr;
	}

	//우편번호 테이블에서 각 시/도에 해당하는 구/군 가져오기
	public ArrayList<String> getGugun(String sido)
	{
		ArrayList<String> gugunAddr = new ArrayList<>();
		String sql = "SELECT DISTINCT gugun FROM zipcode WHERE sido = ? ORDER BY gugun DESC";
		try
		{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, sido);
			rs = psmt.executeQuery();
			while (rs.next())
			{
				gugunAddr.add(rs.getString(1));
			}
			System.out.println("getGugun()성공");
		} catch (Exception e)
		{
			System.out.println("getGugun()실패");
			e.printStackTrace();
		}
		return gugunAddr;
	}

	public void close()
	{
		try
		{
			if (rs != null)
			{
				rs.close();
			}
			if (psmt != null)
			{
				psmt.close();
			}
			if (con != null)
			{
				con.close();
			}
			System.out.println("자원반납시 성공");
		} catch (Exception e)
		{
			System.out.println("자원반납시 예외발생");
		}
	}
}
