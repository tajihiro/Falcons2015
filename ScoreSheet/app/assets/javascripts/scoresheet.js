//コントローラ定義
var NewScoresheetController = function($window, $scope, $location){
    $scope.msg = "こんにちは。";
    $scope.seasonChange = function(){
        $location.search('season_id','28');

        //$window.location.href = location.path();
    };
};

var MemberListController = function($resource, $scope){
    var res = $resource('/members/no/:jersey_no.json',
                        {jersey_no: '@jersey_no'},
                        {'query': { method:'GET'}});
    $scope.memberNames = new Array();
    $scope.memberIds = new Array();
    $scope.changeId = function(val, idx){
        $scope.memberIds[idx] = '';
        $scope.memberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({jersey_no:val});
        $scope.members.$promise.then(function(data){
            console.log(data.member_name);
            $scope.memberIds[idx] = data.id;
            $scope.memberNames[idx] = data.member_name;
        });
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
