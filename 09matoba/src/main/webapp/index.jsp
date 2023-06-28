<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
<link rel="shortcut icon" href="neko.ico">
<title>掲示板</title>
</head>
<body>
<div>
<h1>ひとことけいじばん<span class="mb">モバイルばん</span>へようこそ</h1>
<img class="image" src = "neko.png"alt="neko"/>
<form action="Login" method="post">
ユーザー名：<input type="text" name="name"><br>
パスワード：<input type="password" name="pass"><br>
<input type="submit" value="ログイン">

</div>
</form>
</body>
</html>