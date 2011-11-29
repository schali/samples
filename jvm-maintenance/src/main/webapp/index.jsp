<%@page import="com.github.samples.jvmmaintenance.ActionServlet.ACTIONS"%>
<%@page import="com.github.samples.jvmmaintenance.ActionServlet"%>
<html>
<head>
<title>JVM Maintenance App</title>
</head>
<body>
	<h1>JVM Maintenance App</h1>
	
	<h2>Operations</h2>
	<ul>
		<li><a href="action?<%=ActionServlet.OPERATION_PARAM%>=<%=ACTIONS.GC%>">Perform Garbage Collection</a></li>
		<!--  <li><a href="action?<%=ActionServlet.OPERATION_PARAM%>=<%=ACTIONS.HEAPDUMP%>">Generate Heap Dump</a></li> -->
	</ul>
	
	<h2>JVM Status</h2>
	<ul>
	<li>Available Processors: <%= Runtime.getRuntime().availableProcessors() %></li>
	<li>Free Mem: <%= Runtime.getRuntime().freeMemory()/1024/1024 %>MB
	<li>Total Mem: <%= Runtime.getRuntime().totalMemory()/1024/1024 %>MB
	<li>Max Mem: <%= Runtime.getRuntime().maxMemory()/1024/1024 %>MB
	</ul>

	<h2>System Properties</h2>
	<ul><% 
		for(Object key : System.getProperties().keySet()){
			String value = System.getProperty(key.toString());
			out.println("<li>" + key + " = " + value + "</li>");
		}
	%></ul>
	
	<h2>System Environment</h2>
	<ul><% 
		for(String key : System.getenv().keySet()){
			String value = System.getenv(key);
			out.println("<li>" + key + " = " + value + "</li>");
		}
	%></ul>
	
</body>
</html>