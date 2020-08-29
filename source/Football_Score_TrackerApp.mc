using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Application as App;
using Toybox.Timer;


class Football_Score_TrackerApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }
    
    function update() {
    	WatchUi.requestUpdate();
    }


    // onStart() is called on application start up
    function onStart(state) {
    
    var myTimer = new Timer.Timer();
    
    App.getApp().setProperty("team1Score", 0);
    App.getApp().setProperty("team2Score", 0);
    
    App.getApp().setProperty("team1", "SMITH");
    App.getApp().setProperty("team2", "ROW  ");
    
    App.getApp().setProperty("timer", 0);
    App.getApp().setProperty("timerStarted", false);
    
    myTimer.start(method(:update), 1000, true);
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new Football_Score_TrackerView(), new Football_Score_TrackerDelegate() ];
    }

}
