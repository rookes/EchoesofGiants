package  planetarium
{
	import org.flixel.*;
	
	/**
	 * A planet which the player can attach to and rotate. This is
	 * the actual planet, and does not include any attachments, such
	 * as mirrors or turrets. 
	 * @author Jonathan Miller
	 */
	public class Planet extends FlxSprite
	{
		
		
		public function Planet(X:Number = 0, Y:Number = 0) 
		{
			super(X, Y);
			loadGraphic(Assets.ASTEROID_TEXTURE, false);
		}
		
	}

}