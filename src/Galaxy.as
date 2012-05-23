package  
{
	import org.flixel.*;
	import flash.display.Shape;
	
	/**
	 * A planet which the player can attach to and rotate through the GalaxyGroup class.
	 * @author Jonathan Miller
	 */
	public class Galaxy extends FlxSprite
	{
		/**
		 * Creates a Galaxy at (X, Y) from an image.
		 * @param	X			X position
		 * @param	Y			Y position
		 * @param	graphic		Image file used for the Galaxy - ideally, take this from Assets
		 */
		public function Galaxy(X:Number = 0, Y:Number = 0) 
		{
			super(X, Y);
			loadGraphic(Assets.ASTEROID_TEXTURE, true, false, 16, 16, false);
		}
	}
}