package
{
	import org.flixel.*;

	public class Enemy extends FlxSprite
	{
		public function Enemy(X:int, Y:int)
		{
			super(X, Y);
			loadGraphic(Assets.ENEMY00_TEXTURE, false, false, 4, 4);
			exists = false;
		}

		public function launch():void
		{
			x = 64 + int(Math.random() * (FlxG.width - 128));
			y = -16;
			velocity.x = -50 + int(Math.random() * 100);
			velocity.y = 100;

			health = 4;
			exists = true;
		}

		override public function kill():void
		{
			super.kill();

			FlxG.score += 20;
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