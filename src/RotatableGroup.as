package  
{
	import org.flixel.*;
	/**
	 * Holds all the available Rotatable objects. <code>add()</code> Rotatables to this FlxGroup to allow the 
	 * player to grapple them. RotatableGroup is not responsible for rendering or updating its members, so do 
	 * not <code>add()</code> this class to the PlayState.
	 * @author Jonathan Miller
	 */
	public class RotatableGroup extends FlxGroup
	{	
		public function RotatableGroup() 
		{
			//Start empty
		}
		
		public override function add(Object:FlxBasic):FlxBasic
		{
			if (Object is Rotatable)
				return super.add(Object);
			
			trace("Warning in RotatableGroup: Object not a Rotatable");
			return Object;
		}
	}
}