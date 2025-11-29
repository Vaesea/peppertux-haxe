package creatures.misc;

import flixel.util.FlxTimer;
import objects.Fireball;
import flixel.tweens.FlxTween;
import flixel.graphics.frames.FlxAtlasFrames;

class Flame extends Enemy
{
    var radius = 100;
    var speed = 200;

    var flameImage = FlxAtlasFrames.fromSparrow('assets/images/characters/flame.png', 'assets/images/characters/flame.xml');

    public function new(x:Float, y:Float)
    {
        super(x, y);

        frames = flameImage;
        animation.addByPrefix("normal", "flame normal", 8, true);
        animation.addByPrefix("fade", "flame fade", 8, false);
        animation.play("normal");

        acceleration.y = 0;

        bag = true;

        FlxTween.circularMotion(this, x, y, radius, 0, true, speed, false, {type: LOOPING});
    }

    override private function flipDirection()
    {
        return;
    }

    override public function interact(tux:Tux)
    {
        checkIfHerring(tux);

        if (tux.invincible)
        {
            kill();
        }
        else
        {
            tux.takeDamage();
        }
    }

    override public function kill()
    {
        solid = false;
        animation.play("fade");
        new FlxTimer().start(0.5, function(_) 
        {  
            exists = false;
            alive = false;
        });
    }

    override private function checkIfHerring(tux:Tux)
    {
        if (tux.invincible)
        {
            kill();
        }
    }

    override public function killFall()
    {
        return;
    }

    override public function collideOtherEnemy(otherEnemy:Enemy)
    {
        return;
    }

    override public function collideFireball(fireball:Fireball)
    {
        return;
    }
}

class IceFlame extends Enemy
{
    var radius = 100;
    var speed = 200;

    var iceFlameImage = FlxAtlasFrames.fromSparrow('assets/images/characters/iceflame.png', 'assets/images/characters/iceflame.xml');

    public function new(x:Float, y:Float)
    {
        super(x, y);

        frames = iceFlameImage;
        animation.addByPrefix("normal", "iceflame normal", 8, false);
        animation.addByPrefix("fade", "iceflame fade", 8, false);
        animation.play("normal");

        acceleration.y = 0;

        bag = true;

        FlxTween.circularMotion(this, x, y, radius, 0, true, speed, false, {type: LOOPING});
    }

    override private function flipDirection()
    {
        return;
    }

    override public function interact(tux:Tux)
    {
        checkIfHerring(tux);

        if (tux.invincible)
        {
            kill();
        }
        else
        {
            tux.takeDamage();
        }
    }

    override public function kill()
    {
        solid = false;
        animation.play("fade");
        new FlxTimer().start(0.5, function(_) 
        {  
            exists = false;
            alive = false;
        });
    }

    override private function checkIfHerring(tux:Tux)
    {
        if (tux.invincible)
        {
            kill();
        }
    }

    override public function killFall()
    {
        return;
    }

    override public function collideOtherEnemy(otherEnemy:Enemy)
    {
        return;
    }

    override public function collideFireball(fireball:Fireball)
    {
        kill();
    }
}