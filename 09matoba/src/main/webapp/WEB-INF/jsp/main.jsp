<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ page import="model.User, model.Mutter, java.util.List" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%
// セッションスコープに保存されたユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
// リクエストスコープに保存されたつぶやきリストを取得
List<Mutter> mutterList = (List<Mutter>) request.getAttribute("mutterList");
//リクエストスコープに保存されたエラーメッセージを取得
String errorMsg = (String) request.getAttribute("errorMsg");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="neko.ico">
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
</script>
<title>掲示板</title>
</head>
<body>
<header>
<%
Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd H:mm:ss");
String today = sdf.format(date);
%>
  <div>
      <a><h1>ひとことけいじばん<span class="mb">モバイルばん</span>メイン</h1></a>
    <P>最終更新時刻：<%= today %></P>
    <img class="image" src = "neko2.png"alt="neko2"/>
    <ul id="nav">
      <li><a href="Main">更新</a></li>　　
      <li><a href="Logout">ログアウト</a></li>
      
    </ul>
    </div>

  </header>
<div>
<p>
<%= loginUser.getName() %>さん、ログイン中
<img src="neko4.png" width="50px" alt="neko4"/>
</p>
<form action="Main" method="post">
<input type="text" name="text">
<input type="submit" value="そうしん">

</form>
</div>

<% if(errorMsg != null){ %>
<p><%= errorMsg %></p>
<hr>
<% } %>

<% for(Mutter mutter : mutterList) {%>

<div class="box">
　<p><%= mutter.getUserName() %>さんのつぶやき</p>
<hr>
　<p><%= mutter.getText() %></p>

<ul class="command">
	  <li><a href="#"><img src="heart.png" width="40px" alt="ハート"></a></li>
      <li><a href="#"><img src="pen.png" width="26px" alt="ペン"></a></li>
      <li><a href="#"><img src="dust.png" width="30px" alt="ゴミ"></a></li>
    </ul>

</div>

<% } %>

<jsp:include page="footer.jsp" />
</body>
</html>