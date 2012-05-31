package
{
    import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
    public class PlayState extends AboutState
    {
		private var _enemies:FlxGroup;
		public var _stars:FlxGroup;
		
		//used for launching enemies
		private var lastReleased:int;
		private var releaseRate:int = 500;
		
		protected var _background:FlxSprite; //used strictly for drawing the grapple
		
        override public function create():void
        {	
			//let's create the background
			_background = new FlxSprite(0, 0);
			_background.makeGraphic(FlxG.worldBounds.width, FlxG.worldBounds.height, 0xff222222);
			
			Registry.playerBullets = new BulletManager(100);
			Registry.player = new Player(FlxG.width / 2 - 2, FlxG.height / 2 - 2);
		
			var ggg:GalaxyGroup = new GalaxyGroup(100, 100).addTurret();
			ggg.rotate(40);
			
			FlxG.camera.follow(Registry.player);
			
			add(_background);
			add(Registry.playerBullets);
			add(Registry.player);
			add(ggg);
		}
		
		override public function update():void
		{
			super.update();
			checkInput();
		}
		
		override protected function checkInput():void
		{
			//if the player presses back or escape, let's return to the menu
			if (FlxG.keys.ESCAPE)
			{
				onBack();
			}
		}
	}
}