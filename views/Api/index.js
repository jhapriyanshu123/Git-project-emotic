<% if (!user) { %>
  <div style="width:500px;height:180px;">
    <h2 style="font-size:40px;">Welcome! Please log in.</h2>
    <a href="api/auth/facebook"><img src="fb-login.jpg" width="151" height="24"></a>
    </div>
<% } else { %>
    <h2>Hello, <%= user.username %>.</h2>
<% } %>
