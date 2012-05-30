package 
{
	import org.flixel.*;
	import flash.display.StageDisplayState;
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	public class Main extends FlxGame
	{

		public function Main():void
		{
			super(400, 300, MenuState, 2, 60, 60);
			
			forceDebugger = true;
			//used for fullscreen, will figure out code later
			//stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		}

	}
	
}