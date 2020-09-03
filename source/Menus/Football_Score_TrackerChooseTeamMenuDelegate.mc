using Toybox.WatchUi;
using Toybox.Application as App;
using Toybox.WatchUi as Ui;

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
    
    function changeTeam(team) { // no TextPicker launches triggers charecter picker
    	if (Ui has :TextPicker) {
	    	WatchUi.pushView(
	                    new WatchUi.TextPicker(""),
	                    new ChangeTeamPicker(team),
	                    WatchUi.SLIDE_DOWN
	                );
        } else {
        	var picker = new StringPicker(team);
            Ui.pushView(picker, new AccountCreateFromPickerDelegate(picker), Ui.SLIDE_IMMEDIATE);
        }
    }
}

class ChangeTeamPicker extends WatchUi.TextPickerDelegate {

	var teamName;

    function initialize(team) {
        TextPickerDelegate.initialize();
        teamName = team;  	
    }

    function onTextEntered(text, changed) { // shortens team name for view
    	if (text.length() > 5) {
    		text = text.substring(0, 4) + "...";
    	}
        return App.getApp().setProperty(teamName, text);
    }

    function onCancel() {
    
    }
}