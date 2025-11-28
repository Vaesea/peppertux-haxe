package objects;

import flixel.util.FlxTimer;
import worldmap.WorldmapState.WorldMapState;
import flixel.FlxG;
import creatures.Tux;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Scripting extends FlxSprite
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y);
        makeGraphic(width, height, FlxColor.TRANSPARENT);
        solid = true;
        immovable = true;
    }
}

class StopTux extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.stop();
    }
}

class StopTuxAndWalkRight extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.stop();
        new FlxTimer().start(1, function(_)
        {
            tux.walkRight();
        }, 1);
    }
}

class StartTux extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.start();
    }
}

class WalkTuxRight extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.walkRight();
    }
}

class WalkTuxLeft extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.walkLeft();
    }
}

class RunTuxRight extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false; 
        tux.runRight();
    }
}

class RunTuxLeft extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.runLeft();
    }
}

class TuxJumpSmall extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.jumpSmall();
    }
}

class TuxJump extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.jump();
    }
}

class TuxJumpHigh extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        tux.jumpHigh();
    }
}

class FadeOut extends Scripting
{
    public function new(x:Float, y:Float, width:Int, height:Int)
    {
        super(x, y, width, height);
    }

    public function interact(tux:Tux)
    {
        solid = false;
        Global.PS.camera.fade(FlxColor.BLACK, 2, false, function()
        {
            
            Global.tuxState = tux.currentState;

            if (!Global.completedLevels.contains(Global.currentLevel))
            {
                Global.completedLevels.push(Global.currentLevel);
            }

            Global.saveProgress();
            FlxG.switchState(WorldMapState.new);
        });
    }
}