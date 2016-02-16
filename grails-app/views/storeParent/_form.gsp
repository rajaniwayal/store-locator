<%@ page import="com.StoreParent" %>



<div class="fieldcontain ${hasErrors(bean: storeParentInstance, field: 'countryName', 'error')} ">
	<label for="countryName">
		<g:message code="storeParent.countryName.label" default="Country Name" />
		
	</label>
	<g:textField name="countryName" value="${storeParentInstance?.countryName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storeParentInstance, field: 'storeChild', 'error')} ">
	<label for="storeChild">
		<g:message code="storeParent.storeChild.label" default="Store Child" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${storeParentInstance?.storeChild?}" var="s">
    <li><g:link controller="storeChild" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="storeChild" action="create" params="['storeParent.id': storeParentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'storeChild.label', default: 'StoreChild')])}</g:link>
</li>
</ul>

</div>

