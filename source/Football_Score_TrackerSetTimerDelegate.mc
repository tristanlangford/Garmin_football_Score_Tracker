using Toybox.WatchUi;
using Toybox.Application as App;
using Toybox.Timer;
using Toybox.System;


class Football_Score_TrackerSetTimerDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new Football_Score_TrackerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    var myTimer = new Timer.Timer();
    	
    
        function onKey(keyEvent) {    
	        if (keyEvent.getKey() == 13) {
	        	App.getApp().setProperty("timer", App.getApp().getProperty("timer") + 300);
	        } else if (keyEvent.getKey() == 8 && App.getApp().getProperty("timer") > 300) {
	        	App.getApp().setProperty("timer", App.getApp().getProperty("timer") - 300);
	      	} 
	        WatchUi.requestUpdate();
	        return true;
    	}
    	
    	function onBack() {
    	
    	}
    	
    	function onSelect() {
    	
    	}

}