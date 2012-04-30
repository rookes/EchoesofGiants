package  
{
	import org.flixel.*;
	
	public class AirBubble extends FlxSprite
	{
		protected var _timeToAdd:Number;
		
		/**
		 * The time to add to the game when a bubble is collected
		 */
		public function get TimeToAdd():Number
		{
			return _timeToAdd;
		}
		
		/**
		 * Creates a red star at the specified position.
		 * 
		 * @param	X				The initial X position of the sprite.
		 * @param	Y				The initial Y position of the sprite.
		 */
		public function AirBubble(X:Number=0,Y:Number=0)
		{
			super(X, Y);
			loadGraphic(Assets.BUBBLE_TEXTURE, false, false, 8, 8, false);
			_timeToAdd = 5;
		}		
	}

}