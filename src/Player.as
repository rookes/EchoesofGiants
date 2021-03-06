package  
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxMath;

	public class Player extends FlxSprite
	{
		private var showCursor:Boolean = true;
		
		protected var _nearestStar:Star; //the star closest to the player
		protected var _rotationAngle:Number;
		
		//variables to handle player movement speed
		private var _movementMultiplier:int;
		private const NORMAL_MOVEMENT_MULTIPLIER:int = 7;
		private const SLOW_MOVEMENT_MULTIPLIER:int = 3;
		
		//whether or not the player is in a blackhole
		public var inBlackhole:Boolean = false;

		//some possible variables for powerups to change
		public var weight:Number = 1.0;
		public var grappleStrength:Number = 1.0;
		public var bulletSize:Number = 1.0;
		public var bulletSpeed:Number = 150;
		public var bulletLoadTime:Number = 1.0;
		
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

			maxVelocity.x = 170;
			maxVelocity.y = 170;
			
			drag.x = maxVelocity.x/4;
			drag.y = maxVelocity.y/4;
			antialiasing = true;
			exists = true;
			
			//let's show the mouse by default
			FlxG.mouse.show(Assets.CURSOR_TEXTURE, 2, 4, 4);
		}
		
		/**
		 * Update is called every frame
		 */
		override public function update():void
		{
			checkInput();
			checkBounds();
			super.update();
		}
		
		/**
		 * Checks for any user input from the mouse and keyboard
		 */
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
				fireBullet(Math.cos((angle + 90)*(Math.PI / 180)), Math.sin((angle + 90) * (Math.PI / 180)));
			}
			
			//if the user is pressing shift then slowdown the player's movement
			if (FlxG.keys.pressed("SHIFT"))
			{
				_movementMultiplier = SLOW_MOVEMENT_MULTIPLIER;
			}
			else
			{
				_movementMultiplier = NORMAL_MOVEMENT_MULTIPLIER;
			}
			
		}
		
		/**
		 * Check to see if the player is outside of the game bounds
		 * If the player is outside of the game bounds, shoot him out the other side
		 */
		protected function checkBounds():void
		{
			if (x >= FlxG.worldBounds.width)
			{
				x = 1;
			}
			
			if (x <= 0)
			{
				x = FlxG.worldBounds.width;
			}
			
			if (y >= FlxG.worldBounds.height)
			{
				y = 1;
			}
			
			if (y <= 0)
			{
				y = FlxG.worldBounds.height;
			}
		}
		
		/**
		 * Create and fire a bullet
		 * 
		 * @param	XVelocity				The x velocity to shoot the bullet at
		 * @param	YVelocity				The y velocity to shoot the bullet at
		 */
		protected function fireBullet(XVelocity:Number, YVelocity:Number):void
		{
			Registry.playerBullets.fire(x + origin.x , y + origin.y, XVelocity * bulletSpeed, YVelocity * bulletSpeed);

			velocity.x -= XVelocity * _movementMultiplier;
			velocity.y -= YVelocity * _movementMultiplier;
		}
		
		/**
		 * Respawns the player at the center of the screen
		 * Flickers the player as a visual queue of death
		 */
		public function respawn():void
		{
			flicker();
			x = FlxG.width / 2 - 2;
			y = FlxG.height / 2 - 2;
		}
	}

}