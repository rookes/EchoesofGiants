package  
{
	import org.flixel.*;
	/**
	 * A rotatable mirror which reflects bullets and other materials.
	 * @author Jonathan Miller
	 */
	public class Mirror extends FlxSprite implements Rotatable
	{
		public var canRotate:Boolean = true;
		
		public function Mirror(X:Number = 0, Y:Number = 0, WIDTH:Number = 30, HEIGHT:Number = 5, ANGLE:Number = 0) 
		{
			super(X, Y);
			angle = ANGLE;
			makeGraphic(WIDTH, HEIGHT);
			
			rotate(30);
		}
		
		/** Rotates the Mirror by a certain amount of degrees if the Mirror is avaiable for rotation (see var "canRotate").
		 * @param 	theta		Amount of rotational force given by the player, in degrees.
		 * 
		 * @return Returns the current angular velocity of the Mirror.
		 * */
		public function rotate(theta:Number):Number
		{
			if (canRotate)
				angularVelocity = theta;
			
			return angularVelocity;
		}
		
		/** Reflect given bullet, regardless of whether the bullet is in contact with the mirror or not. The process
		 * (conceptually) is carried out by using an invisible line parallel to the mirror's surface and pulling it up 
		 * to the bullet, first horizontally then vertically, and reflecting the bullet off that. 
		 * 
		 * @param bullet	The bullet to be reflected
		 */
		public static function reflectBullet(mirror:Mirror, bullet:Bullet):void
		{			
			FlxU.rotatePoint(bullet.velocity.x, 
							bullet.velocity.y, 
							0, 
							0, 
							Mirror.differenceBetweenAngles(mirror.getNormalAngle(), 
													Math.atan2(bullet.velocity.y, bullet.velocity.x)) * 2,
							bullet.velocity);
		}
		
		/** Returns the normal to the mirror as a unit vector */
		public function getNormalVector():FlxPoint
		{
			var theta:Number = getNormalAngle();
			return new FlxPoint(Math.cos(theta), Math.sin(theta));
		}
		
		/** Returns the normal to the mirror as an angle (degrees) */
		public function getNormalAngle():Number
		{
			var result:Number = angle + 90;
			return angle % 360;
		}
		
		/** A helper function for finding the difference between two angles (NOTE: angles must be 0-360)*/
		public static function differenceBetweenAngles(a:Number, b:Number):Number
		{
			var result:Number;
			result = Math.abs(a - b);
			if (result > 180)
				result = 360 - result;
			return result;
		}
	}

}