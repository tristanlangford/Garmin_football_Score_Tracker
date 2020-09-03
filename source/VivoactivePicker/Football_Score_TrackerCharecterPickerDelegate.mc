using Toybox.Application as App;
using Toybox.Graphics;	
using Toybox.WatchUi as Ui;	

class AccountCreateFromPickerDelegate extends Ui.PickerDelegate {
    hidden var mPicker;

    function initialize(picker) {
        PickerDelegate.initialize();
        mPicker = picker;
    }

    function onCancel() { // if no input, go back, else remove a charecter
        if(0 == mPicker.getTitleLength()) {
            Ui.popView(Ui.SLIDE_IMMEDIATE);
        } else {
            mPicker.removeCharacter();
        }
    }

    function onAccept(values) { // if the user selects done, confirm, else add letter
        if(!mPicker.isDone()) {
            mPicker.addCharacter(values[0]);
        } else {
        	var vibeData =
				    [
				        new Attention.VibeProfile(50, 500), // On for two seconds
				    ];
			Attention.vibrate(vibeData);
        	Ui.popView(Ui.SLIDE_IMMEDIATE);
        }
    }
}
