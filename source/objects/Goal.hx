package objects;

// Worldmap support by AnatolyStev

import flixel.util.FlxTimer;
import worldmap.WorldmapState.WorldMapState;
import creatures.Tux;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Goal extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        solid = true;
        immovable = true;
        makeGraphic(2, FlxG.height * 16, FlxColor.TRANSPARENT);
    }

    public function reach(tux:Tux)
    {
        if (solid) // TODO: Add cutscene (Will be added!)
        {
            solid = false;
            
            Global.tuxState = tux.currentState;

            if (!Global.completedLevels.contains(Global.currentLevel))
            {
                Global.completedLevels.push(Global.currentLevel);
            }

            if (FlxG.sound.music != null) // Check if song is playing, if it is, stop song. This if statement is here just to avoid a really weird crash.
            {
                FlxG.sound.music.stop();
            }

            FlxG.sound.playMusic("assets/music/leveldone.ogg", 1.0, false);

            tux.stop();
            tux.walkRight();

            new FlxTimer().start(8, function(_)
            {
                Global.saveProgress();
                FlxG.switchState(WorldMapState.new);
            }, 1);
        }
    }
}