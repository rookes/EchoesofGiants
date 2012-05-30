package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	import flash.utils.getTimer;
	
	public class Bullet extends FlxSprite
	{
		//the amount of time for the bulleto exist
		//10000ms = 10s
		private const BULLET_LIFE_TIME:uint = 10000;
		private var timeLastKilled:int;
		
		/**
		 * Create a new bullet that does not exist so it can be ready for the pool allocation in a bullet manager right away
		 */
		public function Bullet() 
		{			
			super(0, 0);
			loadGraphic(Assets.BULLET00_TEXTURE, false, false, 2, 2, false);
			maxVelocity.x = 400;
			maxVelocity.y = 400;
			exists = false; //set exists to false to make the bullet ready for pool allocation right away
		}
		
		/**
		 * Fire a bullet
		 * @param	X			The X position to start the bullet at
		 * @param	Y			The Y position to start the bullet at
		 * @param	XAxisValue	The XAxis value to fire the bullet at, determines the horizontal direction
		 * @param	YAxisValue	The YAxis value to fire the bullet at, determines the vertical direction
		 */
		public function fire(X:int, Y:int, XAxisValue:Number, YAxisValue:Number):void
		{			
			//fire the bullet based on the center of the bullet
			x = X - width / 2;
			y = Y - height / 2;
			velocity.x = XAxisValue * 150;
			velocity.y = YAxisValue * 150;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			checkBounds();
			
			//kill the bullet after it has existed for a set amount of time
			if (getTimer() > BULLET_LIFE_TIME + timeLastKilled)
			{
				kill();
			}
		}
		
		override public function kill():void 
		{
			super.kill();
			timeLastKilled = getTimer();
		}
		
		/**
		 * Check to see if the bullet has left the bounds of the world
		 * If it has, then kill the bullet
		 */
		protected function checkBounds():void
		{
			//we need to check if the bullet has pased the bounds of the screen
			if (x >= FlxG.worldBounds.width || x < 0 || y >= FlxG.worldBounds.height || y < 0)
			{
				kill();		
			}
		}
	}

}