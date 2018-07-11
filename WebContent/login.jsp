<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<%
//create String Arrays for DB users and passwords
String[] usernames = { "raprap", "rosamair" , "rosesophia"};   
String[] passwords = { "amparo", "chua" , "loren"};

//retrieve parameters from the HTTP login request
String name = request.getParameter("name");
String password = request.getParameter("password");

if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
{
try{

boolean userLoggedIn=false;

for (int index=0; index < usernames.length; index++) {
	
	if(name.equals(usernames[index].toString()) && password.equals(passwords[index].toString()))
	{
	session.setAttribute("name",name);
	session.setAttribute("password",password);
	session.setAttribute("loggedIn","true");
	
	response.sendRedirect("welcome.jsp");
	userLoggedIn=true;
	break;
	} 
}

if(!userLoggedIn)
{      
  response.sendRedirect("error.jsp");
}else{}
}
catch(Exception e)
{
//out.println(e);
} 
}
else
{
	//getServletContext().getRequestDispatcher("home.jsp").include(request, response);
	response.sendRedirect("error.jsp");
}
%>
</body>
</html>