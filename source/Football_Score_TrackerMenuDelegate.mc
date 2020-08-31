using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application as App;

class Football_Score_TrackerMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }
    
    function reset() {
    	App.getApp().setProperty("team1Score", 0);
    	App.getApp().setProperty("team2Score", 0);
    	
    	App.getApp().setProperty("timer", 3600);
    	App.getApp().setProperty("timerStarted", false);
    }

    function onMenuItem(item) {
        if (item == :quit) {
            System.exit();
        } else if (item == :reset) {
            reset();
        } else if (item == :changeTeamName) {
        	WatchUi.pushView(new Rez.Menus.ChooseTeam(), new Football_Score_TrackerChooseTeamMenuDelegate(), WatchUi.SLIDE_LEFT);
        } else if (item == :setTimer) {
        	WatchUi.pushView(new Football_Score_TrackerSetTimerView(), new Football_Score_TrackerSetTimerDelegate(), WatchUi.SLIDE_LEFT);
        }
    	return true;
    }

}
