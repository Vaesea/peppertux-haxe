package states;

import flixel.FlxG;
import worldmap.WorldmapState.WorldMapState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.text.FlxText.FlxTextBorderStyle;
import flixel.util.FlxColor;
import flixel.FlxState;

class OutroState extends FlxState
{
    var introText:FlxText;

    var speed = 20;
    var increaseOrDecreaseSpeed = 10;

    override public function create()
    {
        super.create();

        var bg = new FlxSprite();
        bg.loadGraphic("assets/images/cutscene/intro.png", false);
        add(bg);
        
        introText = new FlxText(-25, 716, FlxG.width, "
        Tux had got through the castle, but to his surprise,
        there was no Nolok or Penny anywhere! He tried searching
        around, but he only found a letter. The letter was
        from Nolok, and it told Tux to give up, but no, Tux would not give up.
        So Tux walked out of the castle, and started swimming towards a Forest Island.", 18);
        introText.setFormat("assets/fonts/SuperTux-Medium.ttf", 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        introText.borderSize = 1.25;
        introText.moves = true;
        introText.velocity.y = -speed;
        add(introText);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.SPACE)
        {
            FlxG.switchState(MainMenuState.new); // Switch State
        }
        
        if (FlxG.keys.justPressed.DOWN)
        {
            introText.velocity.y -= increaseOrDecreaseSpeed;
        }
        else if (FlxG.keys.justPressed.UP)
        {
            introText.velocity.y += increaseOrDecreaseSpeed;
        }
    }
}