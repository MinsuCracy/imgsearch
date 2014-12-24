<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Management Page</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
        table{
            border: 0px;
            text-align: center;
            text-decoration-color: blue;
        }

        a{
           text-decoration: none;
        }

        #menu{
            margin: auto;
            width: auto;
            max-width: 500px;
        }

        #content{
                }

        .textCenter{
            text-align: center;
        }
    </style>


</head>
<body>
<!--임시메뉴 구성 DIV-->
    <div id="menu">
        <table>
            <tr>
            	<td><a href="regist">회원정보 추가</a></td>
            	<td>|</td>
                <td><a href="#">회원정보 조회</a></td>
                <td>|</td>
                <td><a href="remove">회원정보 삭제</a></td>
                <td>|</td>
                <td><a href="#">추가 될 내용</a></td>
            </tr>
        </table>
    </div>

    <!--임시컨텐츠 구성 DIV-->
    <div id="content">
        <h1 class="textCenter">실험용 공간</h1>

        <div id="finder">
            <table>
                <tr>
                    <form method="post">
                    <td>아이디 또는 이메일 : </td>
                    <td><input type="text" name="inputData" value=""><input type="button"  onclick="inquiryAction()" value="조회"></td>
                    </form>
                    <td><input type="button" href="#" onclick="listAction()" value="리스트"></td>

                </tr>
            </table>

        </div>

        <div id="user_list">
            <table id="tt"></table>
        </div>
        
        <div id="user_info"></div>
        <div id="user_delete"></div>

    </div>
    
    <script>
    function inquiryAction(){
    	var inputData = $("[name='inputData']").val();
    	$.ajax({
    		url : "userinquiry",
    		type : "get",
    		data : {"inputData" : inputData},
    			
    		success : function(result){
    			var str = '';
    			for(var i in result){
    				str+= '<div>';
    				str+= result[i].u_id +' '+ result[i].u_email+' '+result[i].u_age+''+result[i].u_gender+''+result[i].u_job;
    				/* str+='<button onclick=cmtDelete('+result[i].rno+')>x</button>'; */
    				str+= '</div>';
    			}
    			$("#user_list").empty();
    			$("#user_list").append(str);
    		}
    	});
    }
    
    function listAction(){
    	$.ajax({
    		url : "userlist",
    		type : "get",
    		success : function(result){
    			var str = '';
    			for(var i in result){
    				str+="<div><a href='userread?u_no=";
    				str+=result[i].u_no+"'>"
    				str+=result[i].u_id +' '+result[i].u_email+' '+result[i].u_age+' '+result[i].u_gender+' '+result[i].u_job;
    				str+='</a></div>';
    			}
    			$("#user_list").empty();
    			$("#user_list").append(str);
    		}
    	})
    }
    
    </script>





</body>
</html>