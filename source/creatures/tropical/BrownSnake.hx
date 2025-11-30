package creatures.tropical;

import flixel.graphics.frames.FlxAtlasFrames;

class BrownSnake extends Enemy
{
    var brownSnakeImage = FlxAtlasFrames.fromSparrow("assets/images/characters/brownsnake.png", "assets/images/characters/brownsnake.xml");

    public function new(x:Float, y:Float)
    {
        super(x, y);

        frames = brownSnakeImage;
        animation.addByPrefix('walk', 'walk', 12, true);
        animation.addByPrefix('squished', 'squished', 12, false);
        animation.play('walk');

        walkSpeed = 115;

        setSize(52, 8);
        offset.set(4, 17);
    }

    override private function move()
    {
        velocity.x = direction * walkSpeed;
    }
}
