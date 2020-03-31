var hdCookieName = "hduser";
var cXmlHttp;
var requestUrl = "http://passport.baike.com/loginInfo.jsp?requestType=statusAndTime";
String.prototype.Trim = function() {
	return this.replace(/^\s*|\s*$/g, "");
}
// add by zhangjuanli 2012-05-30 添加常量，主站和小百科的注册、登录url
var registerUrlForBaike = "http://passport.baike.com/user/xbkUserRegister.jsp";
var registerUrlForHudong = "http://passport.baike.com/user/userRegister.jsp";
var loginUrlForBaike = "http://passport.baike.com/login.do?site_ource=xiaobaike_page";
var loginUrlForHudong = "http://passport.baike.com/login.do";
var tmptargetX = null, tmptargetY = null;
function getPageSize() {
	var xScroll, yScroll;
	if (window.innerHeight && window.scrollMaxY) {
		xScroll = window.innerWidth + window.scrollMaxX;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight) { // all
																			// but
																			// Explorer
																			// Mac
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla
		// and Safari
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	}
	var windowWidth, windowHeight;
	if (self.innerHeight) { // all except Explorer
		if (document.documentElement.clientWidth) {
			windowWidth = document.documentElement.clientWidth;
		} else {
			windowWidth = self.innerWidth;
		}
		windowHeight = self.innerHeight;
	} else if (document.documentElement
			&& document.documentElement.clientHeight) { // Explorer 6 Strict
														// Mode
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) { // other Explorers
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	}
	// for small pages with total height less then height of the viewport
	if (yScroll < windowHeight) {
		pageHeight = windowHeight;
	} else {
		pageHeight = yScroll;
	}
	// for small pages with total width less then width of the viewport
	if (xScroll < windowWidth) {
		pageWidth = xScroll;
	} else {
		pageWidth = windowWidth;
	}
	arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);
	return arrayPageSize;
}

