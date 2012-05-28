package  
{
	import org.flixel.FlxTimer;

	/**
	 * A tiny class to change and extend FlxTimer
	 */
	public class Timer extends FlxTimer
	{
		
		/**
		 * Adds a specified amount of time to the _timeCounter
		 * @param	amount			The amount of time to add
		 */
		public function addTime(amount:Number):void
		{
			_timeCounter -= amount;
		}
		
	}

}