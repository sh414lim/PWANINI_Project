<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link rel="stylesheet" href="style/Header.css" />
    <link rel="stylesheet" href="style/footer.css" />
    <link rel="stylesheet" href="style/AdoptionDetail.css" />
  </head>
    <%@ include file="../include/Header.jsp" %>
  
  <body>
    <div class="Guide">
        <span>분양</span>
      </div>

          <div class="adoption_title">
              <img class="adoption_title_bener" src="./images/Adotion1.PNG"/>
              <img class="adoption_title_img" src="${paws.paws_img}"/>
      </div>

      <div class="adoption1_bener">
          <img class="adoption1_bener_fir" src="./images/Adoption3.PNG"/>
          <img src="./images/Adopiton2.PNG"/>
        </div>


        <div class="adoption1_bener_two">
            <img class="adoption1_bener_fir" src="./images/Adoption6.PNG"/>
            <img src="./images/Adoption7.PNG"/>
        </div>


    <div class="Bouns">
        <ul class="Bouns_ul">
          <li>
            <h3> <i class="fas fa-drumstick-bite lg"></i>신선한 사료</h3>
          </li>
          <li>
            <h3><i class="far fa-clock"></i>유통기한 100% 책임제</h3>
         
          </li>
          <li>
            <h3><i class="fas fa-shipping-fast"></i>신속! 정확! 배송!</h3>
          </li>
          <li>
            <h3><i class="fas fa-rss"></i>만원 이상 구매시 무료배송</h3>
          </li>
       	</ul>
      </div>
  
  </body>
     <%@ include file="../include/Footer.jsp" %>
  
</html>