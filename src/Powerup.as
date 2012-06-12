package  
{
	import org.flixel.*;
	/**
	 * Powerup object, collectable by the Player
	 * @author Jonathan Miller
	 */
	public class Powerup extends FlxSprite
	{		
		/** The variable to be changed in Player */
		public var variableChanged:String;
		
		/** Amount changed */
		public var amount:int;
		
		/** Default constructor, used by PowerupManager to instantiate non-active powerups*/
		public function Powerup()
		{
			super(0, 0)
			exists = false;
		}
		
		/** Activate a non-existent Powerup and set its fields*/
		public function activate(X:Number = 0, Y:Number = 0, variableChanged:String = "", amount:int = 1):void
		{
			exists = true //important, obviously
			
			x = X;
			y = Y;
			
			this.variableChanged = variableChanged;
			this.amount = amount;
			
			makeGraphic(10, 10, 0xff0000ff);
		}
	}
}