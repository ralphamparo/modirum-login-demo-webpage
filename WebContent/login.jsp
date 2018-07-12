<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>s
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<%
if (session == null ) {
	response.sendRedirect("home.jsp");
}
%>

<%
	ArrayList<String> usernames=new ArrayList<String>();  
	ArrayList<String> passwords=new ArrayList<String>();
	
	String filePath = new java.io.File("credentials.txt").getAbsolutePath();
			
	java.io.File file = new java.io.File(filePath);
	java.io.FileReader fileReader = new java.io.FileReader(file);
	java.io.BufferedReader bufferedReader = new java.io.BufferedReader(fileReader);
	String line;
	while ((line = bufferedReader.readLine()) != null) {
		String credential[]= line.split("=");
		usernames.add(credential[0]);
		passwords.add(credential[1]);
	}
	fileReader.close();


//create String Arrays for DB users and passwords
//String[] usernames = { "raprap", "rosamair" , "rosesophia"};   
//String[] passwords = { "amparo", "chua" , "loren"};

//retrieve parameters from the HTTP login request

boolean nullSession=false;

String name = String.valueOf(request.getParameter("name"));
String password = String.valueOf(request.getParameter("password"));

if(name.equals("null") && password.equals("null"))
{
	nullSession=true;
}

if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
{
try
{

boolean userLoggedIn=false;

for (int index=0; index < usernames.size(); index++) 
{
	
	if(name.equals(usernames.get(index).toString()) && password.equals(passwords.get(index).toString()))
	{
	session.setAttribute("name",name);
	session.setAttribute("password",password);
	session.setAttribute("loggedIn","true");
	
	response.sendRedirect("welcome.jsp");
	userLoggedIn=true;
	break;
	} 
}

if(!userLoggedIn && !nullSession)
{      
  response.sendRedirect("error.jsp");
}
else if(!userLoggedIn && nullSession)
{
	response.sendRedirect("welcome.jsp");
}
else{
	
}
}
catch(Exception e)
{
//out.println(e);
} finally{}
}else
{
	response.sendRedirect("error.jsp");
}
%>
</body>
</html>