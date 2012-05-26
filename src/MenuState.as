package
{
    import org.flixel.*
	import flash.desktop.NativeApplication;

    public class MenuState extends FlxState
    {
		//text displayed in the menu
		private var title:FlxText;
		
		//buttons in the menu
		//start, about
		private var startButton:FlxButton;
		private var aboutButton:FlxButton;
		
		//text to display the controls
		private var controlsText:FlxText;
		
		
        override public function create():void
        {
			FlxG.bgColor = 0xFF000000;
			
			title = new FlxText(0, 10, FlxG.width, "Echoes of Giants");
			title.alignment = "center";
			title.size = 16;
			add(title);
			
			controlsText = new FlxText(0, 130, FlxG.width, "M&K: WASD - Move, MOUSE - Shoot\n\nX360: LAS - Move, RAS - Shoot\n\n C - Toggle Cursor, ESC - Exit");
			controlsText.alignment = "center";
			controlsText.size = 16;
			add(controlsText);
			
			startButton = new FlxButton(25, FlxG.height - 50, "Start", onStart);
			startButton.color = 0xffffffff;
			startButton.label.color = 0x000000;
			add(startButton);
			
			aboutButton = new FlxButton(FlxG.width - 100, FlxG.height - 50, "About", onAbout);
			aboutButton.color = 0xffffffff;
			aboutButton.label.color = 0x000000;
			add(aboutButton);
			
			FlxG.mouse.show();
        }
		
		override public function update():void
		{
			super.update();
		}
		
		protected function onStart():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState());
		}
		
		protected function onExit():void
		{
			NativeApplication.nativeApplication.exit();
		}
		
		protected function onAbout():void
		{
			FlxG.switchState(new AboutState());
		}
    }
}
