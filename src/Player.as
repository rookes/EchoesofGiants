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
			drag.x = maxVelocity.x*4;
			antialiasing = true;
			exists = true;
			bullets = new FlxGroup();
			
			//let's show the mouse by default
			FlxG.mouse.show(Assets.CURSOR_TEXTURE, 2, 4, 4);
		}
		
		override public function update():void
		{
			//not sure if needed
			ControllerManager.Update();
			checkInput();
			checkBounds();
			cleanUpBullets();
			super.update();
		}
		
		protected function checkInput():void
		{
			/*
			 * Controller Controls
			 * Use the 
			 * Should probably add some checking to see where or not the controller is even plugged in
			 */
			
			//move the player with the left analog stick
			if (ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.LeftStickXAxis) > 0.5
				|| ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.LeftStickXAxis) < -0.5)
			{
				acceleration.x = ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.LeftStickXAxis) * 4 * maxVelocity.x;
			}
			
			if (ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.LeftStickYAxis) > 0.5
				|| ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.LeftStickYAxis) < -0.5)
			{
				acceleration.y = ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.LeftStickYAxis) * 4 * -maxVelocity.y;
			}
			//fire bullets with the right analog stick
			if (ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.RightStickXAxis) > 0.5
				|| ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.RightStickXAxis) < -0.5
				|| ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.RightStickYAxis) > 0.5
				|| ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.RightStickYAxis) < -0.5)
			{
				fireBullet(ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.RightStickXAxis),
							ControllerManager.GetAxisValue(ControllerManager.ControllerOne, ControllerManager.RightStickYAxis));
			}
			
			/*
			 * Keyboard Controls
			 * Move with WASD, shoot by clicking the left mouse button
			 */
			
			 //move with WASD
			if (FlxG.keys.A)
			{
			 acceleration.x = -maxVelocity.x * 4;
			}
			if (FlxG.keys.D)
			{
			 acceleration.x = maxVelocity.x * 4;
			}
			if (FlxG.keys.W)
			{
			 acceleration.y = -maxVelocity.y * 4;
			}
			if (FlxG.keys.S)
			{
			 acceleration.y = maxVelocity.y * 4;
			}

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