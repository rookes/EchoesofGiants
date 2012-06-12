package  
{
	import org.flixel.*;
	
	/**
	 * A <code>FlxGroup</code> containing and managing all active powerups in the current game state.
	 * @author Jonathan Miller
	 */
	public class PowerupManager extends FlxGroup
	{
		
		public function PowerupManager(MaxNumberOfPowerups:uint = 15) 
		{
			super();
			
			//create a pool of the specified amount of powerups
			for (var i:int = 0; i < MaxNumberOfPowerups; i++)
			{
				add(new Powerup);
			}
		}
		
		/** Collect the powerup upon contact, altering the player. This additively alters a variable
		 * in the player.
		 */
		public static function collectPowerup(powerup:Powerup, player:Player):void
		{
			//TODO: Throw exception for unaccepted variable name
			player[powerup.variableChanged] += powerup.amount;	
			
			powerup.kill();
		}
		
		/** Activates a Powerup using the default Powerup constructor parameters
		 * 
		 * @param	X					X location of Powerup
		 * @param	Y					Y location of Powerup
		 * @param	variableChanged		String containing name of variable in Player which should be changed
		 * @param	amount				How large the change of variable is upon collection
		 * 
		 * @return 	The activated Powerup
		 */
		public function addPowerup(X:Number = 0, Y:Number = 0, variableChanged:String = "bulletSpeed", amount:Number = 1):Powerup
		{
			var p:Object = getFirstAvailable();
			
			if (p)
			{
				Powerup(p).activate(X, Y, variableChanged, amount);
				return Powerup(p);
			}
			
			return null;
			
		}
	}
}