using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.System;
using Toybox.Application as App;

class Football_Score_TrackerSetTimerView extends WatchUi.View {

var myText;
var timer;

    function initialize() {
        View.initialize();
    }
    
       function secondsToTimeString(totalSeconds) {
		var minutes = (totalSeconds / 60).toNumber();
		var seconds = totalSeconds - minutes * 60;
		var timeString = Lang.format("$1$:$2$", [minutes.format("%02d"),
			seconds.format("%02d")]);
		return timeString;
	}

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.SetTimerLayout(dc));
        
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    
    myText = new WatchUi.Text({
            :text=>"Set Timer",
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_LARGE,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>50
        });
    
    timer = new WatchUi.Text({
	            :text=>secondsToTimeString(App.getApp().getProperty("timer")),
	            :color=>Graphics.COLOR_BLACK,
	            :font=>Graphics.FONT_LARGE,
	            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
	            :locY=>WatchUi.LAYOUT_VALIGN_CENTER
	        });
    
    }
	
    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.clear();
        
        timer = new WatchUi.Text({
	            :text=>secondsToTimeString(App.getApp().getProperty("timer")),
	            :color=>Graphics.COLOR_BLACK,
	            :font=>Graphics.FONT_LARGE,
	            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
	            :locY=>WatchUi.LAYOUT_VALIGN_CENTER
	        });
        
        myText.draw(dc);
        timer.draw(dc);
       
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
