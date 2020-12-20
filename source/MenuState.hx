// unfinishe JUMPER flash game
// author Andri Gunawan A
package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxRandom;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var _bg:FlxSprite;
	private var _bat:FlxSprite;
	private var _ball:FlxSprite;
	private var _catch:FlxGroup;
	private var _leftcatch:FlxSprite;
	private var _rightcatch:FlxSprite;
	private var _korbans:FlxGroup;
	
	private var _api:FlxSprite;
	
	private var _kecepatan:Int = 250;
	
	private var _walls:FlxGroup;
	private var _leftwall:FlxSprite;
	private var _rightwall:FlxSprite;
	private var _topwall:FlxSprite;
	//private var _value:Int = FlxG.random.int(0, 3);
	
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();
		
		_bg = new FlxSprite(0, 0);
		_bg.loadGraphic("assets/images/dash1.png", false, 640, 360);
		add(_bg);
		
		_korbans = new FlxGroup();
		add(_korbans);
		
		//spawnkorban (20, 20);
		//spawnkorban (80, 80);
		//spawnkorban (120, 120);
		
		_bat = new FlxSprite(288, 318);
		_bat.loadGraphic("assets/images/trampolin.png", true, 64, 32);
		_bat.animation.add("idle", [0]);
		_bat.animation.add("hit", [1, 2, 1, 0], 20, false);
		_bat.immovable = true;
		//_bat.offset.y = 0;
		add(_bat);
		_bat.animation.play("idle");
		
		_ball = new FlxSprite(304, 240);
		_ball.loadGraphic("assets/images/jumper.png", true, 64, 64);
		_ball.animation.add("play", [0, 1, 2, 1], 6, true);
		_ball.elasticity = 1;
		//_ball.maxVelocity.set(200, 200);
		_ball.acceleration.y = _kecepatan;
		add(_ball);
		_ball.animation.play("play");
		
		//_catch = new FlxGroup();
		_leftcatch = new FlxSprite(256, 286);
		_leftcatch.loadGraphic("assets/images/catcher.png", true, 32, 64);
		_leftcatch.animation.add("idle", [4]);
		_leftcatch.animation.add("lari", [5, 6, 5, 4], 6, false);
		add(_leftcatch);
		_leftcatch.animation.play("idle");
		
		_rightcatch = new FlxSprite(352, 286);
		_rightcatch.loadGraphic("assets/images/catcher.png", true, 32, 64);
		_rightcatch.animation.add("idle", [0]);
		_rightcatch.animation.add("lari", [1, 2, 1, 0], 6, false);
		_rightcatch.flipX = false;
		add(_rightcatch);
		_rightcatch.animation.play("idle");
		
		//not implemented image too small
		//_api = new FlxSprite(80, 160);
		//_api.loadGraphic("assets/images/api.png", true, 16, 16);
		//_api.animation.add("fire", [0, 1, 2, 1], 15, true);
		//_api.immovable = true;
		
		//add(_api);
		//_api.animation.play("fire");
		
		_walls =  new FlxGroup();
		_leftwall = new FlxSprite(0, 0);
		_leftwall.makeGraphic(10, 360, FlxColor.GRAY);
		_leftwall.immovable = true;
		_walls.add(_leftwall);
		
		_rightwall = new FlxSprite (630, 0);
		_rightwall.makeGraphic(10, 360, FlxColor.GRAY);
		_rightwall.immovable = true;
		_walls.add(_rightwall);
		
		_topwall = new FlxSprite(0, 0);
		_topwall.makeGraphic(640, 10, FlxColor.GRAY);
		_topwall.immovable = true;
		_walls.add(_topwall);
		
		
		
	}
	//not finished (image too small)
	//private function spawnkorban(x:Int, y:Int):Void {
		//var _anak:FlxSprite = new FlxSprite(x, y);
		//_anak.loadGraphic("assets/images/korban1.png", true, 16, 16);
		//_anak.animation.add("idle", [0, 2, 1, 2, 3, 2], 10, true);
		//_anak.animation.play("idle");
		
		//var _ibu = new FlxSprite(x, y);
		//_ibu.loadGraphic("assets/images/korban1.png", true, 16, 16);
		//_ibu.animation.add("idle", [8, 9, 10, 11, 9, 8], 5, true);
		//_ibu.animation.play("idle");
		
		//var _ayah:FlxSprite = new FlxSprite(x, y);
		//_ayah.loadGraphic("assets/images/korban1.png", true, 16, 16);
		//_ayah.animation.add("idle", [12, 13, 14, 15, 14, 13, 12], 5, true);
		//_ayah.animation.play("idle");
		
		//var _value:Bool = FlxG.random.bool(30);
		//var _value2:Bool = FlxG.random.bool(30);
		//if (_value) {
		//	_korbans.add(_anak);
		//}
		//else if (_value2) {
		//	_korbans.add(_ibu);
		//}
		//else {
		//	_korbans.add(_ayah);
		//}
		
	//}
	
	
	
	
	

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_bat.velocity.x = 0;
		_leftcatch.velocity.x = 0;
		_rightcatch.velocity.x = 0;

		
		
		if (FlxG.keys.pressed.A) {
			_bat.velocity.x = -200;
			_leftcatch.velocity.x = -200;
			_leftcatch.animation.play("lari");
			_rightcatch.velocity.x = -200;
			_rightcatch.animation.play("lari");
		}
		
		else if (FlxG.keys.pressed.D) {
			_bat.velocity.x = 200;
			_leftcatch.velocity.x = 200;
			_rightcatch.velocity.x = 200;
			_leftcatch.animation.play("lari");
			_rightcatch.animation.play("lari");
		}
		
		if (FlxG.keys.justReleased.R) {
			FlxG.resetState();
		}
		
		if (_leftcatch.x < 10) {
			_leftcatch.x = 10;
			_bat.x = 42;
			_rightcatch.x = 106;
		}
		
		if (_rightcatch.x > 598) {
			_rightcatch.x = 598;
			_bat.x = 534;
			_leftcatch.x = 502;
		}
		
		FlxG.collide(_bat, _ball, ping);
		FlxG.collide(_ball, _walls);
		FlxG.collide(_ball, _api);
		//FlxG.collide(_catch, _walls);
	}
	
	private function ping(Bat:FlxObject, Ball:FlxObject):Void {
		var batmid:Int = Std.int(Bat.x) + 20;
		var ballmid:Int = Std.int(Ball.x) + 10;
		var diff:Int;
		var random:Int = Math.round(Math.random() * 8);
		var balspeed:Int = -300;
		
		_ball.velocity.y = balspeed;
		_bat.animation.play("hit");
		
		if (ballmid < batmid) {
			diff = batmid - ballmid;
			Ball.velocity.x = ( -5 * diff);
			Ball.velocity.y = (balspeed + (diff * 5));
		}
		else if (ballmid > batmid) {
			diff = ballmid - batmid;
			Ball.velocity.x = (5 * diff);
			Ball.velocity.y = (balspeed + (diff * 5));
		}
		else {
			Ball.velocity.x = 2 + random;
		}
		
	}
	
}