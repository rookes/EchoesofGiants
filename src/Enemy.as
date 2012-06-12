package
{
	import org.flixel.*;

	public class Enemy extends FlxSprite
	{
		public function Enemy()
		{
			super(0, 0);
			loadGraphic(Assets.ENEMY00_TEXTURE, false, false, 4, 4);
			exists = false;
		}

		/** Drops a powerup with default stats at the current location of the enemy
		 */
		public function dropPowerup():void
		{
			Registry.powerups.addPowerup(x, y);
		}
		
		public function launch():void
		{
			x = 128 + int(Math.random() * (FlxG.width - 128));
			y = -10;
			velocity.x = -50 + int(Math.random() * 100);
			velocity.y = 100;

			health = 4;
			exists = true;
		}

		override public function kill():void
		{
			super.kill();
			if (Math.random() < 0.05)
				dropPowerup();
		}

		override public function update():void
		{
			super.update();

			checkBounds();
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
	}

}