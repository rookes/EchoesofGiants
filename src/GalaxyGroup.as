package  
{
	import org.flixel.*;
	/**
	 * A FlxGroup containing a single Galaxy and all its members (turrets, mirrors, etc). This class also includes 
	 * methods for dynamically creating planets at runtime. 
	 * Example usage:
		 * var andromeda:GalaxyGroup = new GalaxyGroup().addTurret(180).addMirror(270, 360);
	 * @author Jonathan Miller
	 */
	public class GalaxyGroup extends FlxGroup implements Rotatable
	{		
		public var radius:Number;
		public var x:Number;
		public var y:Number;
		
		public var angle:Number = 0;
		public var angularVelocity:Number = 0;
		public var maxAngularVelocity:Number = 40;
		
		protected var _galaxy:Galaxy;
		protected var _bullets:FlxGroup = new FlxGroup();
		protected var _mirror:Mirror = null;
		protected var _turrets:FlxGroup = new FlxGroup();
		
		/**
		 * Creates a GalaxyGroup at (X, Y) with radius R.
		 * @param	X			X position
		 * @param	Y			Y position
		 * @param	R			Working radius of the Galaxy in this group. 
		 */
		public function GalaxyGroup(X:Number = 0, Y:Number = 0, R:Number = 12) 
		{
			super();
			
			_galaxy = new Galaxy(X, Y);
			add(_galaxy);
			add(_bullets);
			add(_mirror);
			add(_turrets);
			
			x = X;
			y = Y;
			radius = R;
			
			//mark as rotatable
			activateRotation();
		}
		
		
		/** UN-IMPLEMENTED
		 * 
		 * @return This GalaxyGroup, for easy chaining of functions.
		 */
		public function addMirror(angle1:Number=0, angle2:Number=0):GalaxyGroup {
			return this;
		}
				
		/**
		 * Add a turret to this GalaxyGroup at the specified angle (degrees).
		 * @param	theta	The angle, taken from the center to the perimeter of the Galaxy, at which the turret is placed. 
		 * 					Note that the turret will always be placed on the perimeter of the Galaxy.
		 * @return	This GalaxyGroup, for easy chaining of functions.
		 */
		public function addTurret(theta:Number = 0):GalaxyGroup {
			//make sure angle is in ideal bounds
			if (theta > 360)
				theta = theta % 360;
			while (theta < 0)
				theta += 360;

			//create the turret
			var tur:Turret = new Turret(x + _galaxy.origin.x + Math.cos(theta * (Math.PI / 180)) * radius - Turret.TURRET_WIDTH/2, 
										y + _galaxy.origin.y + Math.sin(theta * (Math.PI / 180)) * radius - Turret.TURRET_HEIGHT/2);
			tur.origin = new FlxPoint( -radius + Turret.TURRET_WIDTH/2, Turret.TURRET_HEIGHT/2);
			tur.angle = theta;
			
			_turrets.add(tur);
			
			return this;
		}
		
		/** UN-IMPLEMENTED
		 * 
		 * @return This GalaxyGroup, for easy chaining of functions.
		 */
		public function makeMalleable():GalaxyGroup {
			return this;
		}
		
		/** Tags the GalaxyGroup as being rotated by the player (<-- haven't implemented this yet) and rotates everything 
		 * in the GalaxyGroup which is capable of rotation.
		 * @param 	theta		Amount of rotation in degrees.
		 * 
		 * @return The GalaxyGroup's resultant angular velocity.
		 * */
		public function rotate(theta:Number):Number
		{			
			//hard way:
			/*var basic:FlxBasic;
			var i:uint = 0;
			while(i < length)
			{
				basic = members[i++] as FlxBasic;
				if(basic != null)
				{
					if(basic is Rotatable)
						(basic as Rotatable).rotate(theta);
					else if (basic is FlxGroup) {
						(basic as FlxGroup).setAll("angularVelocity", theta);
					}
					else if (basic is FlxObject)
						basic["angularVelocity"] = theta;
				}
			}
			*/
			
			//easy way: (and update method)
			angularVelocity = theta;
			return theta;
		}
		
		public override function update():void
		{
			setAll("angularVelocity", angularVelocity);
			super.update();
		}
		
		public function activateRotation():void
		{
			Registry.rotatables.add(this);
		}
		
		public function deactivateRotation():void
		{
			Registry.rotatables.remove(this);
		}
	}

}