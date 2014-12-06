//コントローラ定義
var NewScoresheetController = function($window, $scope, $location){
    $scope.msg = "こんにちは。";
    $scope.seasonChange = function(){
        $location.search('season_id','28');

        //$window.location.href = location.path();
    };
};
var MemberListController = function($resource, $scope){
    var res = $resource('/members.json');
    $scope.members = res.query();
    $scope.memberName0;
    $scope.memberName1;
    $scope.memberName2;
    $scope.memberName3;
    $scope.memberName4;
    $scope.changeId = function(jersey_no){
        //JSON取得
//        $scope.memberName = res.query();
        $scope.memberName0 = jersey_no;
    };
};

//Application定義
var scoresheetApp = angular.module('ScoresheetApp',['ngResource']);
//Application設定
scoresheetApp.config(['$resourceProvider', function($resourceProvider){
    $resourceProvider.defaults.stripTrailingSlashes = true;
}]);

//Applicationにコントローラ設定
scoresheetApp.controller('newScoresheetController', ['$window','$scope','$location', NewScoresheetController]);
scoresheetApp.controller('memberListController', MemberListController);
