package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMath;
	/**
	 * A rotatable mirror which reflects bullets and other materials.
	 * @author Jonathan Miller
	 */
	public class Mirror extends FlxSprite implements Rotatable
	{
		public var canRotate:Boolean = true;
		public var rect:FlxAngledRect; //used for collision detection
		
		public function Mirror(X:Number = 0, Y:Number = 0, WIDTH:Number = 3, HEIGHT:Number = 20, ANGLE:Number = 0) 
		{
			super(X, Y);
			angle = ANGLE;
			makeGraphic(WIDTH, HEIGHT);
			rect = new FlxAngledRect(x, y, WIDTH, HEIGHT, ANGLE);
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
			//Make sure not to reflect bullets excessively
			if (bullet.recentlyReflected)
				return;
			
			bullet.recentlyReflected = true;
			
			//Just shoot the bullet along the normal angle instead of accurate reflection
			var bulletAngle:Number = FlxMath.asDegrees(FlxMath.atan2(bullet.velocity.y, bullet.velocity.x));
			var normal:Number = mirror.getNormalAngle();
			
			if (differenceBetweenAngles(normal, bulletAngle) < 90)
				normal += 180;
				
			var len:Number = Math.sqrt(bullet.velocity.x * bullet.velocity.x + bullet.velocity.y * bullet.velocity.y);
			bullet.velocity.x = Math.cos(FlxMath.asRadians(normal)) * len;
			bullet.velocity.y = Math.sin(FlxMath.asRadians(normal)) * len;
		}
		
		/** Returns the normal to the mirror as an angle (degrees) */
		public function getNormalAngle():Number
		{
			var result:Number = angle + 90;
			return angle % 180;
		}
		
		/** A helper function for finding the difference between two angles (NOTE: angles must be 0-360)*/
		private static function differenceBetweenAngles(a:Number, b:Number):Number
		{
			var result:Number;
			result = FlxU.abs(a - b);
			if (result > 180)
				result = 360 - result;
			return result;
		}
		
		public override function update():void
		{
			super.update();
			rect.angle = angle;
		}
	}

}