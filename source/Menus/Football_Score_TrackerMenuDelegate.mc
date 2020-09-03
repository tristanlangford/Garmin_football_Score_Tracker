using Toybox.WatchUi;
using Toybox.Application as App;

class Football_Score_TrackerMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }
    
    function resetAll() {
    	App.getApp().setProperty("team1Score", 0);
    	App.getApp().setProperty("team2Score", 0);
 		resetTimer();
    }
    
    function resetTimer() {
    	if (App.Storage.getValue("timer") == null) {
	    	App.getApp().setProperty("timer", 3600);
	    } else {
	    	App.getApp().setProperty("timer", App.Storage.getValue("timer"));
	    }
    }

    function onMenuItem(item) {
        if (item == :quit) {
            System.exit();
        } else if (item == :resetAll) {
            resetAll();
        } else if (item == :resetTimer) {
            resetTimer();
        } else if (item == :setIntervals) {
            WatchUi.pushView(new Football_Score_TrackerSetIntervalView(), new Football_Score_TrackerSetIntervalDelegate(), WatchUi.SLIDE_LEFT);
        } else if (item == :changeTeamName) {
        	WatchUi.pushView(new Rez.Menus.ChooseTeam(), new Football_Score_TrackerChooseTeamMenuDelegate(), WatchUi.SLIDE_LEFT);
        } else if (item == :setTimer) {
        	WatchUi.pushView(new Football_Score_TrackerSetTimerView(), new Football_Score_TrackerSetTimerDelegate(), WatchUi.SLIDE_LEFT);
        }
    	return true;
    }

}
