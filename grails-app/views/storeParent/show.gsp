
<%@ page import="com.StoreParent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'storeParent.label', default: 'StoreParent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="page-content">
        <g:render template="/templates/pagebreadcumbs"/>

        <div class="page-header position-relative">
            <div class="header-title">
                <g:link class="list btn btn-primary shiny" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
                <g:link class="create btn btn-success shiny" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
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
            <!--Header Buttons End-->
        </div>
         <div class="page-body">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12">
                            <div class="widget">
                                <div class="widget-header bg-blue">
                                    <i class="widget-icon fa fa-arrow-left"></i>
                                    <span class="widget-caption"><g:message code="default.show.label" args="[entityName]" /></span>
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


		<div id="show-storeParent" class="content scaffold-show" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list storeParent">
			
				<g:if test="${storeParentInstance?.stateName}">
				<li class="fieldcontain">
					<span id="stateName-label" class="property-label"><g:message code="storeParent.stateName.label" default="State Name" /></span>
					
						<span class="property-value" aria-labelledby="stateName-label"><g:fieldValue bean="${storeParentInstance}" field="stateName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storeParentInstance?.storeChild}">
				<li class="fieldcontain">
					<span id="storeChild-label" class="property-label"><g:message code="storeParent.storeChild.label" default="Store Child" /></span>
					
						<g:each in="${storeParentInstance.storeChild}" var="s">
						<span class="property-value" aria-labelledby="storeChild-label"><g:link controller="storeChild" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${storeParentInstance?.id}" />
					<g:link class="edit btn btn-success shiny" action="edit" id="${storeParentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger shiny" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
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
