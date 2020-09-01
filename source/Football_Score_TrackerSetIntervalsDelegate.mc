using Toybox.WatchUi;
using Toybox.Application as App;
using Toybox.Timer;
using Toybox.System;

var interval = App.Storage.getValue("timer") / 2;

class Football_Score_TrackerSetIntervalDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
    	if (App.Storage.getValue("interval") != 0) {
    		interval = App.Storage.getValue("interval");
    	}
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        return true;
    }
    
    function timerMinus() {
    	if (interval % 60 != 0) {
    		interval -= 150;
    	} else if (interval > 600) {
    		interval -= 300;
    	} else if (interval > 0) {
    		interval -= 60;
    	} else { 
    		return;
    	}
    }
    
    function timerPlus() {
    	if (interval >= 600 && (interval + 300) < (App.Storage.getValue("timer") / 2)) {
    		interval += 300;
    	} else if (interval < 600) {
    		interval += 60;
    	} else if (interval + 300 >= App.Storage.getValue("timer") / 2) {
    		interval = App.Storage.getValue("timer") / 2;
    	} else { 
    		return;
    	}
    }
    
    function onKey(keyEvent) {    
        if (keyEvent.getKey() == 13) {
        	timerPlus();
        } else if (keyEvent.getKey() == 8) {
        	timerMinus();
      	} 
        WatchUi.requestUpdate();
        return true;
	}
	
	function onBack() {
	
	}
    	
	function onSelect() {
		App.Storage.setValue("interval", interval);
		var vibeData =
				    [
				        new Attention.VibeProfile(50, 2000), // On for two seconds
				    ];
		Attention.vibrate(vibeData);
		return true;
	}

}

class Football_Score_TrackerSetIntervalView extends WatchUi.View {

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
            :text=>"Set Intervals",
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_LARGE,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>40
        });
    
    timer = new WatchUi.Text({
	            :text=>secondsToTimeString(interval),
	            :color=>Graphics.COLOR_BLACK,
	            :font=>Graphics.FONT_NUMBER_HOT,
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
	            :text=>secondsToTimeString(interval),
	            :color=>Graphics.COLOR_BLACK,
	            :font=>Graphics.FONT_NUMBER_HOT,
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