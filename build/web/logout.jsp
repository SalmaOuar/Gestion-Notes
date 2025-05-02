
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session != null) {
        session.invalidate(); 
    }
    response.sendRedirect("login.jsp"); 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
