package  planetarium
{
	import org.flixel.*;
	/**
	 * A planet and its attachments, stored as a FlxGroup. This class also includes a large 
	 * amount of methods for dynamically creating planets at runtime. 
	 * Usage:
		 * var mars:PlanetConstruct = new PlanetConstruct(0,0).makeExtraLarge().makeRed();
	 * @author Jonathan Miller
	 */
	public class PlanetConstruct extends FlxGroup
	{
		protected var _planet:Planet;
		
		/**
		 * Constructs dat PlanetConstruct and creates a Planet at (X,Y)
		 * @param	X	X location of included Planet
		 * @param	Y	Y location of included Planet
		 */
		public function PlanetConstruct(X:Number=0, Y:Number=0) 
		{
			super();
			_planet = new Planet(X, Y);
			add(_planet);
		}
		
		//un-implemented
		public function addMirror(ALPHA:Number=0, BETA:Number=ALPHA+90):PlanetConstruct {
			return this;
		}
		
		//un-implemented
		public function makeMalleable():PlanetConstruct {
			return this;
		}
		
		public function addTurret(ALPHA:Number=0):PlanetConstruct {
			return this;
		}
	}

}