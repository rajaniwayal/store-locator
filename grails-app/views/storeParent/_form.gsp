<%@ page import="com.StoreParent" %>
<script>
    function deptController($scope,$http){
        init();
        function init(){
             $scope.childList=[];
            $scope.child={
                cityName:'',
                zipCode:''
            };
            $scope.add=true;
            $scope.update=true;
                <g:if test="${storeParentInstance?.id}">
            $http.get("/${grailsApplication.config.name}/storeParent/childList?id="+"${storeParentInstance?.id}")
                    .success(function (data) {
                        debugger;
                        $scope.childList = data;
                    });
                </g:if>

        }
        $scope.addJson=function(){
            $scope.childList.push($scope.child)

            $scope.child={};
        };
        $scope.editRow=function(index){
            debugger;
            $scope.child=$scope.childList[index]
            $scope.index=index;

        };
        $scope.updateRow=function(){
            debugger;
            $scope.childList[$scope.index]=$scope.child;
            $scope.child={};

        }

        $scope.deleteRow=function(index){
            debugger;
            $scope.childList.splice(index)

        }



    }

</script>
<div ng-controller="deptController">
    <input type="hidden" name="childJSON" value={{childList}}>
<div id="horizontal-form">
<div class="form-group">

<div class="fieldcontain ${hasErrors(bean: storeParentInstance, field: 'stateName', 'error')} ">
	<label for="stateName" class="col-sm-2 control-label no-padding-right">
		<g:message code="storeParent.stateName.label" default="State Name" />
		
	</label>
    <div class="col-sm-3">
	<g:textField class="form-control" name="stateName" value="${storeParentInstance?.stateName}"/>
        </div>
</div>



</div>
</div>

<div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="well with-header  with-footer">
                <div class="header bg-sky">
                    Enter Values
                </div>
                <table class="table table-hover">
                    <thead class="bordered-darkorange">
                    <tr>
                        <th>
                            lables
                        </th>
                        <th>
                            Type
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <label for="cityName" class="col-sm-2 control-label no-padding-right">
                                <g:message code="employee.cityName.label" default="City Name" />

                            </label>
                        </td>
                        <td>
                            <g:textField name="cityName" class="form-control" value="${employeeInstance?.cityName}" ng-model="child.cityName"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="zipCode" class="col-sm-2 control-label no-padding-right">
                                <g:message code="employee.zipCode.label" default="Zip Code" />

                            </label>
                        </td>
                        <td>
                            <g:textField name="zipCode" class="form-control" value="${employeeInstance?.zipCode}" ng-model="child.zipCode"/>
                        </td>
                    </tr>


                    </tbody>
                </table>
                <div class="footer">
                    <input type="button" class="btn btn-primary shiny" value="Add" ng-show="add" ng-click="addJson()">
                    <input type="button" class="btn btn-darkorange shiny" value="Update" ng-show="update" ng-click="updateRow()">
                </div>

            </div>

        </div>

        <div class="col-xs-12 col-md-6">
            <div class="well with-header  with-footer">
                <div class="header bg-sky">
                    Child List
                </div>
                <table class="table table-hover">
                    <thead class="bordered-darkorange">
                    <tr>
                        <th>
                            Actions
                        </th>
                        <th>
                            First Name
                        </th>

                        <th>
                            Last Name
                        </th>


                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="c in childList">
                        <td> <input type="button" class="btn btn-primary shiny" value="Edit" ng-click="editRow($index)">
                            <input type="button" class="btn btn-danger shiny" value="Delete" ng-click="deleteRow($index)"></td>
                        <td>{{c.cityName}}</td>
                        <td>{{c.zipCode}}</td>

                    </tr>

                    </tbody>
                </table>

            </div>

        </div>

    </div>
</div>
