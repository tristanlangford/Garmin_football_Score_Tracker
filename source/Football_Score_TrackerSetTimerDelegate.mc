using Toybox.WatchUi;
using Toybox.Application as App;
using Toybox.Timer;
using Toybox.System;

var setTimer = App.Storage.getValue("timer");

class Football_Score_TrackerSetTimerDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        return true;
    }
    
    function onKey(keyEvent) {    
        if (keyEvent.getKey() == 13) {
        	setTimer += 300;
        } else if (keyEvent.getKey() == 8 && setTimer > 300) {
        	setTimer -= 300;
      	} 
        WatchUi.requestUpdate();
        return true;
	}
	
	function onBack() {
	
	}
    	
	function onSelect() {
		var vibeData =
				    [
				        new Attention.VibeProfile(50, 500), // On for two seconds
				    ];
		Attention.vibrate(vibeData);
		 App.Storage.setValue("timer", setTimer);
		 App.getApp().setProperty("timer", setTimer);
		if (App.Storage.getValue("interval") * 2 > App.Storage.getValue("timer")) {
			App.Storage.setValue("interval", App.Storage.getValue("timer") / 2);
		} else if (App.Storage.getValue("timer") == 300) {
			App.Storage.setValue("interval", 0);
		} 
		App.getApp().setProperty("currentInterval", setTimer - App.Storage.getValue("interval"));
	}

}

class Football_Score_TrackerSetTimerView extends WatchUi.View {

	var myText;
	var timer;

    function initialize() {
        View.initialize();
    }
    
       function secondsToTimeString(totalSeconds) {
       if (totalSeconds % 60 != 0) { App.Storage.setValue("timer", 3600); }
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
            :locY=>40
        });
    }
	
    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.clear();
        
        timer = new WatchUi.Text({
	            :text=>secondsToTimeString(setTimer),
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