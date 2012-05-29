package
{
    import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import flash.utils.getTimer;
	
    public class PlayState extends AboutState
    {		
		private var _player:Player;
		
		private var _enemies:FlxGroup;
		public var _stars:FlxGroup;
		
		public var _mirror:Mirror;
		
		//used for launching enemies
		private var lastReleased:int;
		private var releaseRate:int = 500;
		
		protected var _background:FlxSprite; //used strictly for drawing the grapple
		
        override public function create():void
        {	
			//let's create the background
			_background = new FlxSprite(0, 0);
			add(_background);
			
			//_background.makeGraphic(FlxG.width * FlxG.camera.zoom, FlxG.height * FlxG.camera.zoom, 0xff000000);
			_background.makeGraphic(FlxG.worldBounds.width, FlxG.worldBounds.height, 0xff222222);
			
			_player = new Player(FlxG.width / 2 - 2, FlxG.height / 2 - 2);
			add(_player.bullets);
			add(_player);
			
			_mirror = new Mirror(300, 100);
			add(_mirror);
			
			FlxG.camera.follow(_player);
			
			FlxG.camera.follow(_player);
			
			_enemies = new FlxGroup();
			add(_enemies);
		}
		
		override public function update():void
		{
			super.update();
			checkCollisions();
			checkInput();
			//manageEnemies();
		}
		
		override protected function checkInput():void
		{
			//if the player presses back or escape, let's return to the menu
			if (FlxG.keys.ESCAPE)
			{
				onBack();
			}
		}
		
		private function checkCollisions():void
		{
			FlxG.overlap(_player.bullets, _enemies, bulletHitEnemy);
			
			FlxG.overlap(_mirror, _player.bullets, Mirror.reflectBullet);
			//for each (var b:Bullet in _player.bullets.members)
			//	if (_mirror.rect.overlapsPoint(new FlxPoint(b.x, b.y)))
			//		Mirror.reflectBullet(_mirror, b);
			
			if (FlxG.overlap(_player, _enemies))
			{
				_player.respawn();
			}
		}
		
		private function bulletHitEnemy(bullet:FlxObject, enemy:FlxObject):void
		{
			FlxG.log("bulletHitEnemy()");
			bullet.kill();
			_player.bullets.remove(bullet);

			enemy.hurt(1);
			_enemies.remove(enemy);
			
			FlxG.score += 1;
		}
		
		private function manageEnemies():void
		{
			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();

				release();
			}
		}
		
		public function release():void
		{
			var enemy:Enemy = new Enemy(0, 0);
			enemy.launch();
			_enemies.add(enemy);
		}
	}
}