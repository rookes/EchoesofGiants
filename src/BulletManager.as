package  
{
	import org.flixel.FlxGroup;
	
	public class BulletManager extends FlxGroup
	{
		/**
		 * A BulletManager is simply an extension of FlxGroup to help create a more efficient way to manage and recycle bullets
		 * 
		 * @param	MaxNumberOfBullets			The maximum numbers of bullets the BulletManager will contain
		 */
		public function BulletManager(MaxNumberOfBullets:int) 
		{
			super();
			
			//create a pool of the specified amount of bullets
			for (var i:int = 0; i < MaxNumberOfBullets; i++)
			{
				add(new Bullet);
			}
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
			if (getFirstAvailable())
			{
				Bullet(getFirstAvailable()).fire(X, Y, XAxisValue, YAxisValue);
			}
		}
		
	}

}