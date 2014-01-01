<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/views/include/taglib.jsp"%>
<html>
<head>
<title>菜单导航</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$(".accordion-heading a").click(function() {
			$('.accordion-toggle i').removeClass('icon-chevron-down');
			$('.accordion-toggle i').addClass('icon-chevron-right');
			if (!$($(this).attr('href')).hasClass('in')) {
				$(this).children('i').removeClass('icon-chevron-right');
				$(this).children('i').addClass('icon-chevron-down');
			}
		});
		$(".accordion-body a").click(function() {
			$("#menu li").removeClass("active");
			$("#menu li i").removeClass("icon-white");
			$(this).parent().addClass("active");
			$(this).children("i").addClass("icon-white");
		});
		$(".accordion-body a:first i").click();
		$(".accordion").find("a").css("color","black");
	});
</script>
</head>
<body>
	<div class="accordion" id="menu">
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#menu" href="#collapsePoster" title="remark"><i
					class="icon-chevron-down"></i>&nbsp;海报管理</a>
			</div>
			<div id="collapsePoster" class="accordion-body collapse in">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="banner/banner.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;Banner</a></li>
						<li><a href="banner/enableBanner.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;启动海报</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse" 
					data-parent="#menu" href="#collapseRank" title="remark"><i
					class="icon-chevron-right"></i>&nbsp;排行管理</a>
			</div>
			<div id="collapseRank" class="accordion-body collapse">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="rank/rankWatch.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;观看最多</a></li>
						<li><a href="rank/rankDownload.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;下载最多</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#menu" href="#collapseSubscription" title="remark"><i
					class="icon-chevron-right"></i>&nbsp;订阅管理</a>
			</div>
			<div id="collapseSubscription" class="accordion-body collapse">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="subscription/subscription.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;订阅管理</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#menu" href="#collapseSearch" title="remark"><i
					class="icon-chevron-right"></i>&nbsp;搜索管理</a>
			</div>
			<div id="collapseSearch" class="accordion-body collapse">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="search/searchHot.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;热门搜索</a></li>
						<li><a href="search/searchLog.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;搜索日志</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#menu" href="#collapseRecommend" title="remark"><i
					class="icon-chevron-right"></i>&nbsp;个性化推荐</a>
			</div>
			<div id="collapseRecommend" class="accordion-body collapse">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="recommend/recommend.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;猜你喜欢</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#menu" href="#collapseComment" title="remark"><i
					class="icon-chevron-right"></i>&nbsp;评论管理</a>
			</div>
			<div id="collapseComment" class="accordion-body collapse">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="comment/comment.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;评论管理</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#menu" href="#collapseLetter" title="remark"><i
					class="icon-chevron-right"></i>&nbsp;快报管理</a>
			</div>
			<div id="collapseLetter" class="accordion-body collapse">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="letter/letter.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;快报管理</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="#menu" href="#collapseAdvise" title="remark"><i
					class="icon-chevron-right"></i>&nbsp;意见反馈管理</a>
			</div>
			<div id="collapseAdvise" class="accordion-body collapse">
				<div class="accordion-inner">
					<ul class="nav nav-list">
						<li><a href="advise/advise.jsp" target="mainFrame"><i
								class="icon-user"></i>&nbsp;意见反馈管理</a></li>
					</ul>
				</div>
			</div>
		</div>
	
	</div>
</body>
</html>
