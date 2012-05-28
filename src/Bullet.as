package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	public class Bullet extends FlxSprite
	{
		
		public function Bullet(X:int, Y:int, XAxisValue:Number, YAxisValue:Number) 
		{
			super(X, Y);
			loadGraphic(Assets.BULLET00_TEXTURE, false, false, 2, 2, false);
			x -= width / 2;
			y -= height / 2;
			velocity.x = XAxisValue * 150;
			velocity.y = YAxisValue * 150;
			maxVelocity.x = 400;
			maxVelocity.y = 400;
			exists = true;
			
		}
		
		override public function update():void
		{
			super.update();
			
			checkBounds();
		}
		
		protected function checkBounds():void
		{
			//we need to check if the bullet has pased the bounds of the screen
			if (x >= FlxG.worldBounds.width)
			{
				kill();		
			}
			
			if (x < 0)
			{
				kill();
			}
			
			if (y >= FlxG.worldBounds.height)
			{
				kill();
			}
			
			if (y < 0)
			{
				kill();
			}
		}
	}

}