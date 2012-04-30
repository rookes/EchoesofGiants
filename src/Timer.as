package  
{
	import org.flixel.FlxTimer;

	public class Timer extends FlxTimer
	{
		
		public function addTime(amount:Number):void
		{
			_timeCounter -= amount;
		}
		
	}

}