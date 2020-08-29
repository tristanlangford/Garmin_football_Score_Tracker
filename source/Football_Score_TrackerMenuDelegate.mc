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
    	
    	App.getApp().setProperty("timer", 0);
    	App.getApp().setProperty("timerStarted", false);
    }

    function onMenuItem(item) {
        if (item == :quit) {
            System.exit();
        } else if (item == :reset) {
            reset();
        }
    }

}