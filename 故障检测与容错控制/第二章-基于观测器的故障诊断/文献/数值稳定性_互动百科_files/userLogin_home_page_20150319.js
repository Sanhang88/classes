function getHdCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) return unescape(arr[2]);
    return null;
}

var common_login = {
    inputtime: 0,
    blinkswitch: 0,
    blinktitle: document.title,
    flashMsging: null,
    blinkid: null,
	blinkDesc: null,
    stopFlashNewMsg: function() {
        clearInterval(common_login.blinkid);
        document.title = common_login.blinkDesc+common_login.blinktitle;
		common_login.blinkswitch = 0;
    },
    flashNewMsg: function() {
        document.title = common_login.blinkswitch % 2 ? "【　　　】 - " + common_login.blinktitle: common_login.blinkDesc+" - " + common_login.blinktitle;
        common_login.blinkswitch++;
        if (common_login.blinkswitch > 50) {
            common_login.stopFlashNewMsg();
			document.title = common_login.blinkDesc+common_login.blinktitle;
        }
    },
    loadLoginInfo: function() {
	    var options = {};
        if (!((typeof HD_HEAD_OPTION) == 'undefined')) {
            options = HD_HEAD_OPTION;
        } else {
            if (window.location.hostname == "i.baike.com") {
                options = {
                    hrefType: "_self"
                };
            }
        }
		options = userNoticeDataInfo.getInitArgs(options);
            if (getHdCookie('hduser') == null) {
			  common_login.setDefaultLoadInfo(options.divId);
			}else{
                    common_login.getDataInfo(function(dataInfo) {
                        if (typeof(dataInfo) != "undefined" && dataInfo != null) {
                            // 接下来是对dataInfo对象进行处理
                            common_login.displaceHtml(dataInfo, options);
                        }
                    })
                setTimeout('common_login.loadLoginInfo()', 120000);
            }
    },
    loadDynamicJs: function(url, fun) {
        var script = document.createElement("script");
        script.src = url + '&t=' + Math.random();
        script.type = "text/javascript";
        script.onreadystatechange = function() { // IE不支持script的onload事件，支持script的onreadystatechange事件
            if (script.readyState == 'complete' || script.readyState == 'loaded') {
                setTimeout(function() { // 延时操作
                    fun();
                },
                1000);
            }
        },
        script.onload = function() { // firefox支持script的onload事件，不支持script的onreadystatechange事件
            setTimeout(function() { // 延时操作
                fun();
            },
            1000);
        };
        document.getElementsByTagName("head").item(0).appendChild(script);
    },
    /**
	 * 功能：在不同的域使用的时候，提供数据。
	 * 
	 * @param {function}
	 *            IforGetDiffDataFun, 该函数是当加载数据成功后需要执行的函数。不能为null。
	 * @comment 返回数据的格式为：var dataInfo =
	 *          {"newFansCount":0,"newFeedMeCount":0,"newRecommendMissionCount":0,"unReadNoticeCount":0,"unReadPrivateMsgCount":1,"unReadNewSystemCount":0,"unReadBaikeNoticeCount":0};
	 */
    getDataInfo: function(IforGetDiffDataFun) {
        // 将http请求的url传给commonUtils对象的loadDynamicJs方法，得到返回的dataInfo，再进行操作
        var url = "http://i.baike.com/userNoticeInfoForNav.do?action=getUserNoticeInfoForNav&callback=dataInfo";
        common_login.loadDynamicJs(url,
        function() {
            if (typeof(dataInfo) != "undefined" && dataInfo != null) {
                IforGetDiffDataFun(dataInfo);
            }
        });
    },
	setDefaultLoadInfo: function(tagObject){
	  var nextUrl = encodeURIComponent(encodeURI(window.location.href));
	  document.getElementById(tagObject).innerHTML = "<li class='log' id='entry'><a target='_self' class='cwhite' onmousedown=\"document.domain='baike.com';var date=new Date();date.setTime(date.getTime()+24*3600*1000);document.cookie='nextURL='+encodeURIComponent((document.referrer.length&gt;0&amp;&amp;document.referrer!=window.location.href)?document.referrer:window.location.href)+';expire='+date.toGMTString()+';path=/;domain=.baike.com;'\" href='http://passport.baike.com/login.do?service="+nextUrl+"'>登录</a></li><li class='log bor-no' id='login'><a target='_self' href='http://passport.baike.com/user/userRegister.jsp' class='cwhite'>注册</a></li>";
	},
    displaceHtml: function(dataInfo, options) {
        var userNoticeInfo;
		var htmlparts = {};
        if (typeof(dataInfo) != "undefined" && dataInfo != null) {
            var noticeCount = dataInfo["userNoticeCount"];
            var noticeCountHtml = "";
            if (noticeCount > 0) {
                if (noticeCount > 99) {
                    noticeCount = "N+";
                }
				noticeCountHtml = '<em class="hup" style="display:block;">'+ noticeCount + '</em>';
            }
			var userNick = dataInfo["userNick"];
			if(userNick==null){
				userNick = "";
			}

            userNoticeInfo = userNoticeDataInfo.getDisplayData(dataInfo);
            for (var i in userNoticeDataInfo.keys) {
                var noticeKey = userNoticeDataInfo.keys[i];
                if (userNoticeInfo.hasOwnProperty(noticeKey)) {
                    if (userNoticeDataInfo.noticeUrl.hasOwnProperty(noticeKey)) {
                        var noticeCount = userNoticeInfo[noticeKey] == 0 ? "": "<em>" + userNoticeInfo[noticeKey] + "</em>";
                        if (userNoticeInfo[noticeKey] > 99) {
                            noticeCount = "<em>N+</em>";
                        }
                        htmlparts[noticeKey]=userNoticeDataInfo.noticeUrl[noticeKey].replace("\$", noticeCount);
                    }
                }
            }
			
			
			/*var disHtml='<li class="log">'
			+'<strong class="lk">'+userNick+'</strong>'
			+'<p style="width:90px;">'
			+htmlparts['newFansCount']
			+'<a href="http://i.baike.com/editBaseInfo.do" target="_blank">账号设置</a>'
			+'<a href="http://i.baike.com/user/logout/userLogout.jsp">退出</a></p></li>'
			+'<li class="log">'
			+'<a  class="lk">消息'+noticeCountHtml+'</a>'
			+'<p style="width:115px;">'
			+htmlparts['unReadPrivateMsgCount']
			+htmlparts['unReadNoticeCount']
			+htmlparts['newFeedMeCount']
			+htmlparts['unReadBaikeNoticeCount']
			+htmlparts['unReadCommentReplyNoticeCount']
			+htmlparts['unReadNewSystemCount']
			+'</p></li>'
			+'<li class="log">'
            disHtml += "<a  class='lk'>我的百科</a><p style='width:90px;'>";
			
            //设置列表
            if(dataInfo['isBaikeAdsUser'] == "false"){
				disHtml +="<a href='http://i.baike.com/myDocs.do' target='_blank'>我的贡献</a>" + "<a href='http://i.baike.com/myDocs.do?draft=true' target='_blank'>草稿箱</a>" + "<a href='http://i.baike.com/myMissions.do' target='_blank'>我的任务</a></P></li>";
            }else{
				disHtml +=htmlparts['unReadAuthorityAuditCount']
				+"<a href='http://i.baike.com/myDocs.do' target='_blank'>我的贡献</a>" 
				+ "<a href='http://i.baike.com/myMissions.do' target='_blank'>我的任务</a>" 
				+ htmlparts['teamApplyUserCount']
				+ htmlparts['newRecommendMissionCount']
				+ "<a href='http://i.baike.com/myDocs.do?draft=true' target='_blank'>草稿箱</a>" 
				+ "<a href='http://i.baike.com/myXBK.do?action=toMyXbk'  target='_blank'>我的百科</a>"
				+ "<a href='http://ads.baike.com'  target='_blank'><font color='red'>企业服务</font></a></p></li>"			
            }
            disHtml += '<li class="log bor-no"><a href="http://www.baike.com/">百科首页</a></li>';
			*/
			var pic = "";
			var pic_default = "http://www.huimg.cn/sns/images/tou.gif";
			var pic_rec = dataInfo["userImg"];
			if(null==pic_rec||""==pic_rec||undefined==pic_rec){
				pic = pic_default;
			}else{
				pic = pic_rec;
			}
			var disHtml = '<li class="user-face">';
			disHtml += '<a href="http://i.baike.com/home.do" class="lv" target="_blank"><img class="w30" src='+pic+'><i></i>'+noticeCountHtml+'</a>';
			disHtml += '<p>'+htmlparts["unReadAuthorityAuditCount"]+htmlparts["unReadPrivateMsgCount"]+htmlparts["newRecommendMissionCount"]+htmlparts["newFansCount"]+htmlparts["newFeedMeCount"]+htmlparts["unReadNoticeCount"]+htmlparts["unReadCommentReplyNoticeCount"]+htmlparts["unReadBaikeNoticeCount"]+htmlparts["teamApplyUserCount"]+htmlparts["unReadNewSystemCount"]+'<a href="http://i.baike.com/myDocs.do" target="_blank">我的贡献</a><a href="http://i.baike.com/myDocs.do?draft=true" target="_blank">草稿箱</a><a href="http://i.baike.com/myMissions.do" target="_blank">我的任务</a><a href="http://i.baike.com/myXBK.do?action=toMyXbk" target="_blank">我的百科</a>	<a href="http://i.baike.com/editBaseInfo.do" target="_blank">账号设置</a><a href="http://i.baike.com/user/logout/userLogout.jsp">退出</a><a href="http://service.baike.com" target="_blank">帮助</a></p>';
			disHtml +=  '</li>';
            document.getElementById(options.divId).innerHTML = disHtml;
            //给标题添加新消息提示
            common_login.blinksTitle(userNoticeInfo, userNoticeDataInfo.keys);
            //鼠标hover事件
            common_login.loginHover(options);
        } else {
            document.getElementById(options.divId).innerHTML = "<li>加载失败</li>";
        }
    },
	//根据key 返回所需要的html标签  用于消息通知
	/*modifyNotice: function(dataInfo,noticeKey){
		var disHtml;
		var noticeCount;
		var userNoticeInfo = userNoticeDataInfo.getDisplayData(dataInfo);
	    if (userNoticeInfo.hasOwnProperty(noticeKey)) {
            if (userNoticeDataInfo.noticeUrl.hasOwnProperty(noticeKey)) {
                 noticeCount = userNoticeInfo[noticeKey] == 0 ? "": "<em>" + userNoticeInfo[noticeKey] + "</em>";
                    if (userNoticeInfo[noticeKey] > 99) {
                          noticeCount = "<em>N+</em>";
                }
              disHtml = userNoticeDataInfo.noticeUrl[noticeKey].replace("\$", noticeCount);
            }
        }
		return disHtml;
	},*/
    blinksTitle: function(userNoticeInfo, keys) {
    	clearInterval(common_login.blinkid);
	    //去除消息提示
	    document.title = common_login.blinktitle;
        for (var i in keys) {
            if (userNoticeInfo[keys[i]] != 0) {
			    common_login.blinkDesc = userNoticeDataInfo.noticeDesc[keys[i]];
			    common_login.blinkid = setInterval(blinkNewMsg, 1000);
                break;
            }
        }
    },
    loginHover: function(options) {
		var self = this;
        var ul = document.getElementById(options.divId);
        var list = ul.getElementsByTagName("li");
        for (var i = 0; i < list.length; i++) {
			/*var k_title = list[i].getElementsByClassName("lk");
			var k_title =  self.getElementsByClassName("lk",list[i],"");
			if(null==k_title||k_title.length<1){
					continue;
			}
			k_title[0].style.paddingBottom="8px";*/
            list[i].onmouseover = function() {
                addClass(this, "hover");
            }
            list[i].onmouseout = function() {
                removeClass(this, "hover");
            }
        }
    },
	getElementsByClassName : function (searchClass, node,tag) {
			var result = [];
			if(document.getElementsByClassName){
			  var nodes =  (node || document).getElementsByClassName(searchClass),tag = tag || "*";
				  if(tag === "*"){
					for(var i=0 ;node = nodes[i++];){
						result.push(node);
					}
				  }else{
					for(var i=0 ;node = nodes[i++];){
						if(node.tagName === tag.toUpperCase()){
							result.push(node);
						}
					}
				  }
				return result;
			  }else{
				node = node || document;
				tag = tag || "*";
				var classes = searchClass.split(" "),
				elements = (tag === "*" && node.all)? node.all : node.getElementsByTagName(tag),
				patterns = [],
				current,
				match;
				var i = classes.length;
				while(--i >= 0){
				  patterns.push(new RegExp("(^|\\s)" + classes[i] + "(\\s|$)"));
				}
				var j = elements.length;
				while(--j >= 0){
				  current = elements[j];
				  match = false;
				  for(var k=0, kl=patterns.length; k<kl; k++){
					match = patterns[k].test(current.className);
					if (!match)  break;
				  }
				  if (match)  result.push(current);
				}
				return result;
			  }
        }
}

