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
		
		protected var _galaxy:Galaxy;
		protected var _bullets:FlxGroup = new FlxGroup();
		protected var _mirror:Mirror = null;
		protected var _turrets:FlxGroup = new FlxGroup();
		
		public function GalaxyGroup(X:Number = 0, Y:Number = 0, R:Number = 8) 
		{
			_galaxy = new Galaxy(X, Y);
			add(_galaxy);
			add(_bullets);
			add(_mirror);
			add(_turrets);
			
			x = X;
			y = Y;
			radius = R;
		}
		
		
		//un-implemented
		public function addMirror(angle1:Number=0, angle2:Number=0):GalaxyGroup {
			return this;
		}
				
		//un-implemented
		public function addTurret(angle:Number = 0):GalaxyGroup {
			//make sure angle is in ideal bounds
			if (angle > 360)
				angle = angle % 360;
			while (angle < 0)
				angle += 360;

			/*var tur:Turret = new Turret(x + Math.cos(angle * (Math.PI / 180)) * radius, 
										y + Math.sin(angle * (Math.PI / 180)) * radius, 
										x, 
										y);*/
			var tur:Turret = new Turret(x, y);
			_turrets.add(tur);
			return this;
		}
		
		//un-implemented
		public function makeMalleable():GalaxyGroup {
			return this;
		}
		
		public function rotate(theta:Number):Number
		{
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
			setAll("angularVelocity", theta);
			return 0;
		}
		
		public override function update():void
		{
			super.update();
			rotate(40);
		}
	}

}