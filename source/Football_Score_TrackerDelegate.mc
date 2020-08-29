using Toybox.WatchUi;
using Toybox.Application as App;
using Toybox.Timer;
using Toybox.System;


class Football_Score_TrackerDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new Football_Score_TrackerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    var myTimer = new Timer.Timer();
    
    	function startTimer() {
    		App.getApp().setProperty("timer", App.getApp().getProperty("timer") + 1);
    		WatchUi.requestUpdate();
    	}
    	
    	function stopTimer() {
    		myTimer.stop();
    		App.getApp().setProperty("timerStarted", false);
    	}
    	
    	function timerAction() {
    		if (App.getApp().getProperty("timerStarted")) {
    			stopTimer();
   			} else {
   				myTimer.start(method(:startTimer), 1000, true);
   				App.getApp().setProperty("timerStarted", true);
   			}
    	}
    	
    	function onKeyPressed(keyEvent) {
    		if (keyEvent.getKey() == 5) {
    			App.getApp().setProperty("backPressed", true);
    		}
    	}
    	
    	function onKeyReleased(keyEvent) {
    		if (keyEvent.getKey() == 5) {
    			App.getApp().setProperty("backPressed", false);
    		}
    	}
    
        function onKey(keyEvent) {    
	        if (keyEvent.getKey() == 13 && App.getApp().getProperty("backPressed") == false) {
	        	App.getApp().setProperty("team1Score", App.getApp().getProperty("team1Score") + 1);
	        } else if (keyEvent.getKey() == 8 && App.getApp().getProperty("backPressed") == false) {
	        	App.getApp().setProperty("team2Score", App.getApp().getProperty("team2Score") + 1);
	        } else if (keyEvent.getKey() == 4) {
	    		timerAction();
	        } else if (keyEvent.getKey() == 13 && App.getApp().getProperty("backPressed")) {
	        	App.getApp().setProperty("team1Score", App.getApp().getProperty("team1Score") - 1);
	        } else if (keyEvent.getKey() == 8 && App.getApp().getProperty("backPressed")) {
	        	App.getApp().setProperty("team2Score", App.getApp().getProperty("team2Score") - 1);
	        }
	        WatchUi.requestUpdate();
	        return true;
    	}

}