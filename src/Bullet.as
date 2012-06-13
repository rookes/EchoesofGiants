package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	
	import flash.utils.getTimer;
	
	public class Bullet extends FlxSprite
	{
		//Used to control how often bullet can be reflected
		public var recentlyReflected:Boolean = false;

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
			maxVelocity.x = 800;
			maxVelocity.y = 800;
			exists = false; //set exists to false to make the bullet ready for pool allocation right away
		}
		
		/**
		 * Fire a bullet
		 * @param	X			The X position to start the bullet at
		 * @param	Y			The Y position to start the bullet at
		 * @param	XAxisValue	The x-velocity to fire the bullet at, determines the horizontal direction
		 * @param	YAxisValue	The y-velocity to fire the bullet at, determines the vertical direction
		 */
		public function fire(X:int, Y:int, XAxisValue:Number, YAxisValue:Number):void
		{			
			//fire the bullet based on the center of the bullet
			x = X - origin.x;
			y = Y - origin.y;
			
			velocity.x = XAxisValue;
			velocity.y = YAxisValue;
			
			//bound velocity while maintaining direction
			var xMax:Number = maxVelocity.x;
			var yMax:Number = maxVelocity.y;
			
			if (Math.abs(velocity.x) > xMax)
			{
				velocity.x = FlxU.bound(XAxisValue, -xMax, xMax);
				velocity.y = YAxisValue * (xMax / Math.abs(XAxisValue));
			}
			
			if (Math.abs(velocity.y) > yMax)
			{
				velocity.y = FlxU.bound(YAxisValue, -yMax, yMax);
				velocity.x = XAxisValue * (yMax / Math.abs(YAxisValue));
			}
			
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