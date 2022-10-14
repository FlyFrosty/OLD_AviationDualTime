import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Graphics;


    var showBat;
    var clockColorSet = Graphics.COLOR_DK_BLUE;
    var clockShadSet = Graphics.COLOR_TRANSPARENT;
    var subColorSet = Graphics.COLOR_LT_GRAY;
    var myBackgroundColor = 0x000000;
    var offSetAmmt = 130;
    var timeOrStep;

class AviationDualTimeApp extends Application.AppBase {

    var clockColorNum;
    var clockShadNum;
    var subColorNum;

    function initialize() {
        AppBase.initialize();
        onSettingsChanged();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        onSettingsChanged();
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new AviationDualTimeView() ] as Array<Views or InputDelegates>;
    }

    // New app settings have been received so trigger a UI update
    function onSettingsChanged() {
        //Set Global Settings variables

        clockColorNum = Properties.getValue("ClockColor");
        clockShadNum = Properties.getValue("ShadOpt");
        subColorNum = Properties.getValue("SubColor");
        showBat = Properties.getValue("DispBatt");
        myBackgroundColor = Properties.getValue("BackgroundColor");
        timeOrStep = Properties.getValue("TimeStep");

        colorUpdate();  //Apply the changes
        WatchUi.requestUpdate();
    }
    

        function colorUpdate(){
        //Get color settings

		        if (clockColorNum == 0) {
				    clockColorSet = Graphics.COLOR_WHITE;
                } else if (clockColorNum == 1) {
				    clockColorSet = Graphics.COLOR_LT_GRAY;
                } else if (clockColorNum == 2) {
				    clockColorSet = Graphics.COLOR_DK_GRAY;
                } else if (clockColorNum == 3) {
				    clockColorSet = Graphics.COLOR_BLACK;
                } else if (clockColorNum == 4) {
				    clockColorSet = Graphics.COLOR_RED;
                } else if (clockColorNum == 5) {
				    clockColorSet = Graphics.COLOR_DK_RED;
                } else if (clockColorNum == 6) {
				    clockColorSet = Graphics.COLOR_ORANGE;
                } else if (clockColorNum == 7) {
				    clockColorSet = Graphics.COLOR_YELLOW;
                } else if (clockColorNum == 8) {
				    clockColorSet = Graphics.COLOR_GREEN;
                } else if (clockColorNum == 9) {
				    clockColorSet = Graphics.COLOR_DK_GREEN;
                } else if (clockColorNum == 10) {
				    clockColorSet = Graphics.COLOR_BLUE;
                } else if (clockColorNum == 11) {
				    clockColorSet = Graphics.COLOR_DK_BLUE;
                } else if (clockColorNum == 12) {
				    clockColorSet = Graphics.COLOR_PURPLE;
                } else {
				    clockColorSet = Graphics.COLOR_PINK;
                }

                //Select shadowing
                if (clockShadNum == 0) {
                    clockShadSet = Graphics.COLOR_TRANSPARENT;
                } else if (clockShadNum == 1) {
                    clockShadSet = Graphics.COLOR_BLACK;
                } else if (clockShadNum == 2) {
                    clockShadSet = Graphics.COLOR_WHITE;
                 } else if (clockShadNum == 3) {
                    clockShadSet = Graphics.COLOR_LT_GRAY;
                }

                //Select Sub items color
                if (subColorNum == 0) {
                    subColorSet = Graphics.COLOR_LT_GRAY;
                } else if (subColorNum == 1) {
                    subColorSet = Graphics.COLOR_DK_GRAY;
                } else if (subColorNum == 2) {
                    subColorSet = Graphics.COLOR_BLACK;
                } else if (subColorNum == 3) {
                    subColorSet = Graphics.COLOR_WHITE;
                }

            if (timeOrStep) {
                //Get the Zulu Hours offset ammount
                offSetAmmt = Properties.getValue("ZuluOffset");
            }
        }

}


function getApp() as AviationDualTimeApp {
    return Application.getApp() as AviationDualTimeApp;
}