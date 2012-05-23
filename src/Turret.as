package  
{
	import org.flixel.*;
	/**
	 * It shoots things and you often find it on galaxies. Interesting, huh?
	 * @author Jonathan Miller
	 */
	public class Turret extends FlxSprite
	{
		public static const TURRET_WIDTH:uint = 8;
		public static const TURRET_HEIGHT:uint = 8;
		
		/**
		 * Creates a turret at (X, Y) which points in the specified direction.
		 * @param	X			X position
		 * @param	Y			Y position
		 */
		public function Turret(X:Number = 0, Y:Number = 0, dir:Number = 0) 
		{
			super(X, Y);
			loadGraphic(Assets.BUBBLE_TEXTURE);
			
			angle = dir;
		}
	}
}