using Toybox.WatchUi;
using Toybox.Application as App;


class Football_Score_TrackerDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new Football_Score_TrackerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
        function onKey(keyEvent) {
        
        if ( keyEvent.getKey() == 13 ) {
        	App.getApp().setProperty("team1Score", App.getApp().getProperty("team1Score") + 1);
        } else if ( keyEvent.getKey() == 8 ) {
        	App.getApp().setProperty("team2Score", App.getApp().getProperty("team2Score") + 1);
        }
        WatchUi.requestUpdate();
        return true;
    }

}