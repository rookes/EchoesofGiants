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
			player[powerup.variableChanged] += powerup.amount;			
		}
	}
}