package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxMath;

	public class Player extends FlxSprite
	{
		public const MAX_WIDTH:int = 64;
		public var bullets:FlxGroup;
		private var showCursor:Boolean = true;
		
		protected var _nearestStar:Star; //the star closest to the player
		protected var _rotationAngle:Number;
		
		private const MAX_MOVEMENT_MULTIPLIER:int = 100;
		private const SLOW_MOVEMENT_MULTIPLIER:int = 50;
		
		//whether or not the player is in a blackhole
		public var inBlackhole:Boolean = false;

		/**
		 * Creates a player at the specified position
		 * 
		 * @param	X				The initial X position of the sprite.
		 * @param	Y				The initial Y position of the sprite.
		 */
		public function Player(X:Number=0,Y:Number=0)
		{
			super(X, Y);
			loadGraphic(Assets.PLAYER00_TEXTURE, false, false, 4, 4, false);
			maxVelocity.x = 60;
			maxVelocity.y = 60;
			drag.x = maxVelocity.x/4;
			drag.y = maxVelocity.y/4;
			antialiasing = true;
			exists = true;
			bullets = new FlxGroup();
			
			//let's show the mouse by default
			FlxG.mouse.show(Assets.CURSOR_TEXTURE, 2, 4, 4);
		}
		
		override public function update():void
		{
			checkInput();
			checkBounds();
			cleanUpBullets();
			super.update();
		}
		
		protected function checkInput():void
		{			
			//if the user presses C, toggle the cursor
			if (FlxG.keys.justReleased("C"))
			{
				if (!showCursor)
				{
					FlxG.mouse.show(Assets.CURSOR_TEXTURE, 2, 4, 4);
					showCursor = true;
				}
				else
				{
					FlxG.mouse.hide();
					showCursor = false;
				}
			}
			
			//if the user is pressing down on the mouse, fire
			if (FlxG.mouse.pressed())
			{
				//the angle between the player and the mouse
				var angle:Number = FlxU.getAngle(FlxG.mouse.getWorldPosition(), new FlxPoint(x, y));
				fireBullet(Math.cos((angle+90)/(180/Math.PI)), Math.sin((angle+90)/(180/Math.PI)));
			}
			
			if (FlxG.keys.pressed("SHIFT"))
			{
				_movementMultiplier = SLOW_MOVEMENT_MULTIPLIER;
			}
			else
			{
				_movementMultiplier = MAX_MOVEMENT_MULTIPLIER;
			}
			
		}
		
		protected function checkBounds():void
		{
			//we need to check if the player has pased the bounds of the screen
			if (x >= FlxG.worldBounds.width)
			{
				x = 0;
			}
			
			if (x < 0)
			{
				x = FlxG.width;
			}
			
			if (y >= FlxG.worldBounds.height)
			{
				y = 0;
			}
			
			if (y < 0)
			{
				y = FlxG.height;
			}
		}
		
		protected function fireBullet(XVelocity:Number, YVelocity:Number):void
		{
			var bullet:Bullet = new Bullet(x , y, XVelocity, YVelocity);
			bullets.add(bullet);
			velocity.x = -XVelocity * _movementMultiplier;
			velocity.y = -YVelocity * _movementMultiplier;
		}
		
		private function cleanUpBullets():void
		{
			for each (var bullet:Bullet in bullets)
			{
				if (!bullet.exists)
				{
					bullets.remove(bullet);
				}
			}
		}
		
		public function respawn():void
		{
			flicker();
			x = FlxG.width / 2 - 2;
			y = FlxG.height / 2 - 2;
		}
	}

}