<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="myDiv">
		<form>
		<table class="table">
                    <thead>
			<tr>
                                        <th class="th-lg">id</th>
                                        <th class="th-lg">username</th>
                                        <th class="th-lg">password</th>
                                        <th class="th-lg">role</th>
                                        <th class="th-lg">name</th>
                                        <th class="th-lg">identifier</th>
			</tr>
                    </thead>
                    <tbody>
			<%
				List Li = new ArrayList();
				Iterator lr;

				if (request.getAttribute("userList") != null
						&& request.getAttribute("userList") != "") {
					List userList = (ArrayList) request.getAttribute("userList");
					Iterator itr = userList.iterator();

					while (itr.hasNext()) {
						Li = (ArrayList) itr.next();
						lr = Li.iterator();
						Integer id = (Integer) lr.next();
						String username = (String) lr.next();
						String password = (String) lr.next();
						String role = (String) lr.next();
                                                String name = (String) lr.next();
                                                String ident = (String) lr.next();
			%> 

			<tr>
				<td><%=id%></td>
				<td><%=username%></td>
				<td><%=password%></td>
				<td><%=role%></td>
                                <td><%=name%></td>
                                <td><%=ident%></td>
			</tr>

			<%
				}
				}
			%>
                    </tbody>
                </table>
		</form>
	</div>
</body>
</html>