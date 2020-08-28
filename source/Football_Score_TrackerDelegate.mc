using Toybox.WatchUi;
using Toybox.Application as App;
using Toybox.Timer;


class Football_Score_TrackerDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new Football_Score_TrackerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    	function timer() {
    		App.getApp().setProperty("timer", App.getApp().getProperty("timer") + 1);
    		WatchUi.requestUpdate();
    	}
    
        function onKey(keyEvent) {
        
        System.println(keyEvent.getKey());
        
        if ( keyEvent.getKey() == 13 ) {
        	App.getApp().setProperty("team1Score", App.getApp().getProperty("team1Score") + 1);
        } else if ( keyEvent.getKey() == 8 ) {
        	App.getApp().setProperty("team2Score", App.getApp().getProperty("team2Score") + 1);
        } else if ( keyEvent.getKey() == 4 ) {
        	var myTimer = new Timer.Timer();
    		myTimer.start(method(:timer), 1000, true);
        }
        WatchUi.requestUpdate();
        return true;
    }

}