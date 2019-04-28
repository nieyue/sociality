var business={
	//域名路径
	//domainurl:'http://localhost:8080',

    domainurl:'',
	//domainurl:'http://119.27.177.29:8080',
	//domainurl:'http://zbb.tea18.cn',
    self:{

    },
    /**
     * 验证规则
     */
    userVerification:{
        username:/(^[\u4E00-\u9FA5]{2,16}$)|(^[a-zA-Z\/ ]{2,16}$)/,//中文或英文2-16位
        merDiscount:/^(0\.(0[1-9]{1}|[1-9]\d?)|1(\.0{1,2})?)$/,//0.01-1.00之间
        scale:/^[0]$|^(0\.(0[1-9]{1}|[1-9]\d?)|1(\.0{1,2})?)$/,//0-1.00之间 ，比例
        merPrice:/(^[+]?[1-9]\d*(\.\d{1,2})?$)|(^[+]?[0]{1}(\.\d{1,2})?$)/,//商品价格正则,大于0最多两位小数
        catNum:/^\+?[1-9][0-9]*$/,// 非零正整数
        postNum:/^\+?[0-9][0-9]*$/,// 含零正整数
        nicename: /^[^\s]{1,10}$/,// 1-10位,不包含空格。
        signature:/^[^\s]{1,15}$/,// 1-15位,不包含空格.
        email:/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+(\.[a-zA-Z]{2,3})+$/, // 邮箱
        phone:/^1[0-9]{10}$/, // 手机
        identity:/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/, // 15位和18位身份证号码
        password:/^[0-9_a-zA-Z]{6,20}$/ // 数字、字母、下划线，6-20长度
    },
    //请求原始参数初始
    originParams:{
        startNum:1,//初始化个数
        currentPage:1,//当前页
        pageNum:1,//获取的第几个开始
        pageSize:10,//每页的个数
        total:0//总数
    },
    //请求参数初始
    params:{
        startNum:1,//初始化个数
        currentPage:1,//当前页
        pageNum:1,//获取的第几个开始
        pageSize:10,//每页的个数
        total:0//总数
    },
	//ajax
	ajax:function(param){
        $.ajax({
            url:business.domainurl+param.url,
            data:param.data||{},
            async:param.async==false?false:true,
            dataType:'json',//服务器返回json格式数据
            type:'post',//HTTP请求类型
            timeout:10000,//超时时间设置为10秒；
            xhrFields: {withCredentials: true},
            success: function(data){
                //business.myLoadingToast(data.msg)
                if(!data.code||data.code==200){
                    if(typeof param.success=='function'){
                        param.success(data);
                    }
                }else{
                    if(typeof param.fail=='function'){
                        param.fail(data);
                    }
				}
            }
        })
	},
    /**
     * 单文件上传组件
     * options:输入项
     * options.inputfile 文件元素
     * options.ajaxObj 数组对象1，formData{key,value} 2,url 3,success 4,error
     * options.dragFn 拖拽的对象
     */
    fileUpload:function(options){
        var initPhotoExt=options.photoExt||[".jpg",".png",".gif",".apk"];
        var isPhotoExt=false;
        if(!options&&typeof options!='object' ){
            business.myLoadingToast("操作失败",null);
            return;
        }
        var file=options.inputfile.get(0);
        //console.log(file.files)
        var photoExt=file.value.substr(file.value.lastIndexOf(".")).toLowerCase();// 获得文件后缀名
        // 判断格式
        if(initPhotoExt[0]!="**"){
            for (var i = 0; i < initPhotoExt.length; i++) {
                if(photoExt==initPhotoExt[i])	{
                    isPhotoExt=true;
                }
            }
            if(!isPhotoExt){
                business.myLoadingToast("请上传后缀名为"+initPhotoExt.join("").replace(/\./g,"/")+"的文件!");
                return false;
            }
            /* if(photoExt!='.jpg'&&photoExt!='.png'&&photoExt!='.gif'&&photoExt!='.apk'){
                 myUtils.myLoadingToast("请上传后缀名为jpg/png/gif的照片!");
                 return false;
             }*/
        }
        var fileSize = 0;
        var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
        if (isIE && !file.files) {
            var filePath = file.value;
            var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
            var file = fileSystem.GetFile (filePath);
            fileSize = file.Size;
        }else {
            fileSize = file.files[0].size;
        }
        fileSize=Math.round(fileSize/1024*100)/100; // 单位为KB
        /*if((photoExt=='.apk'&&fileSize>30000)||(photoExt!='.apk'&&fileSize>200)){
            business.myLoadingToast("图片大小为"+fileSize+"KB，超过最大尺寸为200KB，请重新上传!");
            return false;
        }*/
        if (file.files && file.files[0])
        {
            var reader = new FileReader();
            reader.readAsDataURL(file.files[0]);
            reader.onload = function(e){
                if(typeof options.ajaxObj!='object'){
                    business.myLoadingToast("上传失败",null);
                    return;
                }
                if(options.proportion){//是否有宽高比
                    var img = new Image;
                    img.src = reader.result;
                    img.onload = function () {
                        var width = img.width;
                        var height = img.height;
                        if((width/height).toFixed(2)!=(options.proportion).toFixed(2)){
                            business.myLoadingToast("图片宽高比"+(width/height).toFixed(2)+"，应为"+options.proportion);
                        }else{
                            myajax();
                        }

                    };
                }else{
                    myajax();
                }
                function myajax(){
                    business.myPrevToast("上传中",function(){
                        var fd=new FormData();
                        if(typeof options.ajaxObj.formData=='object'){
                            for (var i = 0; i < options.ajaxObj.formData.length; i++) {
                                fd.append(options.ajaxObj.formData[i].key,options.ajaxObj.formData[i].value);
                            }
                        }
                        $.ajax({
                            url:options.ajaxObj.url,
                            type:"POST",
                            data:fd,
                            timeout:30000,
                            enctype:'multipart/form-data',
                            processData:false,// 告诉jQuery不要去处理发送的数据
                            contentType:false, // 告诉jQuery不要去设置Content-Type请求头
                            success:function(src){// 获取最新图片更新
                                if(typeof options.ajaxObj.success=='function'){
                                    options.ajaxObj.success(src);
                                }
                                business.myPrevToast("上传成功",null,"remove");
                            },
                            error:function(d){
                                if(typeof options.ajaxObj.error=='function'){
                                    options.ajaxObj.error();
                                }
                                console.log(d)
                                business.myPrevToast("上传失败",null,"remove");
                            }
                        });
                    },"add");

                    if(typeof options.dragFn=='function'){
                        options.dragFn(e);
                    }
                }
            }

        }else{
            business.myPrevToast("浏览器不支持",null,"add");
            setTimeout(function(){
                business.myPrevToast("浏览器不支持",null,"remove");
            },1000);
            //$(imgelement).attr("src",file.value);
        }
    },
    /**
     * 判断是否微信浏览器
     */
    isWeiXinBrowse:function(){
        var wx=navigator.userAgent.match(/MicroMessenger/);
        if(wx){
            if(wx[0]==='MicroMessenger'){
                return true;
            }
        }
        return false;
    },
    /**
     * 判断是否滑动到底部
     */
    isScrollBottom:function(element){
        var isscrollbottom=false;
        var scrollTop = $(window).scrollTop();
        var scrollHeight = $(document).height();
        var elementHeight = $(element).height();
        var windowHeight = $(window).height();
        if((scrollTop + windowHeight >= scrollHeight-20)||(elementHeight<=windowHeight)){
            isscrollbottom=true;
            // console.log((scrollTop + windowHeight ==
            // scrollHeight)||(elementHeight<=windowHeight))
        }
        return isscrollbottom;
    },
    /**
     * 自定义登录退出
     */
    myLoginOut : function(value,fn) {
        $("body")
            .append(
                "<div id='confirmDiv' style='position:fixed;width:100%;height:100%;background-color:#ccc;opacity:0.5;left:0;top:0;'></div><div id='confirm' style='z-index:9999;color:#fff;background-color:black;text-align:center;line-height:30px;border:1px solid black;border-radius:5px;height:200px;width:200px;margin:-100px -100px;top:50%;left:50%;position:fixed;font-size:20px;'>"
                + "<i class='fa fa-wpbeginner'  style='text-align:center;width:50%;height:50%;font-size:66px;margin-top:10px;'></i><div style='position:absolute;top:100px;width:100%;text-align:center;'>"+value+"</div><div style='position:absolute;left:15px;bottom:15px;width:80px;background-color:#1890ff;color:#fff;cursor:pointer;' id='confirmYes'>确定</div><div  style='cursor:pointer;position:absolute;right:15px;bottom:15px;width:80px;background-color:#fff;color:#000;' id='confirmNo'>取消</div></div>");
        $('#confirmYes').click(function(){
            $('#confirmDiv').remove();
            $('#confirm').remove();
            if(typeof fn=='function'){
                fn();
            }
        });
        $('#confirmNo').click(function(){
            $('#confirmDiv').remove();
            $('#confirm').remove();

        });
    },
    /**
     * 实现慢事件执行的toast
     */
    myPrevToast : function(value,fn,motion) {
        // 如果存在，remove
        if(document.querySelector("#prevToastWarp")){
            document.querySelector("#prevToastValue").innerText=value;
            if(motion=="add"){
                $("#prevToastWarp").fadeIn();
                $("#prevToastWarp").attr("display","block");
            }else if(motion=="remove"){
                setTimeout(function() {
                    $("#prevToastWarp").fadeOut('slow');
                    $("#prevToastWarp").attr("display","none");
                }, 1000);
            }
            if(typeof fn=='function'){
                fn();
            }
            return;
        }
        $("body")
            .append(
                "<div id='prevToastWarp' style='display:none;position:fixed;width:100%;height:100%;top:0;left:0; z-index:999999999'><div id='prevToast' style='text-align:center;color:#fff;background-color:#000;text-align:center;line-height:30px;border:1px solid black;border-radius:5px;min-height:30px;margin:66% auto;max-width:60%;width:auto;'>"
                +"<span id='prevToastValue'>"+ value +"</span>&nbsp;&nbsp; </div></div>");
        if(typeof fn=='function'){
            fn();
        }
    },
    //快速loading
    myLoadingToast:function(value, fn){
        $("body")
            .append(
                "<div id='loadingToast' style='display:none;width:100%;text-align:center;min-height:30px;top:50%;left:0;position:fixed;z-index:999999999;'>"
                +"<div  style='color:#fff;background-color:black;border:1px solid black;border-radius:5px;text-align:center;line-height:30px;min-height:30px;max-width:200px;width:auto;;padding:0 10px;margin:auto;'>"
                + value + "</div>"
                +"</div>");
        $("#loadingToast").fadeIn();
        setTimeout(function() {
            $("#loadingToast").fadeOut('slow');
            $("#loadingToast").remove();
            if(typeof fn=='function'){
                fn();
            }
        }, 1000);
    },
    /**
     * 底部加载toast
     */
    myFootLoadingToast : function(position,bottom, fn,motion) {
        if(!position){
            position="fixed";
        }
        if(typeof bottom!='number'||isNaN(bottom)){
            bottom=0;
        }
        // 如果存在，remove
        if(document.querySelector("#footToast")){
            if(motion=="add"){
                $("#footToast").css("bottom",bottom);
                $("#footToast").fadeIn();
                $("#footToast").attr("display","block");
            }else if(motion=="remove"){
                setTimeout(function() {
                    $("#footToast").fadeOut('slow');
                    $("#footToast").attr("display","none");
                }, 1000);
            }
            if(typeof fn=='function'){
                fn();
            }
            return;
        }
        var appendOrAfter="append";
        if(position=="relative"){
            appendOrAfter="after";
        }
        $("body")[appendOrAfter](
            "<div id='footToast' style='display:none;color:#fff;background-color:#ccc;text-align:center;line-height:30px;border:0px solid black;min-height:30px;width:100%;bottom:"+bottom+";left:0;position:"+position+";'><canvas id='bottomloading'  height='30px' width='30px' style='display:inline-block;margin-bottom:-10px;' >您的浏览器不支持html5</canvas><span id='footToastValue'>正在努力加载中...</span></div>");

        if(typeof fn=='function'){
            fn();
        }

    },
    /**
     * loading小图片
     */
    loading:function (canvas,options){
        this.canvas = canvas;
        if(options){
            this.loading.radius = options.radius||12;
            this.loading.circleLineWidth = options.circleLineWidth||4;
            this.loading.circleColor = options.circleColor||'#00db00';
            this.loading.moveArcColor = options.moveArcColor||'#a6ffa6';
            this.loading.__loading=options.__loading!=null?options.__loading!=true?false:true:true;
        }else{
            this.loading.radius = 12;
            this.loading.circelLineWidth = 4;
            this.loading.circleColor = '#00db00';
            this.loading.moveArcColor = '#a6ffa6';
            this.loading.__loading=true;
        }

        function show(myutil){
            var canvas = myutil.canvas;
            if(!canvas)return;
            if(!canvas.getContext)return;
            if(canvas.__loading)return;
            canvas.__loading = myutil.loading;
            var ctx = canvas.getContext('2d');
            var radius = myutil.loading.radius;
            var me = myutil.loading;
            var rotatorAngle = Math.PI*1.5;
            var step = Math.PI/6;
            canvas.loadingInterval = setInterval(function(){
                ctx.clearRect(0,0,canvas.width,canvas.height);
                var lineWidth = me.circleLineWidth;
                var center = {x:canvas.width/2 ,y:canvas.height/2};
                ctx.beginPath();
                ctx.lineWidth = lineWidth;
                ctx.strokeStyle = me.circleColor;
                ctx.arc(center.x,center.y,radius,0,Math.PI*2);
                ctx.closePath();
                ctx.stroke();
                // 在圆圈上面画小圆
                ctx.beginPath();
                ctx.strokeStyle = me.moveArcColor;
                ctx.arc(center.x,center.y,radius,rotatorAngle,rotatorAngle+Math.PI*.45);
                ctx.stroke();
                rotatorAngle+=step;

            },66);
        }
        function hide(myutil){
            var canvas=myutil.canvas;
            canvas.__loading = false;
            if(canvas.loadingInterval){
                window.clearInterval(canvas.loadingInterval);
            }
            var ctx = canvas.getContext('2d');
            if(ctx)ctx.clearRect(0,0,canvas.width,canvas.height);
        }
        if(this.loading.__loading){
            show(this);
        }else{
            hide(this);
        }
    },
    /**
     * 自定义template
     */
    myTemplate : function(value) {
        var myTemplateWidth= 330;
        var myTemplateMarginWidth= 165;
        if(document.querySelector("html").offsetWidth>640){
            myTemplateWidth= 860;
            myTemplateMarginWidth= 430;
        }
        $("body")
            .append(
                "<div id='myTemplateDiv' style='position:fixed;width:100%;height:100%;background-color:#ccc;opacity:0.5;left:0;top:0;z-index:9998;'></div><div id='myTemplate' style='z-index:9999;color:#000;background-color:#fff;text-align:center;line-height:30px;border:1px solid #fff;border-radius:5px;height:300px;width:"+myTemplateWidth+"px;margin:-100px -"+myTemplateMarginWidth+"px;top:50%;left:50%;position:fixed;font-size:20px;'>"
                + "<div style='box-sizing: border-box;position:absolute;top:0;padding:20px 0;width:100%;text-align:center;overflow: auto;height: 100%;'>"+value+"</div><div class='btn btn-default' style='position:absolute;right:15px;bottom:15px;width:80px;cursor:pointer;' id='myTemplateNo'>关闭</div></div>");
        $('#myTemplateNo').click(function(){
            $('#myTemplateDiv').remove();
            $('#myTemplate').remove();
        });
    },
    //滚动刷新
    scrollFlush:function(callback){
        $(window).scroll(function(){
            if(!navigator.onLine){
                business.myLoadingToast("请检查网络！");
                return;
            }
            if(navigator.onLine&&!business.isBottom&& business.isScrollBottom(document)){
                console.log(111)
                callback()
            }
        });
    },
	//返回
	goback:function(){
		history.back()
	},
	//注册
	goregister:function(){
		location.href="register.html";
	},
	//登录
	gologin:function(){
		location.href="login.html";
	},
    //登出
    loginout:function(){
        business.myLoginOut("确定退出吗？", function() {
            /**
             * 获取单个
             * p.url 列表url
             * p.data 返回列表
             * p.success 成功回调
             */
            business.ajax({
                url:"/account/loginout?accountId="+JSON.parse(localStorage.getItem("account")).accountId,
                success:function(){
                    localStorage.clear();
                    business.gonav("index",false);
                }
            })
        })
    },
	//导航
	gonav:function(param,b){

		//需要验证
		if(b){
            if(!localStorage.getItem("account")){
                localStorage.clear()
                business.gologin()
                return;
            }

			business.ajax({
                url:'/account/islogin',
                success:function(){
                    location.href=param+".html"
                },
                fail:function(){
                    localStorage.clear()
                    business.gologin()
                }
            })
			return;
		}
	    location.href=param+".html"

	},
    /**
     * 获取当前url的参数
     *
     */
    getQueryString: function (name)
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  decodeURIComponent(r[2]); return null;
        //if(r!=null)return  unescape(r[2]); return null;
    },
    /**
     * 分页
     *params.element 放置的元素
     *params.first 首页
     *params.last 末页
     *params.prev 上一页
     *params.next 下一页
     *params.next 下一页
     *params.totalPages 总页数
     *params.startPage 起始页
     *params.visiblePages 显示页码数
     *params.callback 点击回调
     *
     *params.total 总数
     *params.pageSize 每页条数
     *params.pageNum 当前条数
     */
    twbsPagination:function(params){
        if(params.total && params.pageSize){
            params.totalPages=params.total%params.pageSize==0?Math.floor(params.total/params.pageSize):Math.ceil(params.total/params.pageSize);
        }
        if(params.pageNum && params.pageSize){
            params.currentPage=params.pageNum%params.pageSize==0?Math.floor(params.pageNum/params.pageSize):Math.ceil(params.pageNum/params.pageSize);
        }

        if(params.totalPages&&params.totalPages>0) {
            $( params.element ? params.element : "#myPagination").twbsPagination({
                first: params.first ? params.first : '首页',
                last: params.last ? params.last : '末页',
                prev: params.prev ? params.prev : '上一页',
                next: params.next ? params.next : '下一页',
                //href:"?p=1",
                totalPages: params.totalPages,
                startPage: params.startPage ? params.startPage :1,//起始页
                currentPage: params.currentPage ? params.currentPage :1,
                visiblePages: params.totalPages > (params.visiblePages ? params.visiblePages:5) ? (params.visiblePages ? params.visiblePages:5) : params.totalPages,//解决当totalPages小于visiblePages页码变负值的bug
                onPageClick: function (event, page) {
                   // console.log(event)
                    //console.log(page)
                    if(typeof params.callback=='function'){
                        params.callback(page);
                    }
                    //$('#page-content').text('Page ' + page);
                }
            });
        }
    }
};

