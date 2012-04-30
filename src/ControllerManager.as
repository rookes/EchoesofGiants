package  
{
	import extension.JoyQuery.Joystick;
	
	/**
	 * ...
	 * @author Brett Chalupa
	 */
	public class ControllerManager
	{
		//int variables for identifying all of the controllers
		public static var ControllerOne:int = 0;
		public static var ControllerTwo:int = 1;
		public static var ControllerThree:int = 2;
		public static var ControllerFour:int = 3;
		
		//int variables for identifying all the different keys and axes
		//defaults are based upon the Xbox 360 controller
		public static var LeftStickXAxis:int = 0;
		public static var LeftStickYAxis:int = 1;
		public static var RightStickXAxis:int = 4;
		public static var RightStickYAxis:int = 3;
		public static var TriggerAxis:int = 2;
		public static var ButtonOne:int = 0; //A
		public static var ButtonTwo:int = 1; //B
		public static var ButtonThree:int = 2; //X
		public static var ButtonFour:int = 3; //Y
		public static var LeftBumper:int = 4;
		public static var RightBumper:int = 5;
		public static var StartButton:int = 7;
		public static var BackButton:int = 6;
	
		//let's create a new Joystick object
		private static var joy:Joystick = new Joystick();
		
		//private static var _current
		
		public static function Update():void
		{
			joy.JoyQuery();
		}
		
		public static function KeyDown(controller:int, button:int):Boolean
		{
			if (joy.buttonIsDown(controller, button))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public static function GetAxisValue(controller:int, axis:int):Number
		{
			return joy.getAxis(controller, axis);
		}
	}

}