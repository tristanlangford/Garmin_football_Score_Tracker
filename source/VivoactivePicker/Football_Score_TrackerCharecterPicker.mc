using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

class StringPicker extends Ui.Picker {
    const mCharacterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    hidden var TeamName;
    hidden var mFactory;
    hidden var mTeam;
    hidden var mTeamName;


    function initialize(team) {
        mFactory = new CharacterFactory(mCharacterSet, {:addOk=>true});
        mTeam = team;
        TeamName = "";
        mTeamName = new Ui.Text({  // set team name input view
                :text=>TeamName,
                :locX =>Ui.LAYOUT_HALIGN_CENTER,
                :locY=>Ui.LAYOUT_VALIGN_BOTTOM,
                :color=>Gfx.COLOR_WHITE});
        Picker.initialize({:title=>mTeamName, :pattern=>[mFactory]}); // initialize the charecter Picker
    }

    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }

    function addCharacter(character) {
        TeamName += character;
        mTeamName.setText(TeamName);
    }
    
	function saveTeamName(text, teamName) {
    	if (text.length() > 5) {
    		text = text.substring(0, 4) + "...";
    	}
        return App.getApp().setProperty(teamName, text);
    }

    function removeCharacter() {
        TeamName = TeamName.substring(0, TeamName.length() - 1);
        mTeamName.setText(TeamName);
    }

    function getTitleLength() {
        return TeamName.length();
    }

    function isDone() {
    	if (mFactory.isDone()) {
    		saveTeamName(TeamName, mTeam);
    		return true;
    	} else {
    		return false;
    	}
    }
}