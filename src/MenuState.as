package
{
    import org.flixel.*

    public class MenuState extends FlxState
    {
		//text displayed in the menu
		private var title:FlxText;
		
		//buttons in the menu
		//start, about
		private var startButton:FlxButton;
		private var aboutButton:FlxButton;
		
		
        override public function create():void
        {
			FlxG.bgColor = 0xFF000000;
			
			title = new FlxText(0, 10, FlxG.width, "Echoes of Giants");
			title.alignment = "center";
			title.size = 16;
			add(title);
			
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
		
		protected function onAbout():void
		{
			FlxG.switchState(new AboutState());
		}
    }
}