//初始化，所有用户必须登录后访问
;(function(){
    //如果已经登陆
    if(localStorage.getItem("account")&&(JSON.parse(localStorage.getItem("account"))).accountId){
        if($(".nologin").size()>0){
            $(".nologin").remove();
        }
        if($(".islogin").size()>0){
            $(".islogin").show();
        }
    }else{
        if($(".nologin").size()>0){
            $(".nologin").show();
        }
        if($(".islogin").size()>0){
            $(".islogin").remove();
        }
    }

})();
if(location.href.indexOf("login.html")<=-1
    //&&location.href.indexOf("register.html")<=-1
    //&&location.href.indexOf("forget.html")<=-1
    //&&location.href.indexOf("protocol.html")<=-1
    &&location.href.indexOf("notice.html")<=-1
    &&location.href.indexOf("index.html")<=-1
){
    //1自动登录
    business.ajax({
        url:"/account/islogin",
        success:function(data){
            localStorage.setItem("account",JSON.stringify(data.data[0]));
            localStorage.setItem("role",JSON.stringify(data.data[0].role));
        },
        fail:function(){
            business.myLoadingToast("登录后访问",function(){
                business.gologin()
            })
            //自动登录
           /* business.ajax({
                url:'/account/weblogin',
                success:function(data){
                    if(!data.data[0]){
                        //没有就跳转
                        business.myLoadingToast("登录后访问",function(){
                            business.gologin()
                        })
                    }
                    localStorage.setItem("account",JSON.stringify(data.data[0].account));
                    localStorage.setItem("role",JSON.stringify(data.data[0].role));
                    location.href='index.html';
                },
                fail:function(){
                    //没有就跳转
                    business.myLoadingToast("登录后访问",function(){
                        business.gologin()
                    })
                }
            })*/
        }
    })
}else{

}

window.onload=function () {
//解决ios缩放不生效
    document.addEventListener('touchstart',function (event) {
        if(event.touches.length>1){
            event.preventDefault();
        }
    })
    var lastTouchEnd=0;
    document.addEventListener('touchend',function (event) {
        var now=(new Date()).getTime();
        if(now-lastTouchEnd<=300){
            event.preventDefault();
        }
        lastTouchEnd=now;
    },false)

    //解决按钮输入底部导航顶上去
    var windheight =window.innerHeight;
    var bottomx = document.querySelector('.mer-footer'); //底部导航
    if(bottomx){
        window.onresize=function(){
            var docheight = window.innerHeight;
            if(docheight < windheight){
                bottomx.style.display = 'none';
            }else{
                bottomx.style.display = 'inline-block';
            }
        }
    }

    //解决背景高度的问题

}
//