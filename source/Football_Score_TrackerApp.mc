using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Application as App;


class Football_Score_TrackerApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }


    // onStart() is called on application start up
    function onStart(state) {
    App.getApp().setProperty("team1Score", 0);
    App.getApp().setProperty("team2Score", 0);
    
    App.getApp().setProperty("team1", "BLUE");
    App.getApp().setProperty("team2", "RED  ");
    
    App.getApp().setProperty("timer", 0);
    App.getApp().setProperty("timerStarted", false);
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new Football_Score_TrackerView(), new Football_Score_TrackerDelegate() ];
    }

}
