function add()
{
	var name=document.myform.name.value;
	var password1=document.myform.password1.value;
	var password2=document.myform.password2.value;
	var phone=document.myform.phone.value;
	var email=document.myform.email.value;
	if(name==null||name.trim().length<=0)
	{
		alert("请输入姓名");
		return;
	}
	if(password1==null||password1.trim().length<=0||password2==null||password2.trim().length<=0)
	{
		alert("请输入密码");
		return;
	}
	else
	{
		if(password1!=password2)
		{
			alert("两次输入的密码不相同");
			return;
		}
	}
	if(phone==null||phone.trim().length<=0)
	{
		alert("请输入手机号");
		return;
	}
	else
	{
		var reg = /^1[3|4|5|7|8][0-9]{9}$/;
		var flag=reg.test(phone);
		if(!flag)
		{
			alert("手机号码格式错误");
			return;
		}
	}
	if(email==null||email.trim().length<=0)
	{
		alert("请输入邮箱");
		return;
	}
	else
	{
		var reg=/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
		var flag=reg.test(email);
		if(!flag)
		{
			alert("邮箱格式错误");
			return;
		}
	}
	document.myform.submit();
}
function login(){
	var name=document.loginform.name.value;
	var password=document.loginform.password.value;
	if(name==null||name.trim().length<=0)
	{
		alert("用户名未填写。");
		return;
	}
	if(password==null||password.trim().length<=0)
	{
		alert("密码未填写。");
		return;
	}
	document.loginform.submit();
}
function search(){
	var tradename=document.searchform.tradename.value;
	var price1=document.searchform.price1.value;
	var price2=document.searchform.price2.value;
	if(tradename==null||tradename.trim().length<=0)
	{
		if((price1==null||price1.trim().length<=0)&&(price2==null||price2.trim().length<=0))
		{
			alert("请输入查询条件。");
			return;
		}
		else if((price1.trim().length>0&&(price2==null||price2.trim().length<=0))||(price2.trim().length>0&&(price1==null||price1.trim().length<=0)))
		{
			alert("请将价格区间补充完整。");
			return;
		}
		else if(price1!=null&&price2!=null&&parseInt(price1)>parseInt(price2))
		{
			alert("价格区间格式错误");
			return;
		}
	}
	else
	{
		if((price1.trim().length>0&&(price2==null||price2.trim().length<=0))||(price2.trim().length>0&&(price1==null||price1.trim().length<=0)))
		{
			alert("请将价格区间补充完整");
			return;
		}
		else if(price1.trim().length>0&&price2.trim().length>0&& parseInt(price1)>parseInt(price2))
		{
			alert("价格区间格式错误");
			return;
		}
	}
	document.searchform.submit();
}
function addToShoppingCart(){
	var num=document.shoppingForm.tcount.value;
	if(num.trim().length<=0)
	{
		alert("商品数量为空");
		return;
	}
	var reg=new  RegExp("^[0-9]*$");
	if(!reg.test(num))
	{
		alert("请输入整数");
		return;
	}
	document.shoppingForm.submit();
}
function changeTCount(){
	var num=document.changeCount.tcount.value;
	if(num.trim().length<=0)
	{
		alert("商品数量为空");
		return;
	}
	var reg=new  RegExp("^[0-9]*$");
	if(!reg.test(num))
	{
		alert("请输入整数");
		return;
	}
	document.changeCount.submit();
}
function submitOrder(){
	var str=document.submitOrderForm.string.value;
	if(str.trim().length<=0)
	{
		return;
	}
	document.submitOrderForm.submit();
}
function adminLogin(){
	var name=document.adminLoginForm.username.value;
	var passwd=document.adminLoginForm.password.value;
	if(name.trim().length<=0)
	{
		alert('用户名未填写');
		return;
	}
	if(passwd.trim().length<=0)
	{
		alert('密码未填写');
		return;
	}
	document.adminLoginForm.submit();
}
function addTrade(){
	var tname=document.addTradeForm.tname.value;
	var price=document.addTradeForm.price.value;
	var discount=document.addTradeForm.discount.value;
	var discount_one=document.addTradeForm.discount_one.value;
	var discount_two=document.addTradeForm.discount_two.value;
	var discount_three=document.addTradeForm.discount_three.value;
	var count=document.addTradeForm.count.value;
	var img=document.addTradeForm.img.value;
	var information=document.addTradeForm.information.value;
	if(tname.trim().length<=0){
		alert('请输入商品名');
		return;
	}
	if(price.trim().length<=0){
		alert('请输入价格');
		return;
	}
	var reg=new  RegExp("^[0-9]*$");
	if(!reg.test(price))
	{
		alert("价格请输入整数。");
		return;
	}
	if(discount.trim().length<=0){
		alert('请选择是否有折扣');
		return;
	}
	if(discount==1){
		if(discount_one.trim().length<=0){
			alert('请输入白银会员的折扣');
			return;
		}
		if(!reg.test(discount_one))
		{
			alert("白银会员的折扣请输入整数。");
			return;
		}
		if(discount_two.trim().length<=0){
			alert('请输入黄金会员的折扣');
			return;
		}
		if(!reg.test(discount_two))
		{
			alert("黄金会员的折扣请输入整数。");
			return;
		}
		if(discount_three.trim().length<=0){
			alert('请输入钻石会员的折扣');
			return;
		}
		if(!reg.test(discount_three))
		{
			alert("钻石会员的折扣请输入整数。");
			return;
		}
	}
	if(count.trim().length<=0){
		alert('请输入商品数量');
		return;
	}
	if(!reg.test(count))
	{
		alert("商品数量请输入整数");
		return;
	}
	if(img.trim().length<=0){
		alert('请选择图片');
		return;
	}
	if(!(img.indexOf(".jpg")>=0 || img.indexOf(".png")>=0)){
		alert('图片格式错误');
		return;
	}
	if(information.trim().length<=0){
		alert('请输入商品描述');
		return;
	}
	document.addTradeForm.submit();
}
function checkBuyCount(){
	var tname=document.tradeBuyCountForm.tname.value;
	var tid=document.tradeBuyCountForm.tid.value;
	if(tname.trim().length<=0&&tid.trim().length<=0){
		alert('请输入查询条件');
		return;
	}else{
		var reg=new  RegExp("^[0-9]*$");
		if(!reg.test(tid))
		{
			alert("商品id请输入整数。");
			return;
		}
	}
	document.tradeBuyCountForm.submit();
}
function checkCount(){
	var tname=document.tradeCountForm.tname.value;
	var tid=document.tradeCountForm.tid.value;
	if(tname.trim().length<=0&&tid.trim().length<=0){
		alert('请输入查询条件');
		return;
	}else{
		var reg=new  RegExp("^[0-9]*$");
		if(!reg.test(tid))
		{
			alert("商品id请输入整数。");
			return;
		}
	}
	document.tradeCountForm.submit();
}
function checkTradeCount(){
	var count=document.checkTradeCountForm.count.value;
	var reg=new  RegExp("^[0-9]*$");
	if(!reg.test(count))
	{
		alert("库存数量请输入整数。");
		return;
	}
	document.checkTradeCountForm.submit();
}
function checkCustomerOrder(){
	var uname=document.checkCustomerOrderForm.uname.value;
	var uid=document.checkCustomerOrderForm.uid.value;
	if(uname.trim().length<=0 && uid.trim().length<=0){
		alert('请输入查询条件');
		return;
	}else{
		var reg=new  RegExp("^[0-9]*$");
		if(!reg.test(uid)){
			alert('用户id请输入整数');
			return;
		}
	}
	document.checkCustomerOrderForm.submit();
}
function checkTradeOrder(){
	var tname=document.checkTradeOrderForm.tname.value;
	var tid=document.checkTradeOrderForm.tid.value;
	if(tname.trim().length<=0 && tid.trim().length<=0){
		alert('请输入查询条件');
		return;
	}else{
		var reg=new  RegExp("^[0-9]*$");
		if(!reg.test(tid)){
			alert('商品id请输入整数');
			return;
		}
	}
	document.checkTradeOrderForm.submit();
}