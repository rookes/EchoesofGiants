package
{
    import org.flixel.*

    public class AboutState extends FlxState
    {
		//text displayed in the menu
		private var title:FlxText;
		private var aboutText:FlxText;
		
		//buttons in the about menu
		//back, noel's website, brett's website
		private var brettButton:FlxButton;
		private var hokoriButton:FlxButton;
		private var sourceButton:FlxButton;
		private var backButton:FlxButton;
		
		
        override public function create():void
        {
			FlxG.bgColor = 0xFF000000;
			
			title = new FlxText(0, 10, FlxG.width, "About");
			title.alignment = "center";
			title.size = 16;
			add(title);
			
			aboutText = new FlxText(10, 50, FlxG.width-10, "A Hokori Interactive game made by Brett Chalupa.");
			aboutText.alignment = "center";
			//aboutText.size = 12;
			add(aboutText);
			
			brettButton = new FlxButton(25, FlxG.height - 75, "Brett Chalupa", onBrett);
			brettButton.color = 0xffffffff;
			brettButton.label.color = 0x000000;
			add(brettButton);
			
			hokoriButton = new FlxButton(FlxG.width - 200 / 2, FlxG.height - 75, "Hokori", onHokori);
			hokoriButton.color = 0xffffffff;
			hokoriButton.label.color = 0x000000;
			add(hokoriButton);
			
			sourceButton = new FlxButton(25, FlxG.height - 50, "Source", onSource);
			sourceButton.color = 0xffffffff;
			sourceButton.label.color = 0x000000;
			add(sourceButton);
			
			backButton = new FlxButton(FlxG.width - 100, FlxG.height - 50, "Back", onBack);
			backButton.color = 0xffffffff;
			backButton.label.color = 0x000000;
			add(backButton);
        }
		
		override public function update():void
		{
			ControllerManager.Update();
			checkInput();
			super.update();
		}
		
		protected function checkInput():void
		{
			//if the player presses back or escape, let's return to the menu
			if (FlxG.keys.ESCAPE || ControllerManager.KeyDown(ControllerManager.ControllerOne,ControllerManager.BackButton) || ControllerManager.KeyDown(ControllerManager.ControllerOne, ControllerManager.ButtonTwo))
			{
				onBack();
			}
		}
		protected function onBrett():void
		{
			FlxU.openURL("http://brettchalupa.com/");
		}
		
		protected function onHokori():void
		{
			FlxU.openURL("http://hokori-interactive.com/");
		}
		
		protected function onSource():void
		{
			FlxU.openURL("https://github.com/brettchalupa/LD23");
		}
		
		protected function onBack():void
		{
			FlxG.switchState(new MenuState());
		}
    }
}
