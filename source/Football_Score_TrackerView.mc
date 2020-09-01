using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.System;
using Toybox.Application as App;

class Football_Score_TrackerView extends WatchUi.View {

	hidden var myText;
	var teams;
	var timer;
	var interval;
	

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    
    teams = new WatchUi.Text({
	            :text=>App.getApp().getProperty("team1") + "   " + App.getApp().getProperty("team2"),
	            :color=>Graphics.COLOR_BLACK,
	            :font=>Graphics.FONT_LARGE,
	            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
	            :locY=>50
	        });
    
    }
    
    function secondsToTimeString(totalSeconds) {
		var minutes = (totalSeconds / 60).toNumber();
		var seconds = totalSeconds - minutes * 60;
		var timeString = Lang.format("$1$:$2$", [minutes.format("%02d"),
			seconds.format("%02d")]);
		return timeString;
	}
	
	

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.clear();
        
        var myTime = System.getClockTime(); // ClockTime object
        
        var clock = new WatchUi.Text({
        	:text=> myTime.hour.format("%02d") + ":" + myTime.min.format("%02d"),
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_SMALL,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>15
        });
        
        myText = new WatchUi.Text({
            :text=>App.getApp().getProperty("team1Score") + " : " + App.getApp().getProperty("team2Score"),
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_LARGE,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>100
        });
	        
	    timer = new WatchUi.Text({
	        :text=>secondsToTimeString(App.getApp().getProperty("timer")),
	        :color=>Graphics.COLOR_BLACK,
	        :font=>Graphics.FONT_LARGE,
	        :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
	        :locY=>180
	    });
	    
	    var interval = 
	    	new WatchUi.Text({
	        :text=>secondsToTimeString(App.Storage.getValue("interval")),
	        :color=>Graphics.COLOR_BLACK,
	        :font=>Graphics.FONT_SMALL,
	        :locX =>5,
	        :locY=>WatchUi.LAYOUT_VALIGN_CENTER
	        });
        
        myText.draw(dc);
        teams.draw(dc);
        timer.draw(dc);
        clock.draw(dc);
        if (App.Storage.getValue("interval") !=0 ) {
        	interval.draw(dc);
        }
        
       
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
