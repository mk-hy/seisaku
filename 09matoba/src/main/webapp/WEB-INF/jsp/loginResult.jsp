<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%
// セッションスコープからユーザー情報を取得
User loginUser = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="neko.ico">
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
<meta charset="UTF-8">
<title>掲示板</title>
</head>
<body>
<div>
<h1>ひとことけいじばん<span class="mb">モバイルばん</span>ログイン</h1>
<img class="image" src = "neko2.png"alt="neko2"/>
<% if(loginUser != null) { %>
  <p>ログインに成功しました！</p>
  <p>ようこそ！<%= loginUser.getName() %>さん</p>
  <a href="Main">つぶやき投稿・閲覧へ</a>
<% } else { %>
  <p>ログインに失敗しました。</p>
  <a href="index.jsp">TOPへ</a>
<% } %>
</div>
</body>
</html>