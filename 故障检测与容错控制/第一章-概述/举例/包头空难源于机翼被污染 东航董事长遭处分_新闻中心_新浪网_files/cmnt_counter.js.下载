// comment-sounter应用接口
// settings
//p_id=1&t_id=792&d_id=12
var ON = true; // 是否启用本功能
var ISNEW =true 
var Q = "http://counter.sina.com.cn/querylist?format=js&entry=g_clist&id=0&key="; // Counter接口
var U = "http://comment4.news.sina.com.cn/comment/comment4.html?channel=_CHANNEL_&newsid=_NEWSID_&style=_STYLE_"; // 留言板URL

//http://comment5.news.sina.com.cn/cmnt/count?format=json&newslist=gn:1-1-23729031:0,ty:6-12-5970313:0&callback=test12345 
var Q_new = "http://comment5.news.sina.com.cn/cmnt/count?format=json&callback=counter_callback_new&newslist="; // Counter接口
var Q_new_1 = "http://comment5.news.sina.com.cn/cmnt/count?format=json&newslist="; // Counter接口
var U_new = "http://comment5.news.sina.com.cn/comment/skin/default.html?channel=_CHANNEL_&newsid=_NEWSID_&style=_STYLE_"; // 留言板URL
if (ISNEW){
	Q = Q_new;
	Q1 = Q_new_1;
	U = U_new
}
var V = "<A HREF='_URL_' target=_blank>_COUNT_</A>"; // 留言板入口
// depend
var undefined; // for IE5
var g_clist = new Array();
function get_elements_by_tagname( tag, name ) {
     var elem = document.getElementsByTagName( tag );
     var arr = new Array();
     for( i=0,iarr=0; i<elem.length; ++i ) {
          var att = elem[i].getAttribute( "name" );
          if( att == name ) {
               arr[iarr] = elem[i];
               ++iarr;
          }
     }
     return arr;
}
function valid( str ) {
	if ( str==null || str=="" ) {
		return false;
	} else {
		return true;
	}
}
function replace( origin, from, to ) {
	var re = new RegExp( from, "g" );
	return ( origin.replace(re,to) );
}
function uri_encode( str ) {
	if ( !valid(str) ) {
		return "";
	}
	var toescape = ";/?:@&=+ \"#%<>'`[],~!$^(){}|\\";
	var newstr="", chr="";
	for ( var i=0; i<str.length; i++ ) {
		chr = str.charAt(i);
		if ( toescape.indexOf(chr) == -1 ) {
			newstr += chr;
		} else {
			newstr += escape( chr );
		}
	}
	return newstr;
}
function write_back( clist, nlist ) {
    for ( var n=0; n<nlist.length; ++n ) {
        var NODE = nlist[n];
        // cmnt_id
        var cmnt_id = NODE.getAttribute( "cmnt_id" );
        var COUNT = 0;
        for ( var c=0; c<clist.length; ++c ) {
            var KEY = clist[c][0];		    
            if (  cmnt_id == KEY ) {
                COUNT = parseInt( clist[c][1] );
            }
        }
        // limit
        var limit = NODE.getAttribute( "show_limit" );
        if ( valid(limit) ) {
            var border = limit.split(",");
            if ( (border[0]!=undefined && border[0]!="0" && COUNT<parseInt(border[0])) ||
                (border[1]!=undefined && border[1]!="0" && COUNT>parseInt(border[1])) ) {
                continue;
            }
        }
        // url
        var params = cmnt_id.split(":");
        var url = replace( U, "_CHANNEL_", params[0] );
        url = replace( url, "_NEWSID_", params[1] );
        url = replace( url, "_STYLE_", params[2] );
        // count string 
        var count_string = COUNT;
        if ( NODE.getAttribute("cmnt_url") == "true" ) {
            count_string = replace( V, "_URL_", url );
            count_string = replace( count_string, "_COUNT_", COUNT );
        }
        // write
        if ( typeof(cmnt_count_renderer) != "undefined" ) {
            NODE.innerHTML = cmnt_count_renderer( COUNT, url ,NODE);
        } else {
            NODE.innerHTML = replace( NODE.innerHTML, "_COUNT_", count_string );
        }
        NODE.style.display = "";
        // refresh
        var refresh = NODE.getAttribute( "auto_refresh" );
        // ...	    
    }
}
function _load( url ) {
	var js_doc = document.createElement( "script" ); 
	js_doc.setAttribute( "type", "text/javascript" );
	js_doc.setAttribute( "charset", "GBK" );
	var head = document.getElementsByTagName("head")[0];
	if ( head == undefined ) {
		return;
	}
	head.insertBefore( js_doc, null );
	js_doc.src = url;
}
//分割数组
var tool = {
		split:function(arr,max_len){
			var len = arr.length,
				group = Math.ceil(len / max_len),
				temp_arr = [];
			for(var i=0;i<group;i++){
				var temp_clone = arr.concat([]);
				temp_arr[i] = temp_clone.splice( i * max_len, max_len);
			};
			return temp_arr;
		},
		timedProcessArray:function(items, process, callback){
			var todo = items.concat(); //create a clone of the original
			setTimeout(function(){
				var start = +new Date();
				do {
					process(todo.shift());
				} while (todo.length > 0 && (+new Date() - start < 50));
				if (todo.length > 0){
					setTimeout(arguments.callee, 100);
				} else {
					callback(items);
				}
			}, 100);
		},
		isFunction:function(fn){
            return "[object Function]" === Object.prototype.toString.call(fn);
		},
		loadScript:function(url,opt,callback){
			var fnName = "SINACOMMENT" + (+new Date()) + parseInt( Math.random() * 100000 );
			var script = document.createElement("script");
			window[ fnName ] = function(){
				callback.apply( this, arguments );
				try {
					delete window[ fnName ];
					script.parentNode.removeChild(script);
				} catch (e) {

				}
			};
			var param = [];
			for(var key in opt){
				if(key != 'charset'){
					param.push(key + "=" + opt[key]);
				}
			};
			param.push("callback=" + fnName);
			//获取数据;
			var url = url + param.join("&");		
			script.type = "text/javascript";
			script.src = url;
			script.charset = opt.charset || 'GBK';
			document.getElementsByTagName("head")[0].appendChild(script);
		}
};
function load_cmntcount(g_nlist) {
	//console.log(g_nlist);
	// make query string
	var keys= [] , query;
	var map_appeared = new Object();
	for ( var i=0; i<g_nlist.length; ++i ) {
		map_appeared[g_nlist[i].getAttribute("cmnt_id") ] = 1;
	}
	for ( cmntid in map_appeared ) {
		keys.push( cmntid);
	}
	query = Q1 + keys.join(",");
	// update pv, ONLY PROCESS THE FIRST cmnt_count NODE
	var c1 = g_nlist[0];
	var pv_id = c1.getAttribute("p_id");
	var pv_key = c1.getAttribute("p_key");
	var pv_url = c1.getAttribute("p_url");
	if ( valid(pv_id) && valid(pv_key) && valid(pv_url) ) {
		query += ( "&p_id=" + uri_encode(pv_id) );
		query += ( "&p_key=" + uri_encode(pv_key) );
		query += ( "&p_url=" + uri_encode(pv_url) );
		query += ( "&p_expara=" + uri_encode(c1.getAttribute("p_expara")) );
	};
	query += "&";
	// read count
	tool.loadScript( query ,{},function(obj){
		counter_callback_new(obj,g_nlist);
	});
}
// callback
function counter_callback() {
	write_back( g_clist, g_nlist );
}

function counter_callback_new(obj,g_nlist){
	count_list = obj && obj['result'] && obj['result']['count']
	g_clist_new = new Array();
	if(count_list){
		for ( var i=0; i<g_nlist.length; ++i ) {
			var newsid = g_nlist[i].getAttribute("cmnt_id");
			var tmp_obj = count_list[newsid];
			if (tmp_obj){
				var my_total = tmp_obj['total']
				var my_show = tmp_obj['show']
				var my_qreply = tmp_obj['qreply']
				g_clist_new[i] = new Array(newsid, my_show);
			}
			else{
				g_clist_new[i] = new Array(newsid, 0);
			}
		}
		write_back( g_clist_new, g_nlist );
	}
}
// start
var g_nlist = new Array();
function reload_cmntcount() {
	g_nlist = get_elements_by_tagname( "span", "cmnt_count" );
	if ( ON && g_nlist.length>0 ) {
		if(g_nlist.length < 50){
			load_cmntcount(g_nlist);
		}else{
			var arr = tool.split(g_nlist,50);
			tool.timedProcessArray(arr,function(arrItem){
				load_cmntcount(arrItem);
			},function(){});
		}
	}
};

reload_cmntcount();

