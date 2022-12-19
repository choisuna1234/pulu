<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
 <!-- 의종: 주문완료 페이지 -->
<html>
<head>
<style>
.bankBenefit { position:relative; margin:20px 0 0; padding:10px 5px 10px 105px; border:5px solid #e8e8e8; color:#353535; line-height:1.5; }
.bankBenefit h3 { position:absolute; left:0; top:0; width:105px; height:100%; color:#353535; font-size:12px; text-align:center; }
 .bankBenefit h3 strong { display:table; width:105px; height:100%; }
 .bankBenefit h3 strong span { display:table-cell; vertical-align:middle; }
 .bankBenefit .info { padding:0 0 0 15px; border-left:1px solid #e8e8e8; }
 .bankBenefit .info .mileage { margin:6px 0 0; padding:10px 0 0; border-top:1px solid #e8e8e8; *zoom:1; }
 .bankBenefit .info .mileage:after { content:""; display:block; clear:both; }
 .bankBenefit .info .displaynone + .mileage { margin:0; padding:0; border:0; }
 .bankBenefit .info .mileage li { float:left; margin:0 40px 0 0; }
 .bankBenefit .info .mileage li a { text-decoration:none; }
 .bankBenefit .info .mileage li strong { color:#008bcc; }
/* 주문완료 */
 .orderInfo { width:380px; margin:45px auto 0; padding:0 0 10px 130px; color:#353535; line-height:1.5; background:url("http://img.echosting.cafe24.com/skin/base_ko_KR/order/bg_result.gif") no-repeat 0 10px; }
 .orderInfo p { margin:0 0 20px; }
 .orderInfo p strong { display:block; margin:0 0 7px; color:#000; font-size:20px; font-family:gulim,sans-serif; }
 .orderInfo p a { color:#008bcc; text-decoration:underline; font-weight:bold; }
 .orderInfo li strong { font-size:14px; letter-spacing:-1px; } 
/* Title */
 .title { margin:40px 0 10px 10px; }
 .title h3 { color:#353535; font-size:12px; }
/* View */
 .boardView { border:1px solid #d7d5d5; }
.boardView table { table-layout:fixed; color:#353535; line-height:1.5; }
 .boardView th { width:120px; padding:11px 0 10px 19px; border-top:1px solid #e9e9e9; border-right:1px solid #e9e9e9; font-weight:normal; text-align:left; background:#fbfafa; }
 .boardView td { width:auto; padding:11px 0 10px 10px; border-top:1px solid #e9e9e9; }
 .boardView img { vertical-align:middle; }  
/* List */
.orderArea table.areaBoard {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin: 20px 10px;
}
.orderArea table.areaBoard th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #efefef;
}
.orderArea table.areaBoard td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
 
 }
 .btnArea { overflow:hidden; margin:20px 0 0; text-align:right; *zoom:1; }
 .btnArea span.left { float:left; }
 .btnArea span.right { float:right; }
</style>
</head>
<body>
<div module="Order_result" unroll=1>

    
    <!-- 혜택정보 -->
    <div class="bankBenefit">
      
        <h3><strong><span>혜택정보</span></strong></h3>
        <div class="info" >
            <div class="member">
                <p><strong></strong> 님은, 브론즈 회원이십니다.</p>           
            </div>
            <ul class="mileage">             
                <li><a href="">쿠폰 : <strong>0개</strong></a></li>
            </ul>
        </div>
    </div>
    <!-- 주문완료 -->
    <div class="orderInfo">
        <p>
            <strong>고객님의 주문이 완료 되었습니다.</strong>
            주문내역 및 배송에 관한 안내는 <a href="/">주문조회</a> 를 통하여 확인 가능합니다.
       </p>
        
        <br><br><br><br>
    </div>
  
    <!-- 결제정보 -->
    <div class="orderArea">
      
        <div class="boardView">
            <table border="0" align="center">
            
            <tbody>
                <tr>
                    <th scope="row">최종결제금액</th>
                    <td class="price">
                       ${map.ORDER_GOODS_PRICE * map.ORDER_GOODS_AMOUNT + 3000}
                       </td>
                </tr>
                <tr>
                    <th scope="row">결제수단</th>
                    <td>
                        <strong>무통장 입금</strong>
                       <h1 align="center">대명은행 012-456789-01-123 (주)푸르뎁</h1>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>
    </div>
    <!-- 주문 상품 정보 -->
    <div class="orderListArea">
        <div class="title">
            <h3>주문 상품 정보</h3>
        </div>
        <!-- 기본배송 -->
        <table border="0" class="boardList" align="center"  >
            <thead>
                <tr>
                    <th scope="col" class="thumb">이미지</th>                  
                    <th scope="col" class="product">상품정보</th>
                    <th scope="col" class="amount">수량</th> 
                    <th scope="col" class="price">판매가</th>          
                </tr>
            </thead>
   
            <tbody module="Order_normalresultlist">
                <tr>
                    <td class="thumb" >
                       <img src='./resources/file/${map.ORDER_GOODS_IMAGE}' width=200px; height=200px;/>
                    </td>
                    <td class="product" width=200px; height=200px;>
                       <strong>${map.ORDER_GOODS_NAME}</strong>         
                    </td>
                    <td class="amount" width=200px; height=200px;>
                       <strong>${map.ORDER_GOODS_AMOUNT }</strong>
                    </td>
                    <td class="price" width=200px; height=200px;>
                        <strong>${map.ORDER_GOODS_PRICE }</strong>
                    </td>
            </tbody>
        </table>
    
   
    <!-- 배송지정보 -->
    <div class="orderArea">
        <div class="title">
            <h3>배송지정보</h3>
        </div>
        <div class="boardView">
            <table border="0" class="areaBoard" align="center" >      
            <tbody>
                <tr>
                    <th scope="row">받으시는분</th>
                    <td>${map.ORDER_RECEIVE_NAME}</td>
                </tr>                                    
                <tr>
                    <th scope="row">주소</th>
                    <td>${map.ORDER_RECEIVE_ADDR1},${map.ORDER_RECEIVE_ADDR2}</td>                 
                </tr>               
                <tr>
                    <th scope="row">휴대전화</th>
                    <td>${map.PHONE}</td>
                </tr>
                <tr>
                    <th scope="row">배송메시지</th>
                    <td>${map.ORDER_MEMO}</td>
                </tr>          
                <tr class="">
                    <th scope="row">배송업체</th>
                    <td>우체국</td>
                </tr>
            </tbody>
            </table>
        </div>
    </div>
    
    <div class="btnArea">
        <span class="left">
            <a href="#none" onclick="{$action_print_spec}" class="{$print_spec_display|display}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_spec.gif" alt="거래명세서 인쇄" /></a>
            <a href="#none" onclick="{$action_print_pg_card}" class="{$print_pg_card_display|display}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_card.gif" alt="카드매출전표 인쇄" /></a>
        </span>
        <span class="right">
           <!--  <a href="/"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_ing.gif" alt="쇼핑계속하기" /></a> -->
            <a href="/main.pulu"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_check.gif" alt="메인화면으로" /></a>
        </span>
    </div>
    <!-- 이용안내 -->
    <div class="help">
    <br><br>
        <h3>이용안내</h3>
        <div class="content">
            <ul>         
                <li class="item2">배송은 결제완료 후 지역에 따라 3일 ~ 7일 가량이 소요됩니다. </li>
                <li class="item3">상품별 자세한 배송과정은 주문조회를 통하여 조회하실 수 있습니다.</li>
                <li class="item4">주문의 취소 및 환불, 교환에 관한 사항은 이용안내의 내용을 참고하십시오.</li>
            </ul>
        </div>
    </div>
  
</div>
</body>
</html>