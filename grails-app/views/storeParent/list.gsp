
<%@ page import="com.StoreParent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'storeParent.label', default: 'StoreParent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="page-content">
        <g:render template="/templates/pagebreadcumbs"/>
        <div class="page-header position-relative">
            <div class="header-title">
                <g:link class="create btn btn-primary shiny" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
            </div>
            <!--Header Buttons-->
            <div class="header-buttons">
                <a class="sidebar-toggler" href="#">
                    <i class="fa fa-arrows-h"></i>
                </a>
                <a class="refresh" id="refresh-toggler" href="#">
                    <i class="glyphicon glyphicon-refresh"></i>
                </a>
                <a class="fullscreen" id="fullscreen-toggler" href="#">
                    <i class="glyphicon glyphicon-fullscreen"></i>
                </a>
            </div>
        </div>

        <div class="page-body">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12">
                            <div class="widget">
                                <div class="widget-header bg-blue">
                                    <i class="widget-icon fa fa-arrow-left"></i>
                                    <span class="widget-caption"><g:message code="default.list.label" args="[entityName]" /></span>
                                    <div class="widget-buttons">
                                        <a href="#" data-toggle="config">
                                            <i class="fa fa-cog"></i>
                                        </a>
                                        <a href="#" data-toggle="maximize">
                                            <i class="fa fa-expand"></i>
                                        </a>
                                        <a href="#" data-toggle="collapse">
                                            <i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div><!--Widget Buttons-->
                                </div><!--Widget Header-->
                                <div class="widget-body">


		<div id="list-storeParent" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="stateName" title="${message(code: 'storeParent.stateName.label', default: 'State Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${storeParentInstanceList}" status="i" var="storeParentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${storeParentInstance.id}">${fieldValue(bean: storeParentInstance, field: "stateName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${storeParentInstanceTotal}" />
			</div>
		</div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    </div>
	</body>
</html>