function getIframeHeight() {
	var json = document.getElementById("json").value;
	var cpageA = document.getElementsByName("pageA");
	for ( var i = 0; i < cpageA.length; i++) {
		if (cpageA[i].href.indexOf("&json=") == -1) {
			cpageA[i].href = cpageA[i].href + "&json="
					+ encodeURIComponent(json);
		}
	}
	var width = 0;
	var height = 0;
	if (!!(document.all && navigator.userAgent.indexOf('Opera') === -1)) {// ie
		height += document.body.scrollHeight;
		height += 10;
		width += document.body.scrollWidth;
	} else if (navigator.userAgent.indexOf('Opera') != -1) {// Opera
		height += document.body.scrollHeight + 12;
		width += document.body.scrollWidth;
	} else {// firefox
		var bHeight = document.body.scrollHeight;
		var dHeight = document.documentElement.scrollHeight;
		height = Math.min(bHeight, dHeight);
		var bWidth = document.body.scrollWidth;
		var dWidth = document.documentElement.scrollWidth;
		width = Math.max(bWidth, dWidth);
	}
	// if (/firefox/i.test(navigator.userAgent)){
	// height += 30;
	// }
	// if(height<300){
	// height=300;
	// }
	var hashurl = document.getElementById("domain").value;
	var proxyiframe = document.getElementById("proxyiframe");
	// hashurl = window.location.hash.split("#")[1];
	var arrayPageSize = getPageSize();
	proxyiframe.src = "http://" + hashurl + "/iframeheight.html?rnd="
			+ Math.random() + "#" + arrayPageSize[0] + "|" + height;
}
function createCXmlHttpRequestByObject() {
	var xmlObject;
	if (window.ActiveXObject) {
		xmlObject = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		xmlObject = new XMLHttpRequest();
	}
	if (!xmlObject) { // 异常，创建对象实例失败
		window.alert("不能创建cXmlHttpRequest对象实例.");
		return false;
	}
	return xmlObject;
}
function showreply(uuid) {
	var replydisplay = document.getElementById("reply_" + uuid).style.display;
	if (replydisplay != null && replydisplay == 'block') {
		hiddenReply(uuid);
		return;
	}
	var pc = document.getElementById("pc").value;
	var ps = document.getElementById("pageStyle").value;
	if (ps == null) {
		ps = "3";
	}
	var subjectid = document.getElementById("subjectid").value;
	if (pc == null || pc.Trim().length == 0 || subjectid == null
			|| subjectid.Trim().length == 0 || uuid == null
			|| uuid.Trim().length == 0) {
		alert("必要的参数为空。");
		return;
	}
	cXmlHttp = createCXmlHttpRequestByObject();
	var para = "action=showReply&cid=" + uuid + "&pc=" + pc + "&ps=" + ps
			+ "&id=" + encodeURIComponent(subjectid);
	var url = "/comment.do";
	cXmlHttp.open("POST", url, true);
	cXmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	cXmlHttp.onreadystatechange = function() {
		showreplyCallback(uuid);
	}
	cXmlHttp.send(para);
}
function showreplyCallback(uuid) {
	if (cXmlHttp.readyState == 4) {
		if (cXmlHttp.status == 200) {
			if (cXmlHttp.responseText != null) {
				var replydiv = document.getElementById("reply_" + uuid);
				replydiv.style.display = "block";
				replydiv.innerHTML = cXmlHttp.responseText;
				getIframeHeight();
			}
		}
	}
}
function loginAlert() {
	var nextUrl = document.getElementById("purl").value;
	var domain = document.getElementById("domain").value;
	var loginUrl = "http://wiki.baike.com/user/login/userLogin.jsp";
	var registerUrl = "http://wiki.baike.com/user/register/userRegister.jsp";
// 现在统一成主站的页面
// if (domain.indexOf("baike.com") > -1) {
// loginUrl =
// "http://passport.baike.com/login.do?site_ource=xiaobaike_page&service="
// + encodeURIComponent(nextUrl);
// registerUrl = "http://passport.baike.com/user/xbkUserRegister.jsp?autourl="
// + encodeURIComponent(nextUrl);
// }
	var loginHtml = "<div style='margin-top:30px;margin-left:10px;margin-right:10px'>您还没有登录，请先<a onmousedown=\"document.domain='baike.com';var date=new Date();date.setTime(date.getTime()+24*3600*1000);document.cookie='nextURL="
			+ encodeURIComponent(nextUrl)
			+ ";expire='+date.toGMTString()+';path=/;domain=.baike.com;'\" target='_parent' href='"
			+ loginUrl
			+ "'>登录</a>或<a href='"
			+ registerUrl
			+ "' target='_parent'>注册</a></div>";
	CreateDivAlert(220, 100, loginHtml, "提示您：");
	// add by zhangjuanli 2012-03-14 添加统计代码
	try {
		StatVirtualTraffic(document.referrer, window.location,
				"COMMENT_NOTLOGIN");
	} catch (e) {

	}

}
function doCommentSubmit() {
	var returnValue = getHdCookie(hdCookieName);
	// add by zhangjuanli 2012-04-24 添加“是否允许匿名用户发表评论的判断”
	var anonyuserflag = document.getElementById("anonyuserflag").value;
	if (anonyuserflag == "false") {
		if (returnValue == null) {
			getPassportInfo(requestUrl);
			return;
		}
	}
	var pc = document.getElementById("pc").value;
	var subjectid = document.getElementById("subjectid").value;
	var pid = "0";
	if (document.getElementById("pid") != null) {
		pid = document.getElementById("pid").value;
	}
	var commentcontent = document.getElementById("commentcontent").value;
	var str = "无需登录，直接发布";
	if (commentcontent == str) {
		commentcontent = "";
	}
	if (commentcontent == null || commentcontent.Trim().length == 0) {
		alert("不能提交空内容。");
		if (anonyuserflag == "true" && returnValue == null) {
			isAnonyuserForDisplay();
		}
		return;
	}
	if (pc == null || pc.Trim().length == 0 || subjectid == null
			|| subjectid.Trim().length == 0) {
		alert("必要的参数为空。");
		if (anonyuserflag == "true" && returnValue == null) {
			isAnonyuserForDisplay();
		}
		return;
	}
	var ps = document.getElementById("pageStyle").value;
	if (ps == null) {
		ps = "3";
	}
	if (commentcontent.Trim().length > 140) {
		alert("提交的内容太长了，最长140个汉字，请删除一部分后再提交。");
		if (anonyuserflag == "true" && returnValue == null) {
			isAnonyuserForDisplay();
		}
		return;
	}
	var commentsubmit = document.getElementById("commentsubmit");
	commentsubmit.disabled = true;
	var json = document.getElementById("json").value;
	cXmlHttp = createCXmlHttpRequestByObject();
	// add by zhangjuanli 2012-06-15 添加评论来源参数
	var sourceinfo = document.getElementById("sourceinfo").value;
	var seccode;
	if(document.getElementById("seccode")==null){
		seccode = "";
	}else{
		seccode = document.getElementById("seccode").value;
	}
	var para = "action=add&pid=" + pid + "&pc=" + pc + "&ps=" + ps + "&id="
			+ encodeURIComponent(subjectid) + "&content="
			+ encodeURIComponent(commentcontent) + "&json="
			+ encodeURIComponent(json) + "&sourceinfo="
			+ encodeURIComponent(sourceinfo) + "&seccode="
			+ encodeURIComponent(seccode);
	var url = "/comment.do";
	cXmlHttp.open("POST", url, true);
	cXmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	cXmlHttp.onreadystatechange = commentCallback;
	cXmlHttp.send(para);
}
function commentCallback() {
	if (cXmlHttp.readyState == 4) {
		if (cXmlHttp.status == 200) {
			if (cXmlHttp.responseXML != null) {
				var anonyuserflag = document.getElementById("anonyuserflag").value;
				var returnValue = getHdCookie(hdCookieName);
				var state = cXmlHttp.responseXML.getElementsByTagName("state")[0].firstChild.data;
				if (state == 1) {
					// alert("发表成功！");
					// location.href=document.location.href.replace(/p=\d+/,"p=1");
					var lastcomment = cXmlHttp.responseXML
							.getElementsByTagName("lastcomment")[0].firstChild.data;
					var snsdiv = document
							.getElementById("sns-footprint-profile");
					var x = snsdiv.firstChild;
					if (x != null) {
						while (x != null && x.nodeType != 1) {
							x = x.nextSibling;
						}
					}
//					if (x != null) {
//						x.className = "footlist-new";
//					}
					snsdiv.innerHTML = lastcomment + snsdiv.innerHTML;
					var commenthead = document.getElementById("commenthead");
					if (commenthead != null) {
						var commentnumStr = commenthead.innerHTML;
						var commentnum = parseInt(commentnumStr.substring(
								commentnumStr.indexOf("(") + 1, commentnumStr
										.indexOf("个"))) + 1;
						commenthead.innerHTML = commentnumStr.substring(0,
								commentnumStr.indexOf("(") + 1)
								+ commentnum
								+ commentnumStr.substring(commentnumStr
										.indexOf("个"));
					}
					document.getElementById("commentcontent").value = '';
					document.getElementById("chLeft").innerHTML = "还可以输入140个字";
					getIframeHeight();
					// 针对开启匿名用户发表评论功能的讨论区
					// add by zhangjuanli 2012-05-29
					// 评论发表成功，将“无需登录，直接发布”的提示信息放入textarea中
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
						// 发表成功，弹出提示窗
						var productCode = document.getElementById("pc").value;
						var dc = commentSuccessTC(productCode);
						setTimeout(function() { // 评论成功的弹窗显示5S后自动关闭
							dc.remove();
						}, 5000);
					}
				} else if (state == -1) {
					// alert("你还没登录！");
					getPassportInfo(requestUrl);
				} else if (state == -2) {
					alert("必要参数为空！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				} else if (state == -3) {
					alert("评论太长了,最多140个字符！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				} else if (state == -4) {
					alert("此讨论区已经关闭！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				} else if (state == -5) {
					alert("讨论内容含有违禁词，请先删除再提交！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				} else if (state == -6) {
					alert("你的这个评论已经提交过了！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				} else if (state == -7) {
					alert("评论产品码没有通过审核！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				} else if (state == -8) {
					alert("验证码为空，请输入验证码！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				} else if (state == -9) {
					alert("验证码错误，请重新输入！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				} else {
					alert("发表失败！");
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
					}
				}
			}
		}
	}
	var commentsubmit = document.getElementById("commentsubmit");
	commentsubmit.disabled = false;
}
// add by zhangjuanli 2012-05-30 发表评论成功的弹窗
function commentSuccessTC(productCode) { // 主站和小百科登录注册的url不一样，根据产品码来区分
	var productCodes = [ '011501', '011502', '01151101', '01032901' ];
	var html = '<div class="contant"><div class="forum-cg"><p class="forum-cg_con">评论成功！<br/>登录后可享受向百万专家<br/>提问特权！<b class=""><a href="$1" target="_blank">登录</a>|<a href="$2" target="_blank">注册</a></b></p><p class="forum-cg_oth"><label>其他帐号登录：</label><a href="$3" title="用微博帐号登录" target="_blank"><img src="http://www.huimg.cn/hudong/public/images/taolunqu/sina.jpg" /></a> <a href="$4" title="用QQ帐号登录" target="_blank"><img src="http://www.huimg.cn/hudong/public/images/taolunqu/qq.jpg" /></a> <a href="$5" title="用人人帐号登录" target="_blank"><img src="http://www.huimg.cn/hudong/public/images/taolunqu/renren.jpg" /></a></p></div></div>';
	var flag = false;
	if (productCode != null && productCode.length > 0) {
		for ( var i in productCodes) {
			if (productCode == productCodes[i]) {
				flag = true;
			}
		}
	}
	if (flag) {
		html = html.replace("\$1", loginUrlForBaike);
		html = html.replace("\$3", loginUrlForBaike);
		html = html.replace("\$4", loginUrlForBaike);
		html = html.replace("\$5", loginUrlForBaike);
		html = html.replace("\$2", registerUrlForBaike);
	} else {
		html = html.replace("\$1", loginUrlForHudong);
		html = html.replace("\$3", loginUrlForHudong);
		html = html.replace("\$4", loginUrlForHudong);
		html = html.replace("\$5", loginUrlForHudong);
		html = html.replace("\$2", registerUrlForHudong);
	}
	var biaotiContent = "温馨提示";
	var dc = CreateDivAlert(220, 200, html, biaotiContent);
	dc.changePositon(tmptargetX, tmptargetY);
	return dc;
}
function replycomment(pid,pos) {
	var returnValue = getHdCookie(hdCookieName);
	// add by zhangjuanli 2012-04-24 添加“是否允许匿名用户发表评论的判断”
	var anonyuserflag = document.getElementById("anonyuserflag").value;
	if (anonyuserflag == "false") {
		if (returnValue == null) {
			getPassportInfo(requestUrl);
			return;
		}
	}
	var pc = document.getElementById("pc").value;
	var subjectid = document.getElementById("subjectid").value;
	if (pid == null) {
		pid = "0";
	}
	var commentcontent = document.getElementById("text_" + pid).value;
	if (commentcontent == null || commentcontent.Trim().length == 0) {
		alert("不能提交空内容。");
		return;
	}
	if (pc == null || pc.Trim().length == 0 || subjectid == null
			|| subjectid.Trim().length == 0) {
		alert("必要的参数为空。");
		return;
	}
	var ps = document.getElementById("pageStyle").value;
	if (ps == null) {
		ps = "3";
	}
	if (commentcontent.Trim().length > 140) {
		alert("提交的点评内容太长了，最长140个字符，请删除一部分后再提交。");
		return;
	}
	var replybutton = document.getElementById("replybutton_" + pid);
	replybutton.disabled = true;
	var json = document.getElementById("json").value;
	cXmlHttp = createCXmlHttpRequestByObject();
	// add by zhangjuanli 2012-06-15 添加评论来源参数
	var sourceinfo = document.getElementById("sourceinfo").value;
	var para = "action=add&pid=" + pid + "&pc=" + pc + "&ps=" + ps + "&id="
			+ encodeURIComponent(subjectid) + "&content="
			+ encodeURIComponent(commentcontent) + "&json="
			+ encodeURIComponent(json) + "&sourceinfo="
			+ encodeURIComponent(sourceinfo);
	var url = "/comment.do";
	cXmlHttp.open("POST", url, true);
	cXmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	cXmlHttp.onreadystatechange = function() {
		replycommentCallback(pid,pos);
	}
	cXmlHttp.send(para);
	// add by zhangjuanli 2012-05-30 弹窗定位
	var event = GetEvent();
	tmptargetX = mouseX(event);
	tmptargetY = mouseY(event);
}
function replycommentCallback(pid,pos) {
	if (cXmlHttp.readyState == 4) {
		if (cXmlHttp.status == 200) {
			if (cXmlHttp.responseXML != null) {
				var state = cXmlHttp.responseXML.getElementsByTagName("state")[0].firstChild.data;
				var anonyuserflag = document.getElementById("anonyuserflag").value;
				var returnValue = getHdCookie(hdCookieName);
				if (state == 1) {
					var uuid = cXmlHttp.responseXML.getElementsByTagName("pid")[0].firstChild.data;
					var replynum_a_id = "";
					if(pos){
						replynum_a_id = "replynum_" + uuid+"_"+pos;
					}else{
						replynum_a_id = "replynum_" + uuid;
					}
					var replynumA = document.getElementById(replynum_a_id);
					var replynumStr = replynumA.innerHTML;
					var replynum = parseInt(replynumStr.substring(3,
							replynumStr.length - 1)) + 1;
					replynumA.innerHTML = "回复(" + replynum + ")";
					var lastcomment = cXmlHttp.responseXML
							.getElementsByTagName("lastcommentreply")[0].firstChild.data;
					var uldiv = document.getElementById("ul_" + uuid);
					uldiv.innerHTML = lastcomment + uldiv.innerHTML;
					document.getElementById("text_" + uuid).value = '';
					document.getElementById("chLeft_" + pid).innerHTML = "还可以输入140个字";
					getIframeHeight();
					// 针对开启匿名用户发表评论功能的讨论区
					// add by zhangjuanli 2012-05-29
					// 评论发表成功，将“无需登录，直接发布”的提示信息放入textarea中
					if (anonyuserflag == "true" && returnValue == null) {
						isAnonyuserForDisplay();
						// 发表成功，弹出提示窗
						var productCode = document.getElementById("pc").value;
						var dc = commentSuccessTC(productCode);
						setTimeout(function() { // 评论成功的弹窗显示5S后自动关闭
							dc.remove();
						}, 5000);
						tmptargetX = null;
						tmptargetY = null;
					}
				} else if (state == -1) {
					// alert("你还没登录！");
					getPassportInfo(requestUrl);
				} else if (state == -2) {
					alert("必要参数为空！");
				} else if (state == -3) {
					alert("评论太长了,最多140个字符！");
				} else if (state == -4) {
					alert("此讨论区已经关闭！");
				} else if (state == -5) {
					alert("回复内容含有违禁词，请先删除再提交！");
				} else if (state == -6) {
					alert("你的这个回复已经提交过了！");
				} else if (state == -7) {
					alert("评论产品码没有通过审核！");
				} else {
					alert("发表失败！");
				}
			}
		}
	}
	var replybutton = document.getElementById("replybutton_" + pid);
	replybutton.disabled = false;
}
function hiddenReply(uuid) {
	document.getElementById("reply_" + uuid).style.display = "none";
	getIframeHeight();
}
// 读cookie判断用户是否登陆
function getHdCookie(name) {
	try {
		var arr = document.cookie.match(new RegExp("(^| )" + name
				+ "=([^;]*)(;|$)"));
		if (arr != null)
			return unescape(arr[2]);
	} catch (e) {
		return null;
	}
	return null;
}
function getCookie(Name) {
	var search = Name + "=";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1) {
				end = document.cookie.length;
			}
			return unescape(document.cookie.substring(offset, end));
		} else {
			return null;
		}
	}
	return null;
}
function DivAlert(messageDiv) {
	this.messageDIV = messageDiv;
	// 创建提示框底层
	this.bottomDIV = document.createElement("div");
	// 配置样式
	this.bottomDIV.style.opacity = "0.50";
	this.bottomDIV.style.filter = "Alpha(opacity=50);";
	this.bottomDIV.style.backgroundColor = "#FFFFFF";
	this.bottomDIV.style.height = document.body.scrollHeight + "px";
	this.bottomDIV.style.width = "100%";
	this.bottomDIV.style.marginTop = "0px";
	this.bottomDIV.style.marginLeft = "0px";
	this.bottomDIV.style.position = "absolute";
	this.bottomDIV.style.top = "0px";
	this.bottomDIV.style.right = "0px";
	this.bottomDIV.style.zIndex = 100;
	// 显示提示框
	var event = GetEvent();
	this.show = function() {
		// 显示提示框底层
		document.body.appendChild(this.bottomDIV);
		// 显示messageDIV
		document.body.appendChild(this.messageDIV);
		// 把messageDIV定位到body中间
		this.messageDIV.style.position = "absolute";
		x = mouseX(event) - this.messageDIV.offsetWidth;
		if (x < 0) {
			x = 0;
		}
		y = mouseY(event) - this.messageDIV.offsetHeight;
		if (y < 0) {
			y = 0;
		}
		this.messageDIV.style.top = y + "px";
		this.messageDIV.style.right = x + "px";
		this.messageDIV.style.zIndex = 101;
	}
	// 更改弹窗的位置
	this.changePositon = function(targetX, targetY) {
		var x = targetX - this.messageDIV.offsetWidth;
		if (x < 0) {
			x = 0;
		}
		var y = targetY - this.messageDIV.offsetHeight;
		if (y < 0) {
			y = 0;
		}
		this.messageDIV.style.top = y + "px";
		this.messageDIV.style.right = x + "px";
	}
	// 移除提示框
	// modify by zhangjuanli 2012-11-29 添加判断。当第一次移除弹窗的时候，没有问题；当第二次移除
	// 弹窗的时候，需要加判断，防止页面找不到节点的js错误。
	this.remove = function() {
		if(this.bottomDIV != null){
			document.body.removeChild(this.bottomDIV);
			this.bottomDIV = null;
		}
		if(this.messageDIV != null){
			document.body.removeChild(this.messageDIV);
			this.messageDIV = null;
		}
	}
}
function CreateDivAlert(width, height, htmlContent, biaotiContent) {
	// 创建提示框内容部分
	var d = document.createElement("div");
	d.style.width = width + "px";
	d.style.height = height + "px";
	d.style.borderColor = "#666666";
	d.style.borderStyle = "solid";
	d.style.borderWidth = "5px";
	d.style.backgroundColor = "white";
	var h2Node = document.createElement("h2");
	h2Node.style.color = "#FFFFFF";
	h2Node.style.background = "none repeat scroll 0 0 #009DF0";
	h2Node.style.fontSize = "14px";
	h2Node.style.paddingTop = "3px";
	h2Node.style.paddingBottom = "3px";
	h2Node.innerHTML = "&nbsp;" + biaotiContent;
	d.appendChild(h2Node);
	var closeNode = document.createElement("img");
	closeNode.style.background = "url('http://www.huimg.cn/lib/dialog/close.jpg') repeat scroll 0 0 transparent";
	closeNode.style.cursor = "pointer";
	closeNode.style.styleFloat = "right";
	closeNode.style.position = "absolute";
	closeNode.style.right = "5px";
	closeNode.style.top = "3px";
	closeNode.style.height = "16px";
	closeNode.style.width = "16px";
	closeNode.onclick = function() {
		dc.remove();
	}
	d.appendChild(closeNode);
	// 向提示框内容部分画需要显示的信息
	insertHtml("beforeEnd", d, htmlContent);
	// 实例化提示框
	var dc = new DivAlert(d);
	// 显示提示框
	dc.show();
	return dc;
}
function mouseX(event) {
	event = event || window.event;
	if (event == null) {
		return 0;
	}
	if (event.pageX) {
		return event.pageX;
	} else if (event.clientX) {
		return event.clientX
				+ (document.documentElement.scrollLeft ? document.documentElement.scrollLeft
						: document.body.scrollLeft);
	} else {
		return null;
	}
}
function mouseY(event) {
	event = event || window.event;
	if (event == null) {
		return 0;
	}
	if (event.pageY) {
		return event.pageY;
	} else if (event.clientY) {
		return event.clientY
				+ (document.documentElement.scrollTop ? document.documentElement.scrollTop
						: document.body.scrollTop);
	} else {
		return null;
	}
}
function GetEvent() {
	if (document.all) // IE
	{
		return window.event;
	}
	func = GetEvent.caller; // 返回调用本函数的函数
	while (func != null) {
		// Firefox 中一个隐含的对象 arguments，第一个参数为 event 对象
		var arg0 = func.arguments[0];
		// alert('参数长度：' + func.arguments.length);
		if (arg0) {
			if ((arg0.constructor == Event || arg0.constructor == MouseEvent)
					|| (typeof (arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
				return arg0;
			}
		}
		func = func.caller;
	}
	return null;
}
function insertHtml(where, el, html) {
	where = where.toLowerCase();
	if (el.insertAdjacentHTML) {
		switch (where) {
		case "beforebegin":
			el.insertAdjacentHTML('BeforeBegin', html);
			return el.previousSibling;
		case "afterbegin":
			el.insertAdjacentHTML('AfterBegin', html);
			return el.firstChild;
		case "beforeend":
			el.insertAdjacentHTML('BeforeEnd', html);
			return el.lastChild;
		case "afterend":
			el.insertAdjacentHTML('AfterEnd', html);
			return el.nextSibling;
		}
		throw 'Illegal insertion point -> "' + where + '"';
	}
	var range = el.ownerDocument.createRange();
	var frag;
	switch (where) {
	case "beforebegin":
		range.setStartBefore(el);
		frag = range.createContextualFragment(html);
		el.parentNode.insertBefore(frag, el);
		return el.previousSibling;
	case "afterbegin":
		if (el.firstChild) {
			range.setStartBefore(el.firstChild);
			frag = range.createContextualFragment(html);
			el.insertBefore(frag, el.firstChild);
			return el.firstChild;
		} else {
			el.innerHTML = html;
			return el.firstChild;
		}
	case "beforeend":
		if (el.lastChild) {
			range.setStartAfter(el.lastChild);
			frag = range.createContextualFragment(html);
			el.appendChild(frag);
			return el.lastChild;
		} else {
			el.innerHTML = html;
			return el.lastChild;
		}
	case "afterend":
		range.setStartAfter(el);
		frag = range.createContextualFragment(html);
		el.parentNode.insertBefore(frag, el.nextSibling);
		return el.nextSibling;
	}
	throw 'Illegal insertion point -> "' + where + '"';
}
function checkLogin(which) {
	// add by zhangjuanli 2012-04-24 添加“是否允许匿名用户发表评论的判断”
	var anonyuserflag = document.getElementById("anonyuserflag").value;
	if (anonyuserflag == "false") {
		var returnValue = getHdCookie(hdCookieName);
		if (returnValue == null) {
			which.blur();
			getPassportInfo(requestUrl);
			return false;
		}
	} else {
		// add by zhangjuanli 2012-05-29 将textarea的样式去除，并去掉文字信息
		var str = "无需登录，直接发布";
		var commentContent = which.value;
		if (commentContent == str) {
			which.value = "";
			which.removeAttribute("style");
		}
	}
	return true;
}
function checkLength(which, chLeft) {
	var maxChars = 140;
	if (which.value.length > maxChars) {
		which.value = which.value.substring(0, maxChars);
	}
	var curr = maxChars - which.value.length;
	document.getElementById(chLeft).innerHTML = curr.toString();
}
function checkInputLength(which, chLeft) {
	var maxChars = 140;
	var curr = maxChars - which.value.length;
	if (curr >= 0) {
		document.getElementById(chLeft).innerHTML = "还可以输入" + curr.toString()
				+ "个字";
		document.getElementById(chLeft).style.color = "black";
	} else {
		document.getElementById(chLeft).innerHTML = "已超出" + Math.abs(curr)
				+ "字";
		document.getElementById(chLeft).style.color = "red";
	}
}
// add by zhangjuanli 2012-03-14 评论中心丢失hudong域的cookie，添加解决办法。
// http://passport.baike.com/loginInfo.jsp?requestType=statusAndTime
// 返回的结果：（1）var statusAndTime = "true&2591991";（2）var statusAndTime = "false";
// 如果返回的结果是（1），种cookie。使用隐藏的iframe，其src=”
// http://passport.baike.com/login.do?site_ource=zz_page&service=http://i.baike.com/static.html”;
// 如果返回的结果是（2）；走原有的逻辑，使用原有的弹窗。

var HdTools = {
	loadDynamicJs : function(url, fun) {
		var script = document.createElement("script");
		script.src = url + '&t=' + Math.random();
		script.type = "text/javascript";
		script.onreadystatechange = function() { // IE不支持script的onload事件，支持script的onreadystatechange事件
			if (script.readyState == 'complete'
					|| script.readyState == 'loaded') {
				fun();
			}
		}, script.onload = function() { // firefox支持script的onload事件，不支持script的onreadystatechange事件
			fun();
		};
		document.getElementsByTagName("head").item(0).appendChild(script);
	}
}
function getPassportInfo(requestUrl) {
	if (requestUrl != null) {
		HdTools.loadDynamicJs(requestUrl,
				function() {
					if (typeof (statusAndTime) != "undefined"
							&& statusAndTime != null) {
						if (!statusAndTime) {
							loginAlert();
						} else if (statusAndTime.indexOf("true") > -1) {
							setCookes();
						}
					} else {
						loginAlert();
					}
				});

	}
}
// add by zhangjuanli 2012-03-14 种cookie。使用隐藏的iframe，其src=”
// http://passport.baike.com/login.do?site_ource=zz_page&service=http://i.baike.com/static.html”。
function setCookes() {
	var iframeObj = document.getElementById("passportComment");
	if (iframeObj != null) {
		document.body.removeChild(iframeObj);
	}
	var iframeSrc = "http://passport.baike.com/login.do?site_ource=zz_page&service="
			+ encodeURIComponent("http://i.baike.com/static.html");
	var IframeObj = document.createElement("iframe");
	IframeObj.id = "passportComment";
	IframeObj.width = 0;
	IframeObj.height = 0;
	IframeObj.frameborder = 0;
	IframeObj.style = "display:none";
	IframeObj.src = iframeSrc;
	IframeObj.name = "passportComment";
	document.body.appendChild(IframeObj);
}
// add by zhangjuanli 2012-05-30 评论框上显示提示文字
function isAnonyuserForDisplay() {
	var anonyuserflag = document.getElementById("anonyuserflag").value;
	var returnValue = getHdCookie(hdCookieName);
	if (anonyuserflag == "true" && returnValue == null) {
		document.getElementById("commentcontent").value = "无需登录，直接发布";
		document.getElementById("commentcontent").setAttribute("style",
				"color:#999;");
	}
}




function commentInit() {
	//获取用户信息
	
	
	
	var returnValue = getHdCookie(hdCookieName);
	
	
	 $("a[id^='up_']").live("mouseover",function(){
		 
		 var self = this;
		  $('.ico5', $(self).parent()).remove();
		  $('.icoTip', $(self).parent()).remove();
		  var node=$("<em class=\"ico5\">赞</em>");
		  $(self).parent().append(node);
		 
	 });
	 
	 
	 $("a[id^='up_']").live("mouseout",function(){
	 
		  var self = this;
		  $('.ico5', $(self).parent()).remove();
		  $('.icoTip', $(self).parent()).remove();
		 
  }); 
	 
	 
	 
	 
$("a[id^='down_']").live("mouseover",function(){
		 
	  var self = this;
	  $('.ico6', $(self).parent()).remove();
	  $('.icoTip2', $(self).parent()).remove();
	  var node=$("<em class=\"ico6\">鄙视</em>");
	  $(self).parent().append(node);
		 
	 });
	 


$("a[id^='down_']").live("mouseout",function(){
	 
	  var self = this;
	  $('.ico6', $(self).parent()).remove();
	  $('.icoTip2', $(self).parent()).remove();
 });


	 
	 $("a[id^='up_']").live("click",
			  function () {
				  var self = this;
				  var uuid=$(self).attr("id").replace("up_","");
				  var pc=$("#pc").val();
				  var appid=$("#subjectid").val();
				  
//				  recordLog("ding comment id = " + uuid);
				  recordLog("ding_comment");
				  //获取uuid,获取cookie，判断是否是登录用户
				  //登录用户提交到后端做处理，若不是登录用户
				  //查找cookie,若存在cookie，不在提交，若不存在cookie，提交信息
				  //类型：顶(1)踩(0) name(uuid+类型(0或1)) value(1)
				  //完成后写cookie,cookie格式
				  if (returnValue == null) {
						//匿名用户，获取cookie是否已经顶踩过
						 var uuidcookie= getCookie(uuid+1);
						 if(null==uuidcookie){
							 //第一次，走后台逻辑
							 
							 UpOrDownComment(uuid,1,pc,appid,self);
							 //种cookie
							 //setCookie(uuid+1,1);
						 }else{
							 //添加重复提示语
							 //alert("已经操作过");
							// $(self).parent().next().remove();
									  $('.ico5', $(self).parent()).remove();
									  $('.icoTip', $(self).parent()).remove();
									var  tipnode=$("<em class=\"icoTip\">不要太贪心哦，你已经亮过一次态度了</em>");
									$(self).parent().append(tipnode);
							 
						 }

						return;
					}else{
						//不是匿名用户，走后台
						 UpOrDownComment(uuid,1,pc,appid,self);
					}
				  }); 
	 
	 $("a[id^='down_']").live("click",
			 
			  function () { 
				  var self = this;
				  
				  var uuid=$(self).attr("id").replace("down_","");
				  var pc=$("#pc").val();
				  var appid=$("#subjectid").val();
//					recordLog("cai comment id = " + uuid);
					recordLog("cai_comment");
				  if (returnValue == null) {
						//匿名用户，获取cookie是否已经顶踩过
						 var uuidcookie= getCookie(uuid+0);
						 if(null==uuidcookie){
							 //第一次，走后台逻辑
							 
							 UpOrDownComment(uuid,0,pc,appid,self);
							 //种cookie
							//setCookie(uuid+0,1);
						 }else{
							// alert("已经操作过");
							 //重复操作
							 
									  $('.ico6', $(self).parent()).remove();
									  $('.icoTip2', $(self).parent()).remove();
									var tipnode=$("<em class=\"icoTip2\">不要太贪心哦，你已经亮过一次态度了</em>");
									$(self).parent().append(tipnode);
						 }

						return;
					}else{
						//不是匿名用户，走后台
						 UpOrDownComment(uuid,0,pc,appid,self);
					}
				  
				
				  }); 
	
}

function getNodeText(self){
	var count=$(self).parent().text().replace("(","").replace(")","");
	var newcount=parseInt(count)+1;
	var reg=new RegExp("\\(.*\\)","g");   
	var temp=$(self).parent().html().replace(reg,"");
	var counttemp="("+newcount+")";
	 return temp+counttemp;
	
}

function UpOrDownComment(uuid,optype,pc,appid,node, customSuccessFunction) {
	$.ajax({
			type : "POST",
			dataType : "json",
			data : {
			uuid:uuid,
			optype : optype,
			pc : pc,
			appid : appid,
			t : Math.random()
		},
		url : "/comment.do?action=commentScore",
		success : function(info) {
			if(customSuccessFunction != null) {
				customSuccessFunction.call();
			}else {
				if(info.flag=="true"){
					//操作成功，修改样式。数量加1
					if(optype==0){
						$('.ico1', $(node)).attr("class","ico3");
					}else if(optype==1){
						$('.ico2', $(node)).attr("class","ico4");
					}
						
					  $('.ico5', $(node).parent()).remove();
					  $('.icoTip', $(node).parent()).remove();
			  		  $('.ico6', $(node).parent()).remove();
					  $('.icoTip2', $(node).parent()).remove();
					  
					  var parentNode=$(node)[0];
					  var textNode=$(node)[0].lastChild;
					  //创建新节点
					var count=$(node).text().replace("(","").replace(")","");
					var newcount=parseInt(count)+1;
					var counttemp="("+newcount+")";
					parentNode.removeChild(textNode);
					//parentNode.append(counttemp);
					
					var txtNode = document.createTextNode(counttemp);
					parentNode.appendChild(txtNode);
					
					//写cookie
					setCookie(uuid+optype,1);
				}else{	
					if(info.msg=="重复操作"){
							  if(optype==0){
								  
									  $('.ico6', $(node).parent()).remove();
									  $('.icoTip2', $(node).parent()).remove();
									var tipnode=$("<em class=\"icoTip2\">不要太贪心哦，你已经亮过一次态度了</em>");
									 $(node).parent().append(tipnode);
								}else if(optype==1){
									  $('.ico5', $(node).parent()).remove();
									  $('.icoTip', $(node).parent()).remove();
									var  tipnode=$("<em class=\"icoTip\">不要太贪心哦，你已经亮过一次态度了</em>");
									 $(node).parent().append(tipnode);
								}
					}
				}
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	})
	
}
function setCookie(name,value)  
{  
var Days = 30;  
var exp = new Date();    
exp.setTime(exp.getTime() + Days*24*60*60*1000);  
document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();  
}   

//function getCookie(name)  
//{  
//var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");  
//if(arr=document.cookie.match(reg)) return unescape(arr[2]);  
//else return null;  
//}   

//标记下播放器的初始化状态
var soundManagerStatus = false;
/**
 * 创建一个声音评论的播放器
 * @param {Object} id 当前播放器的唯一标识
 * @param {Object} url 当前音频地址
 * @param {Object} time 当前音频长度秒
 * @param {Object} location 当前播放器展示的位置div的id
 * @return soundManager返回的声音文件
 */
function createSound(id, url, time, div) {
	//计算播放器宽度,最大60秒,最宽100px,最窄60px
	var width = time / 60 * 40 + 60;
	width = width > 100 ? 100 : width;
	tipWidth = (width-52/2) > 50 ?(width-52/2) : 50 ;
	var html = $('<i class="yjL"></i><span class="sound" style="width:'+ width +'px;"><em class="soundNum">'+ time +'</em><em class="ico7"></em><em class="ico8"></em><em class="ico10"><img src="http://www.huimg.cn/entry/images/playing.gif"></em></span><i class="yjR"></i><em class="btnSoundTip" style="display:none; width:'+ tipWidth +'px;">有声播放</em>');
	//底层播放器
	var aSound = soundManager
			.createSound( {
				id : id,
				url : url,
				autoLoad : false,
				autoPlay : false,
				volume : 60,
				onstop : function() {
					$('.ico10', html).hide();
					$('.ico8', html).show();
				},
				onfinish : function() {
					$('.ico10', html).hide();
					$('.ico8', html).show();

//					//触发播放完成事件
//					 var uuidcookie = getCookie(id+2);
//					 if(null==uuidcookie){
//						 UpOrDownComment(id, 2, $(div).attr('productCode'), $(div).attr('objectId'), null, function() {
//							//写cookie
//							setCookie(id+2,1);
//						 });
//					 }else{
//						 //什么都不处理
//					 }
				}
			});
	//默认隐藏暂停按钮
	$('.ico10', html).hide();
	//增加播放停止事件处理
	$(div).click(function() {
		if(soundManagerStatus == false) {
			alert("语音播放器加载异常,请安装浏览器flash插件");
		}else {
			if(aSound.playState == 0) {
				$('.ico8', html).hide();
				$('.ico10', html).show();
				//关闭其他所有正在播放的播放器
				soundManager.stopAll();
				aSound.play();
//				recordLog("play sound comment id=" + id);
				recordLog("play_sound_comment");
			}else if(aSound.playState == 1) {
				$('.ico10', html).hide();
				aSound.stop();
				$('.ico8', html).show();
			}
		}
	});
	//增加浮层事件
	html.mouseover(function() {
		$(html[3]).show();
	}).mouseout(function() {
		$(html[3]).hide();
	});
	//附加到界面
	$(div).html(html);
	
	return aSound;
}

function showAppPannel() {
	if($(document).width() >= 500) {
		var download = "http://appserver.baike.com/deploy/guancha/baikeguancha_1.0.11.apk";
		var pannel = '<div class="mini"><p class="yyhf">“语言回复”请下载手机端应用（扫描下载或者直接点击下载）</p><ul class="yyhfUl"><li style="display:none"><img src="images/1.png" alt="扫描下载iPhone版" /><p>扫描下载iPhone版</p></li><li><img src="http://cms.huimg.cn/about/m/images/baikeguancha_android.png" alt="扫描下载Android版" /><p>扫描下载Android版</p></li></ul><div class="yyhfBtn"><button style="display:none">iPhone 版下载</button><button onclick=javascript:window.location.href="'+download+'">Android 版下载</button></div></div>';
		popWindow(500,'语音回复，精彩无限！',pannel);
	}else {
		var pannel = '<div class="mini"><div class="yyhfTag"><a id="iphoneTab" href="#" onclick=\'$("#iphoneTab").removeClass("current");$("#androidTab").addClass("current");return false;\' class="current yyhfTagL">iPhone版下载</a><a id="androidTab" onclick=\'$(this).removeClass("current");$("#iphoneTab").addClass("current");return false;\' href="#">Android版下载</a></div><p class="yyhf">“语言回复”请下载手机端</p><ul class="yyhfUl"><li class="current"><img src="images/1.png" alt="扫描下载iPhone版" /><p>扫描下载iPhone版</p></li><li><img src="http://cms.huimg.cn/about/m/images/baikeguancha_android.png" alt="扫描下载Android版" /><p>扫描下载Android版</p></li></ul><div class="yyhfBtn"><button class="current">iPhone 版下载</button><button>Android 版下载</button></div>';
		popWindow(200,'语音回复，精彩无限！',pannel);
	}
	//TODO 下载统计
}

function recordLog(watchflag){
	try {
		$.getScript("http://stat.baike.com/js/webstat_manage.js", function() {
			StatVirtualTraffic(document.referrer, window.location, "stat_hdstat_onclick_" + watchflag);
		});
	} 
	catch (e) {
	}
}
function showsec(id){//显示验证码
	var objImage=document.getElementById(id);
	objImage.src="/Captcha.wiki?random="+Math.random();
}
//add by let
$(document).ready(function() {
	commentInit();
	//初始化声音播放器
	soundManager.setup({
		url : 'http://comment.baike.com/js/soundManager/swf/',
		onready : function() {
			soundManagerStatus = true;
		},
		ontimeout : function() {
			soundManagerStatus = false;
		}
	});
	setTimeout(function() {
		$('.btnSound').each(function(index) {
			createSound($(this).attr('uuid'), $(this).attr('soundUrl'), $(this).attr('length'), this);
		});
	}, 1000);
	$('.btnSheng').click(showAppPannel);
	
	
	//最热评论收缩
	var hotComments = $("[commentPosition='hot']"); 
	if(hotComments.size() > 5) {
		hotComments.each(function(i) {
			if(i >=5) {
				$(this).hide();
			}
		});
		$('.btnMore').show();
		$('.btnMore').click(function() {
			$(this).hide();
			hotComments.each(function(i) {
				if(i >=5) {
					$(this).show();
				}
			});
			getIframeHeight();
		});
	}else if(hotComments.size() >=1 && hotComments.size() <= 5) {
		$('.btnMore').hide();
	}else {
		//什么都不做
	}
});

