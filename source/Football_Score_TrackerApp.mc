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
    
    var myTimer = new Timer.Timer(); // timer for refreshing view for clock
    
    // get data from storage, or set values if no storage data
    if (App.Storage.getValue("interval") == null) {
    	App.Storage.setValue("interval", 0);
    }
    
    if (App.Storage.getValue("timer") == null) {
    	App.getApp().setProperty("timer", 3600);
    	App.getApp().setProperty("currentInterval", 1800);
    } else {
    	App.getApp().setProperty("timer", App.Storage.getValue("timer"));
    	App.getApp().setProperty("currentInterval", App.Storage.getValue("timer") - App.Storage.getValue("interval"));
    }
    
    App.getApp().setProperty("team1Score", 0);
    App.getApp().setProperty("team2Score", 0);
    
    if (App.Storage.getValue("team1") == null) {
    	App.getApp().setProperty("team1", "SMITH");
    } else {
    	App.getApp().setProperty("team1", App.Storage.getValue("team1"));
    }
    
    if (App.Storage.getValue("team2") == null) {
    	App.getApp().setProperty("team2", "ROW  ");
    } else {
    	App.getApp().setProperty("team2", App.Storage.getValue("team2"));
    }
    
    App.getApp().setProperty("timerStarted", false);
    
    App.getApp().setProperty("backPressed", false);
    
    myTimer.start(method(:update), 1000, true); // start timer for clock
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    	App.Storage.setValue("team1", App.getApp().getProperty("team1"));
    	App.Storage.setValue("team2", App.getApp().getProperty("team2"));
    
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new Football_Score_TrackerView(), new Football_Score_TrackerDelegate() ];
    }

}
