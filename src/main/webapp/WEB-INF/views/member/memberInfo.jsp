<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

</head>

    
<div class="container">

      
      <h2>개인정보 조회</h2>
      
    </div>
      
      
        <h4 class="mb-3">개인정보</h4>
        <form class="needs-validation" >
         
              <label for="firstName" class="form-label">회원 ID</label>
              <input type="text" class="form-control" id="firstName" value="${M.MEMBER_ID }" readonly>

            
              <label for="lastName" class="form-label">회원 이름</label>
              <input type="text" class="form-control" id="lastName" value="${M.MEMBER_NAME }" readonly >
              
            
          
              <label for="username" class="form-label">회원 연락처</label>
                <input type="text" class="form-control" id="username" value="${M.MEMBER_PHONE }" readonly>
              
            
            
              <label for="email" class="form-label">Email </label>
              <input type="email" class="form-control" id="email" value="${M.MEMBER_EMAIL }" readonly>
              
            
              <label for="address" class="form-label">우편번호</label>
              <input type="text" class="form-control" id="address" value="${M.MEMBER_ZIPCODE }" readonly>
              
          
              <label for="address2" class="form-label">주소</label>
              <input type="text" class="form-control" id="address2" value="${M.MEMBER_ADDRESS1 }-${M.MEMBER_ADDRESS2}" readonly>
            
         <br/>
          <hr class="my-4">
          <button class="w-100 btn btn-primary btn-lg" type="button" onclick="location.href='pwCheck';">개인정보 수정하기</button>
        </form>
      

  
</div>
  

</body>
</html>