
<%@ page import="com.StoreParent" %>
<!DOCTYPE html>
<html >
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'storeParent.label', default: 'StoreParent')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <script>

    </script>
</head>
<body>
<a href="#list-storeParent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li>Search Locations according to zip code</li>
    </ul>
</div>
<div id="list-storeParent" class="content scaffold-list" role="main">
 <h1>{{1+3}}</h1>
</div>
</body>
</html>
