package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author Andri Gunawan
 */
class Player extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.jadi__png, true, 16, 16);
		animation.add("hit", [9, 10, 9], 6, false);
		animation.add("idle", [8]);
		
	}
	
}