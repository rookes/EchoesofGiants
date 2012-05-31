package org.flixel 
{
	/**
	 * ...
	 * @author Jonathan Miller
	 */
	public class FlxAngledRect extends FlxRect
	{
		public var angle:Number;
		
		public function FlxAngledRect(X:Number=0, Y:Number=0, Width:Number=0, Height:Number=0, Angle:Number = 0) 
		{
			super(X, Y, Width, Height);
			angle = Angle;
		}
		
		public function overlapsPoint(point:FlxPoint):Boolean
		{
			var rad:Number = FlxU.max(width, height);
			if (FlxU.abs(x - point.x) > rad || FlxU.abs(y - point.y) > rad)
				return false;
			
			FlxG.log(width/2);
			
			FlxU.rotatePoint(point.x, point.y, x, y, angle, point);
		
			if (FlxU.abs(x - point.x) <= width / 2 && FlxU.abs(y - point.y) <= height / 2)
			{
				FlxG.log("Rectangle collided!");
				return true;
			}
			
			return false;
		}
		
		//TODO: Override the other functions
	}

}