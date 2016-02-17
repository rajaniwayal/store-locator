<%--
  Created by IntelliJ IDEA.
  User: Rajani
  Date: 17/02/16
  Time: 15:57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'storeParent.label', default: 'Search Location')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <script>
        function searchController($scope,$http){
            init();
            function init(){
                $http.get("/${grailsApplication.config.name}/storeParent/itemList")
                        .success(function (data) {
                            debugger;
                            $scope.itemList = data;
                        });

            }
        }

    </script>
</head>
<body>
<div class="page-content" ng-controller="searchController">
    <g:render template="/templates/pagebreadcumbs"/>

    <div class="page-header position-relative">
        <div class="header-title">

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
                                <span class="widget-caption">Search Location according to Zip code</span>
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


                                <div class="form-horizontal">

                                    <div class="row">
                                        <div id="horizontal-form">
                                            <div class="form-group">

                                                <div class="fieldcontain ${hasErrors(bean: storeParentInstance, field: 'stateName', 'error')} ">
                                                    <label for="stateName" class="col-sm-2 control-label no-padding-right">
                                                        <g:message code="storeParent.stateName.label" default="Zip Code" />

                                                    </label>
                                                    <div class="col-sm-6" >
                                                       <input type="text" class="form-control" ng-model="search" placeholder="Enter Zip Code / City Name">
                                                   </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="col-xs-12 col-md-12">

                                            <table class="table table-hover">
                                                <thead class="bordered-darkorange">
                                                <tr>
                                                    <th>
                                                        Locations
                                                    </th>
                                                    <th>
                                                        Zip Code
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr ng-repeat="a in itemList | filter:search">
                                                    <td>{{a.cityName}}</td>
                                                    <td>{{a.zipCode}}</td>
                                                </tr>

                                                </tbody>
                                            </table>

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
</div>
</body>
</html>