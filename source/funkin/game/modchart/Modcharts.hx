package funkin.game.modchart;

import flixel.math.FlxAngle;
import funkin.game.modchart.*;
import funkin.game.modchart.events.CallbackEvent;

class Modcharts {
    static function numericForInterval(start, end, interval, func){
        var index = start;
        while(index < end){
            func(index);
            index += interval;
        }
    }

    static var songs = ["fresh"];
	public static function isModcharted(songName:String){
		if (songs.contains(songName.toLowerCase()))
            return true;

        // add other conditionals if needed
        
        //return true; // turns modchart system on for all songs, only use for like.. debugging
        return false;
    }
    
    public static function loadModchart(modManager:ModManager, songName:String){
        PlayState.songIsModcharted = true;
        switch (songName.toLowerCase()){
            default:
                if(ClientPrefs.middleScroll){
                    modManager.setValue("opponentSwap", 0.5);
                    modManager.setValue("alpha", 0.65, 1);
                    modManager.setValue("transform0X", -375, 1);
                    modManager.setValue("transform1X", -350, 1);
                    modManager.setValue("transform2X", 350, 1);
                    modManager.setValue("transform3X", 375, 1);
                }
                PlayState.songIsModcharted = false;
                
        }
        if (PlayState.songIsModcharted)
            trace('${songName} modchart loaded!');
    }
}