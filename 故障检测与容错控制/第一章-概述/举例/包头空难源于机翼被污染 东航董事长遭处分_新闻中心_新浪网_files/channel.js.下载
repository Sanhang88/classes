var g_local = new Array();
var g_preURL = "";
function init_local()
{
	var tmpstr = "";
	tmpstr = g_preURL + "anh/";
	g_local['安徽省'] = tmpstr;
	tmpstr = g_preURL + "beij/";
	g_local['北京市'] = tmpstr;
	tmpstr = g_preURL + "chongq/";
	g_local['重庆市'] = tmpstr;
	tmpstr = g_preURL + "fuj/";
	g_local['福建省'] = tmpstr;
	tmpstr = g_preURL + "gansh/";
	g_local['甘肃省'] = tmpstr;
	tmpstr = g_preURL + "guangd/";
	g_local['广东省'] = tmpstr;
	tmpstr = g_preURL + "guangx/";
	g_local['广西'] = tmpstr;
	tmpstr = g_preURL + "guizh/";
	g_local['贵州省'] = tmpstr;
	tmpstr = g_preURL + "hain/";
	g_local['海南省'] = tmpstr;
	tmpstr = g_preURL + "heb/";
	g_local['河北省'] = tmpstr;
	tmpstr = g_preURL + "heilj/";
	g_local['黑龙江省'] = tmpstr;
	tmpstr = g_preURL + "hen/";
	g_local['河南省'] = tmpstr;
	tmpstr = g_preURL + "hub/";
	g_local['湖北省'] = tmpstr;
	tmpstr = g_preURL + "hun/";
	g_local['湖南省'] = tmpstr;
	tmpstr = g_preURL + "neimg/";
	g_local['内蒙古'] = tmpstr;
	tmpstr = g_preURL + "jiangshu/";
	g_local['江苏省'] = tmpstr;
	tmpstr = g_preURL + "jiangx/";
	g_local['江西省'] = tmpstr;
	tmpstr = g_preURL + "jil/";
	g_local['吉林省'] = tmpstr;
	tmpstr = g_preURL + "liaon/";
	g_local['辽宁省'] = tmpstr;
	tmpstr = g_preURL + "ningx/";
	g_local['宁夏'] = tmpstr;
	tmpstr = g_preURL + "qingh/";
	g_local['青海省'] = tmpstr;
	tmpstr = g_preURL + "shanx_taiy/";
	g_local['山西省'] = tmpstr;
	tmpstr = g_preURL + "shanx_xian/";
	g_local['陕西省'] = tmpstr;
	tmpstr = g_preURL + "shand/";
	g_local['山东省'] = tmpstr;
	tmpstr = g_preURL + "shangh/";
	g_local['上海市'] = tmpstr;
	tmpstr = g_preURL + "sich/";
	g_local['四川省'] = tmpstr;
	tmpstr = g_preURL + "tianj/";
	g_local['天津市'] = tmpstr;
	tmpstr = g_preURL + "xizh/";
	g_local['西藏'] = tmpstr;
	tmpstr = g_preURL + "xinj/";
	g_local['新疆'] = tmpstr;
	tmpstr = g_preURL + "yunn/";
	g_local['云南省'] = tmpstr;
	tmpstr = g_preURL + "zhej/";
	g_local['浙江省'] = tmpstr;
	tmpstr = g_preURL + "gangaotai/";
	g_local['港澳台'] = tmpstr;
	tmpstr = g_preURL + "beij/";
	g_local['其他省'] = tmpstr;
	tmpstr = g_preURL + "";
	g_local['全国'] = tmpstr;
		
}


function location_jump()
{
	if(province == "" || province == "undefined")
	{
		return false;
	}

	init_local();

	if(g_local[province] == "" || g_local[province] == "undefined")
	{
		return false;
	}

	var urlStr=window.location.href;
	var urlBase = "";

	var pos = urlStr.lastIndexOf("/");
	urlBase = urlStr.substr(0, pos+1);

	filename = urlStr.substr(pos+1);


	
	
	
	var jump_url = urlBase + g_local[province] + filename;
	window.location = jump_url;
}

location_jump();
