<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
 <!-- ����: �ֹ��Ϸ� ������ -->
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
/* �ֹ��Ϸ� */
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

    
    <!-- �������� -->
    <div class="bankBenefit">
      
        <h3><strong><span>��������</span></strong></h3>
        <div class="info" >
            <div class="member">
                <p><strong></strong> ����, ����� ȸ���̽ʴϴ�.</p>           
            </div>
            <ul class="mileage">             
                <li><a href="">���� : <strong>0��</strong></a></li>
            </ul>
        </div>
    </div>
    <!-- �ֹ��Ϸ� -->
    <div class="orderInfo">
        <p>
            <strong>������ �ֹ��� �Ϸ� �Ǿ����ϴ�.</strong>
            �ֹ����� �� ��ۿ� ���� �ȳ��� <a href="/">�ֹ���ȸ</a> �� ���Ͽ� Ȯ�� �����մϴ�.
       </p>
        
        <br><br><br><br>
    </div>
  
    <!-- �������� -->
    <div class="orderArea">
      
        <div class="boardView">
            <table border="0" align="center">
            
            <tbody>
                <tr>
                    <th scope="row">���������ݾ�</th>
                    <td class="price">
                       ${map.ORDER_GOODS_PRICE * map.ORDER_GOODS_AMOUNT + 3000}
                       </td>
                </tr>
                <tr>
                    <th scope="row">��������</th>
                    <td>
                        <strong>������ �Ա�</strong>
                       <h1 align="center">������� 012-456789-01-123 (��)Ǫ����</h1>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>
    </div>
    <!-- �ֹ� ��ǰ ���� -->
    <div class="orderListArea">
        <div class="title">
            <h3>�ֹ� ��ǰ ����</h3>
        </div>
        <!-- �⺻��� -->
        <table border="0" class="boardList" align="center"  >
            <thead>
                <tr>
                    <th scope="col" class="thumb">�̹���</th>                  
                    <th scope="col" class="product">��ǰ����</th>
                    <th scope="col" class="amount">����</th> 
                    <th scope="col" class="price">�ǸŰ�</th>          
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
    
   
    <!-- ��������� -->
    <div class="orderArea">
        <div class="title">
            <h3>���������</h3>
        </div>
        <div class="boardView">
            <table border="0" class="areaBoard" align="center" >      
            <tbody>
                <tr>
                    <th scope="row">�����ôº�</th>
                    <td>${map.ORDER_RECEIVE_NAME}</td>
                </tr>                                    
                <tr>
                    <th scope="row">�ּ�</th>
                    <td>${map.ORDER_RECEIVE_ADDR1},${map.ORDER_RECEIVE_ADDR2}</td>                 
                </tr>               
                <tr>
                    <th scope="row">�޴���ȭ</th>
                    <td>${map.PHONE}</td>
                </tr>
                <tr>
                    <th scope="row">��۸޽���</th>
                    <td>${map.ORDER_MEMO}</td>
                </tr>          
                <tr class="">
                    <th scope="row">��۾�ü</th>
                    <td>��ü��</td>
                </tr>
            </tbody>
            </table>
        </div>
    </div>
    
    <div class="btnArea">
        <span class="left">
            <a href="#none" onclick="{$action_print_spec}" class="{$print_spec_display|display}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_spec.gif" alt="�ŷ����� �μ�" /></a>
            <a href="#none" onclick="{$action_print_pg_card}" class="{$print_pg_card_display|display}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_card.gif" alt="ī�������ǥ �μ�" /></a>
        </span>
        <span class="right">
           <!--  <a href="/"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_ing.gif" alt="���ΰ���ϱ�" /></a> -->
            <a href="/main.pulu"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order_check.gif" alt="����ȭ������" /></a>
        </span>
    </div>
    <!-- �̿�ȳ� -->
    <div class="help">
    <br><br>
        <h3>�̿�ȳ�</h3>
        <div class="content">
            <ul>         
                <li class="item2">����� �����Ϸ� �� ������ ���� 3�� ~ 7�� ������ �ҿ�˴ϴ�. </li>
                <li class="item3">��ǰ�� �ڼ��� ��۰����� �ֹ���ȸ�� ���Ͽ� ��ȸ�Ͻ� �� �ֽ��ϴ�.</li>
                <li class="item4">�ֹ��� ��� �� ȯ��, ��ȯ�� ���� ������ �̿�ȳ��� ������ �����Ͻʽÿ�.</li>
            </ul>
        </div>
    </div>
  
</div>
</body>
</html>