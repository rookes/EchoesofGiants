package  
{
	import org.flixel.*;
	
	public class Asteroid extends FlxSprite
	{
		
		
		
		public function Asteroid(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			(Assets.ASTEROID_TEXTURE, true, false, 16, 16, false);
			scale = new FlxPoint(2, 2);
			addAnimation("rotate", [0, 1, 2, 3], 4, true);
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
			play("rotate");
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
