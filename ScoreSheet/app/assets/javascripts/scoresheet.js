//コントローラ定義
var NewScoresheetController = function($window, $scope, $location){
    $scope.msg = "こんにちは。";
    $scope.seasonChange = function(){
        $location.search('season_id','28');

        //$window.location.href = location.path();
    };
};
//Application定義
var scoresheetApp = angular.module('ScoresheetApp',[]);
//Applicationにコントローラ設定
scoresheetApp.controller('newScoresheetController', ['$window','$scope','$location', NewScoresheetController]);
