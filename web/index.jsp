<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"   href="https://fonts.googleapis.com/css?family=Raleway">
<title>오늘의 동료</title>
<style>
body, h1 {
   font-family: "Raleway", sans-serif
}

body, html {
   height: 100%
}

.bgimg {
   background-image: url('Pimages/city1.PNG'); 
   min-height: 100%;
   background-position: center;
   background-size: cover;
}
</style>
</head>
<body>
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-xlarge">
    Today's Colleague
  </div>
  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top">Today's Colleague</h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p class="w3-large w3-center"><a href="/p/selectMain?num=1">Go to Main</a></p>
  </div>
  <div class="w3-display-bottomleft w3-padding-large">
    Made by <a href="#">Our Team</a>
  </div>
</div>

</body>
</html>