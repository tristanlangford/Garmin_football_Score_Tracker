using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application as App;

class Football_Score_TrackerChooseTeamMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :team1) {
        	changeTeam("team1");
        } else if (item == :team2) {
           changeTeam("team2");
        }
        return true;
    }
    
    function changeTeam(team) {
    	WatchUi.pushView(
                    new WatchUi.TextPicker(""),
                    new ChangeTeamPicker(team),
                    WatchUi.SLIDE_DOWN
                );
    }
}

class ChangeTeamPicker extends WatchUi.TextPickerDelegate {

	var teamName;

    function initialize(team) {
        TextPickerDelegate.initialize();
        teamName = team;  	
    }

    function onTextEntered(text, changed) {
    	if (text.length() > 5) {
    		text = text.substring(0, 4) + "...";
    	}
        return App.getApp().setProperty(teamName, text);
    }

    function onCancel() {
    
    }
}