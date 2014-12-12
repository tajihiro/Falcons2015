/*
/* コントローラ定義
 */
var NewScoresheetController = function($window, $scope, $location){
    $scope.msg = "こんにちは。";
    $scope.seasonChange = function(){
        $location.search('season_id','28');

        //$window.location.href = location.path();
    };
};
//
//GoalList
//
var GoalListController = function($resource, $scope){
    var res = $resource('/members/no/:jersey_no.json',
                        {jersey_no: '@jersey_no'},
                        {'query': { method:'GET'}});
    $scope.goalMemberIds = new Array();
    $scope.goalMemberNames = new Array();
    $scope.assist1MemberIds = new Array();
    $scope.assist1MemberNames = new Array();
    $scope.assist2MemberIds = new Array();
    $scope.assist2MemberNames = new Array();
    //Goal Member
    $scope.changeGoal = function(val, idx){
        $scope.goalMemberIds[idx] = '';
        $scope.goalMemberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({jersey_no:val});
        $scope.members.$promise.then(function(data){
            console.log(data.member_name);
            $scope.goalMemberIds[idx] = data.id;
            $scope.goalMemberNames[idx] = data.member_name;
        });
    };
    //Assist1 Member
    $scope.changeAssist1 = function(val, idx){
        $scope.assist1MemberIds[idx] = '';
        $scope.assist1MemberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({jersey_no:val});
        $scope.members.$promise.then(function(data){
            console.log(data.member_name);
            $scope.assist1MemberIds[idx] = data.id;
            $scope.assist1MemberNames[idx] = data.member_name;
        });
    };
    //Assist2 Member
    $scope.changeAssist2 = function(val, idx){
        $scope.assist2MemberIds[idx] = '';
        $scope.assist2MemberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({jersey_no:val});
        $scope.members.$promise.then(function(data){
            console.log(data.member_name);
            $scope.assist2MemberIds[idx] = data.id;
            $scope.assist2MemberNames[idx] = data.member_name;
        });
    };
};

//
// PenaltyList
//
var PenaltyListController = function($resource, $scope){
    var res = $resource('/members/no/:jersey_no.json',
        {jersey_no: '@jersey_no'},
        {'query': { method:'GET'}});
    $scope.penaltyMemberIds = new Array();
    $scope.penaltyMemberNames = new Array();
    //Penalty Member
    $scope.changePenalty = function(val, idx){
        $scope.penaltyMemberIds[idx] = '';
        $scope.penaltyMemberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({jersey_no:val});
        $scope.members.$promise.then(function(data){
            console.log(data.member_name);
            $scope.penaltyMemberIds[idx] = data.id;
            $scope.penaltyMemberNames[idx] = data.member_name;
        });
    };
};

/*
/* Application定義
 */
var scoresheetApp = angular.module('ScoresheetApp',['ngResource']);
//Application設定
scoresheetApp.config(['$resourceProvider', function($resourceProvider){
    $resourceProvider.defaults.stripTrailingSlashes = true;
}]);

/*
/* Applicationにコントローラ設定
 */
scoresheetApp.controller('newScoresheetController', ['$window','$scope','$location', NewScoresheetController]);
scoresheetApp.controller('goalListController', GoalListController);
scoresheetApp.controller('penaltyListController', PenaltyListController);
