package  
{
	import org.flixel.*;
	/**
	 * Powerup object, collectable by the Player
	 * @author Jonathan Miller
	 */
	public class Powerup extends FlxSprite
	{	
		/** How far the Powerup has to be from player to accelerate */
		public static const ACCEL_RANGE:Number = 90;
		
		/** How fast the Powerup accelerates towards the player */
		public static const ACCEL_TOWARDS_PLAYER:Number = 11.5;
		
		/** The variable to be changed in Player */
		public var variableChanged:String;
		
		/** Amount changed */
		public var amount:Number;
		
		/** Default constructor, used by PowerupManager to instantiate non-active powerups*/
		public function Powerup()
		{
			super(0, 0)
			
			drag.x = 13;
			drag.y = 13;
			
			maxVelocity.x = 180;
			maxVelocity.y = 180;
			
			exists = false;
		}
		
		/** Activate a non-existent Powerup and set its fields*/
		public function activate(X:Number = 0, Y:Number = 0, variableChanged:String = "bulletSpeed", amount:Number = 1):void
		{
			exists = true //important, obviously
			
			x = X;
			y = Y;
			
			this.variableChanged = variableChanged;
			this.amount = amount;
			
			makeGraphic(10, 10, 0xff0000ff);
		}
		
		public override function update():void
		{
			var player:Player = Registry.player;
			var xInc:Number = player.x + player.origin.x - x - origin.x;
			var yInc:Number = player.y + player.origin.y - y - origin.y;
						
			if (Math.abs(xInc) < ACCEL_RANGE && Math.abs(yInc) < ACCEL_RANGE)
			{			
				velocity.x += ((ACCEL_RANGE - Math.abs(xInc)) / ACCEL_RANGE + 0.05) * ACCEL_TOWARDS_PLAYER * (Math.abs(xInc)/xInc);
				velocity.y += ((ACCEL_RANGE - Math.abs(yInc)) / ACCEL_RANGE + 0.05) * ACCEL_TOWARDS_PLAYER * (Math.abs(yInc)/yInc);
			} 
	
			super.update();
		}
	}
}