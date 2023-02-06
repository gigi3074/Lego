<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="../resource/js/search_id.js"></script>
</head>
<form commandName="searchVO" id="createForm" action="${path}/account/search_result_id" method="post">
 
<body class="bg-gradient-primary">
<div class="container">
<!-- Outer Row -->
<div class="row justify-content-center">
 
<div class="col-xl-10 col-lg-12 col-md-9">
 
<div class="card o-hidden border-0 shadow-lg my-5">
<div class="card-body p-0">
<!-- Nested Row within Card Body -->
<div class="row">
<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
<div class="col-lg-6">
<div class="p-5">
  <div class="text-center">
      <h1 class="h4 text-gray-900 mb-2">사용자 아이디를 잊었나요?</h1>
      <p class="mb-4">We get it, stuff happens. Just enter your name and phon number below
          and we'll send you a link to reset your ID!</p>
  </div>
      <div class="form-group">
          <input type="text" class="form-control form-control-user"
              id="me_name" name="me_name"
              placeholder="Enter name...">
      </div>
      <div class="form-group">
          <input type="email" class="form-control form-control-user"
              id="me_tel" name="me_tel"
              placeholder="Enter phon number...">
      </div>
      <a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn btn-primary btn-user btn-block">
          Search ID
      </a>
  <hr>
     <div class="text-center">
      <a class="small" href="/account/register">Create an Account!</a>
  </div>
  <div class="text-center">
      <a class="small" href="/account/login">Already have an account? Login!</a>
  </div>
</div>
</div>
</div>
</div>
</div>
 
</div>
 
</div>
 
</div>
 
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
 
<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>
 
</body>
 
 
</form>
</html>