function hasClass(obj, cls) {
    return obj.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
}

function addClass(obj, cls) {
    if (!hasClass(obj, cls)) obj.className += " " + cls;
}

function removeClass(obj, cls) {
    if (hasClass(obj, cls)) {
        var reg = new RegExp('(\\s|^)' + cls + '(\\s|$)');
        obj.className = obj.className.replace(reg, ' ');
    }
}

var userNoticeDataInfo = {

    /**
	 * 定义变量，当新加一种通知类型的时候，只需要在keys中添加新的通知类型的key，在noticeUrl中添加key和该key对应的页面显示内容
	 */
    // keys：从http请求传回的json数据包含的所有key
	keys: ["unReadAuthorityAuditCount","unReadPrivateMsgCount","newRecommendMissionCount","newFansCount", "newFeedMeCount", "unReadNoticeCount", "unReadCommentReplyNoticeCount", "unReadBaikeNoticeCount", "teamApplyUserCount","unReadNewSystemCount"  ],
    /**
	 * 每个key对应的页面显示内容（包括通知数量和url等），供加载jquery的页面使用
	 */
    noticeUrl: {
		"unReadAuthorityAuditCount": "<a href='http://i.baike.com/myDocs.do?haveLook=true' key='unReadAuthorityAuditCount' target='_blank' class='wh1'>权威评审$</a>",
		"unReadPrivateMsgCount": "<a href='http://i.baike.com/myMsgs.do' key='unReadPrivateMsgCount' target='_blank' class='wh1'>站内信$</a>",
		 "newRecommendMissionCount": "<a href='http://i.baike.com/myMissions.do?showType=2' key='newRecommendMissionCount' target='_blank' class='wh2'>推荐任务$</a>",
		"newFansCount": "<a href='http://i.baike.com/fansList.do' key='newFansCount' target='_blank' class='wh2'>我的粉丝$</a>",
		"newFeedMeCount": "<a href='http://i.baike.com/home.do?type=2' key='newFeedMeCount' target='_blank' class='wh2'>@我的消息$</a>",
		"unReadNoticeCount": "<a href='http://i.baike.com/unReadNotice.do' key='unReadNoticeCount' target='_blank' class='wh3'>回复我的$</a>",
		"unReadCommentReplyNoticeCount": "<a href='http://i.baike.com/myMsgs.do?action=inbox&msg_type=1'  key='unReadCommentReplyNoticeCount' target='_blank' class='wh1'>讨论区回复$</a>",
		"unReadBaikeNoticeCount": "<a href='http://i.baike.com/myMsgs.do?action=baikeNotice'  key='unReadBaikeNoticeCount' target='_blank' class='wh2'>站点回复$</a>",
	    "teamApplyUserCount": "<a href='http://i.baike.com/myMissions.do'  key='teamApplyUserCount' target='_blank' class='wh3'>有奖任务$</a>",
		"unReadNewSystemCount": "<a href='http://i.baike.com/myMsgs.do?action=inbox&msg_type=1'  key='unReadNewSystemCount' target='_blank' class='wh3'>系统通知$</a>" 
    },
    noticeDesc: {
        "unReadAuthorityAuditCount": "【新权威评审】",
        "unReadPrivateMsgCount": "【新消息】",
        "newRecommendMissionCount": "【新推荐任务】",
        "newFansCount": "【新粉丝】",
        "newFeedMeCount": "【新回复】",
        "unReadNoticeCount": "【新回复】",
        "unReadCommentReplyNoticeCount": "【新回复】",
        "unReadBaikeNoticeCount": "【新回复】",
        "teamApplyUserCount": "【新抢词夺理入队申请】",
        "unReadNewSystemCount": "【新系统通知】"
    },
    /**
	 * 定义默认的参数
	 */
    defaults: {
        // 页面显示的浮窗是一个div，定义div的id
        divId: "loggingnews",
        // 浮窗的位置参数
        location: document.body,
        // a标签指向的url是否在新页面打开，默认在新页面打开（即：<a href="www.baike.com"
        // target="_blank">）
        hrefType: "_blank"
    },

    /**
	 * 获取需要显示的数据，返回一个数组，包括：key值、未读信息的数量。
	 * 
	 * @param {object}
	 *            dataInfo
	 */
    getDisplayData: function(dataInfo) {
        var self = this;
        var userNoticeInfo;
        if (dataInfo != null) {
            userNoticeInfo = dataInfo["UserNoticeInfoModel"]
        }
        return userNoticeInfo;
    },

    // 获取参数，在生成页面显示的浮窗的html代码的时候，如果不传递参数，则使用默认值；如果传递参数，则使用传递的值。
    getInitArgs: function(options) {
        var self = this;
        if ((typeof(options) == "undefined") || (options == null)) {
            options = self.defaults;
        } else {
            function extend(defaults, options) {
                var type;
                for (var i in defaults) {
                    type = typeof options[i];
                    if (type == "undefined") {
                        // 如果在默认值中的对象在 options中不存在，则options的值为默认值
                        // 使用默认值
                        options[i] = defaults[i];
                    } else {
                        // 如果默认值中的对象在 options中以对象存在，则需要判断 options
                        // 这个对象是否是jquery函数，如果不是则继续遍历。
                        if (type == "object") {
                            var type2 = typeof options[i].html;
                            if (type2 == "undefined") {
                                extend(defaults[i], options[i]);
                            }
                        }
                    }
                }
            }
            extend(self.defaults, options);
        }
        return options;
    }
};
function loadLoginInfo() {
    common_login.loadLoginInfo();
}

function blinkNewMsg() {
    common_login.flashNewMsg();
}
function stopBlinkNewMsg() {
    common_login.stopFlashNewMsg();
}