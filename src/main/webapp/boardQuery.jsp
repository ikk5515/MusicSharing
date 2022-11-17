<%@page import="music.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="dbconn.jsp"%>

	<%
	int count = 0;
	
	String tab = request.getParameter("tab");
	session.setAttribute("tab", tab);

	String table = (String) session.getAttribute("tab");

	String sql = "select * from " + table + " order by 1 desc limit 5";
	String sql2 = "select count(*) from " + table;
	 
	Statement stat = null;
	ResultSet rs = null;

	Statement stat1 = null;
	ResultSet rs1 = null;
	
	stat = conn.createStatement(); /* Statment 객체생성 */
	rs = stat.executeQuery(sql); /* 쿼리 실행 */
	
	stat1 = conn.createStatement(); /* Statment 객체생성 */
	rs1 = stat1.executeQuery(sql2); /* 쿼리 실행 */

	
	
	if (table.equals("korMusic")) {
		String sql3	= "select * from " + table + "where korno < ? order by korno desc limit 5";
		ArrayList<korMusic> list = new ArrayList<>();
		while (rs.next()) {
			while (rs1.next()) {
				count = rs.getInt(1);
				break;
			}
			korMusic korMusic = new korMusic();
			korMusic.setKorno(rs.getInt(1));
			korMusic.setKorTitle(rs.getString(2));
			korMusic.setKorSinger(rs.getString(3));
			korMusic.setKorYoutube(rs.getString(4));
			korMusic.setKorKind(rs.getString(5));
			korMusic.setUserNick(rs.getString(6));
			korMusic.setKordate(rs.getString(7));
			list.add(korMusic); // 생성된 korMusic 객체를 리스트에 저장
		}
		request.setAttribute("count", count);
		request.setAttribute("list", list); // list를 request 영역에 저장

		rs.close();
		rs1.close();
		stat.close();
		stat1.close();
		conn.close();

		/* RequestDispatcher 객체 이용
		 넘겨줄 페이지를 RequestDispatcher 객체에 넣고,
		 이 객체가 가지고 있는 forward 메소드를 이용하여 데이터를 전달한다. 
		*/
		RequestDispatcher rd = request.getRequestDispatcher("korMainBoard.jsp");
		rd.forward(request, response);
	} else if (table.equals("abroadMusic")) {
		String sql3	= "select * from " + table + "where abrno < ? order by abrno desc limit 5";
		ArrayList<abroadMusic> list = new ArrayList<>();
		while (rs.next()) {
			while (rs1.next()) {
				count = rs.getInt(1);
				break;
			}
			abroadMusic abroadMusic  = new abroadMusic();
			abroadMusic.setAbrno(rs.getInt(1));
			abroadMusic.setAbrTitle(rs.getString(2));
			abroadMusic.setAbrSinger(rs.getString(3));
			abroadMusic.setAbrYoutube(rs.getString(4));
			abroadMusic.setAbrKind(rs.getString(5));
			abroadMusic.setUserNick(rs.getString(6));
			abroadMusic.setAbrdate(rs.getString(7));
			list.add(abroadMusic); // 생성된 abroadMusic 객체를 리스트에 저장
		}
		request.setAttribute("count", count);
		request.setAttribute("list", list); // list를 request 영역에 저장

		rs.close();
		rs1.close();
		stat.close();
		stat1.close();
		conn.close();

		/* RequestDispatcher 객체 이용
		 넘겨줄 페이지를 RequestDispatcher 객체에 넣고,
		 이 객체가 가지고 있는 forward 메소드를 이용하여 데이터를 전달한다. 
		*/
		RequestDispatcher rd = request.getRequestDispatcher("abroadMainBoard.jsp");
		rd.forward(request, response);
	}
	%>


</body>
</html>