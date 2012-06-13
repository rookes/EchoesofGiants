package 
{
	import org.flixel.*;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame
	{

		public function Main():void
		{
			super(400, 300, MenuState, 2, 60, 60);
			
			forceDebugger = true;
		}

	}
	
}