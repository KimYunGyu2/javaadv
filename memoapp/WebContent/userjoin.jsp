<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bootstrap 5 Login Form Example</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="signin.css" rel="stylesheet">
    </head>
    
 

    <body>
    
       <script type="text/javascript">
    function fn_submit() {
    	var f = document.frm;
    	if(f.userid.value =="") {
    		alert("아이디를 입력해주세요.");
    		f.userid.focus();
    		return false;
    	}
    	if(f.userpw.value =="") {
    		alert("비밀번호를 입력해주세요.");
    		f.userpw.focus();
    		return false;
    	}
    	if(f.username.value =="") {
    		alert("별명을 입력해주세요.");
    		f.userpw.focus();
    		return false;
    	}
    	f.submit();
    }
    </script>
    
    
    <!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
		
        <div class="container-fluid vh-100" style="margin-top:100px">
            <div class="" style="margin-top:150px">
                <div class="rounded d-flex justify-content-center">
                    <div class="col-md-4 col-sm-12 shadow-lg p-5 bg-light">
                        <div class="text-center">
                            <h3 class="text-primary">회원가입</h3>
                        </div>
                        <form name = "frm" action="useradd.jsp" method="post">
                            <div class="p-4">
                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"><i
                                            class="bi bi-person-plus-fill text-white"></i></span>
                                    <input type="text" name="userid" class="form-control" placeholder="아이디" required>
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"><i
                                            class="bi bi-key-fill text-white"></i></span>
                                    <input type="password" name="userpw" class="form-control" placeholder="비밀번호" required>
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"><i
                                            class="bi bi-person-plus-fill text-white"></i></span>
                                    <input type="text" name="username" class="form-control" placeholder="별명" required>
                                </div>
                                
                                <button class="btn btn-primary text-center mt-2" type="submit" onclick="fn_submit(); return false;">  가입 </button>
                                                                
                            </div>
                        </form>
                                       
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
    </body>

</html>