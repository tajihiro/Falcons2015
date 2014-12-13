/*
/* コントローラ定義
 */
var ScoreSheetController = function($window, $scope, $location){
    $scope.msg = "こんにちは。";
    $scope.selectedSeasonId;
    $scope.changeSeason = function(selectedSeasonId){
        console.log(selectedSeasonId);
        //$location.search('season_id','28');
        //$window.location.href = location.path();
    };
};

//
//RosterGoalieList
//
var GoalieListController = function($resource, $scope){
    var res = $resource('/season/:season_id/members/no/:jersey_no.json',
        {season_id: '@season_id', jersey_no: '@jersey_no'},
        {'query': { method:'GET'}});
    $scope.memberIds = new Array();
    $scope.rosterMemberNames = new Array();
    //Member
    $scope.changeRoster = function(jersey_no, idx){
        $scope.memberIds[idx] = '';
        $scope.rosterMemberNames[idx] = '';
        console.log("SEASON_ID:" + $scope.selectedSeasonId);
        //JSON取得
        $scope.members = res.query({season_id:$scope.selectedSeasonId, jersey_no:jersey_no});
        $scope.members.$promise.then(function(data){
            console.log(data.member_names + ' / ' + data.id + ' / ' + data.position_name);
            $scope.memberIds[idx] = data.id;
            $scope.rosterMemberNames[idx] = data.member_names;
        });
    };
};

//
//RosterPlayerList
//
var PlayerListController = function($resource, $scope){
    //var res = $resource('/members/no/:jersey_no.json',
    var res = $resource('/season/:season_id/members/no/:jersey_no.json',
        {season_id: '@season_id', jersey_no: '@jersey_no'},
        {'query': { method:'GET'}});
    $scope.memberIds = new Array();
    $scope.rosterMemberNames = new Array();
    $scope.rosterPostionNames = new Array();
    //Member
    $scope.changeRoster = function(jersey_no, idx){
        $scope.memberIds[idx] = '';
        $scope.rosterMemberNames[idx] = '';
        $scope.rosterPostionNames[idx] = '';
        //JSON取得
        $scope.members = res.query({season_id:$scope.selectedSeasonId, jersey_no:jersey_no});
        $scope.members.$promise.then(function(data){
            console.log(data.member_names + ' / ' + data.id + ' / ' + data.position_name);
            $scope.memberIds[idx] = data.id;
            $scope.rosterMemberNames[idx] = data.member_names;
            $scope.rosterPostionNames[idx] = data.position_name;
        });
    };
};

//
//GoalList
//
var GoalListController = function($resource, $scope){
    var res = $resource('/season/:season_id/members/no/:jersey_no.json',
                        {season_id: '@season_id', jersey_no: '@jersey_no'},
                        {'query': { method:'GET'}});
    $scope.goalMemberIds = new Array();
    $scope.goalMemberNames = new Array();
    $scope.assist1MemberIds = new Array();
    $scope.assist1MemberNames = new Array();
    $scope.assist2MemberIds = new Array();
    $scope.assist2MemberNames = new Array();
    //Goal Member
    $scope.changeGoal = function(jersey_no, idx){
        $scope.goalMemberIds[idx] = '';
        $scope.goalMemberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({season_id:$scope.selectedSeasonId, jersey_no:jersey_no});
        $scope.members.$promise.then(function(data){
            console.log(data.member_names);
            $scope.goalMemberIds[idx] = data.id;
            $scope.goalMemberNames[idx] = data.member_names;
        });
    };
    //Assist1 Member
    $scope.changeAssist1 = function(jersey_no, idx){
        $scope.assist1MemberIds[idx] = '';
        $scope.assist1MemberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({season_id:$scope.selectedSeasonId, jersey_no:jersey_no});
        $scope.members.$promise.then(function(data){
            console.log(data.member_names);
            $scope.assist1MemberIds[idx] = data.id;
            $scope.assist1MemberNames[idx] = data.member_names;
        });
    };
    //Assist2 Member
    $scope.changeAssist2 = function(jersey_no, idx){
        $scope.assist2MemberIds[idx] = '';
        $scope.assist2MemberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({season_id:$scope.selectedSeasonId, jersey_no:jersey_no});
        $scope.members.$promise.then(function(data){
            console.log(data.member_names);
            $scope.assist2MemberIds[idx] = data.id;
            $scope.assist2MemberNames[idx] = data.member_names;
        });
    };
};

//
// PenaltyList
//
var PenaltyListController = function($resource, $scope){
    var res = $resource('/season/:season_id/members/no/:jersey_no.json',
                        {season_id: '@season_id', jersey_no: '@jersey_no'},
                        {'query': { method:'GET'}});
    $scope.penaltyMemberIds = new Array();
    $scope.penaltyMemberNames = new Array();
    //Get Penalty Member
    $scope.changePenalty = function(jersey_no, idx){
        $scope.penaltyMemberIds[idx] = '';
        $scope.penaltyMemberNames[idx] = '';
        //JSON取得
        $scope.members = res.query({season_id:$scope.selectedSeasonId, jersey_no:jersey_no});
        $scope.members.$promise.then(function(data){
            console.log(data.member_names);
            $scope.penaltyMemberIds[idx] = data.id;
            $scope.penaltyMemberNames[idx] = data.member_names;
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
scoresheetApp.controller('scoreSheetController', ['$window','$scope','$location', ScoreSheetController]);
scoresheetApp.controller('goalieListController', GoalieListController);
scoresheetApp.controller('playerListController', PlayerListController);
scoresheetApp.controller('goalListController', GoalListController);
scoresheetApp.controller('penaltyListController', PenaltyListController);
