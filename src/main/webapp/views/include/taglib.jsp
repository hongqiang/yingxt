<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<c:set var="ctxView" value="${pageContext.request.contextPath}/views/modules"/>
<%-- <c:set var="serverUrl" value="http://221.192.139.36:8080/test2"/> --%>
<c:set var="serverUrl" value="http://localhost:8080/yingxt"/>
<c:set var="pageUrl" value="${pageContext.request.contextPath}/servlet/pageServlet"/>
