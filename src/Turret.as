package  
{
	import org.flixel.*;
	/**
	 * It shoots things and you often find it on galaxies. Interesting, huh?
	 * @author Jonathan Miller
	 */
	public class Turret extends FlxSprite
	{
		
		public function Turret(X:Number = 0, Y:Number = 0, centerX:Number = 0, centerY:Number = 0) 
		{
			super(X, Y);
			loadGraphic(Assets.BUBBLE_TEXTURE);
			//origin = new FlxPoint(centerX-X, centerY-Y);
		}
		
	}

}