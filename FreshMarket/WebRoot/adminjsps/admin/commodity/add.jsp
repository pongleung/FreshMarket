<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

</style>

<script type="text/javascript" src="<c:url value='/ajax-lib/ajaxutils.js'/>"></script>
    <script type="text/javascript">
    window.onload = new function(){
    	ajax(
    		  {
	    		url:"<c:url value='/AdminCommodityTypeServlet?method=getAllCommodityType'/>",
	    		callback:function(data) {
						var arr = data.split(",");
						// 循环遍历每个商品(种类编号:商品种类名称)，每个名称生成一个option对象，添加到<select>中
						
							for(var i = 0; i < arr.length; i++) {
								var a = arr[i].split(":");
								var op = document.createElement("option");//创建一个指名名称元素
								op.value = a[0];//设置op的实际值为当前的商品种类编号
								var textNode = document.createTextNode(a[1]);//创建文本节点
								op.appendChild(textNode);//把文本子节点添加到op元素中，指定其显示值
								
								document.getElementById("type").appendChild(op);
							}
					}
			   }
    	);
    };
    
    
    </script>
    <script type="text/javascript">
    		function _onClick(){
    			var isOK = true;
    			var cn = document.getElementById("cn").value;
    			var cp = document.getElementById("cp").value;
    			var op = document.getElementById("type");
    			var img = document.getElementById("img").value;
    			var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
    			if(cn.trim()==""){
    				alert("商品名称不能为空!!!");
    				isOK = false;
    			}else if(!reg.test(cn)){
    				alert("商品名称必须为中文!!");
    				isOK = false;
    			}
    			if(cp.trim()==""){
    				alert("商品价格不能为空!!");
    				isOK = false;
    			}else if(cp<=0 || cp!=parseInt(cp)){
    				alert("商品价格必须为正整数!!");
    				isOK = false;
    			}
    			if(op.value=="===请选择类型==="){
    				alert("请选择类型!!");
    				isOK = false;
    			}
    			if(img.trim()==""){
    				alert("请选择图片!!");
    				isOK = false;
    			}
    			
    			return isOK;
    		} 
    		
    		
    		
    		
    		
    </script>
    
    
    
    
  </head>
  
  <body>
    <h2>商品信息添加</h2>
    <form action="<c:url value='/AdminCommodityServlet?method=addCommodity'/>" method="post" enctype="multipart/form-data">
    	商品名称:<input type="text" name="commodityName" id="cn"><br>
    	商品类型:<select name="commodityTypeID" id="type">
    				<option >===请选择类型===</option>
  					
    			</select><br>
    	商品价格:<input type="text" name="commodityPrice" id="cp"><br>
    	商品图片:<input type="file" name="image" id="img"/><br/>
    	<input type="submit" value="添加" onclick="javascript:return _onClick()">
    
    </form>
  </body>
</html>
