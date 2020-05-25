<%@page import="controller.OracleDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%-- 파일명 : 03PostLoginOracle.jsp --%>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	OracleDAO dao = new OracleDAO();
	boolean isMember = dao.isMember(user_id, user_pw);
	JSONObject jsonObj = new JSONObject();
	
	if(isMember == true){
		jsonObj.put("result", 1);
		jsonObj.put("message", "로그인 성공");
		String html = "";
		html += "<table class = 'table table-bordered' style = 'width : 300px;'>";
		html += "	<tr>";
		html += "		<td>회원님, 반갑습니다.</td>";
		html += "	</tr>";
		html += "</table>";
		
		jsonObj.put("html", html);
	}
	else {
		jsonObj.put("result", 0);
		jsonObj.put("message", "로그인 실패");
	}
	dao.close();
	String jsonTxt = jsonObj.toJSONString();
	out.println(jsonTxt);
%>