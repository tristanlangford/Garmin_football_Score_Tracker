using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Application as App;

class Football_Score_TrackerView extends WatchUi.View {

	hidden var myText;
	var score1 = App.getApp().getProperty("team1Score");
	var score2 = App.getApp().getProperty("team2Score");

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
    
    }
	
	

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        
        myText = new WatchUi.Text({
	            :text=>App.getApp().getProperty("team1Score") + " : " + App.getApp().getProperty("team2Score"),
	            :color=>Graphics.COLOR_WHITE,
	            :font=>Graphics.FONT_LARGE,
	            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
	            :locY=>WatchUi.LAYOUT_VALIGN_CENTER
	        });
        
        myText.draw(dc);
        
       
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
