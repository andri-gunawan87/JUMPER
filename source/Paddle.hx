package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author Andri Gunawan
 */
class Paddle extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(40, 6, FlxColor.MAGENTA);
		
	}
	
	
	
}