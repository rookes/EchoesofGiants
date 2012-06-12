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
		
		public function Powerup(variableChanged:String = "", amount:int = 1) 
		{
			this.variableChanged = variableChanged;
			this.amount = amount;
			
			makeGraphic(10, 10, 0xff0000ff);
		}	
	}
}