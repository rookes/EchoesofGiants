package  
{
	/**
	 * Anything that the Player can attempt to connect to and rotate
	 * @author Jonathan Miller
	 */
	public interface Rotatable 
	{
		/** Rotates the rotatable object, indicating an input angle.
		 * @param 	theta		Amount of rotational force given by the player, in degrees. The rotatable object's 
		 * 						actual change in angle may vary according to implementation.
		 * 
		 * @return Returns the current angular velocity of the object.
		 * */
		function rotate(theta:Number):Number;
		
		/** Allow the Player to grapple this object */
		function activateRotation():void;
		
		/** Do not allow the Player to grapple this object */
		function deactivateRotation():void;
	}
}