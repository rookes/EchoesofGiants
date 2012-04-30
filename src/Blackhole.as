package  
{
	import org.flixel.*;
	
	public class Blackhole extends FlxSprite
	{
		
		public function Blackhole(X:Number=0,Y:Number=0)
		{
			super(X, Y);
			loadGraphic(Assets.BLACKHOLE_TEXTURE, true, false, 16, 16, false);
			scale = new FlxPoint(2, 2);
			addAnimation("rotate", [0, 1, 2, 3], 10, true);
		}
		
		override public function update():void
		{
			play("rotate");
		}
	}

}
